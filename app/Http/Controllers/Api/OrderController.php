<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Order;
use App\Services\OrderService;
use App\Http\Resources\OrderResource;

class OrderController extends Controller
{
    protected $orderService;
    
    /**
    * Loads CartController
    * 
    * @param OrderService $cartRepo
    * @return OrderController
    */
    public function __construct(OrderService $orderService)
    {    
        $this->middleware('auth:api');
        $this->orderService = $orderService;
    }
       /**
     * Return a paginated list of user orders.
     *
     * @return OrderResource
     */
    public function index()
    {
        $orders = Order::latest()->withCount('products')->paginate(20);

        return OrderResource::collection($orders);
    }

    /**
     * Fetch and return the order.
     *
     * @param Order $order
     * @return OrderResource
     */
    public function show(Order $order)
    {
        $order->products = $order->products()->latest()->get();
        return new OrderResource($order);
    }

    /**
     * Validate and save a new order to the database.
     *
     * @param Request $request
     * @return OrderResource
     */
    public function store(Request $request)
    {
        $order = $this->validate($request, [
            'cart' => 'required|numeric',
            'shipping' => 'required',
        ]);

        $order = $this->orderService->create($order);

        return new OrderResource($order);
    }
}
