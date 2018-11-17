<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\File;
use App\models\Settingmodel;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
class Settingcontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $setings = DB::table('settings')->where('idsettings',1)->get(); 	
        return view('setting/edit',['setting'=>$setings,'websettings'=>$websetting]);
    }

    /**
     * Show the form for creating a new resource.
     *
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
        //$settings = Settingmodel::find('idsetting',$id);
        // dd($settings);
        //return view('setting/edit',['settings'=>$settings]);
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
        $rules = [
            'webname'=>'required|min:3',
            'kontak1'=>'required|min:5|numeric',
            'kontak2'=>'required|min:5|numeric',
            'kontak3'=>'required|min:5|numeric',
            'email'=>'required|min:5|email',
            'ico'=>'image|mimes:jpeg,jpg,png,gif|nullable|max:2000',
            'logo'=>'image|mimes:jpeg,jpg,png,gif|nullable|max:2000',
            'meta'=>'required|min:3'
        ];
        // dd($request);
        $customMessages = [
        'required'  => 'Maaf, :attribute harus di isi',
        'min'       => 'Maaf, data yang anda masukan terlalu sedikit',
        'numeric'   => 'Maaf, data harus angka',
        'email'     => 'Maaf, data harus email'
         ];
        $this->validate($request,$rules,$customMessages);

        //$setting=Settingmodel::find($id);
        $setting = DB::table('settings')->where('idsettings',$id)->get();
        foreach ($setting as $row) {
            if($request->hasFile('ico') && $request->hasFile('logo')){

            if($request->hasFile('ico')){
            File::delete('img/setting/'.$row->ico);
            $nameico=$request->file('ico')->
            getClientOriginalname();
            $lower_file_name=strtolower($nameico);
            $replace_space=str_replace(' ', '-', $lower_file_name);
            $nameicon=time().'-'.$replace_space;
            $destination=public_path('img/setting');
            $request->file('ico')->move($destination,$nameicon);
            }

            if($request->hasFile('logo')){
            File::delete('img/setting/'.$row->logo);
            $namelog=$request->file('logo')->
            getClientOriginalname();
            $lower_file_name=strtolower($namelog);
            $replace_space=str_replace(' ', '-', $lower_file_name);
            $namelogo=time().'-'.$replace_space;
            $destination=public_path('img/setting');
            $request->file('logo')->move($destination,$namelogo);
            }
            DB::table('settings')
            ->where('idsettings',$id)
            ->update([
            'webName'=>$request->webname,
            'kontak1'=>$request->kontak1,
            'kontak2'=>$request->kontak2,
            'kontak3'=>$request->kontak3,
            'email'=>$request->email,
            'ico'=>$nameicon,
            'logo'=>$namelogo,
            'meta'=>$request->meta,
            'max_tgl'=>$request->kadaluarsa
            ]);

            }elseif($request->hasFile('ico')){
            if($request->hasFile('ico')){
            File::delete('img/setting/'.$row->ico);
            $nameico=$request->file('ico')->
            getClientOriginalname();
            $lower_file_name=strtolower($nameico);
            $replace_space=str_replace(' ', '-', $lower_file_name);
            $nameicon=time().'-'.$replace_space;
            $destination=public_path('img/setting');
            $request->file('ico')->move($destination,$nameicon);
            }

            DB::table('settings')
            ->where('idsettings',$id)
            ->update([
            'webName'=>$request->webname,
            'kontak1'=>$request->kontak1,
            'kontak2'=>$request->kontak2,
            'kontak3'=>$request->kontak3,
            'email'=>$request->email,
            'ico'=>$nameicon,
            'meta'=>$request->meta,
            'max_tgl'=>$request->kadaluarsa
            ]);
            }elseif ($request->hasFile('logo')) {

            if($request->hasFile('logo')){
            File::delete('img/setting/'.$row->logo);
            $namelog=$request->file('logo')->
            getClientOriginalname();
            $lower_file_name=strtolower($namelog);
            $replace_space=str_replace(' ', '-', $lower_file_name);
            $namelogo=time().'-'.$replace_space;
            $destination=public_path('img/setting');
            $request->file('logo')->move($destination,$namelogo);
            }

             DB::table('settings')
            ->where('idsettings',$id)
            ->update([
            'webName'=>$request->webname,
            'kontak1'=>$request->kontak1,
            'kontak2'=>$request->kontak2,
            'kontak3'=>$request->kontak3,
            'email'=>$request->email,
            'logo'=>$namelogo,
            'meta'=>$request->meta,
            'max_tgl'=>$request->kadaluarsa
            ]);
            }else{
            DB::table('settings')
            ->where('idsettings',$id)
            ->update([
            'webName'=>$request->webname,
            'kontak1'=>$request->kontak1,
            'kontak2'=>$request->kontak2,
            'kontak3'=>$request->kontak3,
            'email'=>$request->email,
            'meta'=>$request->meta,
            'max_tgl'=>$request->kadaluarsa
            ]);
            }

            
        
        }
        return redirect('setting')->with('status','Edit Data Sukses');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
         Settingmodel::destroy($id);
        return redirect('setting')->with('status','Hapus Data Sukses');
    }
}
