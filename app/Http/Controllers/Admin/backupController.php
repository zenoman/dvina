<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class backupController extends Controller
{
    public function index(){
    	$webinfo = DB::table('settings')->limit(1)->get();
    	return view('backup/index',['websettings'=>$webinfo]);
    }
    public function tampil(Request $request){
    	$bulan = $request->bulan;
    	$tahun = $request->tahun;

    	$webinfo = DB::table('settings')->limit(1)->get();

    	return view('backup/tampil',['websettings'=>$webinfo,'bulan'=>$bulan,'tahun'=>$tahun]);
    }
}
