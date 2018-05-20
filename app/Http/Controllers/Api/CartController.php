<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redis;

//use App\Cart;
use App\Http\Resources\CartResource;
use App\Services\CartService;
use App\Http\Requests\CartPut;

class CartController extends Controller
{
    protected $cartService;
    
    /**
    * Loads CartController
    * 
    * @param CartService $cartRepo
    * @return CartController
    */
    public function __construct(CartService $cartService)
    {   
        $this->cartService = $cartService;
    }
       /**
     * Return a list of items in the cart.
     * 
     * @param int $id
     * @return CartResource
     */
    public function show($id)
    { 
        return $this->cartService->get($id);
    }

    /**
     * Validate and save a new item in the cart.
     *
     * @param int $id
     * @param CartPut $request
     * @return CartResource
     */
    public function update($id, CartPut $request)
    {
        return $this->cartService->add($id, $request->input('product'), intval($request->input('quantity')));
    }

    /**
     * Validate and remove an item from the cart.
     *
     * @param int $id
     * @return CartResource
     */
    public function destroy($id)
    {
        return $this->cartService->destroy($id);
    }
}
