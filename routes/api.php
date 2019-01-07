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
Route::post('login/','Logincontroller@loginApi');
Route::get('gambar_item/{id}','Admin\Barangcontroller@gmbItem');
Route::get('warna_item/{id}','Admin\Barangcontroller@warnaItem');
Route::get('kategori/{id}','Admin\Barangcontroller@perKategori');
Route::get('kategoriPage/{id}?page={page}','Admin\Barangcontroller@perPageKategori');
//pemesanan
Route::post('pesan/','Admin\transaksiController@orderBarang');

