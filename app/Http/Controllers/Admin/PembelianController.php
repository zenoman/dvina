<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class PembelianController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $pembelians = DB::table('tb_transaksis')
                    ->select(DB::raw('tb_transaksis.*,tb_users.username,tb_users.telp,tb_bank.nama_bank'))
                    ->join('tb_users','tb_transaksis.iduser','=','tb_users.id')
                    ->join('tb_bank','tb_transaksis.pembayaran','=','tb_bank.id')
                    ->orderby('tb_transaksis.id','desc')
                    ->paginate(40);
        return view('pembelian/index',['pembelians'=>$pembelians,'websettings'=>$websetting]);
    }

    public function terima(Request $request){
        $id         = $request->kode;
        $idadmin    = $request->admin;
        $total      = $request->total + $request->ongkir;
        $ongkir     = $request->ongkir;

        DB::table('tb_transaksis')
        ->where('id',$id)
        ->update([
            'status'=>'diterima',
            'total_akhir'=>$total,
            'ongkir'=>$ongkir
        ]);
        
       return back()->with('status','Pembelian Diterima');
    }

    public function tolak($id){
        DB::table('tb_transaksis')
        ->where('id',$id)
        ->update(['status'=>'ditolak']);
        
       return back()->with('status','Pembelian Ditolak');
    }

    public function sukses($id){
        DB::table('tb_transaksis')
        ->where('id',$id)
        ->update(['status'=>'sukses']);
        
       return back()->with('status','Pembelian Sukses');
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
    }
}
