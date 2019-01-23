@extends('layout.master')

@foreach($websettings as $webset)
@section('title',$webset->webName)
@section('favicon')
<link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
@endsection
@endforeach

@section('css')
<link href="{{asset('assets/js/select2.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/js/loading.css')}}" rel="stylesheet">
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
                    <div class="panel panel-default" >
                        <div class="panel-heading">
                            Isi Data Dibawah Ini Sesuai Perintah !
                        </div>
                        <div class="panel-body">
                            <div class="row loading-div" id="panelnya">
                                <div class="col-lg-12">
                                    <h3>Faktur : <span id="noresi"></span> </h3><hr>
                                    
                                       
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                            <label>Cari Barang</label>
                                    <select class="form-control" id="caribarang" autofocus>
                                    </select>
                                        </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                            <label>Cari Warna</label>
                                    <select class="form-control" id="cariwarna">
                                        <option value="ph" data-stok="" selected disabled hidden>pilih warna</option>
                                    </select>
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Jumlah</label>
                                                <div class="form-group input-group">
                                            
                                            <input type="text" class="form-control" id="jumlah" onkeypress="return isNumberKey(event)">
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <label>&nbsp;</label>
                                                <div class="form-group input-group">
                                            
                                            <button class="btn btn-primary btn-sm" id="tambahbarang">Tambah</button>&nbsp;
                                             <button class="btn btn-danger btn-sm">Bersih</button>
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
                                            <label>Harga(Rp)</label>
                                            <input type="text" class="form-control" readonly id="harga">
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                            <label>Stok(Pcs)</label>
                                            <input type="text" class="form-control" readonly id="stok">
                                        </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                            <label>Diskon(%)</label>
                                            <input type="text" class="form-control" readonly id="diskon">
                                            <input type="hidden" id="kodebarangnya">
                                        </div>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nama Barang</th>
                                        <th>Warna</th>
                                        <th>Harga</th>
                                        <th>Jumlah</th>
                                        <th>Diskon</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                    <tbody id="tubuh">
                                        
                                    </tbody>
                                </table>
                            </div>
                                        {{csrf_field()}}
                                       
                                        <input class="btn btn-primary" type="submit" name="submit" value="simpan">
                                        <a onclick="window.history.go(-1);" class="btn btn-danger">Kembali</a>
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
        <script src="{{asset('assets/js/loading.js')}}"></script>
        <script type="text/javascript">
        $("#caribarang").select2();
        </script>
        <script src="{{asset('assets/js/pembelianlangsung.js')}}"></script>
        @endsection