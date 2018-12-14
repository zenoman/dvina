<?php

use Illuminate\Http\Request;

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
Route::get('listBarang/','Admin\Barangcontroller@getBarang');
Route::get('listEtalase/','Admin\Barangcontroller@listEtalase');
Route::get('listKategori/','Admin\Kategoricontroller@getKategori');
Route::post('/loginUser','Logincontroller@loginApi');
Route::get('slider/','Admin\Slidercontroller@getSlider');
Route::get('kategori/{public}/{img}/{kategori}',function(){

});
