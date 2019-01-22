<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class pembelianlangsung extends Controller
{
    public function tampil(){
    	$webinfo = DB::table('settings')->limit(1)->get();
    	return view('transaksilangsung/index',['websettings'=>$webinfo]);
    }
    public function carikode(){
    	$tanggal    = date('dmy');
        $kodeuser = sprintf("%02s",session::get('iduser'));
        $lastuser = $tanggal."-".$kodeuser;
        $kode = DB::table('tb_transaksis_langsung')
        ->where('faktur','like','%'.$lastuser.'-%')
        ->max('faktur');

        if(!$kode){
            $finalkode = "DVN".$tanggal."-".$kodeuser."-000001";
        }else{
            $newkode    = explode("-", $kode);
            $nomer      = sprintf("%06s",$newkode[2]+1);
            $finalkode  = "DVN".$tanggal."-".$kodeuser."-".$nomer;
        }
        return response()->json($finalkode);
    }

    public function caribarang(Request $request){
        if($request->has('q')){
        $cari = $request->q;
        $data = DB::table('tb_kodes')
                ->select('barang','kode_barang')
                ->where('barang','like','%'.$cari.'%')
                ->orwhere('kode_barang','like','%'.$cari.'%')
                ->get();
        return response()->json($data);
        }
    }
    public function carihasilbarang($kode){
         $data = DB::table('tb_kodes')
                    ->where('kode_barang',$kode)
                    ->get();
            
        return response()->json($data);
    }
    public function cariwarna($kode){
        
        $data = DB::table('tb_barangs')
                ->select('idbarang','warna','stok')
                ->where('kode','=',$kode)
                ->get();
        return response()->json($data);
        
    }
}
