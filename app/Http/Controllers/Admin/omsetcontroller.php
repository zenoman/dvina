<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Exports\omset;
use Maatwebsite\Excel\Facades\Excel;

class omsetcontroller extends Controller
{
    public function index()
    {	$webinfo = DB::table('settings')->limit(1)->get();
	 	$data = DB::table('omset')->get();
		return view('omset/index',['data'=>$data,'websettings'=>$webinfo]);}

	//===========================================================
	public function exportomset(){
		return Excel::download(new omset(),"laporan_omset.xlsx");
	}
}
