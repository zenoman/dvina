<?php
use Illuminate\Support\Facades\Input;
//captcha
Route::get('refreshcaptcha', 'Logincontroller@refreshCaptcha');

//pengeluaran
Route::get('/pengeluaran','Admin\pengeluaranController@index');

//pembelian lain
Route::get('/pembelianlain','Admin\pembelianlainController@index');

//backup
Route::get('/tampilbackup','Admin\backupController@tampil');
Route::get('/backup','Admin\backupController@index');

//laporan
Route::get('/exsportpemasukanlain/{bulan}/{tahun}','Admin\laporanController@exportpemasukanlain');
Route::get('/cetakpemasukanlain/{bulan}/{tahun}','Admin\laporanController@cetakpemasukanlain');
Route::get('/tampilpemasukanlain','Admin\laporanController@tampilpemasukanlain');
Route::get('/laporan/pemasukanlain','Admin\laporanController@pilihpemasukanlain');
Route::get('/exsportdetailpemasukan/{bulan}/{tahun}','Admin\laporanController@exsportdetailpemasukan');
Route::get('/cetakdetailpemasukan/{bulan}/{tahun}','Admin\laporanController@cetakdetailpemasukan');
Route::get('/tampildetailpemasukan','Admin\laporanController@tampildetailpemasukan');
Route::get('/laporan/detailpemasukan','Admin\laporanController@pilihdetailpemasukan');
Route::get('/exsportpemasukan/{bulan}/{tahun}','Admin\laporanController@exsportpemasukan');
Route::get('/cetakpemasukan/{bulan}/{tahun}','Admin\laporanController@cetakpemasukan');
Route::get('/tampilpemasukan','Admin\laporanController@tampilpemasukan');
Route::get('/laporan/pemasukan','Admin\laporanController@pilihpemasukan');
Route::get('/exsportpengeluaran/{bulan}/{tahun}','Admin\laporanController@exsportpengeluaran');
Route::get('/cetakpengeluaran/{bulan}/{tahun}','Admin\laporanController@cetakpengeluaran');
Route::get('/tampilpengeluaran','Admin\laporanController@tampilpengeluaran');
Route::get('/laporan/pengeluaran','Admin\laporanController@pilihpengeluaran');

//pembelian
Route::get('pembelian/{id}/detail','Admin\PembelianController@detail');
Route::get('/pembelian/gagal','Admin\PembelianController@listtolak');

//catalog
Route::get('transaksigagal','frontend\Catalogcontroller@transaksigagal');
Route::post('/transaksi/tolak','frontend\Catalogcontroller@tolak');
Route::get('/semuaproduk/{id}/kategori','frontend\Catalogcontroller@kategori');
Route::post('/cari','frontend\Catalogcontroller@caribarang');
Route::get('/transaksisaya','frontend\Catalogcontroller@transaksisaya');
Route::post('/aksibeli','frontend\Catalogcontroller@aksibeli');
Route::get('/belisekarang','frontend\Catalogcontroller@transaksi');
Route::get('/hapuskeranjang/{id}','frontend\Catalogcontroller@hapuskeranjang');
Route::get('/keranjang','frontend\Catalogcontroller@keranjang');
Route::get('/semuaproduk','frontend\Catalogcontroller@index');
Route::get('/detailbarang/{id}','frontend\Catalogcontroller@show');
Route::post('/tambahkeranjang','frontend\Catalogcontroller@masukkeranjang');
//pembelian
Route::get('/pembelian/{id}/hapus','Admin\PembelianController@hapus');
Route::post('/pembelian','Admin\PembelianController@terima');
Route::post('/pembelian/tolak','Admin\PembelianController@tolak');
Route::get('/pembelian/{id}/sukses','Admin\PembelianController@sukses');
Route::get('/pembelian/{id}/tolak','Admin\PembelianController@tolak');
Route::get('/pembelian/{id}/terima','Admin\PembelianController@terima');
Route::get('/pembelian','Admin\PembelianController@index');

//bank
Route::resource('bank','Admin\BankController');

//dashboard admin
Route::get('/cektransaksi','Admin\Dashboardcontroller@cektransaksi');
Route::get('/cekbar','Admin\Dashboardcontroller@cekbar');
Route::get('/cektransaksi/{id}','Admin\Dashboardcontroller@updatetransaksi');
//========================================================

Route::get('/hubungikami','frontend\userUtama@hubungi');

Route::resource('/','frontend\userUtama');
Route::get('/editprofileuser','frontend\userUtama@edituser');
Route::post('/editprofileuser','frontend\userUtama@aksiedit');

Route::get('/logout','Logincontroller@logout');
Route::get('/validatelogin','Logincontroller@validatelogin');

Route::get('/admin', 'Admin\Admincontroller@index');
Route::post('/admin','Admin\Admincontroller@store');
Route::get('/admin/create','Admin\Admincontroller@create');
Route::get('/admin/{id}','Admin\Admincontroller@edit');
Route::put('/admin/{id}','Admin\Admincontroller@update');
Route::get('/admin/{id}/delete','Admin\Admincontroller@destroy');
Route::get('/admin/{id}/changepass','Admin\Admincontroller@changepass');
Route::put('/admin/{id}/changepass','Admin\Admincontroller@actionchangepass');
//=========================================================
Route::get('/user','Admin\Usercontroller@index');
Route::post('/user','Admin\Usercontroller@store');
Route::get('/user/create','Admin\Usercontroller@create');
Route::get('/user/{id}','Admin\Usercontroller@edit');
Route::put('/user/{id}','Admin\Usercontroller@update');
Route::get('/user/{id}/delete','Admin\Usercontroller@destroy');
Route::get('/user/{id}/changepass','Admin\Usercontroller@changepass');
Route::put('/user/{id}/changepass','Admin\Usercontroller@actchangepass');
Route::post('user/cari','Admin\Usercontroller@cariuser');
//==========================================================
Route::get('/kategori','Admin\Kategoricontroller@index');
Route::post('/kategori','Admin\Kategoricontroller@store');
Route::put('/kategori/{id}/update','Admin\Kategoricontroller@update');
Route::get('/kategori/{id}/delete','Admin\Kategoricontroller@destroy');
//============================================================
Route::put('/barang/{id}/updatewarna','Admin\Barangcontroller@updatewarna');
Route::get('/barang/{id}/hapuswarna','Admin\Barangcontroller@hapuswarna');
Route::post('/barang/warna','Admin\Barangcontroller@tambahwarna');
Route::post('/barang/cari','Admin\Barangcontroller@cari');
Route::get('/barang','Admin\Barangcontroller@index');
Route::get('/barang/create','Admin\Barangcontroller@create');
Route::post('/barang','Admin\Barangcontroller@store');
Route::get('/barang/{id}/hapus','Admin\Barangcontroller@destroy');
Route::get('/barang/{id}/edit','Admin\Barangcontroller@edit');
Route::put('/barang/{id}','Admin\Barangcontroller@update');
Route::get('/barang/{id}/hapusgambar','Admin\Barangcontroller@hapusgambar');
Route::post('/barang/{id}/editgambar','Admin\Barangcontroller@editgambar');
Route::get('/barang/{id}/tambahstok','Admin\Barangcontroller@tambahstok');
Route::post('/barang/tambahstok','Admin\Barangcontroller@aksitambahstok');
Route::post('/barang/hapusbanyak','Admin\Barangcontroller@hapusbanyak');
Route::get('/barang/importexcel','Admin\Barangcontroller@importexcel');
Route::get('/barang/eksportkategori','Admin\Barangcontroller@exsportexcel');
Route::post('/barang/aksiimportexcel','Admin\Barangcontroller@aksiimportexcel');
Route::get('barang/download','Admin\Barangcontroller@downloadtemplate');
//dashboard admin
Route::get('/dashboard','Admin\Dashboardcontroller@index');
//==============================================================
Route::get('/login','Logincontroller@index');
Route::get('/loginUser','Logincontroller@loginuser');
Route::post('/loginUser','Logincontroller@masukuser');
Route::post('/login/masuk','Logincontroller@masuk');
Route::get('/login/logout','Logincontroller@logout');
Route::get('/login/logoutuser','Logincontroller@logoutuser');
Route::post('/login/register','Logincontroller@register');

//setting web
Route::get('/setting','Admin\Settingcontroller@index');
Route::put('/setting/{id}','Admin\Settingcontroller@update');

//===============================================================
Route::resource('jual','Admin\transaksiController');
//---transaksi autocomp barang----
// Route::get('autB',function(){
// 	$term=Input::get('term');
// 	$data=DB::table('tb_barangs')->select('idbarang','barang','kode','harga','stok')->where('barang','LIKE','%'.$term.'%')->get();
// 	foreach($data as $dt){
// 		$rta[]=array('value'=>$dt->barang,'kode'=>$dt->kode,'harga'=>$dt->harga,'stok'=>$dt->stok);
// 	}
// 	return Response::json($rta);
// });
Route::get("/trans",function(){
	return view('transaksi\trans');
});
//----show transaksi------------------------------------------
Route::get('/showt','Admin\transaksiController@showData');
//======delete Transaksi=======================================
Route::post('/hapus','Admin\transaksiController@hapus');
//==========================slider=============================
Route::get('/slider','Admin\Slidercontroller@index');
Route::get('/slider/create','Admin\Slidercontroller@create');
Route::post('/slider','Admin\Slidercontroller@store');
Route::get('/slider/{id}/delete','Admin\Slidercontroller@destroy');
Route::get('/slider/{id}','Admin\Slidercontroller@edit');
Route::put('/slider/{id}','Admin\Slidercontroller@update');