<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class OrderServiceServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(
            'App\Services\OrderService' 
        );
    }
}
