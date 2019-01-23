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
        $kode = DB::table('tb_transaksis')
        ->where([['faktur','like','%'.$lastuser.'-%'],['metode','=','langsung']])
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
    public function tambahdetail(Request $request){
         $websetting = DB::table('settings')->limit(1)->get();
        foreach ($websetting as $ws) {
            $day = date("d")+$ws->max_tgl;
        }
         DB::table('tb_details')
            ->insert([
                'faktur'=>$request->faktur,
                'idwarna'=>$request->idwarna,
                'tgl'=>date("Y-m-d"),
                'tgl_kadaluarsa'=>date("Y")."-".date("m")."-".$day,
                'kode_barang'=>$request->kodebarang,
                'barang'=>$request->barang,
                'harga'=>$request->harga,
                'jumlah'=>$request->jumlah,
                'total_a'=>$request->totalawal,
                'diskon'=>$request->diskon,
                'total'=>$request->total,
                'admin'=>session::get('iduser'),
                'metode'=>"langsung"
            ]);
    }
    public function caridetailbarang($kode){
         $data = DB::table('tb_details')->where('faktur',$kode)->get();
        return response()->json($data);
    }

    public function hapusdetailbarang($id){
        $databarang = DB::table('tb_details')
        ->where('id',$id)
        ->get();

        foreach ($databarang as $row) {
        DB::table('keranjang_cancel')
        ->insert([
            'tgl'=>date('Y-m-d'),
            'idbarang'=>$row->idwarna,
            'jumlah'=>$row->jumlah
        ]);
        
        DB::table('tb_details')->where('id',$id)->delete();
        }
    }
}
