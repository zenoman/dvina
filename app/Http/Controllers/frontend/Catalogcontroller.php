<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

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
}
