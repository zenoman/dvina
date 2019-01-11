<?php

namespace App\Http\Controllers\Admin;
ini_set('max_execution_time', 180);
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\models\bankmodel;
use Illuminate\Support\Facades\DB;

class BankController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $websetting = DB::table('settings')->limit(1)->get();
        $databank = bankmodel::where('id','>',1)->get();
        return view('bank/index',['databank'=>$databank,'websettings'=>$websetting]);
    }
    
    public function store(Request $request)
    {
        bankmodel::create([
            'nama_bank'=>$request->bank,
            'rekening'=>$request->rekening
        ]);
        return redirect('bank')->with('status','Tambah Data berhasil');
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
        bankmodel::find($id)
                    ->update([
                        'nama_bank'=>$request->bank,
                        'rekening'=>$request->rekening
                    ]);
        return redirect('bank')->with('status','Edit Data berhasil');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        bankmodel::destroy($id);
        return redirect('bank')->with('status','Hapus Data berhasil');
    }
}
