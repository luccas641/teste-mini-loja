<?php

namespace App\Repositories;

use Cart;

interface CartRepositoryInterface
{
    /**
     * Save cart.
     *
     * @param $id
     * @param $content
     */
    public function createOrUpdate($id, $content);

    /**
     * Request a cartId
     *
     * @return int
     */
    public function request();

    /**
     * Find cart by id.
     *
     * @param string $id
     *
     * @return Cart|null
     */
    public function findById($id);

    /**
     * Remove cart by id.
     *
     * @param string $id
     */
    public function remove($id);
}
