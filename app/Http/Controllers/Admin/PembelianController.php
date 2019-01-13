<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
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
                    ->leftjoin('tb_users','tb_transaksis.iduser','=','tb_users.id')
                    ->leftjoin('tb_bank','tb_transaksis.pembayaran','=','tb_bank.id')
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

    public function tolak(Request $request){
        $kode = $request->kode;
        $iduser = $request->iduser;
        $keterangan = $request->keterangan;
        //==================================================
        $maxkode = DB::table('log_cancel')->max('faktur');
        if($maxkode != NULL){
            $numkode = substr($maxkode, 6);
            $countkode = $numkode+1;
            $newkode = "Cancel".sprintf("%05s", $countkode);
        }else{
            $newkode = "Cancel00001";
        }
        //===================================================
        $transaksi = DB::table('tb_transaksis')
        ->where('id',$kode)
        ->get();
        foreach ($transaksi as $row) {
            DB::table('log_cancel')
            ->insert([
                'faktur'=>$newkode,
                'total_akhir'=>$row->total,
                'tgl'=>date("d-m-Y"),
                'bulan'=>date("m"),
                'status'=>'ditolak',
                'id_user'=>$row->iduser,
                'id_admin'=>$iduser,
                'keterangan'=>$keterangan
            ]);
            $caridetail = DB::table('tb_details')
            ->where('faktur',$row->faktur)
            ->get();
            foreach ($caridetail as $cdl) {
                DB::table('detail_cancel')
                ->insert([
                'idwarna'=>$cdl->idwarna,
                'iduser'=>$cdl->iduser,
                'kode'=>$newkode,
                'tgl'=>$cdl->tgl,
                'jumlah'=>$cdl->jumlah,
                'harga'=>$cdl->harga,
                'barang'=>$cdl->barang,
                'total'=>$cdl->total,
                'diskon'=>$cdl->diskon
                ]);
            }
            DB::table('tb_details')->where('faktur',$row->faktur)->delete();
            DB::table('tb_transaksis')->where('id',$kode)->delete();
        }
       return back()->with('status','Pembelian Ditolak');
    }
    public function listtolak(){
        
        $websetting = DB::table('settings')->limit(1)->get();
        $cancels = DB::table('log_cancel')
                    ->select(DB::raw('log_cancel.*,tb_users.username,tb_users.telp'))
                    ->leftjoin('tb_users','log_cancel.id_user','=','tb_users.id')
                    ->orderby('log_cancel.id','desc')
                    ->paginate(40);
        return view('pembelian/listcancel',['cancels'=>$cancels,'websettings'=>$websetting]);
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
    public function hapus($id)
    {
        DB::table('tb_details')->where('faktur',$id)->delete();
        DB::table('tb_transaksis')->where('faktur',$id)->delete();
        return back()->with('status','Data Berhasil Dihapus');
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
    public function detail($id)
    {
        $kode = DB::table('tb_transaksis')
        ->where('id',$id)
        ->limit(1)
        ->get();
        foreach ($kode as $row) {
            $kodenya = $row->faktur;
        }
        $data = DB::table('tb_details')
        ->where('faktur',$kodenya)
        ->get();
         $websetting = DB::table('settings')->limit(1)->get();
         return view('pembelian/detail',['kode'=>$kode,'data'=>$data,'websettings'=>$websetting]);
    }
}
