<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;

class detailpemasukan implements FromCollection, WithHeadings
{
     public function __construct(string $tgl1,string $tgl2)
    {
        $this->tgl1 = $tgl1;
        $this->tgl2 = $tgl2;
    }
    public function collection()
    {
        return DB::table('tb_details')
        ->select(DB::raw('tb_details.tgl,tb_details.faktur,tb_details.kode_barang,tb_users.username,tb_barangs.barang_jenis,tb_details.harga,tb_details.jumlah,tb_details.diskon,tb_details.total,tb_kodes.harga_beli,tb_details.total - tb_kodes.harga_beli*tb_details.jumlah as laba'))
        ->leftjoin('tb_users','tb_users.id','=','tb_details.iduser')
        ->leftjoin('tb_transaksis','tb_transaksis.faktur','=','tb_details.faktur')
        ->leftjoin('tb_kodes','tb_kodes.kode_barang','=','tb_details.kode_barang')
        ->leftjoin('tb_barangs','tb_barangs.idbarang','=','tb_details.idwarna')
        ->whereBetween('tb_details.tgl',[$this->tgl1,$this->tgl2])
        ->where('tb_transaksis.status','=','sukses')
        ->orwhere('tb_transaksis.status','=','diterima')
        ->get();
    }
    public function headings(): array
    {
        return [
           'tanggal',
           'Faktur',
           'Kode Barang',
           'Pembeli',
           'Nama Barang',
           'Harga Jual',
           'jumlah',
           'Diskon',
           'Total',
           'Harga Beli',
           'Laba'
        ];
    }
}
