<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\support\Facades\File;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\models\Usermodel;

class Usercontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $users = Usermodel::orderBy('id','desc')->paginate(40);
        return view('user/index',['user'=> $users,'websettings'=>$websetting]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function cariuser(Request $request)
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $datauser = DB::table('tb_users')->where('nama','like','%'.$request->cari.'%')->get();
        
        return view('user/pencarian', ['datauser'=>$datauser, 'cari'=>$request->cari,'websettings'=>$websetting]);
    }

    public function create()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        return view('user/create',['websettings'=>$websetting]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $roles = [
                    'nama'      => 'required|min:5',
                    'username'  => 'required|min:5|alpha_dash',
                    'password'  => 'required|min:5',
                    'konfirmasi_password'=>'required|min:5|same:password',
                    'no_telfon' => 'required|min:5|numeric',
                    'email'     => 'required|min:5|email',
                    'alamat'    => 'required|min:5',
                    'kota'      => 'required|min:5',
                    'provinsi'  => 'required',
                    'kode_pos'  => 'required|numeric',
                    'gambar_ktp'=> 'image|nullable|max:2000'
                    
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

    $this->validate($request,$roles,$customMessages);
    if($request->hasFile('gambar_ktp')){ 
                     $namaexs=$request->File('gambar_ktp')->getClientOriginalName();
                     $lower_file_name=strtolower($namaexs);
                    $replace_space=str_replace(' ','-',$lower_file_name);
                     $namagambar=time().'-'.$replace_space;
                     $destination = public_path('img/user');
                   $request->file('gambar_ktp')->move($destination,$namagambar);
                }else{
                    $namagambar='';
                }
                

        Usermodel::create([
                'username' => $request->username,
                'password' => md5($request->password),
                'email'    => $request->email,
                'telp'     => $request->no_telfon,
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'kota'     => $request->kota,
                'provinsi' => $request->provinsi,
                'kodepos'  => $request->kode_pos,
                'ktp_gmb'  => $namagambar
               
               

        ]);
                 return redirect('user')->with('status','Input Data Sukses');

  
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
        $websetting = DB::table('settings')->limit(1)->get();
        $user = Usermodel::find($id);
        return view('user/edit',['datauser'=>$user,'websettings'=>$websetting]);
    }
    public function changepass($id)
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $user = Usermodel::find($id);
        return view('user/changepass',['datauser'=>$user,'websettings'=>$websetting]);
    }

    public function actchangepass(Request $request, $id)
    {
        $roles = [
                'username' => 'required|min:5|same:username_lama',
                 ];

        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'       => 'Maaf, data yang anda masukan terlalu sedikit',
        'alpha_dash'=> 'Maaf, tidak menerima data lain kecuali alphabet',
        'same'      => 'Maaf, Pastikan :attribute dan :other sama',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email',
        'image'     => 'Maaf, file harus berupa gambar',
        'max'       => 'Maaf, file terlalu besar'
    ];

    $this->validate($request,$roles,$customMessages);

    $newpass =md5($request->password_lama);
        if($request->password==$newpass){
            if($request->konfirmasi_password_baru==$request->password_baru){
                 
                 Usermodel::find($id)->update([
        'password' => md5($request->konfirmasi_password_baru)
    ]);
        return redirect('user')->with('status','Edit Password Berhasil');
            }else{
             return redirect('user/'.$id.'/changepass')->with('errorpass2','Maaf, Konfimasi Password Baru Anda Salah');
            }
        }else{
        return redirect('user/'.$id.'/changepass')->with('errorpass1','Maaf, Konfimasi Password Anda Salah');
        }}

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $roles = [
                'username' => 'required|min:5|alpha_dash',
                'email'    => 'required|min:5|email',
                'kota'     => 'required|min:5',
                'provinsi' => 'required',
                'kode_pos' => 'required|numeric',
                'nama'     => 'required|min:5',
                'gambar_ktp' => 'image|nullable|max:2000',
                'no_telfon'=> 'required|min:5|numeric',
                'alamat'   => 'required|min:5'
                // 'password' => 'required|min:5',
                // 'password_lama' => 'required|min:5|same:password',
                // 'password_baru' => 'required|min:5',
                // 'konfirmasi_password_baru' => 'required|min:5|same:password_baru',
                
                ];

        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'       => 'Maaf, data yang anda masukan terlalu sedikit',
        'alpha_dash'=> 'Maaf, tidak menerima data lain kecuali alphabet',
        'same'      => 'Maaf, Pastikan :attribute dan :other sama',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email',
        'image'     => 'Maaf, file harus berupa gambar',
        'max'       => 'Maaf, file terlalu besar'
    ];

    $this->validate($request,$roles,$customMessages);
    //dd($request);
        $namagambar=Usermodel::find($id);

        if($request->hasFile('gambar_ktp')){
            File::delete('img/user/'.$namagambar->ktp_gmb);
           $namaexs=$request->file('gambar_ktp')->getClientOriginalName();
            $lower_file_name=strtolower($namaexs);
            $replace_space=str_replace(' ','-',$lower_file_name);
            $namagambar=time().'-'.$replace_space;
            $destination=public_path('img/user');
            $request->file('gambar_ktp')->move($destination,$namagambar);
        }
        if($request->hasFile('gambar_ktp')){
            Usermodel::find($id)->update([
                'username' => $request->username,
                'email'    => $request->email,
                'telp'     => $request->no_telfon,
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'kota'     => $request->kota,
                'provinsi' => $request->provinsi,
                'kodepos'  => $request->kode_pos,
                'ktp_gmb'  => $namagambar
        ]);
        }else{
           Usermodel::find($id)->update([
                'username' => $request->username,
                'email'    => $request->email,
                'telp'     => $request->no_telfon,
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'kota'     => $request->kota,
                'provinsi' => $request->provinsi,
                'kodepos'  => $request->kode_pos
                ]);
        }
        
        return redirect('user')->with('status','Edit Data Sukses');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $namagambar = Usermodel::find($id);
            if($namagambar->ktp_gmb!= ''){
                File::delete('img/user/'.$namagambar->ktp_gmb);
            }
        Usermodel::destroy($id);
        return redirect ('user')->with ('status','Hapus Data Sukses');
    }
}
