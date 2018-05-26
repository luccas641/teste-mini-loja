<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::resource('carts', 'Api\CartController')
    ->only(['index', 'show', 'update', 'destroy']);

Route::resource('categories', 'Api\CategoryController')
    ->only(['index', 'show']);

Route::resource('products', 'Api\ProductController')
    ->only(['index', 'show']);

Route::resource('specs', 'Api\SpecController')
->only(['index', 'show']);

Route::group([
    'middleware' => 'api',
], function ($router) {
    Route::resource('orders', 'Api\OrderController')
    ->only(['index', 'show', 'store']);
});

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {

    Route::post('register', 'Api\AuthController@register');
    Route::post('login', 'Api\AuthController@login');
    Route::post('logout', 'Api\AuthController@logout');
    Route::get('refresh', 'Api\AuthController@refresh');
    Route::get('user', 'Api\AuthController@me');

});
