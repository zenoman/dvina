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
        $tgl=date('y-m-d');
       
        $kode=$request->get('kode_barang');
        $barang=$request->get('barang');
        $harga=$request->get('harga');
        $jumlah=$request->get('jumlah');
        $totala=$harga*$jumlah;
        $diskon=$request->get('diskon');
        $total=$totala-($totala*$diskon/100);
        $metod="pesan";
        //cek tgl
        $maxtgl=DB::table("settings")->first();
        $keep=$maxtgl->max_tgl;
        $tglExp=Date('y-m-d',strtotime("+".$keep." days"));
        //cek Stok
        $sisa=DB::table("tb_barangs")
                ->where('idbarang',$id)->first();
        $stk=$sisa->stok;
        if($stk<$jumlah){
            return response()->json(["status"=>"0","pesan"=>"Stok Barang Tersisa ".$stk]);
        }else{
           
             //simpan ke Query
             $data=DB::insert("insert into tb_details(idwarna,iduser,tgl,tgl_kadaluarsa,kode_barang,barang,harga,jumlah,total_a,diskon,total,metode) values(?,?,?,?,?,?,?,?,?,?,?,?)",[$id,$iduser,$tgl,$tglExp,$kode,$barang,$harga,$jumlah,$totala,$diskon,$total,$metod]);
             if ($data){
                 return response()->json(["status"=>"1","pesan"=>"Berhasil Dipesan,Lihat Keranjang"]);
             }else{
                 return response()->json(["status"=>"0","pesan"=>"Gagal Dipesan"]);
             }            
        }        

    }
    //tampil Keranjang
    function vBelanja($id){
        $data=DB::table("tb_details")
                ->where("iduser",$id)
                ->where("sb","0")
                ->join("tb_barangs","idbarang","=","idwarna")
                ->join("gambar","tb_details.kode_barang","=","gambar.kode_barang")
                ->groupBy("tb_details.id")
                ->select(DB::raw("tb_details.*,tb_barangs.warna,gambar.nama"))
                ->get();        
        return response()->json(["data"=>$data]);                               
    }
    function hapusk(Request $req){
        $id=$req->get("id");
        $data=DB::delete("delete from tb_details where id=?",[$id]);
        if($data){
            return response()->json(["pesan"=>"Berhasil Dihapus"]);
        }else{
            return response()->json(["pesan"=>"Gagal Dihapus"]);
        }
    }
    function totalK($id){
        $data=DB::table("tb_details")
                ->select(DB::raw("SUM(total) as total"))
                ->where("iduser",$id)
                ->where("sb","0")
                ->first();
        return response()->json($data);        
    }
    function vBank(){
        $data=DB::table("tb_bank")
                ->where('rekening','!=','-')
                ->get();
        return response()->json(["data"=>$data]);
    }
    function carikode(){
         //Cari Kode
         $tgl=date("dmy"); 
         $tgltr=date("ymd");
         $fk=DB::table("tb_transaksis")
                 ->select(DB::Raw("MAX(RIGHT(faktur,5)) as kd_max"));

                 if($fk->count()>0){
                   // $finalkode="DVN".$tgl."00001";
                   foreach($fk->get() as $fak){
                        $tmp=((int)$fak->kd_max)+1;
                        $finalkode="DVN".$tgl.sprintf('%05s',$tmp);
                   }
                }else{
                    $finalkode="DVN".$tgl."00001";
                }
                dd($finalkode);
    }
    function transaksibeli(Request $request){
        $total=$request->total;
        $st="terkirim";
        $id=$request->id;
        $al=$request->alamat;
        $bank=$request->bank;
        $mtd=$request->mtd;
         //Cari Kode
         $tgl=date("dmy"); 
         $tgltr=date("ymd");
         $fk=DB::table("tb_transaksis")
                 ->select(DB::Raw("MAX(RIGHT(faktur,5)) as kd_max"));

                 if($fk->count()>0){
                   // $finalkode="DVN".$tgl."00001";
                   foreach($fk->get() as $fak){
                        $tmp=((int)$fak->kd_max)+1;
                        $finalkode="DVN".$tgl.sprintf('%05s',$tmp);
                   }
                }else{
                    $finalkode="DVN".$tgl."00001";
                }
        if(empty($bank)){
            $data=DB::insert("insert into tb_transaksis(iduser,faktur,tgl,total,status,alamat_tujuan,ongkir,total_akhir,pembayaran,metode) values(?,?,?,?,?,?,?,?,?,?)",[$id,$finalkode,$tgltr,$total,$st,$al,"0",$total,"1",$mtd]);
            $up=DB::table("tb_details")
                    ->where(['iduser'=>$id,'sb'=>'0'])
                    ->update(['sb'=>'1','faktur'=>$finalkode]);
        }else{            
            $data=DB::insert("insert into tb_transaksis(iduser,faktur,tgl,total,status,alamat_tujuan,pembayaran,metode) values(?,?,?,?,?,?,?,?)",[$id,$finalkode,$tgltr,$total,$st,$al,$bank,$mtd]);
            $up=DB::table("tb_details")
                    ->where(['iduser'=>$id,'sb'=>'0'])
                    ->update(['sb'=>'1','faktur'=>$finalkode]);
        }
        if($data){
            return response()->json(["status"=>"1","pesan"=>"Transaksi Berhasil,Tunggu Total Ongkir Jika Metode Pemesanan Selain ambil Di toko"]);
        }else{
            return response()->json(["status"=>"0","pesan"=>"Transaksi Gagal"]);
        }
    }
   
    function vTrans($id){
        $data=DB::table('tb_transaksis')
                ->where("iduser",$id)                               
                ->orderBy("id","DESC")
                ->paginate(10);
        return response()->json($data);
    }
}
