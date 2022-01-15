<?php

namespace App\Listeners;

use App\Events\ProdutoVendido;
use App\Models\Produto;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class AtualizacaoEstoque
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  ProdutoVendido  $event
     * @return void
     */
    public function handle(ProdutoVendido $event)
    {
        $produto = Produto::find($event->vendaProduto->produto_id);
        $produto->quantidade = $produto->quantidade - $event->vendaProduto->quantidade;
        $produto->save();
    }
}
