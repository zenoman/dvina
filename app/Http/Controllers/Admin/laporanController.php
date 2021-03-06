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
use App\Exports\transaksilangsung;
use App\Exports\detailtransaksilangsung;
use Maatwebsite\Excel\Facades\Excel;

class laporanController extends Controller
{
    public function totalaset(){
        $webinfo = DB::table('settings')->limit(1)->get();
        $barang = DB::table('tb_kodes')
            ->join('tb_kategoris', 'tb_kodes.id_kategori', '=', 'tb_kategoris.id')
            ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
            ->select(DB::raw('tb_kodes.*, tb_kategoris.kategori,SUM(tb_barangs.stok) as total, SUM(tb_barangs.stok) * tb_kodes.harga_beli as tot'))
            ->groupBy('tb_kodes.kode_barang')
            ->orderby('tb_kodes.id','desc')
            ->paginate(50);
        $barangg = DB::table('tb_kodes')
            ->join('tb_kategoris', 'tb_kodes.id_kategori', '=', 'tb_kategoris.id')
            ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
            ->select(DB::raw('tb_kodes.*, tb_kategoris.kategori,SUM(tb_barangs.stok) as total, SUM(tb_barangs.stok) * tb_kodes.harga_beli as tot'))
            ->groupBy('tb_kodes.kode_barang')
            ->orderby('tb_kodes.id','desc')
            ->get();
        return view('laporan/totalaset',['barangg'=>$barangg,'barang'=>$barang,'websettings'=>$webinfo]);
    }
    //============================================================================

    public function exportpemasukanlain($bulan , $tahun){
    $namafile = "laporan_pemasukan_lain_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new pemasukanlain($bulan,$tahun),$namafile); 
    }

    //=============================================================================
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

    //=============================================================================
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

    //=============================================================================
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

    //=============================================================================
    public function exsportdetailpemasukan($tgl1,$tgl2){
        $namafile = "laporan_detail_pemasukan_tanggal_".$tgl1."_sampai_".$tgl2.".xlsx";
     return Excel::download(new detailpemasukan($tgl1,$tgl2),$namafile);
    }

    //=============================================================================
    public function cetakdetailpemasukan($tgl1,$tgl2){
         $data = DB::table('tb_details')
        ->select(DB::raw('tb_details.*,tb_users.username,tb_barangs.barang_jenis,tb_kodes.harga_beli'))
        ->leftjoin('tb_users','tb_users.id','=','tb_details.iduser')
        ->leftjoin('tb_transaksis','tb_transaksis.faktur','=','tb_details.faktur')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_details.idwarna')
        ->leftjoin('tb_kodes','tb_kodes.kode_barang','=','tb_details.kode_barang')
        ->whereBetween('tb_details.tgl',[$tgl1,$tgl2])
        ->where('tb_transaksis.status','=','sukses')
        ->orwhere('tb_transaksis.status','=','diterima')
        ->get();
        return view('laporan/cetakdetailpemasukan',['data'=>$data,'tgl1'=>$tgl1,'tgl2'=>$tgl2]);
    }

    //=============================================================================
    public function tampildetailpemasukan(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tgl1= $request->tgl1;
        $tgl2= $request->tgl2;
        $data = DB::table('tb_details')
        ->select(DB::raw('tb_details.*,tb_users.username,tb_barangs.barang_jenis,tb_kodes.harga_beli'))
        ->leftjoin('tb_users','tb_users.id','=','tb_details.iduser')
        ->leftjoin('tb_transaksis','tb_transaksis.faktur','=','tb_details.faktur')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_details.idwarna')
        ->leftjoin('tb_kodes','tb_kodes.kode_barang','=','tb_details.kode_barang')
        ->whereBetween('tb_details.tgl',[$tgl1, $tgl2])
        ->where('tb_transaksis.status','=','sukses')
        ->orwhere('tb_transaksis.status','=','diterima')
        ->paginate(40);
        return view('laporan/detailpemasukan',['data'=>$data,'websettings'=>$webinfo,'tgl1'=>$tgl1,'tgl2'=>$tgl2,'data3'=>$data->appends(request()->input())]);
    }
      //=====================================================================
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
    //=====================================================================
    public function exsportpemasukan($tgl1, $tgl2){
    $namafile = "laporan_pemasukan_tgl_".$tgl1."_sampai_".$tgl2.".xlsx";
     return Excel::download(new PemasukanExport($tgl1, $tgl2),$namafile);
    }
    //=====================================================================
    public function cetakpemasukan($tgl1, $tgl2){
       
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.*,tb_users.username,tb_bank.nama_bank'))
        ->leftjoin('tb_users','tb_users.id','=','tb_transaksis.iduser')
        ->leftjoin('tb_bank','tb_bank.id','=','tb_transaksis.pembayaran')
         ->whereBetween('tb_transaksis.tgl',[$tgl1,$tgl2])
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->orderby('tb_transaksis.faktur','desc')
        ->get();
        $totalnya = DB::table('tb_transaksis')
        ->select(DB::raw('SUM(total_akhir) as totalnya'))
         ->whereBetween('tb_transaksis.tgl',[$tgl1,$tgl2])
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->get();
        return view('laporan/cetakpemasukan',['data'=>$data,'tgl1'=>$tgl1,'tgl2'=>$tgl2,'total'=>$totalnya]);
    }

    //==============================================================
    public function tampilpemasukan(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tgl1 = $request->tgl1;
        $tgl2 = $request->tgl2;
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.*,tb_users.username,tb_bank.nama_bank'))
        ->leftjoin('tb_users','tb_users.id','=','tb_transaksis.iduser')
        ->leftjoin('tb_bank','tb_bank.id','=','tb_transaksis.pembayaran')
        ->whereBetween('tb_transaksis.tgl',[$tgl1,$tgl2])
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->orderby('tb_transaksis.faktur','desc')
        ->paginate(40);
        return view('laporan/pemasukan',['data'=>$data,'websettings'=>$webinfo,'tgl1'=>$tgl1,'tgl2'=>$tgl2,'data3'=>$data->appends(request()->input())]);
    }

    //==============================================================
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

    //==============================================================
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

    //==============================================================
    public function exsportpengeluaran($bulan, $tahun){
     $namafile = "laporan_pengeluaran_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new PengeluaranExport($bulan,$tahun),$namafile);
    }

    //==============================================================
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
    public function pilihtransaksilangsung(){
        $webinfo = DB::table('settings')->limit(1)->get();
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('MONTH(tgl) as bulan,YEAR(tgl) as tahun'))
        ->where('metode','langsung')
        ->groupby('bulan')
        ->groupby('tahun')
        ->orderby('tgl','desc')
        ->get();
        return view('laporan/pilihtransaksilangsung',['websettings'=>$webinfo,'data'=>$data]);
    }

    public function tampiltransaksilangsung(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tanggalnya = explode('-', $request->bulan);
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.*,admins.username'))
        ->leftjoin('admins','admins.id','=','tb_transaksis.admin')
        ->whereMonth('tb_transaksis.tgl',$tanggalnya[0])
        ->whereYear('tb_transaksis.tgl',$tanggalnya[1])
        ->where('tb_transaksis.metode','langsung')
        ->orderby('tb_transaksis.id','desc')
        ->paginate(40);
        
        return view('laporan/transaksilangsung',['data'=>$data,'websettings'=>$webinfo,'bulan'=>$tanggalnya[0],'tahun'=>$tanggalnya[1],'data3'=>$data->appends(request()->input())]);
    }

    public function cetaktransaksilangsung($bulan,$tahun){
        $data = DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.*,admins.username'))
        ->leftjoin('admins','admins.id','=','tb_transaksis.admin')
        ->whereMonth('tb_transaksis.tgl',$bulan)
        ->whereYear('tb_transaksis.tgl',$tahun)
        ->where('tb_transaksis.metode','langsung')
        ->orderby('tb_transaksis.id','desc')
        ->get();
        $totalnya = DB::table('tb_transaksis')
        ->select(DB::raw('SUM(total_akhir) as totalnya'))
        ->whereMonth('tb_transaksis.tgl',$bulan)
        ->whereYear('tb_transaksis.tgl',$tahun)
        ->where('tb_transaksis.metode','langsung')
        ->get();
        return view('laporan/cetaktransaksilangsung',['data'=>$data,'bulan'=>$bulan,'tahun'=>$tahun,'total'=>$totalnya]);
    }

    public function exporttransaksilangsung($bulan,$tahun){
        $namafile = "laporan_transaksi_langsung_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new transaksilangsung($bulan,$tahun),$namafile); 
    }

    public function pilihdetailtransaksi(){
        $webinfo = DB::table('settings')->limit(1)->get();
        $data = DB::table('tb_details')
        ->select(DB::raw('MONTH(tgl) as bulan,YEAR(tgl) as tahun'))
        ->where('metode','langsung')
        ->groupby('bulan')
        ->groupby('tahun')
        ->orderby('tgl','desc')
        ->get();
        return view('laporan/pilihdetailtransaksi',['websettings'=>$webinfo,'data'=>$data]);
    }
    public function detailtransaksi(Request $request){
        $webinfo = DB::table('settings')->limit(1)->get();
        $tanggalnya = explode('-', $request->bulan);
        $data = DB::table('tb_details')
        ->select(DB::raw('tb_details.*,admins.username'))
        ->leftjoin('admins','admins.id','=','tb_details.admin')
        ->whereMonth('tb_details.tgl',$tanggalnya[0])
        ->whereYear('tb_details.tgl',$tanggalnya[1])
        ->where('tb_details.metode','langsung')
        ->orderby('tb_details.id','desc')
        ->paginate(40);
        
        return view('laporan/detailtransaksi',['data'=>$data,'websettings'=>$webinfo,'bulan'=>$tanggalnya[0],'tahun'=>$tanggalnya[1],'data3'=>$data->appends(request()->input())]);
    }
    public function cetakdetailtransaksi($bulan,$tahun){
        $data = DB::table('tb_details')
        ->select(DB::raw('tb_details.*,admins.username'))
        ->leftjoin('admins','admins.id','=','tb_details.admin')
        ->whereMonth('tb_details.tgl',$bulan)
        ->whereYear('tb_details.tgl',$tahun)
        ->where('tb_details.metode','langsung')
        ->orderby('tb_details.id','desc')
        ->get();
        $totalnya = DB::table('tb_details')
        ->select(DB::raw('SUM(total) as totalnya'))
        ->whereMonth('tgl',$bulan)
        ->whereYear('tgl',$tahun)
        ->where('metode','langsung')
        ->get();
         return view('laporan/cetakdetailtransaksi',['data'=>$data,'bulan'=>$bulan,'tahun'=>$tahun,'total'=>$totalnya]);
    } 
    public function exportdetailtransaksi($bulan,$tahun){
         $namafile = "laporan_detail_transaksi_langsung_bulan_".$bulan."_tahun_".$tahun.".xlsx";
     return Excel::download(new detailtransaksilangsung($bulan,$tahun),$namafile); 
    }

}
