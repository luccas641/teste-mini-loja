<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Product;
use App\Http\Resources\ProductResource;

use Elasticsearch;

class ProductController extends Controller
{
       /**
     * Return a paginated list of products.
     *
     * @return ProductResource
     */
    public function index()
    {
        $products = Product::latest()->withCount('categories')
            ->paginate(20);

        return ProductResource::collection($products);
    }

    public function search($q, Request $request)
    {
        $mustFilters = [];
        $shouldFilters = [];
        $priceMin = 0;
        $priceMax = 99999;

        if($request->input('priceMax') > 0){
           $priceMax = floatVal($request->input('priceMax'));
        }
        if($request->input('priceMin') > 0){
            $priceMin = floatVal($request->input('priceMin'));
         }
        array_push($mustFilters,[
            "range" => [
            "price" => [
                "gte" => $priceMin,
                "lte" => $priceMax
            ]
        ]]);
        $categories = json_decode($request->input('categories'), true);
        if(count($categories)>0) {
            foreach($categories as $category) {
                array_push($shouldFilters, 
                [
                    "term" => [
                        "categories.id" => $category
                    ]
                ]);

            }
        }
        $esProducts = Elasticsearch::search([
            'index' => 'shopping',
            'type' => 'product',
            'body' => [
                "_source" => ["id"],
                "size" => 20,
                "query" => [
                    "bool" => [
                        "must" => [
                            "query_string" => [
                                "query" => "*{$q}*",
                                "fields" => ["categories.name", "description", "name", "specs.name", "specs.pivot.value"]
                            ]
                        ],
                        "filter" => [
                            "bool" => [
                                "must" => $mustFilters,
                                "should" => $shouldFilters
                            ]
                        ]
                    ]
                ]   
            ]
        ]);
        $ids = array_map(function($item) {
            return $item['_source']['id'];
        }, $esProducts['hits']['hits']);

        $products = Product::withCount('categories')->findMany($ids);
        
        return ProductResource::collection($products);
    }

    /**
     * Fetch and return the product.
     *
     * @param Product $product
     * @return ProductResource
     */
    public function show(Product $product)
    {
        $product->categories = $product->categories()->get();
        $product->specs = $product->specs()->get();
        return new ProductResource($product);
    }

    /**
     * Validate and save a new product to the database.
     *
     * @param Request $request
     * @return ProductResource
     */
    public function store(Request $request)
    {
        $product = $this->validate($request, [
            'name' => 'required|max:50',
            'price' => 'required|numeric|min:0',
            'description' => 'required'
        ]);

        $product = Product::create($product);

        return new ProductResource($product);
    }
}
