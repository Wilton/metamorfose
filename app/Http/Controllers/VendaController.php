<?php

namespace App\Http\Controllers;

use App\Events\ProdutoVendido;
use App\Models\Produto;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\VendaCollection;
use App\Http\Resources\VendaResource;
use App\Models\Pagamento;
use App\Models\Venda;
use App\Models\VendaProduto;

class VendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $result = Venda::with([
                'VendaProduto', 
                'Pagamento', 
                'VendaProduto.produto', 
                'Pagamento.tipoPagamento', 
                'VendaProduto.produto.marca'
            ])
            ->latest()
            ->paginate();
        return new VendaCollection($result);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function pesquisar(Request $request)
    {
        $result = Venda::with([
                'VendaProduto', 
                'Pagamento', 
                'VendaProduto.produto', 
                'Pagamento.tipoPagamento', 
                'VendaProduto.produto.marca'
            ])
            ->inicio($request->json('inicio'))
            ->fim($request->json('fim'))
            ->orderBy('id', 'desc')
            ->paginate();
        return new VendaCollection($result);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dadosVenda = $request->json('venda');
        $venda = new Venda();
        $venda->fill($dadosVenda);
        $venda->save();

        $items = $request->json('items');
        $total = 0;
        $quantidade = 0;
        foreach($items as $item) {
            $quantidade += $item['quantidade'];
            $total += $item['preco'] * $item['quantidade'];

            $vendaProduto = new VendaProduto();
            $vendaProduto->produto_id = $item['produto_id'];
            $vendaProduto->quantidade = $item['quantidade'];
            $vendaProduto->preco = $item['preco'];
            $vendaProduto->venda_id = $venda->id;
            $vendaProduto->save();
            ProdutoVendido::dispatch($vendaProduto);
        }

        $venda->total = number_format($total, 2);
        $venda->quantidade = $quantidade;
        $venda->save();

        $pagamentos = $request->json('pagamentos');
        foreach($pagamentos as $pg) {
            $pagamento = new Pagamento();
            $pagamento->tipo_pagamento_id = $pg['tipo_pagamento_id'];
            $pagamento->valor = $pg['valor'];
            $pagamento->venda_id = $venda->id;

            if(isset($pg['parcelas'])) {
                $pagamento->parcelas = $pg['parcelas'];
            }
            $pagamento->save();
        }

        return new VendaResource(
            Venda::with(['VendaProduto.produto', 'Pagamento.tipoPagamento'])->find($venda->id)
        );

        // return response()->json([
        //     'data' => Venda::with(['VendaProduto.produto', 'Pagamento.tipoPagamento'])->find($venda->id),
        // ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $result = Venda::with(['VendaProduto.produto', 'Pagamento.tipoPagamento'])->find($id);
        return new VendaResource($result);
        // return response()->json([
        //     'data' => $result,
        // ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
