<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;


class DashboardController extends Controller
{
   
    public function index()
    {

    	$tgl = date('d-m-Y');
    	$check = DB::table('tb_stokawals')->where('tgl',$tgl)->count();
    	if($check > 0 ){
    		
    	}else{
    		$databarang = DB::table('tb_barangs')->get();

    		foreach ($databarang as $row) {
    			DB::table('tb_stokawals')
    				->insert([
    					'idbarang'=>$row->idbarang,
    					'kode_barang'=>$row->kode,
    					'barang'=>$row->barang,
    					'jumlah'=>$row->stok,
    					'tgl'=>$tgl
    				]);
    		}
        }
        return view('home/index',[
            'jumlahuser'=>$this->jumlahuser(),
            'jumlahstok'=>$this->jumlahstok()
        ]);
    }

    function jumlahuser(){
        $jumlah = DB::table('tb_users')->count();
        return $jumlah;
    }

    function jumlahstok(){
        $jumlah = DB::table('tb_barangs')->sum('stok');
        return $jumlah;
    }

    
}
