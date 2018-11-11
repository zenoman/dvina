@extends('layout.master')
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
                                        <option valuer="sumatera utara">Sumatera Utara</option>
                                        <option valuer="sumatera barat">Sumatera Barat</option>
                                        <option valuer="riau">Riau</option>
                                        <option valuer="kepuluan riau">Kepulauan Riau</option>
                                        <option valuer="jambi">Jambi</option>
                                        <option valuer="sumatera selatan">Sumatera Selatan</option>
                                        <option valuer="bangka belitung">Bangka Belitung</option>
                                        <option valuer="bengkulu">Bengkulu</option>
                                        <option valuer="lampung">Lampung</option>
                                        <option valuer="jakarta">DKI Jakarta</option>
                                        <option valuer="jawa barat">Jawa Barat</option>
                                        <option valuer="banten">Banten</option>
                                        <option valuer="jawa tengah">Jawa Tengah</option>
                                        <option valuer="yogyakarta">Yogyakarta</option>
                                        <option valuer="jawa timur">Jawa Timur</option>
                                        <option valuer="bali">Bali</option>
                                        <option valuer="NTB">NTB</option>
                                        <option valuer="NTT">NTT</option>
                                        <option valuer="kalimantan utara">Kalimantan Utara</option>
                                        <option valuer="kalimantan barat">Kalimantan Barat</option>
                                        <option valuer="kalimantan tengah">Kalimantan Tengah</option>
                                        <option valuer="kalimantan selatan">Kalimantan Selatan</option>
                                        <option valuer="kalimantan timur">Kalimantan Timur</option>
                                        <option valuer="sulawesi utara">Sulawesi Utara</option>
                                        <option valuer="sulawesi barat">Sulawesi Barat</option>
                                        <option valuer="sulawesi tengah">Sulawesi Tengah</option>
                                        <option valuer="sulawesi tenggara">Sulawesi Tenggara</option>
                                        <option valuer="sulawesi selatan">Sulawesi Selatan</option>
                                        <option valuer="gorontalo">Gorontalo</option>
                                        <option valuer="maluku">Maluku</option>
                                        <option valuer="maluku utara">Maluku Utara</option>
                                        <option valuer="papua barat">Papua Barat</option>
                                        <option valuer="papua">Papua</option>
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