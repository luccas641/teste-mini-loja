<?php
namespace App;
use Illuminate\Contracts\Support\Arrayable;
use InvalidArgumentException;

class CartItem implements Arrayable
{
    /**
     * The identifier of the cart item.
     *
     * @var int|string
     */
    public $id;
    /**
     * The name of the cart item.
     *
     * @var string
     */
    public $name;
    /**
     * The image of the cart item.
     *
     * @var float
     */
    public $image;
    /**
     * The price of the cart item.
     *
     * @var float
     */
    public $price;
    /**
     * The quantity for this cart item.
     *
     * @var int|float
     */
    public $quantity;
    /**
     * CartItem constructor.
     *
     * @param int|string $id
     * @param string     $name
     * @param int|float  $price
     * @param int        $quantity
     *
     */
    public function __construct($id, $name, $image, $price, $quantity)
    {
        $this->id = $id;
        $this->name = $name;
        $this->image = $image;
        $this->price = (float) $price;
        $this->quantity = (int) $quantity;
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
        return new self(
            $attributes['id'],
            $attributes['name'],
            $attributes['image'],
            $attributes['price'],
            $attributes['quantity']
        );
    }

    /**
     * Get total price.
     *
     * Total price = price * quantity.
     *
     * @return float
     */
    public function getTotal()
    {
        return $this->price * $this->quantity;
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
            'name' => $this->name,
            'image' => $this->image,
            'price' => $this->price,
            'quantity' => $this->quantity,
        ];
    }
}