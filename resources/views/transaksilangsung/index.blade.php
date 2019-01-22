@extends('layout.master')

@foreach($websettings as $webset)
@section('title',$webset->webName)
@section('favicon')
<link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
@endsection
@endforeach

@section('css')
<link href="{{asset('assets/js/select2.min.css')}}" rel="stylesheet">
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
                    <h1 class="page-header">Transaksi Langsung</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                     @if (session('status'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('status') }}
                    </div>
                    @endif
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Isi Data Dibawah Ini Sesuai Perintah !
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3>Faktur : <span id="noresi"></span> </h3><hr>
                                    <form action="#" role="form" method="POST">
                                       
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                            <label>Cari Barang</label>
                                    <select class="form-control" id="caribarang">
                                    </select>
                                        </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                            <label>Cari Warna</label>
                                            <input type="text" class="form-control" name="nama" required>
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Jumlah</label>
                                                <div class="form-group input-group">
                                            
                                            <input type="text" class="form-control" name="nama" required>
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <label>&nbsp;</label>
                                                <div class="form-group input-group">
                                            
                                            <button class="btn btn-primary btn-sm">Tambah</button>&nbsp;
                                             <button class="btn btn-danger btn-sm">Hapus</button>
                                        </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                            <label>Nama Barang</label>
                                            <input type="text" class="form-control" readonly id="nama_barang">
                                        </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                            <label>Harga</label>
                                            <input type="text" class="form-control" readonly id="harga">
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                            <label>Stok</label>
                                            <input type="text" class="form-control" readonly id="stok">
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                            <label>Diskon</label>
                                            <input type="text" class="form-control" readonly id="diskon">
                                        </div>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Larry</td>
                                            <td>the Bird</td>
                                            <td>@twitter</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                                        {{csrf_field()}}
                                       
                                        <input class="btn btn-primary" type="submit" name="submit" value="simpan">
                                        <a onclick="window.history.go(-1);" class="btn btn-danger">Kembali</a>
                                    </form>
                                </div>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endsection
        @section('js')
        <script src="{{asset('assets/js/select2.min.js')}}"></script>
        <script type="text/javascript">
        $("#caribarang").select2();
        </script>
        <script src="{{asset('assets/js/pembelianlangsung.js')}}"></script>
        @endsection