<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use App\models\Usermodel;

class Logincontroller extends Controller
{
   
    public function index()
    {
        return view('login/index');
    }
    public function masuk(Request $request){
        $username = $request->username;
        $password = md5($request->password);

        $data = DB::table('admins')->where([['username',$username],['password',$password]])->count();
        $datausers = DB::table('admins')->where([['username',$username],['password',$password]])->get();
        foreach ($datausers as $datauser) {
            $id = $datauser->id;
        }
        if($data>0){
                Session::put('username',$request->username);
                Session::put('iduser',$id);
                Session::put('login',TRUE);
                return redirect('dashboard');
        }else{
            return redirect('login');
        }
    }
    public function logout(){
        Session::flush();
        return redirect('login');
    }
    public function logoutuser(){
        Session::flush();
        return back();   
    }
    public function validatelogin(){
        Session::flush();
        return redirect('login')->with('status','Maaf, Anda Harus Login');
    }

    public function loginuser()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        return view('login/loginuser',['websettings'=>$websetting]);
    }
    public function masukuser(Request $request){
        $username = $request->username;
        $password = md5($request->password);

        $data = DB::table('tb_users')->where([['username',$username],['password',$password]])->count();
        $datausers = DB::table('tb_users')
        ->where([['username',$username],['password',$password]])
        ->get();
        foreach ($datausers as $du) {
             $id = $du->id;
         }
        if($data>0){
                Session::put('user_name',$request->username);
                Session::put('user_id',$id);
                Session::put('login',TRUE);
                return redirect('/');
        }else{
            return back()->with('errorlogin','username atau password salah');
        }
    }
    
    public function register(Request $request)
    {
        $roles = [
                    'nama'      => 'required|min:5',
                    'username'  => 'required|min:5|alpha_dash',
                    'password'  => 'required|min:5',
                    'konfirmasi_password'=>'required|min:5|same:password',
                    'no_telfon' => 'required|numeric',
                    'email'     => 'required|email',
                    'alamat'    => 'required',
                    'kota'      => 'required',
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
                 return back()->with('status','Registrasi sukses, Silahkan Login');
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

    //-------------------- API ANDROID ----------------------
    function loginApi(Request $req){
        $username = $req->username;
        $password = md5($req->password);

        $data = DB::table('tb_users')->where([['username',$username],['password',$password]])->count();
        $datausers = DB::table('tb_users')
        ->where([['username',$username],['password',$password]])
        ->get();
        if($data>0){
        return response()->json(["status"=>"1","data"=>$datausers]);
        }else{
            return response()->json(["status"=>"0","data"=>$datausers]);
        }
    }
}
