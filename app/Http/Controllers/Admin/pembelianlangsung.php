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
}
