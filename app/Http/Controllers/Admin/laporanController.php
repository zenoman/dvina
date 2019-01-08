<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Exports\PengeluaranExport;
use Maatwebsite\Excel\Facades\Excel;

class laporanController extends Controller
{
    public function pilihpengeluaran(){
    	$data = DB::table('tb_tambahstoks')
        ->select(DB::raw('MONTH(tgl) as bulan, YEAR(tgl) as tahun'))
        ->groupby('bulan')
        ->groupby('tahun')
        ->orderby('tgl','desc')
        ->get();
        $websetting = DB::table('settings')->limit(1)->get();
    	return view('laporan/pilihpengeluaran',['data'=>$data,'websettings'=>$websetting]);
    }

    public function exsportpengeluaran($bulan, $tahun){
     $namafile = "laporan_pengeluaran_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new PengeluaranExport($bulan,$tahun),$namafile);
    }

    public function tampilpengeluaran(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tanggalnya = explode('-', $request->bulan);
        $data = DB::table('tb_tambahstoks')
        ->select(DB::raw('tb_tambahstoks.*,admins.username,tb_barangs.barang_jenis,tb_kodes.harga_beli'))
        ->leftjoin('admins','admins.id','=','tb_tambahstoks.idadmin')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_tambahstoks.idwarna')
        ->leftjoin('tb_kodes','tb_kodes.kode_barang','=','tb_tambahstoks.kode_barang')
        ->where('tb_tambahstoks.aksi','tambah')
        ->whereMonth('tb_tambahstoks.tgl',$tanggalnya[0])
        ->whereYear('tb_tambahstoks.tgl',$tanggalnya[1])
        ->orderby('tb_tambahstoks.id','desc')
        ->paginate(40);
        return view('laporan/pengeluaran',['data'=>$data,'websettings'=>$webinfo,'bulan'=>$tanggalnya[0],'tahun'=>$tanggalnya[1],'data3'=>$data->appends(request()->input())]);
    }
    public function cetakpengeluaran($bulan,$tahun){
        $data = DB::table('tb_tambahstoks')
        ->select(DB::raw('tb_tambahstoks.*,admins.username,tb_barangs.barang_jenis,tb_kodes.harga_beli'))
        ->leftjoin('admins','admins.id','=','tb_tambahstoks.idadmin')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_tambahstoks.idwarna')
        ->leftjoin('tb_kodes','tb_kodes.kode_barang','=','tb_tambahstoks.kode_barang')
        ->where('tb_tambahstoks.aksi','tambah')
        ->whereMonth('tb_tambahstoks.tgl',$bulan)
        ->whereYear('tb_tambahstoks.tgl',$tahun)
        ->orderby('tb_tambahstoks.id','desc')
        ->get();

        return view('laporan/cetakpengeluaran',['data'=>$data,'bulan'=>$bulan,'tahun'=>$tahun]);
    } 

}
