<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Exports\detailpemasukan;
use App\Exports\PengeluaranExport;
use App\Exports\pemasukanExport;
use App\Exports\pemasukanlain;
use Maatwebsite\Excel\Facades\Excel;

class laporanController extends Controller
{
    public function exportpemasukanlain($bulan , $tahun){
    $namafile = "laporan_pemasukan_lain_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new pemasukanlain($bulan,$tahun),$namafile);
    }

    public function cetakpemasukanlain($bulan,$tahun){
        $data = DB::table('tb_tambahstoks')
        ->select(DB::raw('tb_tambahstoks.*,admins.username,tb_barangs.barang_jenis,tb_kodes.harga_beli'))
        ->leftjoin('admins','admins.id','=','tb_tambahstoks.idadmin')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_tambahstoks.idwarna')
        ->leftjoin('tb_kodes','tb_kodes.kode_barang','=','tb_tambahstoks.kode_barang')
        ->where('tb_tambahstoks.aksi','kurangi')
        ->whereMonth('tb_tambahstoks.tgl',$bulan)
        ->whereYear('tb_tambahstoks.tgl',$tahun)
        ->orderby('tb_tambahstoks.id','desc')
        ->get();
        $total = DB::table('tb_tambahstoks')
        ->select(DB::raw('SUM(total) as totalnya'))
        ->where('tb_tambahstoks.aksi','kurangi')
        ->whereMonth('tb_tambahstoks.tgl',$bulan)
        ->whereYear('tb_tambahstoks.tgl',$tahun)
        ->get();
        return view('laporan/cetakpemasukanlain',['data'=>$data,'bulan'=>$bulan,'tahun'=>$tahun,'totalnya'=>$total]);
    }
    public function tampilpemasukanlain(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tanggalnya = explode('-', $request->bulan);
        $data = DB::table('tb_tambahstoks')
        ->select(DB::raw('tb_tambahstoks.*,admins.username,tb_barangs.barang_jenis,tb_kodes.harga_beli'))
        ->leftjoin('admins','admins.id','=','tb_tambahstoks.idadmin')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_tambahstoks.idwarna')
        ->leftjoin('tb_kodes','tb_kodes.kode_barang','=','tb_tambahstoks.kode_barang')
        ->where('tb_tambahstoks.aksi','kurangi')
        ->whereMonth('tb_tambahstoks.tgl',$tanggalnya[0])
        ->whereYear('tb_tambahstoks.tgl',$tanggalnya[1])
        ->orderby('tb_tambahstoks.id','desc')
        ->paginate(40);
        return view('laporan/pemasukanlain',['data'=>$data,'websettings'=>$webinfo,'bulan'=>$tanggalnya[0],'tahun'=>$tanggalnya[1],'data3'=>$data->appends(request()->input())]);
    }
    public function pilihpemasukanlain(){
        $data = DB::table('tb_tambahstoks')
        ->select(DB::raw('MONTH(tgl) as bulan, YEAR(tgl) as tahun'))
        ->where('aksi','kurangi')
        ->groupby('bulan')
        ->groupby('tahun')
        ->orderby('tgl','desc')
        ->get();
        $websetting = DB::table('settings')->limit(1)->get();
        return view('laporan/pilihpemasukanlain',['data'=>$data,'websettings'=>$websetting]);
    }
    public function exsportdetailpemasukan($bulan,$tahun){
        $namafile = "laporan_detail_pemasukan_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new detailpemasukan($bulan,$tahun),$namafile);
    }

    public function cetakdetailpemasukan($bulan,$tahun){
         $data = DB::table('tb_details')
        ->select(DB::raw('tb_details.*,tb_users.username,tb_barangs.barang_jenis'))
        ->leftjoin('tb_users','tb_users.id','=','tb_details.iduser')
        ->leftjoin('tb_transaksis','tb_transaksis.faktur','=','tb_details.faktur')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_details.idwarna')
        ->whereMonth('tb_details.tgl',$bulan)
        ->whereYear('tb_details.tgl',$tahun)
        ->where('tb_transaksis.status','=','sukses')
        ->orwhere('tb_transaksis.status','=','diterima')
        ->get();
        return view('laporan/cetakdetailpemasukan',['data'=>$data,'bulan'=>$bulan,'tahun'=>$tahun]);
    }
    public function tampildetailpemasukan(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tanggalnya = explode('-', $request->bulan);
        $data = DB::table('tb_details')
        ->select(DB::raw('tb_details.*,tb_users.username,tb_barangs.barang_jenis'))
        ->leftjoin('tb_users','tb_users.id','=','tb_details.iduser')
        ->leftjoin('tb_transaksis','tb_transaksis.faktur','=','tb_details.faktur')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_details.idwarna')
        ->whereMonth('tb_details.tgl',$tanggalnya[0])
        ->whereYear('tb_details.tgl',$tanggalnya[1])
        ->where('tb_transaksis.status','=','sukses')
        ->orwhere('tb_transaksis.status','=','diterima')
        ->paginate(40);
        return view('laporan/detailpemasukan',['data'=>$data,'websettings'=>$webinfo,'bulan'=>$tanggalnya[0],'tahun'=>$tanggalnya[1],'data3'=>$data->appends(request()->input())]);
    }
    public function pilihdetailpemasukan(){
        $data = DB::table('tb_details')
        ->select(DB::raw('MONTH(tgl) as bulan, YEAR(tgl) as tahun'))
        ->whereNotNull('faktur')
        ->groupby('bulan')
        ->groupby('tahun')
        ->orderby('tgl','desc')
        ->get();
        $webinfo = DB::table('settings')->limit(1)->get();
        return view('laporan/pilihdetailpemasukan',['data'=>$data,'websettings'=>$webinfo]);
    }
    public function exsportpemasukan($bulan, $tahun){
    $namafile = "laporan_pemasukan_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new PemasukanExport($bulan,$tahun),$namafile);
    }
    public function cetakpemasukan($bulan, $tahun){
       
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.*,tb_users.username,tb_bank.nama_bank'))
        ->leftjoin('tb_users','tb_users.id','=','tb_transaksis.iduser')
        ->leftjoin('tb_bank','tb_bank.id','=','tb_transaksis.pembayaran')
        ->whereMonth('tb_transaksis.tgl',$bulan)
        ->whereYear('tb_transaksis.tgl',$tahun)
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->orderby('tb_transaksis.faktur','desc')
        ->get();
        $totalnya = DB::table('tb_transaksis')
        ->select(DB::raw('SUM(total_akhir) as totalnya'))
        ->whereMonth('tb_transaksis.tgl',$bulan)
        ->whereYear('tb_transaksis.tgl',$tahun)
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->get();
        return view('laporan/cetakpemasukan',['data'=>$data,'bulan'=>$bulan,'tahun'=>$tahun,'total'=>$totalnya]);
    }
    public function tampilpemasukan(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tanggalnya = explode('-', $request->bulan);
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.*,tb_users.username,tb_bank.nama_bank'))
        ->leftjoin('tb_users','tb_users.id','=','tb_transaksis.iduser')
        ->leftjoin('tb_bank','tb_bank.id','=','tb_transaksis.pembayaran')
        ->whereMonth('tb_transaksis.tgl',$tanggalnya[0])
        ->whereYear('tb_transaksis.tgl',$tanggalnya[1])
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->orderby('tb_transaksis.faktur','desc')
        ->paginate(40);
        return view('laporan/pemasukan',['data'=>$data,'websettings'=>$webinfo,'bulan'=>$tanggalnya[0],'tahun'=>$tanggalnya[1],'data3'=>$data->appends(request()->input())]);
    }
    public function pilihpemasukan(){
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('MONTH(tgl) as bulan, YEAR(tgl) as tahun'))
        ->where('status','=','diterima')
        ->orwhere('status','=','sukses')
        ->groupby('bulan')
        ->groupby('tahun')
        ->orderby('tgl','desc')
        ->get();
        $webinfo = DB::table('settings')->limit(1)->get();
        return view('laporan/pilihpemasukan',['data'=>$data,'websettings'=>$webinfo]);
    }
    public function pilihpengeluaran(){
    	$data = DB::table('tb_tambahstoks')
        ->select(DB::raw('MONTH(tgl) as bulan, YEAR(tgl) as tahun'))
        ->where('aksi','tambah')
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
        $total = DB::table('tb_tambahstoks')
        ->select(DB::raw('SUM(total) as totalnya'))
        ->where('tb_tambahstoks.aksi','tambah')
        ->whereMonth('tb_tambahstoks.tgl',$bulan)
        ->whereYear('tb_tambahstoks.tgl',$tahun)
        ->get();
        return view('laporan/cetakpengeluaran',['data'=>$data,'bulan'=>$bulan,'tahun'=>$tahun,'total'=>$total]);
    } 

}
