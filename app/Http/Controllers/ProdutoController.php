<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProdutoRequest;
use App\Http\Resources\ProdutoCollection;
use App\Http\Resources\ProdutoResource;

class ProdutoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $result = Produto
            ::with(['categoria', 'marca'])
            ->ativo()
            ->codigo($request->json('codigo'))
            ->marca($request->json('marca_id'))
            ->categoria($request->json('categoria_id'))
            ->nome($request->json('nome'))
            ->descricao($request->json('descricao'))
            ->paginate();
        return new ProdutoCollection($result);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function pesquisar(Request $request)
    {
        // var_dump($request->json('codigo'));exit;
        $q = Produto
            ::with(['categoria', 'marca'])
            ->ativo()
            ->codigo($request->json('codigo'))
            ->byMarca($request->json('marca_id'))
            ->byCategoria($request->json('categoria_id'))
            ->nome($request->json('nome'))
            ->orderBy($request->query('sortBy', 'nome'), $request->query('sortType', 'asc'));
        
        if($request->query('per_page', 15) != '-1') {
            $result = $q->paginate($request->query('per_page', 15));
        } else {
            $result = $q->get();
        }

        return new ProdutoCollection($result);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProdutoRequest $request)
    {
        $produto = new Produto();
        $produto->fill($request->json()->all());
        $produto->save();
        return new ProdutoResource($produto);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $result = Produto::with(['categoria', 'marca'])->find($id);
        return new ProdutoResource($result);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ProdutoRequest $request, $id)
    {
        $produto = Produto::findOrFail($id);
        $produto->fill($request->json()->all());
        $produto->save();
        return new ProdutoResource($produto);
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

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function alerta()
    {
        $q = Produto::with(['categoria', 'marca'])
            ->ativo()
            ->alerta()
            ->orderBy('nome');
        $result = $q->get();
        return new ProdutoCollection($result);
    }
}
