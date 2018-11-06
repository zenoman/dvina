@extends('layout.master')


@section('content')

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Import Excel</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                Langkah-langkah Upload Excel
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                           <ol>
                                               <li>Download file template upload dan kategori di tab download template excel yang berada bawah ini, pastikan mendownload kedua file di bawah</li>
                                               <li>
                                                   Buka file <b>"template.xlsx"</b> kemudian isi data sesuai aturan di bawah ini
                                               </li>
                                               <li>
                                                   isi <b>id_kategori</b> sesuai dengan <b>id kategori</b> di file <b>"kategori.xlsx"</b>, jangan isikan id lain selain id yang tercantum pada file <b>"kategori.xlsx"</b>. untuk lebih jelas lihat gambar di bawah ini
                                               </li><br>
                                               <img src="{{url('img/web/dvina.PNG')}}">
                                               <br><br>
                                               <img src="{{url('img/web/dvina2.PNG')}}"><br><br>
                                               <li>
                                                   isi nama_barang dan warna dengan format text, kemudian untuk harga_barang, diskon_barang dan stok isi dengan format angka. Untuk lebih jelas lihat gambar di bawah
                                               </li><br>
                                               <img src="{{url('img/web/dvina3.PNG')}}"><br><br>
                                               <li>
                                                   Selanjutnya varian, varian hanya dapat di isi dengan huruf <b>y</b> atau <b>n</b> dan pastikan huruf kecil, huruf <b>y</b> digunakan untuk barang utama sedangkan <b>n</b> digunakan untuk variasi warna barang utama, pastikan variasi barang memiliki data <b>id_kategori</b>,<b>nama_barang</b>, <b>nama_kategori</b> yang sama dengan barang utamanya. untuk lebih jelas lihat contoh berikut
                                               </li><br>
                                               <img src="{{url('img/web/dvina4.PNG')}}"><br><br>
                                               <div class="alert alert-warning">
                                                dari gambar di atas menunjukan bahwa barang <b>kerudung kediri</b> memiliki variasi warna : merah, abu-abu & putih kemudian <b>kerudung malang</b> tidak memiliki warna lain kecuali merah maroon lalu <b>kerudung nganjuk</b> memiliki varian warna : biru laut & biru tua
                                               </div><br>
                                               <li>Kemudian save <b>template.xlsx</b> dan upload di tab paling bawah yaitu <b>upload file</b>, jangan lupa setelah proses upload selesai tambahkan gambar pada barang-barang tersebut </li><br>
                                               <div class="alert alert-danger">
                                                <b>NB</b> : Untuk mengurangi kesalahan saat import excel, pastikan data di excel tidak lebih dari 40 baris. 
                                               </div>
                                           </ol>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                Download Template Excel
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <a href="{{url('barang/eksportkategori')}}" class="btn btn-primary">Download Kategori</a>
                                            <a href="{{url('barang/download')}}" class="btn btn-info">Download Template Excel</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                Upload File
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <form action="/barang/aksiimportexcel" role="form" method="POST" enctype="multipart/form-data">
                                       <div class="form-group">
                                            <label>File excel</label>
                                            <input type="file"name="file" required>
                                              <p class="help-block">*File excel tidak boleh kosong</p>
                                        </div>
                                        {{csrf_field()}}
                                      <input class="btn btn-primary" type="submit" name="submit" value="simpan">
                                        
                                        
                                    </form> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
                <!-- /.col-lg-12 -->
                <div class="pull-right">
                    <a onclick="window.history.go(-1);" class="btn btn-danger">Kembali</a>    
                </div>
            </div>
        </div>
        
        @endsection

        @section('js')
             @endsection



