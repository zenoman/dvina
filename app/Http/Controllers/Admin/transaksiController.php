<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\tb_details;

class transaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //        
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

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $post=DB::table('tb_barangs')->select("*")->where('idbarang',$id)->get();
        return response()->json($post);
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
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
}
