<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;

class pemasukanExport implements FromCollection, WithHeadings
{
    public function __construct(int $bulan,int $tahun)
    {
        $this->bulan = $bulan;
        $this->tahun = $tahun;
    }
    public function collection()
    {
    	return DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.*,tb_users.username,tb_bank.nama_bank'))
        ->leftjoin('tb_users','tb_users.id','=','tb_transaksis.iduser')
        ->leftjoin('tb_bank','tb_bank.id','=','tb_transaksis.pembayaran')
        ->whereMonth('tb_transaksis.tgl',$this->bulan)
        ->whereYear('tb_transaksis.tgl',$this->tahun)
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->orderby('tb_transaksis.faktur','desc')
        ->get();        
    }
    public function headings(): array
    {
        return [
            'No',
            'tanggal',
            'Faktur',
            'Pembeli',
            'Alamat Tujuan',
            'Metode Bayar',
            'Ongkir',
            'Total'
        ];
    }
}
