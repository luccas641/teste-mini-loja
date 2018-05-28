<?php 

namespace App\Services;

use Illuminate\Support\Facades\Auth;
use Elasticsearch;

use App\Product;

class ProductService
{
    /**
    * Method to search for a product
    *
    * @param String $q 
    * @param Request $productRequest
    * @return Collection
    */
    public function search($q, $request)
    {
        $query = $this->makeSearchQuery($q, $request);
        $esProducts = Elasticsearch::search($query);
        $ids = array_map(function($item) {
            return $item['_source']['id'];
        }, $esProducts['hits']['hits']);

        $products = Product::withCount('categories')->findMany($ids);
        return $products;
    }

    /**
    * Method to build a elasticSearch query;
    *
    * @param String $q 
    * @param Request $productRequest
    * @return string
    */
    private function makeSearchQuery($q, $request) {
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
            ]
        ]);
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
        $query = [
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
        ];
        return $query;
    }
}