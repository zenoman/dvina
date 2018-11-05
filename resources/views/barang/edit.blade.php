@extends('layout.master')
@section('plugincss')
@endsection

@section('content')
<script type="text/javascript">
     function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
</script>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Edit Data Barang</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit Gambar
                        </div>
                        <div class="panel-body">
                            <div class="row">
                             @foreach($fotos as $foto)
                             <?php 
                             $kodebaru = $foto->id."-".$idnya;
                             ?>
                                <div class="col-md-3">
                                <img src="../../img/barang/{{$foto->nama}}" style="width:100%;height: 100%">
                                <a href="../../barang/{{$kodebaru}}/hapusgambar" onclick="return confirm('Apakah anda yakin menghapus gambar ini ?')" class="btn btn-block btn-danger">Hapus Foto</a>
                                <br>
                                </div>
                                @endforeach
                            </div>
                            @if($jumlah_foto<4)
                            <form method="post" action="../../barang/{{$idnya}}/editgambar" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="hidden" name="kode_barang" value="{{$kode}}">
                                <input type="hidden" name="jumlah_file" value="{{4-$jumlah_foto}}">
                                <label>Foto</label>
                                <input type="file" class="form-control" name="photo[]" multiple required>
                                <p class="help-block">*Foto Tidak Boleh Lebih Dari {{4-$jumlah_foto}} File</p>
                            </div>
                            @if (session('errorfoto'))
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('errorfoto') }}
                    </div>
                    @endif
                            {{csrf_field()}}
                             <input class="btn btn-primary" type="submit" name="submit" value="simpan">    
                            </form>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Isi Data Dibawah Ini Sesuai Perintah !
                        </div>
                        <div class="panel-body">
                            <div class="row">
                             
                                <div class="col-lg-12">
                             @foreach($barang as $row)
                                    <form action="/barang/{{$row->idbarang}}" role="form" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="idbarang" value="{{$row->idbarang}}">
                                        <div class="form-group">
                                            <label>Kode Barang</label>
                                            <input type="text" class="form-control" name="kode_barang" value="{{$row->kode}}" readonly required>
                                        </div>


                                        <div class="form-group">
                                            <label>Nama Barang</label>
                                            <input type="text" class="form-control" name="nama_barang" value="{{$row->barang}}" required readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Kategori</label>
                                            <input type="text" class="form-control" name="kategori_barang" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Harga Barang</label>
                                            <input type="text" onkeypress="return isNumberKey(event)" class="form-control" name="harga_barang" value="{{$row->harga}}" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Diskon Barang</label>
                                            <input type="text" onkeypress="return isNumberKey(event)" class="form-control" name="diskon_barang" value="{{$row->diskon}}" required>
                                        </div>
                                        
                                        <div class="form-group">
                                        <label>Warna</label>
                                        <input type="text" name="warna" value="{{$row->warna}}" class="form-control" required>
                                        </div>
                                        {{csrf_field()}}
                                        <input type="hidden" name="_method" value="PUT">
                                        <input class="btn btn-primary" type="submit" name="submit" value="simpan">
                                        
                                         <a onclick="window.history.go(-1);" class="btn btn-danger">Kembali</a>
                                    </form>
                                    @endforeach
                                </div>
                              
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
                
            </div>
            <!-- /.row -->
        </div>
       
        @endsection

        @section('pluginjs')
        
        @endsection



