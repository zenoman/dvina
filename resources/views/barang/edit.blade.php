@extends('layout.master')
@foreach($websettings as $webset)
@section('title',$webset->webName)
@section('favicon')
<link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
@endsection
@endforeach

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
                            <h4>Edit Gambar</h4>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                             @foreach($fotos as $foto)
                             <?php 
                             $kodebaru = $foto->id."-".$idnya;
                             ?>
                                <div class="col-md-3">
                                <img src="{{asset('img/barang/'.$foto->nama)}}" style="width:100%;height: 100%">
                                <a href="{{url('barang/'.$kodebaru.'/hapusgambar')}}" onclick="return confirm('Apakah anda yakin menghapus gambar ini ?')" class="btn btn-block btn-danger">Hapus Foto</a>
                                <br>
                                </div>
                                @endforeach
                            </div>
                            @if($jumlah_foto<4)
                            <form method="post" action="/barang/{{$idnya}}/editgambar" enctype="multipart/form-data">
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
                            <a href="{{url('/barang')}}" class="btn btn-danger">Kembali</a>
                            </form>
                            @else
                             <a href="{{url('/barang')}}" class="btn btn-danger">Kembali</a>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Edit Data Barang</h4>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                             
                                <div class="col-lg-12">
                             @foreach($barang as $row)
                                    <form action="/barang/{{$row->id}}" role="form" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="idbarang" value="{{$row->id}}">
                                        <div class="form-group">
                                            <label>Kode Barang</label>
                                            <input type="text" class="form-control" name="kode_barang" value="{{$row->kode_barang}}" readonly required>
                                        </div>

                                        <!--halo hhhh-->
                                        <div class="form-group">
                                            <label>Nama Barang</label>
                                            <input type="text" class="form-control" name="nama_barang" value="{{$row->barang}}" required>
                                            <input type="hidden" name="oldnama" value="{{$row->barang}}">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Kategori</label>
                                            <select class="form-control" name="kategori_barang">
                                                @foreach($kategori as $kat)
                                                <option value="{{$kat->id}}" @if($kat->id==$row->id_kategori)selected @endif >{{$kat->kategori}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Deskripsi Barang</label>
                                            <textarea class="form-control" name="deskripsi" rows="5">{{$row->deskripsi}}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Harga Barang</label>
                                            <input type="text" onkeypress="return isNumberKey(event)" class="form-control" name="harga_barang" value="{{$row->harga_barang}}">
                                        </div>

                                        <div class="form-group">
                                            <label>Diskon Barang</label>
                                            <input type="number" min="0" max="99" onkeypress="return isNumberKey(event)" class="form-control" name="diskon_barang" value="{{$row->diskon}}" required>
                                        </div>
                                        
                                        {{csrf_field()}}
                                        <input type="hidden" name="_method" value="PUT">
                                        <input class="btn btn-primary" type="submit" name="submit" value="simpan">
                                        
                                         <a href="{{url('/barang')}}" class="btn btn-danger">Kembali</a>
                                    </form>
                                    @endforeach
                                </div>
                              
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <h4>Edit Variasi Warna & Stok</h4>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div>
                              <form class="form-inline" action="{{url('/barang/warna')}}" method="post">
                                <div class="form-group">
                                  <label for="email">Warna:</label>
                                  <input type="text" class="form-control" placeholder="Masukan Warna" name="warna">
                                </div>
                                <div class="form-group">
                                  <label for="pwd">Stok:</label>
                                  <input type="text" onkeypress="return isNumberKey(event)" class="form-control" placeholder="Masukan Stok" name="stok">
                                  <input type="hidden" name="kode" value="{{$kode}}">
                                </div>
                                {{@csrf_field()}}
                                <button type="submit" class="btn btn-success">Simpan</button>
                              </form>
                            </div>
                            <hr>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Warna</th>
                                            <th>Stok</th>
                                            <th>Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $i = 0;
                                        ?>
                                        @foreach($warna as $war)
                                        <?php $i++; ?>
                                        <tr>
                                            <td>{{$i}}</td>
                                            <td>{{$war->warna}}</td>
                                            <td>{{$war->stok}} Pcs</td>
                                            <td>
                                                <button class="btn btn-primary" data-toggle="modal" data-target="#myModal{{$war->idbarang}}">Edit</button>

                                <div class="modal fade" id="myModal{{$war->idbarang}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Edit Data</h4>
                                        </div>
                                        <form role="form" method="POST" action="{{url('/barang/'.$war->idbarang.'/updatewarna')}}" enctype="multipart/form-data">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                        <div class="form-group">
                                            <label>warna</label>
                                            <input class="form-control" name="warna" type="text" required value="{{$war->warna}}">
                                        </div>
                                        <input type="hidden" name="kode" value="{{$kode}}">
                                         <input type="hidden" name="harga_barang" value="{{$row->harga_barang}}">
                                        <div class="form-group">
                                            <label>Stok</label>
                                            <input class="form-control" onkeypress="return isNumberKey(event)" name="stok" type="text" value="{{$war->stok}}" required>
                                            <input name="oldstok" type="hidden" value="{{$war->stok}}">
                                        </div>
                                        <div class="form-group">
                                            <label>Keterangan</label>
                                            <textarea class="form-control" name="deskripsi" rows="3"></textarea>
                                            <p class="help-block">Masukan Keterangan kenapa anda mengedit variasi warna ini.</p>
                                        </div>
                                        {{ csrf_field() }}
                                       <input type="hidden" name="_method" value="PUT">
                                            </div>
                                        </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                        </div>
                                        </form>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                                                <a onclick="return confirm('Hapus Data ?')" href="{{url('/barang/'.$war->idbarang.'/hapuswarna')}}" class="btn btn-danger">hapus</a>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <a href="{{url('/barang')}}" class="btn btn-danger">Kembali</a>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                <!-- /.col-lg-12 -->
                
            </div>
            <!-- /.row -->
        </div>
       
        @endsection

        @section('pluginjs')
        
        @endsection



