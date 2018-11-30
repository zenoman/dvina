<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class Catalogcontroller extends Controller
{
    public function index(){
        $websetting = DB::table('settings')->limit(1)->get();
    	$barangs = DB::table('tb_kodes')
            ->join('tb_kategoris', 'tb_kodes.id_kategori', '=', 'tb_kategoris.id')
            ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
            ->select(DB::raw('tb_kodes.*, tb_kategoris.kategori,SUM(tb_barangs.stok) as total'))
            ->groupBy('tb_kodes.kode_barang')
            ->orderby('tb_kodes.id','desc')
            ->paginate(15);
        $totalkeranjang = DB::table('tb_details')
        ->where([['iduser',Session::get('user_id')],['faktur',null]])
        ->count();

        $totalbayar = DB::table('tb_details')
                        ->select(DB::raw('SUM(total) as newtotal'))
                        ->where([['iduser',Session::get('user_id')],['faktur',null]])
                        ->get();
        $kategori = DB::table('tb_kategoris')->get();
    	return view('frontend/semuaproduk',['barangs'=>$barangs,'kategoris'=>$kategori,'websettings'=>$websetting,'totalkeranjang'=>$totalkeranjang,'totalbayar'=>$totalbayar]);
    }

    public function keranjang(){
        $barangs =  DB::table('tb_details')
                    ->select('tb_details.*','tb_barangs.warna','tb_kodes.id as idkode','tb_kodes.diskon')
                    ->join('tb_kodes','tb_details.kode_barang','=','tb_kodes.kode_barang')
                    ->join('tb_barangs','tb_details.idwarna','=','tb_barangs.idbarang')
                    ->where([['tb_details.iduser',Session::get('user_id')],['tb_details.faktur',null]])
                    ->get();

        $subtotal = DB::table('tb_details')
                    ->select(DB::raw('SUM(total) as total'))
                   ->where([['tb_details.iduser',Session::get('user_id')],['tb_details.faktur',null]])
                    ->get();
        $jumlah = DB::table('tb_details')->where([['iduser',Session::get('user_id')],['faktur',null]])->count();
        //dd($jumlah);
        $websetting = DB::table('settings')->limit(1)->get();
        return view('frontend/listkeranjang',['websettings'=>$websetting,'barangs'=>$barangs,'subtotal'=>$subtotal,'jumlah'=>$jumlah]);
    }

    public function show($id){
        $websetting = DB::table('settings')->limit(1)->get();
        $barangs = DB::table('tb_kodes')
            ->join('tb_kategoris', 'tb_kodes.id_kategori', '=', 'tb_kategoris.id')
            ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
            ->select(DB::raw('tb_kodes.*, tb_kategoris.kategori,SUM(tb_barangs.stok) as total'))
            ->groupBy('tb_kodes.kode_barang')
            ->orderby('tb_kodes.id','desc')
            ->where('tb_kodes.id',$id)
            ->get();
            //dd($barangs);
        return view('frontend/singleproduk',['databarang'=>$barangs,'websettings'=>$websetting]);
    }

    public function masukkeranjang(Request $request)
    {
        $websetting = DB::table('settings')->limit(1)->get();
        foreach ($websetting as $ws) {
            $day = date("d")+$ws->max_tgl;
        }
        

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
            foreach ($caribarang as $barang){
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
                'tgl_kadaluarsa'=>$day."-".date("m")."-".date("Y"),
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

    public function transaksi(){
        $datauser = DB::table('tb_users')
                    ->where('id',Session::get('user_id'))
                    ->get();

        $barangs = DB::table('tb_details')
                    ->select(DB::raw('tb_details.*,tb_kodes.barang'))
                    ->join('tb_kodes','tb_details.kode_barang','=','tb_kodes.kode_barang')
                    ->where([['tb_details.iduser',Session::get('user_id')],['tb_details.faktur',null]])
                    ->get();

        $subtotal = DB::table('tb_details')
                    ->select(DB::raw('SUM(total) as total'))
                   ->where([['tb_details.iduser',Session::get('user_id')],['tb_details.faktur',null]])
                    ->get();
        $jumlahbarang = DB::table('tb_details')
                        ->where([['tb_details.iduser',Session::get('user_id')],['tb_details.faktur',null]])
                        ->count();
        $rekening = DB::table('tb_bank')->get();
        $websetting = DB::table('settings')->limit(1)->get();
        return view('frontend\transaksi',['websettings'=>$websetting,'barangs'=>$barangs,'subtotal'=>$subtotal,'datauser'=>$datauser,'rekening'=>$rekening,'jumlah'=>$jumlahbarang]);
    }

    public function hapuskeranjang($id){
        DB::table('tb_details')->where('id',$id)->delete();
        return back();
    }

    public function aksibeli(Request $request){
        $iduser     = Session::get('user_id');
        $kode = DB::table('tb_transaksis')->max('faktur');
        if($kode != NULL){
            $numkode = substr($kode, 5);
            $countkode = $numkode+1;
            $newkode = "DVINA".sprintf("%05s", $countkode);
        }else{
            $newkode = "DVINA00001";
        }
        $tgl = date("d-m-Y");
        $total = $request->total;
        $alamat = $request->alamat;
        $pembayaran = $request->pembayaran;
        $keterangan = $request->keterangan;

        DB::table('tb_transaksis')
        ->insert([
            'iduser'=>$iduser,
            'faktur'=>$newkode,
            'tgl'=>$tgl,
            'total'=>$total,
            'status'=>'terkirim',
            'alamat_tujuan'=>$alamat,
            'keterangan'=>$keterangan,
            'pembayaran'=>$pembayaran
        ]);
        DB::table('tb_details')
        ->where([['iduser',Session::get('user_id')],['faktur',null]])
        ->update([
            'faktur'=>$newkode
        ]);

         return redirect('transaksisaya');
    }

    public function transaksisaya(){
        $transaksi = DB::table('tb_transaksis')->where('iduser',Session::get('user_id'))->paginate(15);
        $websetting = DB::table('settings')->limit(1)->get();
        return view('frontend/transaksisaya',['websettings'=>$websetting,'transaksis'=>$transaksi]);
    }
}
