<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/{any}', function () {
    return view('app');
})->where('any', '.*');


/*
Route::get('/', function () {
    return view('index');
});

Route::get('/', function () {
    return view('index');
});

// Route::get('/','DashboardController@index');
Route::group(['prefix' => 'student'], function(){
Route::get('/create', ['uses' => 'StudentController@create','as' => 'student.create']);
});
Route::get('/report/retention', ['uses' => 'ReportRetentionController@index', 'as' => 'report.retention']);
Route::get('/report/retention-detail', ['uses' => 'ReportRetentionController@detail', 'as' => 'report.retention.detail']);
*/