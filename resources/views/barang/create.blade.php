@extends('layout.master')


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
                    <h1 class="page-header">Tambah Data Barang</h1>
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
                                @if (count($errors) > 0)
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    @endif
                                <div class="col-lg-12">
                                    <form action="/barang" role="form" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>Kode Barang</label>
                                            <input type="text" class="form-control" name="kode_barang" value="{{$kode}}" readonly>
                                        </div>

                                        @if($errors->has('kode_barang'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('kode_barang')}}
                                         </div>
                                        @endif


                                        <div class="form-group">
                                            <label>Nama Barang</label>
                                            <input type="text" class="form-control" name="nama_barang" value="{{ old('nama_barang') }}" required>
                                              <p class="help-block">*Nama Barang Tidak Dapat Diubah</p>
                                        </div>
                                        @if($errors->has('nama_barang'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('nama_barang')}}
                                         </div>
                                        @endif
                                        <div class="form-group">
                                        <label>Kategori</label>
                                        <select class="form-control" name="kategori">
                                                @foreach($kategori as $kat)
                                                <option value="{{$kat->id}}-{{$kat->kategori}}">{{$kat->kategori}}</option>
                                                @endforeach
                                            </select>
                                            <p class="help-block">*Kategori Barang Tidak Dapat Diubah</p>    
                                        </div>
                                        

                                        <div class="form-group">
                                            <label>Foto</label>
                                            <input type="file" class="form-control" name="photo[]" multiple required>
                                            <p class="help-block">*Foto Tidak Lebih Dari 4 File</p> 
                                        </div>
                                         @if (session('errorfoto'))
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('errorfoto') }}
                    </div>
                    @endif
                                        <div class="form-group">
                                            <label>Harga Barang</label>
                                            <input type="text" onkeypress="return isNumberKey(event)" class="form-control" name="harga_barang" value="{{ old('harga_barang') }}" required>
                                        </div>
                                        @if($errors->has('nama_barang'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('nama_barang')}}
                                         </div>
                                        @endif
                                        <div class="form-group">
                                            <label>Diskon Barang</label>
                                            <input type="text" onkeypress="return isNumberKey(event)" class="form-control" name="diskon_barang" value="{{ old('diskon_barang') }}" required>
                                        </div>
                                        @if($errors->has('diskon_barang'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('diskon_barang')}}
                                         </div>
                                        @endif
                                        
                                        <hr>
                                       <div id="newlink">
                                        <div class="row">
                                        <div class="col-md-6 form-group">
                                        <label>Warna</label>
                                        <input type="text" name="warna[]" value="" class="form-control" required>
                                        </div>
                                        <div class="col-md-6 form-group">
                                        <label>Stok</label>
                                        <input type="text" onkeypress="return isNumberKey(event)" name="stok[]" value="" class="form-control" required>
                                        </div>
                                        </div>
                                         </div>


                                        {{csrf_field()}}
                                        <div id="addnew">
                                            <br>
                                            <div>
                                        <a href="javascript:new_link()" class="btn btn-success"><i class="fa fa-plus"></i> Tambah Variasi</a>
                                    </div>
                                        </div>

                                        <br>
                                        <hr>
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
        <div id="newlinktpl" style="display:none" class="form-group">
            <hr>
             <div class="row">
                                        <div class="col-md-6 form-group">
                                        <label>Warna</label>
                                        <input type="text" name="warna[]" value="" class="form-control" required>
                                        </div>
                                        <div class="col-md-6 form-group">
                                        <label>Stok</label>
                                        <input type="text" onkeypress="return isNumberKey(event)" name="stok[]" value="" class="form-control" required>
                                        </div>
                                        </div>
        </div>
        @endsection

        @section('js')
        <script type="text/javascript">
         
var ct = 1;
function new_link()
{
    ct++;
    var div1 = document.createElement('div');
    div1.id = ct;
    // link to delete extended form elements
    var delLink = '<a href="javascript:delIt('+ ct +')" class="btn btn-danger"><i class="fa fa-trash"></i> Hapus Variasi</a><br>';
    div1.innerHTML = document.getElementById('newlinktpl').innerHTML + delLink;
    document.getElementById('newlink').appendChild(div1);
}
// function to delete the newly added set of elements
function delIt(eleId)
{
    d = document;
    var ele = d.getElementById(eleId);
    var parentEle = d.getElementById('newlink');
    parentEle.removeChild(ele);
}
function validate(frm)
{
    var ele = frm.elements['feedurl[]'];
    if (! ele.length)
    {
        alert(ele.value);
    }
    for(var i=0; i<ele.length; i++)
    {
        alert(ele[i].value);
    }
    return true;
}
function add_feed()
{
    var div1 = document.createElement('div');
    // Get template data
    div1.innerHTML = document.getElementById('newlinktpl').innerHTML;
    // append to our form, so that template data
    //become part of form
    document.getElementById('newlink').appendChild(div1);
}

</script>
        @endsection



