<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Stokawal extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_stokawals', function (Blueprint $table) {
            $table->increments('id');
            $table->string('kode_barang');                        
            $table->string('barang');            
            $table->string('jumlah');                        
            $table->string('tgl');                        
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tb_stokawals');
    }
}
