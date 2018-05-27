<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use App\Product;
use Elasticsearch;

class IndexProduct implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($id)
    {
    
    }

    /**
     * Execute the job.
     * 
     * Not the best way to do it. Usefull for this project.
     * Alternatives: One job for each product index, update with cron jobs, update on edit/new.
     *
     * @return void
     */
    public function handle()
    {
        $products = Product::with(['categories', 'specs'])->get();
        foreach($products as $product) {
            $product->price = floatval($product->price);
            $data = [
                'body' => $product,
                'index' => 'shopping',
                'type' => 'product',
                'id' => $product->id,
            ];
            $return = Elasticsearch::index($data);
        }        
    }
}
