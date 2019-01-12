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
                    <h1 class="page-header">Ganti Password Admin</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Isi Data Dibawah Ini Sesuai Perintah !
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form action="/admin/{{$dataadmin->id}}/changepass" role="form" method="POST">
                                        
                                        <div class="form-group">
                                            <label>Konfirmasi Username</label>

                                            <input type="hidden" name="username" value="{{$dataadmin->username}}">

                                            <input type="text" class="form-control" name="konfirmasi_username" required>
                                            
                                            <p class="help-block">*Masukan Username user yang akan di ganti passwordnya</p>
                                        
                                        </div>
                                        @if($errors->has('konfirmasi_username'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('konfirmasi_username')}}
                                         </div>
                                        @endif

                                        
                                        <div class="form-group">
                                            <label>Konfirmasi Password</label>
                                            <input type="hidden" name="password" value="{{$dataadmin->password}}">

                                            <input type="password" class="form-control" name="konfirmasi_password" required>

                                            <p class="help-block">*Masukan password lama user yang akan diganti passwordnya</p>
                                            @if (session('errorpass1'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('errorpass1') }}
                    </div>
                    @endif
                                        </div>
                                        @if($errors->has('konfirmasi_password'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('konfirmasi_password')}}
                                         </div>
                                        @endif
                                        <hr>
                                        <div class="form-group">
                                            <label>Password Baru</label>
                                            <input type="password" class="form-control" name="password_baru" required>
                                        </div>
                                       @if($errors->has('password_baru'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('password_baru')}}
                                         </div>
                                        @endif

                                        <div class="form-group">
                                            <label>Konfirmasi Password Baru</label>
                                            <input type="password" name="konfirmasi_password_baru" class="form-control" required>
                                            @if($errors->has('konfirmasi_password_baru'))
                                            <div class="alert alert-danger">
                                                {{$errors->first('konfirmasi_password_baru')}}
                                            </div>
                                            @endif
                                            @if (session('errorpass2'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('errorpass2') }}
                    </div>
                    @endif
                                        </div>
                                        {{csrf_field()}}
                                        <!--div class="form-group">
                                            <label>Selects</label>
                                            <select class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div-->
                                        <input type="hidden" name="_method" value="PUT">
                                        <input class="btn btn-primary" type="submit" name="submit" value="simpan">
                                        <a onclick="window.history.go(-1);" class="btn btn-danger">Kembali</a>
                                    </form>
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