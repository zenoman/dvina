<?php

namespace App\Imports;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BarangImport implements ToCollection, WithHeadingRow
{
    function olderkode(){
         $kode = DB::table('tb_kodes')->max('kode_barang');
         return $kode;
    }
    function kode(){
        $kode = DB::table('tb_kodes')->max('kode_barang');
          //  dd($kode);
        if($kode != NULL){
            $numkode = substr($kode, 3);
            $countkode = $numkode+1;
            $newkode = "BRG".sprintf("%05s", $countkode);
        }else{
            $newkode = "BRG00001";
        }

        return $newkode;
    }

    function insertkode($nama_barang){
        $kode = $this->kode();
        DB::table('tb_kodes')->insert([
            'kode_barang'=>$kode,
            'barang'=>$nama_barang
        ]);
    }
  
      public function collection(Collection $rows)
    {
        foreach ($rows as $row) 
        {
            if($row['varian']=="y"){
                    $this->insertkode($row['nama_barang']);
                    $newkode = $this->olderkode();
                }else{
                    $newkode = $this->olderkode();
                }
            DB::table('tb_barangs')->insert([
                'idkategori'=>$row['id_kategori'],
                'kode'=> $newkode,
                'barang' => $row['nama_barang'],
                'harga' => $row['harga_barang'],
                'diskon' => $row['diskon_barang'],
                'stok' => $row['stok'],
                'warna' => $row['warna'],
                'kategori'=>$row['nama_kategori']
            ]);
        }
    }
}
