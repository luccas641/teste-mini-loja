<?php

namespace App\Repositories;

use Illuminate\Support\Facades\Redis;
use App\Cart;

class CartRepositoryRedis implements CartRepositoryInterface
{
    /**
     * Save cart.
     *
     * @param $id
     * @param Cart $cart
     */
    public function createOrUpdate($id, $cart)
    {
        Redis::set($this->getKey($id), serialize($cart), "ex", 3600);
    }
    /**
     * Request a cartId
     *
     * @return int
     */
    public function request() {
        if(Redis::exists("cartId")) {
            $pipe = Redis::pipeline();
            $pipe->incr('cartId');
            $pipe->get('cartId');
            return $pipe->execute();
        } else {
            Redis::set('cartId', 1);
            return 1;
        }
    }
    /**
     * Find cart by id.
     *
     * @param string $id
     *
     * @return Cart|null
     */
    public function findById($id)
    {
        $cart = Redis::get($this->getKey($id));

        if ($cart === null) {
            return;
        }
        
        return (unserialize($cart));
    }

    /**
     * Remove cart by id.
     *
     * @param string $id
     */
    public function remove($id)
    {
        Redis::del($this->getKey($id));
    }

    /**
     * Get the key to store cart.
     *
     * @param $id
     *
     * @return string
     */
    protected function getKey($id)
    {
        return sprintf('cart.%s', $id);
    }
}
