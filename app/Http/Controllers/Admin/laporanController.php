<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class laporanController extends Controller
{
    public function pilihpengeluaran(){
    	// $data = DB::table('tb_tambahstoks')
    	// ->select(DB::raw('tb_tambahstoks.*,admins.username,tb_barangs.barang_jenis'))
    	// ->leftjoin('admins','admins.id','=','tb_tambahstoks.idadmin')
    	// ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_tambahstoks.idwarna')
    	// ->get();
    	$data = DB::table('tb_tambahstoks')
        ->select(DB::raw('MONTH(tgl) as bulan, YEAR(tgl) as tahun'))
        ->groupby('bulan')
        ->groupby('tahun')
        ->orderby('tgl','desc')
        ->get();
        $websetting = DB::table('settings')->limit(1)->get();
    	return view('laporan/pilihpengeluaran',['data'=>$data,'websettings'=>$websetting]);
    } 

}
