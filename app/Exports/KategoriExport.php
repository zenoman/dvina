<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadings;
class KategoriExport implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return DB::table('tb_kategoris')->select('id', 'kategori')->get();;
    }
    public function headings(): array
    {
        return [
            'id kategori',
            'Nama Kategori',
        ];
    }
}
