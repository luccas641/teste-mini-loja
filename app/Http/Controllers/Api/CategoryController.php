<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Category;
use App\Http\Resources\CategoryResource;

class CategoryController extends Controller
{
       /**
     * Return a paginated list of categories.
     *
     * @return CategoryResource
     */
    public function index()
    {
        $categories = Category::latest()->withCount('products')
            ->paginate(20);

        return CategoryResource::collection($categories); 
    }

    /**
     * Fetch and return the category.
     *
     * @param Category $category
     * @return CategoryResource
     */
    public function show(Category $category)
    {
        $category->products = $category->products()->latest()->paginate(6);
        return new CategoryResource($category);
    }

    /**
     * Validate and save a new category to the database.
     *
     * @param Request $request
     * @return CategoryResource
     */
    public function store(Request $request)
    {
        $category = $this->validate($request, [
            'name' => 'required|max:50',
        ]);

        $category = Category::create($category);

        return new CategoryResource($category);
    }
}
