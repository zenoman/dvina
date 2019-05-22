<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;

class pemasukanExport implements FromCollection, WithHeadings
{
    public function __construct(string $tgl1,string $tgl2)
    {
        $this->tgl1 = $tgl1;
        $this->tgl2 = $tgl2;
    }
    public function collection()
    {
    	return DB::table('tb_transaksis')
        ->select(DB::raw('tb_transaksis.tgl,tb_transaksis.faktur,tb_users.username,tb_transaksis.alamat_tujuan,tb_bank.nama_bank,tb_transaksis.ongkir,tb_transaksis.total_akhir'))
        ->leftjoin('tb_users','tb_users.id','=','tb_transaksis.iduser')
        ->leftjoin('tb_bank','tb_bank.id','=','tb_transaksis.pembayaran')
        ->whereBetween('tb_transaksis.tgl',[$this->tgl1,$this->tgl2])
        ->where('tb_transaksis.status','sukses')
        ->orwhere('tb_transaksis.status','diterima')
        ->orderby('tb_transaksis.faktur','desc')
        ->get();        
    }
    public function headings(): array
    {
        return [
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
