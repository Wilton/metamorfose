<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendaProdutosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('venda_produto', function (Blueprint $table) {
            $table->id();
            $table->tinyInteger('quantidade');
            $table->decimal('preco');
            // $table->unsignedBigInteger('produto_id');
            // $table->unsignedBigInteger('venda_id');
            $table->foreignId('produto_id')->constrained('produto')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('venda_id')->constrained('venda')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
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
        Schema::dropIfExists('venda_produto');
        Schema::enableForeignKeyConstraints();
    }
}
