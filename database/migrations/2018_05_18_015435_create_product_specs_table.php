<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductSpecsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_spec', function (Blueprint $table) {
            $table->increments('id');
            $table->string('value');
            $table->unsignedInteger('spec_id');
            $table->unsignedInteger('product_id');
            $table->timestamps();

            $table->foreign('spec_id')->references('id')->on('specs')
            ->onDelete('cascade');;
            $table->foreign('product_id')->references('id')->on('products')
            ->onDelete('cascade');;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_specs');
    }
}
