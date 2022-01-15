<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\CategoriaRequest;
use App\Http\Resources\CategoriaCollection;
use App\Http\Resources\CategoriaResource;
use App\Models\Categoria;

class CategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $collecton = new CategoriaCollection(Categoria::all());
        return $collecton;
        // nome($request->input('nome'))
        //     ->ativo($request->input('ativo'))
        //     ->paginate();

        // return response()->json([
        //     'data' => $result,
        // ]);
    }

    public function pesquisar(Request $request)
    {
        $collection = new CategoriaCollection(
            Categoria::nome($request->json('nome'))->ativo($request->json('ativo'))
                ->orderBy($request->query('sortBy', 'nome'), $request->query('sortType', 'asc'))
                ->paginate($request->query('per_page', 15))
        );
        return $collection;
        // return response()->json([
        //     'data' => $result->toArray(),
        // ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CategoriaRequest $request)
    {
        $categoria = new Categoria();
        $categoria->fill($request->json()->all());
        $categoria->save();
        // return response()->json($categoria->toArray());
        return new CategoriaResource($categoria);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $categoria = Categoria::find($id);
        return new CategoriaResource($categoria);
        // return response()->json([
        //     'data' => $result,
        // ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoriaRequest $request, $id)
    {
        // var_dump($request->json()->all());
        // exit;
        $categoria = Categoria::findOrFail($id);
        $categoria->fill($request->json()->all());
        // $categoria->nome = $request->input('nome');
        // $categoria->ativo = $request->input('ativo');
        $categoria->save();
        return new CategoriaResource($categoria);
        // return response()->json($categoria->toArray());
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
