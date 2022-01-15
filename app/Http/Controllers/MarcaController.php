<?php

namespace App\Http\Controllers;

use App\Models\Marca;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\MarcaRequest;
use App\Http\Resources\MarcaCollection;
use App\Http\Resources\MarcaResource;

class MarcaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $result = Marca::ativo()
            ->orderBy('nome')
            ->get();

        return MarcaResource::collection($result);
    }

    public function pesquisar(Request $request)
    {
        $collection = new MarcaCollection( 
            Marca::nome($request->json('nome'))->ativo($request->json('ativo'))
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
    public function store(MarcaRequest $request)
    {
        $marca = new Marca();
        $marca->fill($request->json()->all());
        $marca->save();
        // return response()->json($marca->toArray());
        return new MarcaResource($marca);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // $result = new MarcaResource(Marca::find($id));
        return new MarcaResource(Marca::find($id));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(MarcaRequest $request, $id)
    {
        // var_dump($request->json()->all());
        // exit;
        $marca = Marca::findOrFail($id);
        $marca->fill($request->json()->all());
        // $marca->nome = $request->input('nome');
        // $marca->ativo = $request->input('ativo');
        $marca->save();
        // return response()->json($marca->toArray());
        return new MarcaResource($marca);
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
