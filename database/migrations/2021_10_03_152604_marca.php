<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Marca extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('marca', function(Blueprint $table) {
            $table->id();
            $table->string('nome', 255);
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
        Schema::dropIfExists('marca');
        Schema::enableForeignKeyConstraints();
    }
}
