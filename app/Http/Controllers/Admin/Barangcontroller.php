<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use App\models\Barangmodel;
use App\Imports\BarangImport;
use App\Exports\KategoriExport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Response;

class Barangcontroller extends Controller
{
    public function index()
    {
        $barang = DB::table('tb_barangs')->orderBy('idbarang','desc')->paginate(50);
        return view('barang/index',['barang'=>$barang]);
    }

    public function importexcel ()
    {
        return view('barang/importexcel');
    }

    public function exsportexcel()
    {
    return Excel::download(new KategoriExport, 'Kategori.xlsx');
    return redirect('barang/importexcel');

    }
    public function downloadtemplate(){
         $file= public_path(). "/files/template.xlsx";

            $headers = array(
              'Content-Type: application/excel',
            );

    return Response::download($file, 'template.xlsx', $headers);
    return redirect('barang/importexcel');
    }
    public function aksiimportexcel(Request $request)
    {
        if($request->hasFile('file')){
            
        Excel::import(new BarangImport, request()->file('file'));
        }

        return redirect('barang')->with('status','Import excel sukses');
    }

    public function create()
    {
        $kode = DB::table('tb_kodes')->max('kode_barang');
        if($kode != NULL){
            $numkode = substr($kode, 3);
            $countkode = $numkode+1;
            $newkode = "BRG".sprintf("%05s", $countkode);
        }else{
            $newkode = "BRG00001";
        }
        $kategori = DB::table('tb_kategoris')->get();
        return view('barang/create',['kode'=>$newkode,'kategori'=>$kategori]);
    }

    public function tambahstok($id){
        $barang = DB::table('tb_barangs')->where('idbarang',$id)->get();
        return view('barang/tambahstok',['barang'=>$barang]);
    }

    public function aksitambahstok(Request $request){
        $idbarang = $request->idbarang;
        DB::table('tb_barangs')
        ->where('idbarang',$idbarang)
        ->update([
            'stok'=> $request->stok_lama + $request->stok
            ]);
        DB::table('tb_tambahstoks')
        ->insert([
            'idbarang'=>$request->idbarang,
            'barang'=>$request->nama_barang,
            'jumlah'=>$request->stok,
            'total'=>$request->stok*$request->harga,
            'tgl'=>date("d-m-Y")
        ]);

        return redirect('barang')->with('status','Tambah Stok Berhasil');
    }
   
    public function store(Request $request)
    {
        //dd($request);
        $rules = [
            'kode_barang' => 'required|min:3',
            'nama_barang' => 'required',
            "photo.*"  => "required|image|max:2048"
        ];
        

        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'       => 'Maaf, data yang anda masukan    terlalu sedikit',
        'alpha_dash'=> 'Maaf, tidak menerima data lain kecuali alphabet',
        'same'      => 'Maaf, Pastikan :attribute dan :other sama',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email',
        'image'     => 'Maaf, file harus berupa gambar',
        'max'       => 'Maaf, file terlalu besar'
    ];
    $this->validate($request, $rules, $customMessages);
    $jumlah_file = sizeof($request->file('photo'));
    if($jumlah_file>4){
        return redirect('barang/create')->with('errorfoto','Maaf, Foto tidak boleh lebih dari 4');
    }
    foreach ($request->file('photo') as $photos) {
             $namaexs = $photos->getClientOriginalName();
            //membuat nama  file menjadi lower case / kecil semua
            $lower_file_name=strtolower($namaexs);
            //merubah nama file yg ada spasi menjadi -
            $replace_space=str_replace(' ', '-', $lower_file_name);
            $namagambar = time().'-'.$replace_space;
            $destination = public_path('img/barang');
            $photos->move($destination,$namagambar);
            DB::table('gambar')->insert([
                'kode_barang' => $request->kode_barang,
                'nama' => $namagambar
            ]);
        }
        $kategori = explode("-",$request->kategori);
    $i=0;
    foreach ($request->warna as $warna) {

         DB::table('tb_barangs')->insert([
                'idkategori'=>$kategori[0],
                'kode' => $request->kode_barang,
                'barang' => $request->nama_barang,
                'harga' => $request->harga_barang,
                'diskon' => $request->diskon_barang,
                'stok' => $request->stok[$i],
                'warna' => $warna
            ]);
         $i++;
    }
        Barangmodel::create([
            'kode_barang'=>$request->kode_barang,
            'barang'=>$request->nama_barang
        ]);

        return redirect('barang')->with('status','data berhasil di simpan');
    }

    public function editgambar(Request $request, $id){
        $rules = [
            'kode_barang' => 'required|min:3',
            "photo.*"  => "required|image|max:2048"
        ];
        

        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'image'     => 'Maaf, file harus berupa gambar',
        'max'       => 'Maaf, file terlalu besar'
    ];
    $this->validate($request, $rules, $customMessages);
    $jumlah_foto = sizeof($request->file('photo'));

    if($jumlah_foto > $request->jumlah_file){
         return redirect('barang/'.$id.'/edit')->with('errorfoto','Maaf, Foto Yang Anda Inputkan Terlalu Banyak');
    }
        foreach ($request->file('photo') as $photos) {
             $namaexs = $photos->getClientOriginalName();
            //membuat nama  file menjadi lower case / kecil semua
            $lower_file_name=strtolower($namaexs);
            //merubah nama file yg ada spasi menjadi -
            $replace_space=str_replace(' ', '-', $lower_file_name);
            $namagambar = time().'-'.$replace_space;
            $destination = public_path('img/barang');
            $photos->move($destination,$namagambar);
            DB::table('gambar')->insert([
                'kode_barang' => $request->kode_barang,
                'nama' => $namagambar
            ]);
        }
        return redirect('barang/'.$id.'/edit');
    }
   
    public function cari(Request $request)
    {
        $databarang = DB::table('tb_barangs')->where('barang','like','%'.$request->cari.'%')->get();
        return view('barang/pencarian',['databarang'=>$databarang, 'cari'=>$request->cari]);
    }
    public function hapusgambar($id){
        $newkode = explode("-",$id);
        $foto = DB::table('gambar')->where('id',$newkode[0])->get();
        foreach ($foto as $row) {
            File::delete('img/barang/'.$row->nama);
        }
        DB::table('gambar')->where('id',$newkode[0])->delete();

        return redirect('barang/'.$newkode[1].'/edit');
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $barang = DB::table('tb_barangs')->where('idbarang',$id)->get();
        foreach ($barang as $row) {
            $kode = $row->kode;
        }
        $fotos = DB::table('gambar')->where('kode_barang',$kode)->get();
        $jumlah_foto = DB::table('gambar')->where('kode_barang',$kode)->count();
        return view('barang/edit',['barang'=>$barang,'fotos'=>$fotos,'idnya'=>$id,'kode'=>$kode,'jumlah_foto'=>$jumlah_foto]);
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
        $kode = $request->idbarang;
        DB::table('tb_barangs')
        ->where('idbarang',$kode)
        ->update([
            'harga'=>$request->harga_barang,
            'diskon'=>$request->diskon_barang,
            'warna'=>$request->warna

        ]);

        return redirect('barang')->with('status','Berhasil Edit Data');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $barang = DB::table('tb_barangs')
        ->where('idbarang',$id)->get();
        //dd($barang);
        foreach ($barang as $brg) {
        $kodenya = $brg->kode;
        }
        //dd($kodenya);
        $hitung_barang = DB::table('tb_barangs')
        ->where('kode', $kodenya)
        ->count();

        if($hitung_barang>1){
        DB::table('tb_stokawals')->where('idbarang',$id)->delete();
        DB::table('tb_barangs')->where('idbarang', $id)->delete();
            
    }else{
        $fotos = DB::table('gambar')->where('kode_barang',$kodenya)->get();
        foreach ($fotos as $foto) {
            File::delete('img/barang/'.$foto->nama);
        }
        DB::table('tb_stokawals')->where('idbarang',$id)->delete();
        DB::table('gambar')->where('kode_barang',$kodenya)->delete();
        DB::table('tb_stokawals')->where('idbarang',$id)->delete();
        DB::table('tb_kodes')->where('kode_barang', $kodenya)->delete();
        DB::table('tb_barangs')->where('idbarang', $id)->delete();
        
    }
    return redirect('barang')->with('status','Hapus data berhasil');
        
    }

    public function hapusbanyak(Request $request){
        if(!$request->kodebarang){
            return redirect('barang')->with('statuserror','Tidak ada data yang dipilih');
        }else{
          foreach ($request->kodebarang as $id) {
        $barang = DB::table('tb_barangs')
        ->where('idbarang',$id)->get();
        //dd($barang);
        foreach ($barang as $brg) {
        $kodenya = $brg->kode;
        }
        //dd($kodenya);
        $hitung_barang = DB::table('tb_barangs')
        ->where('kode', $kodenya)
        ->count();

        if($hitung_barang>1){
        DB::table('tb_stokawals')->where('idbarang',$id)->delete();
        DB::table('tb_barangs')->where('idbarang', $id)->delete();
            
    }else{
        $fotos = DB::table('gambar')->where('kode_barang',$kodenya)->get();
        foreach ($fotos as $foto) {
            File::delete('img/barang/'.$foto->nama);
        }
        DB::table('tb_stokawals')->where('idbarang',$id)->delete();
        DB::table('gambar')->where('kode_barang',$kodenya)->delete();
        DB::table('tb_stokawals')->where('idbarang',$id)->delete();
        DB::table('tb_kodes')->where('kode_barang', $kodenya)->delete();
        DB::table('tb_barangs')->where('idbarang', $id)->delete();
        
    }
    
        }
        return redirect('barang')->with('status','Hapus data berhasil');  
        }
        
        
    }
    
}
