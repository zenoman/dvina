<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use App\models\Adminmodel;
use Illuminate\Support\Facades\DB;
class Admincontroller extends Controller
{
    public function index()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $admins = Adminmodel::get();
        return view('admin/index',['admin'=>$admins,'websettings'=>$websetting]);
    }
    public function create()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        return view('admin/create',['websettings'=>$websetting]);
    }

    public function changepass($id)
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $admin = Adminmodel::find($id);
        return view('admin/changepass',['dataadmin'=>$admin,'websettings'=>$websetting]);
    }

    public function actionchangepass(Request $request, $id){
        $rules = [
                'konfirmasi_username'       =>  'required|min:5|same:username',
                'konfirmasi_password'       =>  'required|min:5',
                'konfirmasi_password_baru'  =>  'required|min:5'
            ];
        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'       => 'Maaf, data yang anda masukan terlalu sedikit',
        'alpha_dash'=> 'Maaf, tidak menerima data lain kecuali alphabet',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email',
        'same'      => 'Maaf, :attribute salah'
         ];
        $this->validate($request,$rules,$customMessages);
        $newpass =md5($request->konfirmasi_password);
        if($request->password==$newpass){
            if($request->konfirmasi_password_baru==$request->password_baru){
                 Adminmodel::find($id)->update([
            'password' => md5($request->konfirmasi_password_baru)
        ]);
        return redirect('admin')->with('status','Edit Password berhasil');
            }else{
             return redirect('admin/'.$id.'/changepass')->with('errorpass2','Maaf, Konfimasi Password Baru Anda Salah');
            }
        }else{
        return redirect('admin/'.$id.'/changepass')->with('errorpass1','Maaf, Konfimasi Password Anda Salah');
        }
       
    }
    public function store(Request $request)
    {
        $rules = [
                    'nama'      => 'required|',
                    'username'  => 'required|alpha_dash',
                    'password'  => 'required|min:5',
                    'konfirmasi_password'=>'required|same:password',
                    'no_telfon' => 'required|numeric',
                    'email'     => 'required|email'
                    ];

    $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'       => 'Maaf, data yang anda masukan terlalu sedikit',
        'alpha_dash'=> 'Maaf, tidak menerima data lain kecuali alphabet',
        'same'      => 'Maaf, Pastikan :attribute dan :other sama',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email'
    ];
        $this->validate($request,$rules,$customMessages);
        Adminmodel::create([
            'username'  => $request->username,
            'password'  => Hash::make($request->password),
            'nama'      => $request->nama,
            'telp'      => $request->no_telfon,
            'email'     => $request->email,
            'level'     => $request->level
        ]);

        return redirect('admin')->with('status','Input Data Sukses');
    }
    public function show($id)
    {
        //
    }
    public function edit($id)
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $admin = Adminmodel::find($id);
        return view('admin/edit',['dataadmin'=>$admin,'websettings'=>$websetting]);
    }
    public function update(Request $request, $id)
    {
        $rules = [
            'nama'=>'required|min:5',
            'username'=>'required|min:5|alpha_dash',
            'no_telfon'=>'required|min:5|numeric',
            'email'=>'required|min:5|email'
            
            ];
        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'       => 'Maaf, data yang anda masukan terlalu sedikit',
        'alpha_dash'=> 'Maaf, tidak menerima data lain kecuali alphabet',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email'
        
         ];
        $this->validate($request,$rules,$customMessages);
        
        Adminmodel::find($id)->update([
            'username'=>$request->username,
            'nama'=>$request->nama,
            'telp'=>$request->no_telfon,
            'email'=>$request->email,
            'level'=>$request->level
            ]);
        return redirect('admin')->with('status','Edit Data Sukses');
    }
    public function destroy($id)
    {
         Adminmodel::destroy($id);
        return redirect('admin')->with('status','Hapus Data Sukses');
    }
}
