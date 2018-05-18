<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['address', 'suburb', 'city', 'code', 'phone'];
}
