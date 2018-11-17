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
                    <h1 class="page-header">Tambah Data User</h1>
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
                                    <form action="/user" role="form" enctype="multipart/form-data" method="POST">
                                        
                                        <div class="form-group">
                                            <label>Nama</label>
                                            <input type="text" class="form-control" placeholder="contoh : deva satrio" name="nama" value="{{ old('nama') }}">
                                        </div>
                                        @if($errors->has('nama'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('nama')}}
                                         </div>
                                        @endif


                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" class="form-control" placeholder="contoh : devasatrio" name="username" value="{{ old('username') }}">
                                        </div>
                                        @if($errors->has('username'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('username')}}
                                         </div>
                                        @endif


                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" class="form-control" name="password">
                                        </div>
                                        @if($errors->has('password'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('password')}}
                                         </div>
                                        @endif

                                        <div class="form-group">
                                            <label>Konfirmasi Password</label>
                                            <input type="password" class="form-control" name="konfirmasi_password">
                                        </div>
                                        @if($errors->has('konfirmasi_password'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('konfirmasi_password')}}
                                         </div>
                                        @endif


                                        <div class="form-group">
                                            <label>No. Telfon</label>
                                            <input type="text" class="form-control" placeholder="Contoh : 085222333XXX" name="no_telfon" value="{{ old('no_telfon') }}">
                                        </div>
                                        @if($errors->has('no_telfon'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('no_telfon')}}
                                         </div>
                                        @endif

                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" placeholder="Contoh : email@example.com" name="email" value={{ old('email') }}>
                                        </div>
                                       @if($errors->has('email'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('email')}}
                                         </div>
                                       @endif

                                       <div class="form-group">
                                        <label>Alamat</label>
                                        <textarea class="form-control" rows="3" name="alamat">{{old('alamat')}}</textarea>
                                        </div>
                                        @if($errors->has('alamat'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('alamat')}}
                                         </div>
                                       @endif

                                        <div class="form-group">
                                            <label>Kota</label>
                                            <input type="text" class="form-control" placeholder="Contoh : Kediri" name="kota" value={{ old('kota') }}>
                                        </div>
                                          @if($errors->has('kota'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('kota')}}
                                         </div>
                                       @endif

                                        <div class="form-group">
                                            <label>Provinsi</label>
                                            <select class="form-control"name="provinsi">
                                                <option value="aceh">Aceh</option>
                                        <option value="sumatera utara">Sumatera Utara</option>
                                        <option value="sumatera barat">Sumatera Barat</option>
                                        <option value="riau">Riau</option>
                                        <option value="kepuluan riau">Kepulauan Riau</option>
                                        <option value="jambi">Jambi</option>
                                        <option value="sumatera selatan">Sumatera Selatan</option>
                                        <option value="bangka belitung">Bangka Belitung</option>
                                        <option value="bengkulu">Bengkulu</option>
                                        <option value="lampung">Lampung</option>
                                        <option value="jakarta">DKI Jakarta</option>
                                        <option value="jawa barat">Jawa Barat</option>
                                        <option value="banten">Banten</option>
                                        <option value="jawa tengah">Jawa Tengah</option>
                                        <option value="yogyakarta">Yogyakarta</option>
                                        <option value="jawa timur">Jawa Timur</option>
                                        <option value="bali">Bali</option>
                                        <option value="NTB">NTB</option>
                                        <option value="NTT">NTT</option>
                                        <option value="kalimantan utara">Kalimantan Utara</option>
                                        <option value="kalimantan barat">Kalimantan Barat</option>
                                        <option value="kalimantan tengah">Kalimantan Tengah</option>
                                        <option value="kalimantan selatan">Kalimantan Selatan</option>
                                        <option value="kalimantan timur">Kalimantan Timur</option>
                                        <option value="sulawesi utara">Sulawesi Utara</option>
                                        <option value="sulawesi barat">Sulawesi Barat</option>
                                        <option value="sulawesi tengah">Sulawesi Tengah</option>
                                        <option value="sulawesi tenggara">Sulawesi Tenggara</option>
                                        <option value="sulawesi selatan">Sulawesi Selatan</option>
                                        <option value="gorontalo">Gorontalo</option>
                                        <option value="maluku">Maluku</option>
                                        <option value="maluku utara">Maluku Utara</option>
                                        <option value="papua barat">Papua Barat</option>
                                        <option value="papua">Papua</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label>Kode Pos</label>
                                            <input type="text" class="form-control" placeholder="Contoh : 06" name="kode_pos" value={{ old('kode_pos') }}>
                                        </div>
                                          @if($errors->has('kode_pos'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('kode_pos')}}
                                         </div>
                                       @endif

                                        <div class="form-group">
                                            <label>Gambar Ktp</label>
                                            <input type="file" name="gambar_ktp" required>
                                        </div>
                                          @if($errors->has('gambar_ktp'))
                                       <div class="alert alert-danger">
                                        {{ $errors->first('gambar_ktp')}}
                                         </div>
                                       @endif
                                        {{csrf_field()}}
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