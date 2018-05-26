<?php namespace App\Services;

use App\OrderItem;
use App\Product;
use App\Order;
use App\Services\CartService;

use Illuminate\Support\Facades\Auth;

class OrderService
{
    protected $cartService;
    
    /**
    * Loads CartController
    * 
    * @param CartService $cartRepo
    * @return OrderController
    */
    public function __construct(CartService $cartService)
    {   
        $this->cartService = $cartService;
    }
    /**
    * Method to create order
    * 
    * @param Request $orderRequest
    * @return string
    */
    public function create($orderRequest)
    {
        $cart = $this->cartService->get($orderRequest['cart']);
        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->total = $cart->getTotal();
        $order->code = $orderRequest['shipping']['code'];
        $order->address = $orderRequest['shipping']['address'];
        $order->city = $orderRequest['shipping']['city'];
        $order->suburb = $orderRequest['shipping']['suburb'];
        $order->state = $orderRequest['shipping']['state'];
        $order->phone = $orderRequest['shipping']['phone'];
        $order->save();

        foreach($cart->content as $item) {
            $order->products()->attach($item->id, ['price' => $item->price, 'quantity' => $item->quantity]);
        }
        return $order;
    }
}