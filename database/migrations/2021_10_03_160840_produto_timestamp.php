<?php

use App\Models\Categoria;
use App\Models\Marca;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ProdutoTimestamp extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produto', function (Blueprint $table) {
            $table->id();
            $table->string('nome', 200);
            $table->string('descricao', 3000);
            $table->string('codigo', 45);
            $table->decimal('preco', 8, 2);
            $table->decimal('custo', 8, 2);
            $table->tinyInteger('quantidade')->default(1);
            $table->tinyInteger('alerta')->default(1);
            $table->tinyInteger('ativo')->default(1);
            $table->foreignId('marca_id')->constrained('marca')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('categoria_id')->constrained('categoria')->onUpdate('cascade')->onDelete('cascade');
            // $table->foreignIdFor(Marca::class)->constrained();
            // $table->foreignIdFor(Categoria::class)->constrained();
            //$table->timestamps();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
            $table->index('id');
            $table->index('nome');
            //$table->index('descricao');
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
        Schema::dropIfExists('produto');
        Schema::enableForeignKeyConstraints();
    }
}
