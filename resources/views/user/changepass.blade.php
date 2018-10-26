@extends('layout.master')
@section('content')
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Ganti Password User</h1>
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
                            <form action="/user/{{$datauser->id}}/changepass" role="form" enctype="multipart/form-data" method="POST">
                                        

                                        <div class="form-group">
                                            <input type="hidden" name="username_lama" value="{{$datauser->username}}">

                                            <label>Username</label>
                                            <input type="text" class="form-control" name="username" required>
                                            <p class="help-block">*Masukan Username user yang akan di ganti passwordnya</p>
                                        </div>
                                        @if($errors->has('username'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('username')}}
                                         </div>
                                        @endif

                                        <div class="form-group">
                                            <input type="hidden" name="password" value="{{$datauser->password}}">

                                            <label>Password Lama</label>
                                            <input type="password" name="password_lama" class="form-control" required>
                                            <p class="help-block">*Masukan password lama user yang akan di ganti passwordnya</p>
                                        </div>
                                        @if (session('errorpass1'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('errorpass1') }}
                    </div>
                    @endif
                                        <hr>

                                        <div class="form-group">
                                            <label>Password Baru</label>
                                            <input type="password" name="password_baru" class="form-control" required>
                                        </div>
                                        @if($errors->has('password_baru'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('password_baru')}}
                                         </div>
                                        @endif
                                        <div class="form-group">
                                            <label>Konfirmasi Password Baru</label>
                                            <input type="password" name="konfirmasi_password_baru" class="form-control">
                                        </div>
                                         @if (session('errorpass2'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('errorpass2') }}
                    </div>
                    @endif
                                        {{csrf_field()}}
                                        
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