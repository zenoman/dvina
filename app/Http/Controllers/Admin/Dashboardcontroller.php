<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;


class DashboardController extends Controller
{
    public function editprofil(){
        return view('home/editprofile');
    }
   
    public function index()
    {
        $tgl = date('d-m-Y');
        // $check = DB::table('tb_stokawals')->where('tgl',$tgl)->count();
        //    if($check <= 0 ){
        //        $databarang = DB::table('tb_kodes')
        //        ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
        //        ->select('tb_kodes.*','tb_barangs.warna','tb_barangs.stok','tb_barangs.idbarang')
        //        ->get();
        //        //dd($barang);
    	// 	foreach ($databarang as $row) {
    	// 		DB::table('tb_stokawals')
    	// 			->insert([
    	// 				'idbarang'=>$row->id,
        //                    'idwarna'=>$row->idbarang,
    	// 				'kode_barang'=>$row->kode_barang,
    	// 				'barang'=>$row->barang,
        //              'jumlah'=>$row->stok,
    	// 				'tgl'=>$tgl
    	// 			]);
    	// 	}
        //  }
        $hapuslogcancel = DB::table('log_cancel')
        ->whereMonth('tgl','!=',date("m"))
        ->delete();

        $hapusdetailcancel = DB::table('detail_cancel')
        ->whereMonth('tgl','!=',date("m"))
        ->delete();

        $hapuscancelkeranjang = DB::table('keranjang_cancel')
        ->whereMonth('tgl','!=',date("m"))
        ->delete();
        
        $datakeranjang = DB::table('tb_details')
        ->whereNull('faktur')
        ->get();
        foreach ($datakeranjang as $row) {
            if($row->tgl_kadaluarsa < date('Y-m-d')){
                DB::table('keranjang_cancel')
                ->insert([
                    'tgl'=>date('Y-m-d'),
                    'idbarang'=>$row->idwarna,
                    'jumlah'=>$row->jumlah
                ]);
                DB::table('tb_details')->where('id',$row->id)->delete();
            }
        }
        $websetting = DB::table('settings')->limit(1)->get();
        return view('home/index',[
            'jumlahuser'=>$this->jumlahuser(),
            'jumlahstok'=>$this->jumlahstok(),
            'jumlahtransaksi' =>$this->jumlahtransaksi(),
            'jumlahtransaksig'=>$this->jumlahtransaksig(),
            'websettings'=>$websetting
        ]);
    }

    function jumlahuser(){
        $jumlah = DB::table('tb_users')->count();
        return $jumlah;
    }

    function jumlahtransaksi(){
        $bulan = date('m');
        $jumlah = DB::table('tb_transaksis')->where('tgl','like','%'.$bulan.'%')->count();
        return $jumlah;
    }
    function jumlahtransaksig(){
        $bulan = date('m');
        $jumlah = DB::table('log_cancel')->where('bulan',$bulan)->count();
        return $jumlah;
    }

    function jumlahstok(){
        $jumlah = DB::table('tb_barangs')->sum('stok');
        return $jumlah;
    }

    public function cektransaksi(){
        $transaksi = DB::table('tb_transaksis')
                    ->select(DB::raw('tb_transaksis.*,tb_users.username'))
                    ->join('tb_users','tb_transaksis.iduser','=','tb_users.id')
                    ->where('tb_transaksis.status','terkirim')
                    ->get();
        return response()->json($transaksi);
    }

    public function updatetransaksi($id){
       DB::table('tb_transaksis')
        ->where('id',$id)
        ->update([
            'status'=>'dibaca'
        ]);
    }

    public function cekbar(){
        $transaksi = DB::table('tb_transaksis')
                    ->select(DB::raw('tb_transaksis.*,tb_users.username'))
                    ->join('tb_users','tb_transaksis.iduser','=','tb_users.id')
                    ->where('tb_transaksis.status','terkirim')
                    ->orwhere('tb_transaksis.status','dibaca')
                    ->limit(10)
                    ->get();
        return response()->json($transaksi);
    }
    
}
