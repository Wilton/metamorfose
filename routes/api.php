<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('categoria', 'CategoriaController');
Route::resource('marca', 'MarcaController');
Route::resource('produto', 'ProdutoController');
Route::resource('venda', 'VendaController');
Route::post('produto/pesquisar', 'ProdutoController@pesquisar');
Route::get('alerta/produto', 'ProdutoController@alerta');
Route::post('marca/pesquisar', 'MarcaController@pesquisar');
Route::post('categoria/pesquisar', 'CategoriaController@pesquisar');
Route::post('venda/pesquisar', 'VendaController@pesquisar');
