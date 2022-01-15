<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Categoria extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categoria', function(Blueprint $table) {
            $table->id();
            $table->string('nome');
            $table->tinyInteger('ativo')->default(1);
            $table->index(['id', 'nome']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('categoria');
        Schema::enableForeignKeyConstraints();

    }
}
