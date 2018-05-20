<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Spec extends Model
{
    protected $fillable = ['name'];
    
    public function products()
    {
        return $this->belongsToMany('App\Product');
    }
}
