<?php

namespace App\Imports;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Session;

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
  
      public function collection(Collection $rows)
    {
        foreach ($rows as $row) 
        {
            if($row['varian']=='y'){
                     $kode = $this->kode();
                    DB::table('tb_kodes')->insert([
                    'kode_barang'=>$kode,
                    'barang'=>$row['nama_barang'],
                    'id_kategori'=>$row['id_kategori'],
                    'harga_barang' => $row['harga_barang'],
                    'harga_beli'=>$row['harga_beli'],
                    'deskripsi'=> $row['deskripsi'],
                    'diskon' => $row['diskon_barang']
                    ]);
                }else if($row['varian']=='n'){
                    $newkode = $this->olderkode();
                DB::table('tb_barangs')->insert([
                'kode'=> $newkode,
                'stok' => 0,
                'warna' => $row['warna'],
                'barang_jenis'=>$row['nama_barang']
                ]);
            $id = DB::getPdo()->lastInsertId();
            DB::table('tb_tambahstoks')
            ->insert([
                'idwarna'=>$id,
                'idadmin'=>Session::get('iduser'),
                'kode_barang'=>$newkode,
                'jumlah'=>$row['stok'],
                'tgl'=>date("Y-m-d"),
                'total'=>$row['harga_beli']*$row['stok'],
                'keterangan'=>'menambah pertama kali',
                'aksi'=>'tambah'

            ]);
        // $kode = DB::table('tb_kodes')->max('kode_barang');
        // if($kode != NULL){
        //     $databarang = DB::table('tb_kodes')
        //     ->join('tb_barangs', 'tb_barangs.kode', '=', 'tb_kodes.kode_barang')
        //     ->select('tb_kodes.*','tb_barangs.warna','tb_barangs.stok','tb_barangs.idbarang')
        //     ->where('tb_kodes.kode_barang',$kode)
        //     ->orderby('tb_barangs.idbarang','desc')
        //     ->limit(1)
        //     ->get();
        //     foreach ($databarang as $rw) {
        //         DB::table('tb_stokawals')
        //             ->insert([
        //                 'idbarang'=>$rw->id,
        //                 'idwarna'=>$rw->idbarang,
        //                 'kode_barang'=>$rw->kode_barang,
        //                 'barang'=>$rw->barang,
        //                 'jumlah'=>$rw->stok,
        //                 'tgl'=>date('d-m-Y')
        //             ]);
            
        //     }
        //         }
                    }


            
            
        }
    }
}
