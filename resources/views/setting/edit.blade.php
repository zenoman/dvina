@extends('layout.master')
@foreach($websettings as $webset)
@section('title',$webset->webName)
@section('favicon')
<link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
@endsection
@endforeach
@section('content')
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Edit Data Setting</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit Data Dibawah Ini Sesuai Perintah !
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    @foreach($setting as $row)
                                    <form action="/setting/{{$row->idsettings}}" role="form" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>Nama Web</label>
                                            <input type="text" class="form-control" name="webname" value="{{$row->webName}}">
                                        </div>
                                         @if($errors->has('webname'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('webname')}}
                                         </div>
                                       @endif
                                        <div class="form-group">
                                            <label>Kontak1</label>
                                            <input type="text" class="form-control" name="kontak1" value="{{$row->kontak1}}">
                                        </div>
                                         @if($errors->has('kontak1'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('kontak1')}}
                                         </div>
                                       @endif
                                        <div class="form-group">
                                            <label>Kontak2</label>
                                            <input type="text" class="form-control" name="kontak2" value="{{$row->kontak2}}">
                                        </div>
                                         @if($errors->has('kontak2'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('kontak2')}}
                                         </div>
                                       @endif
                                        <div class="form-group">
                                            <label>Kontak3</label>
                                            <input type="text" class="form-control" name="kontak3" value="{{$row->kontak3}}">
                                        </div>
                                         @if($errors->has('kontak3'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('kontak3')}}
                                         </div>
                                       @endif
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="email" value="{{$row->email}}">
                                        </div>
                                         @if($errors->has('email'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('email')}}
                                         </div>
                                       @endif
                                       <div class="form-group">
                                            <label>Meta</label>
                                            <input type="text" class="form-control" name="meta" value="{{$row->meta}}">
                                        </div>
                                         @if($errors->has('meta'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('meta')}}
                                         </div>
                                       @endif

                                       <div class="form-group">
                                            <label>Batas hari Pemesana</label>
                                            <input type="text" class="form-control" name="kadaluarsa" value="{{$row->max_tgl}}">
                                        </div>
                                        
                                             <div class="form-group">
                                            <label>Ganti Icon</label><p>
                                            <img src="../img/setting/{{$row->ico}}" width="100" height="100">
                                            <input type="file" name="ico">
                                        </div>
                                        @if($errors->has('ico'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('ico')}}
                                         </div>
                                       @endif
                                             <div class="form-group">
                                            <label>Ganti Logo</label><p>
                                            <img src="../img/setting/{{$row->logo}}" width="100" height="100">
                                            <input type="file" name="logo">
                                        </div>
                                          @if($errors->has('logo'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('logo')}}
                                         </div>
                                       @endif


                                         {{csrf_field()}}
                                        <input type="hidden" name="_method" value="PUT">
                                        <input class="btn btn-primary" type="submit" name="submit" value="simpan">
                                       
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
        <!-- /#page-wrapper -->
        @endsection