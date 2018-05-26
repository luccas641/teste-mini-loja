<?php namespace App\Services;

use App\Repositories\CartRepositoryInterface;
use App\CartItem;
use App\Product;
use App\Cart;
class CartService
{
    protected $cartRepo;
    
    /**
    * Loads CartService
    * 
    * @param CartRepositoryInterface $cartRepo
    * @return CartService
    */
    public function __construct(CartRepositoryInterface $cartRepo)
    {
        $this->cartRepo = $cartRepo;
    }

    /**
    * Method to get cart based either on name or ID
    * 
    * @param int $cartId
    * @return string
    */
    public function request($cartId)
    {
        $cart = $this->cartRepo->request();

        return $cart;
    }

    /**
    * Method to get cart based either on name or ID
    * 
    * @param int $cartId
    * @return string
    */
    public function get($cartId)
    {
        $cart = $this->cartRepo->findById($cartId);

        return $cart;
    }

    /**
     * Add an item to the cart.
     *
     * @param string|int $id
     * @param string     $name
     * @param int|float  $price
     * @param int        $quantity
     *
     * @return CartItem
     */
    public function add($cartId, $productId, $quantity)
    {
        $product = Product::findOrFail($productId);
        $cart = $this->cartRepo->findById($cartId);
        if (!$cart) 
        {
            $cart = new Cart($cartId);
        }

        if($quantity==0) {
            $cart->remove($product->id);
        } else {
            $cart->add($product->id, $product->name, $product->price, $quantity);
        }
    
        
        $this->cartRepo->createOrUpdate($cart->id, $cart);
        
        return $cart;
    }
    public function destroy($cartId)
    {
        $this->cartRepo->remove($cartId);
    }
}