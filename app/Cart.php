<?php
namespace App;
use Illuminate\Contracts\Support\Arrayable;
use InvalidArgumentException;
use Illuminate\Support\Collection;
use App\CartItem;

class Cart implements Arrayable
{
    /**
     * The identifier of the cart.
     *
     * @var int|string
     */
    public $id; 
    /**
    * Shopping cart content.
    *
    * @var Collection
    */
    public $content;

    /**
     * Cart constructor.
     *
     * @param int|string $id
     * @param Collection $content
     *
     * @throws InvalidArgumentException
     */
    public function __construct($id)
    {
        $this->id = $id;
        $this->content = new Collection();
    }
    /**
    * Add cart content.
    *
    * If an item is already in the cart then update quantity.
    * 
    * @param int $id  
    * @param stirng $name  
    * @param float $price
    * @param int $quantity 
    */
    public function add ($id, $name, $image, $price, $quantity) {
        $cartItem = new CartItem($id, $name, $image, $price, $quantity);
        /*if ($this->content->has($id)) {
            $cartItem->quantity += $this->content->get($id)->quantity;
        }*/
        $this->content->put($id, $cartItem);
    }
    /**
    * Get cart total.
    *
    * If an item is already in the cart then update quantity.
    * 
    * @param int $id  
    * @param stirng $name  
    * @param float $price
    * @param int $quantity 
    */
    public function getTotal () {
        $total = 0;
        foreach($this->content as $item) {
            $total += $item->price * $item->quantity;
        }
        return $total;
    }

    /**
     * Remove the item with id from the cart.
     *
     * @param int $id
     *
     */
    public function remove($id)
    {
        $this->content->pull($id);
    }

    /**
     * Create a new instance from the given array.
     *
     * @param array $attributes
     *
     * @throws InvalidArgumentException
     *
     * @return $this
     */
    public static function fromArray(array $attributes)
    {
        $cart = new self(
            $attributes['id']
        );

        $cart->content = new Collection($attributes['content']);

        return $cart;
    }

    /**
     * Get the instance as an array.
     *
     * @return array
     */
    public function toArray()
    {
        return [
            'id' => $this->id,
            'content' => $this->content->toArray(),
        ];
    }
}