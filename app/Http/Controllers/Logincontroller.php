<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\models\Usermodel;

class Logincontroller extends Controller
{
   
    public function index()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        return view('login/index',['websettings'=>$websetting]);
    }
    public function masuk(Request $request){
        $request->validate([
            'kodecap' => 'required|captcha'
        ]);
        $username = $request->username;
        $mypassword = $request->password;

        $data = DB::table('admins')->where('username',$username)->count();
        if($data>0){
            $datauser = DB::table('admins')->where('username',$username)->get();
            foreach ($datauser as $row) {
                $password = $row->password;
                $id = $row->id;
                $level = $row->level;
            }
            if(Hash::check($mypassword, $password)){
                Session::put('username',$request->username);
                Session::put('iduser',$id);
                Session::put('level',$level);
                Session::put('login',TRUE);
                return redirect('dashboard');
            }else{
                 return redirect('login')->with('status','Maaf, password salah');
            }
        }else{
            return redirect('login')->with('status','Maaf, Username tidak detemukan');
        }
    }
    public function logout(){
        Session::flush();
        return redirect('login');
    }
    public function logoutuser(){
        Session::flush();
        return redirect('/');   
    }
    public function validatelogin(){
        Session::flush();
        return redirect('login')->with('status','Maaf, Anda Harus Login');
    }
    public function refreshCaptcha()
    {
        return response()->json(['captcha'=> captcha_img()]);
    }
    public function loginuser()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        return view('login/loginuser',['websettings'=>$websetting]);
    }
    public function masukuser(Request $request){
        $request->validate([
            'kodecap' => 'required|captcha'
        ]);
        
        $username = $request->username;
        $password = $request->password;

        $data = DB::table('tb_users')
        ->where('username',$username)
        ->count();
        
        if($data > 0){
            $datausers = DB::table('tb_users')
            ->where('username',$username)
            ->get();
            
            foreach ($datausers as $du) {
                $id = $du->id;
                $jumlahcancel=$du->cancel;
                $mypass = $du->password;
            }

            if(Hash::check($password,$mypass)){
                 if($jumlahcancel>=3){
                    return back()
                    ->with('errorlogin','Maaf, akun anda di banned tanyakan admin untuk info lebih lanjut');
                }else{
                    Session::put('user_name',$request->username);
                    Session::put('user_id',$id);
                    Session::put('login',TRUE);
                    return redirect('/');
                }
            }else{
               return back()
               ->with('errorlogin','Maaf,password salah'); 
            }
        }else{
            return back()
            ->with('errorlogin','Maaf,username salah atau tidak ada');
        }}
    
    public function register(Request $request)
    {
        $roles = [
        'nama'      => 'required',
        'username'  => 'required|min:8|alpha_dash',
        'password'  => 'required|min:8',
        'konfirmasi_password'=>'required|min:8|same:password',
        'no_telfon' => 'required|numeric',
        'email'     => 'required|email',
        'alamat'    => 'required',
        'kota'      => 'required',
        'provinsi'  => 'required',
        'kode_pos'  => 'required|numeric',
        'gambar_ktp'=> 'image|nullable|max:3000'];

        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'=> 'Maaf, data yang anda masukan    terlalu sedikit',
        'alpha_dash'=>'Maaf, tidak menerima data lain kecuali alphabet',
        'same'      => 'Maaf, Pastikan :attribute dan :other sama',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email',
        'image'     => 'Maaf, file harus berupa gambar',
        'max'       => 'Maaf, file terlalu besar'
        ];

    $this->validate($request,$roles,$customMessages);
    $jumlahuser = DB::table('tb_users')
    ->where('username',$request->username)->count();
    if($jumlahuser > 0){
    return back()
    ->with('errormultiuser','Maaf, username telah digunakan, coba lainya');
    }else{
    if($request->hasFile('gambar_ktp')){ 
    $namaexs=$request->File('gambar_ktp')->getClientOriginalName();
    $lower_file_name=strtolower($namaexs);
    $replace_space=str_replace(' ','-',$lower_file_name);
    $namagambar=time().'-'.$replace_space;
    $destination = public_path('img/user');
    $request->file('gambar_ktp')->move($destination,$namagambar);
    }else{$namagambar='';}
        
        Usermodel::create([
                'username' => $request->username,
                'password' => Hash::make($request->password),
                'email'    => $request->email,
                'telp'     => $request->no_telfon,
                'nama'     => $request->nama,
                'alamat'   => $request->alamat,
                'kota'     => $request->kota,
                'provinsi' => $request->provinsi,
                'kodepos'  => $request->kode_pos,
                'ktp_gmb'  => $namagambar
        ]);
        return back()
        ->with('status','Registrasi sukses, Silahkan Login');   
    }
    
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
