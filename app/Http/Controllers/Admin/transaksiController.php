<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\tb_details;

class transaksiController extends Controller
{
    
    public function index()
    {
        return view('transaksi/transaksi');
    }
    public function showData(){
        $post=DB::table("tb_details")->select("*")->get();
        return response()->json($post);
    }

    public function autobarang($term){        
        $autoB=DB::table('tb_barangs')->select('kode','barang')->where('barang','Like','%'.$term.'%')->get();
        if($prefix!=null){
            return response()->json($autoB);
        }else{
            return response([
                'data'=>'Isikan Query',
            ]);
        }
    }

    public function store(Request $request)
    {
        //
        $kd=$request->get('kode_barang');
        $br=$request->get('barang');
        $hg=$request->get('harga');        
        $jml=$request->get('jumlah');
        $ta=$hg*$jml;
        $dsk="0";
        $tl=$request->get('total');
        $admin="admin";
        $post=DB::insert("insert into tb_details(kode_barang,barang,harga,jumlah,total_a,diskon,total,admin) values(?,?,?,?,?,?,?,?)",[$kd,$br,$hg,$jml,$ta,$dsk,$tl,$admin]);
        return response()->json($post);
    }

    public function edit($id)
    {
        $post=DB::table('tb_barangs')->select("*")->where('idbarang',$id)->get();
        return response()->json($post);
        
    }

    public function destroy($id)
    {
        //
        $post=DB::delete("delete from tb_details where id=?",[$id]);
        return response()->json(['done']);
    }
    public function hapus(Request $request){
        $id=$request->get('id');
        $post=DB::delete("delete from tb_details where id=?",[$id]);
        return response()->json(['done']);
    }


//--------------------------- API Android =--------------------------
    function orderBarang(Request $request){
        $id=$request->get('idwarna');
        $iduser=$request->get('iduser');        
        $tgl=date('dd-MM-yyyy');
        //$tglExp=date('');
        $kode=$request->get('kode_barang');
        $barang=$request->get('barang');
        $harga=$request->get('harga');
        $jumlah=$request->get('jumlah');
        $totala=$harga*$jumlah;
        $diskon=$request->get('diskon');
        $total=$totala-($totala*$diskon/100);
        $metod="pesan";
//simpan ke Query
        $data=DB::insert("insert into tb_details(idwarna,iduser,tgl,tgl_kadaluarsa,kode_barang,barang,harga,jumlah,total_a,diskon,total,metode) values(?,?,?,?,?,?,?,?,?,?,?,?)",[$id,$iduser,$tgl,$tglExp,$kode,$barang,$harga,$jumlah,$totala,$diskon,$total,$metod]);
        if ($data){
            return response()->json(["status"=>"1","msg"=>"Berhasil Dipesan"]);
        }else{
            return response()->json(["status"=>"0","msg"=>"Gagal Dipesan"]);
        }

    }
}
