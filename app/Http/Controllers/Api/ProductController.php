<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Product;
use App\Services\ProductService;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{
    protected $productService;
    
    /**
    * Loads ProductController
    * 
    * @param ProductService $productService
    * @return productController
    */
    public function __construct(ProductService $productService)
    {    
        $this->productService = $productService;
    }
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
        $products = $this->productService->search($q, $request);
        
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
