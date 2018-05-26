<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['address', 'suburb', 'city', 'code', 'phone'];
    /**
     * The products that belong to the category.
     */
    public function products()
    {
        return $this->belongsToMany('App\Product')->withPivot('price', 'quantity');
    }
}
