<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class Catalogcontroller extends Controller
{
    public function index(){
    	$barangs = DB::table('tb_kodes')
            ->join('tb_kategoris', 'tb_kodes.id_kategori', '=', 'tb_kategoris.id')
            ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
            ->select(DB::raw('tb_kodes.*, tb_kategoris.kategori,SUM(tb_barangs.stok) as total'))
            ->groupBy('tb_kodes.kode_barang')
            ->orderby('tb_kodes.id','desc')
            ->paginate(15);
    	return view('frontend/semuaproduk',['barangs'=>$barangs]);
    }
    public function show($id){
        $barangs = DB::table('tb_kodes')
            ->join('tb_kategoris', 'tb_kodes.id_kategori', '=', 'tb_kategoris.id')
            ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
            ->select(DB::raw('tb_kodes.*, tb_kategoris.kategori,SUM(tb_barangs.stok) as total'))
            ->groupBy('tb_kodes.kode_barang')
            ->orderby('tb_kodes.id','desc')
            ->where('tb_kodes.id',$id)
            ->get();
            //dd($barangs);
        return view('frontend/singleproduk',['databarang'=>$barangs]);
    }
    public function masukkeranjang(Request $request)
    {
        $datawarna = explode("-", $request->warna);
        $cariwarnas = DB::table('tb_barangs')
                    ->where('idbarang',$datawarna[0])
                    ->get();
        

        foreach ($cariwarnas as $warna) {
           $stokterkini = $warna->stok;
        
        if ($stokterkini<$datawarna[1]) {
            return back()->with('error','Maaf, Stok telah di update silahkan ulangi pemesanan anda');
        }else{
            $caribarang = DB::table('tb_kodes')
                        ->where('kode_barang',$request->kode_barang)
                        ->get();
            foreach ($caribarang as $barang) {
                    $nama = $barang->barang;
                    $harga = $barang->harga_barang; 
                    $diskon = $barang->diskon;
            }
            $totaldiskon = $diskon/100*$request->jumlah*$harga;            
            DB::table('tb_details')
            ->insert([
                'idwarna'=>$datawarna[0],
                'iduser'=>Session::get('user_id'),
                'tgl'=>date("d-m-Y"),
                'kode_barang'=>$request->kode_barang,
                'barang'=>$nama,
                'harga'=>$harga,
                'jumlah'=>$request->jumlah,
                'total_a'=>($request->jumlah*$harga),
                'diskon'=>$totaldiskon,
                'total'=>($request->jumlah*$harga)-$totaldiskon,
                'metode'=>"pesan"


            ]);
            return back();
        }
    }
    }
}
