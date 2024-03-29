<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class VendaTotalEQuantidade extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('venda', function (Blueprint $table) {
            $table->decimal('total')->default(0);
            $table->smallInteger('quantidade')->default(0);
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
        Schema::table('venda', function (Blueprint $table){
            $table->dropColumn('total');
            $table->dropColumn('quantidade');
        });
    }
}
