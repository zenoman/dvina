@extends('layout.master')
@section('css')
<!-- DataTables CSS -->
    <link href="{{asset('assets/vendor/datatables-plugins/dataTables.bootstrap.css')}}" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="{{asset('assets/vendor/datatables-responsive/dataTables.responsive.css')}}" rel="stylesheet">
@endsection
@section('content')
<div id="page-wrapper">    
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Hasil Pencarian "{{$cari}}"</h1>

                </div>
            </div>
            <div class="row">

                <div class="col-lg-12">
                    @if (session('status'))
                    <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('status') }}
                    </div>
                    @elseif(session('statuserror'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('statuserror') }}
                    </div>
                    @endif
                	 
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            List Data Barang Hasil Pencarian
                        </div>
            
                        <div class="panel-body table-responsive">
                            <form method="post" action="/barang/hapusbanyak">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">

                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Nama Barang</th>
                                        <th>Kategori</th>
                                        <th>Harga</th>
                                        <th>Diskon</th>
                                        <th>Warna</th>
                                        <th>Stok</th>
                                        <th class="text-center">Aksi</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i=0;?>
                                   	@foreach($databarang as $row)
                                    <?php $i++; ?>
                                    <tr>
                                   		<td>{{$i}}</td>
                                   		<td>{{$row->kode}}</td>
                                   		<td>{{$row->barang}}</td>
                                        <td>{{$row->kategori}}</td>
                                   		<td>{{$row->harga}}</td>
                                        <td>{{$row->diskon}}</td>
                                        <td><b>{{$row->warna}}</b></td>
                                        <td>{{$row->stok}}</td>
                                        <td class="text-center">
                                            <a href="{{url('barang/'.$row->idbarang.'/tambahstok')}}" class="btn btn-warning"><i class="fa fa-plus"></i></a>
                                            <a href="{{url('barang/'.$row->idbarang.'/edi')}}t" class="btn btn-success"><i class="fa fa-wrench"></i></a>
                                            <a onclick="return confirm('Hapus Data ?')" href="{{url('barang/'.$row->idbarang.'/hapus')}}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
                                        </td>
                                        <td align="center" bgcolor="#FFFFFF"><input name="kodebarang[]" type="checkbox" id="checkbox[]" value="{{$row->idbarang}}"></td>
                                   	</tr>
                                    @endforeach
                                    
                                </tbody>
                            </table>
                              <a onclick="window.history.go(-1);" class="btn btn-danger">Kembali</a>
                            <div class="pull-right">

                            <input type="submit" name="submit" class="btn btn-block btn-danger" value="hapus data terpilih">    
                            </div>
                            {{csrf_field()}}
                        </form>
                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        @endsection
        @section('js')
        <!-- DataTables JavaScript -->
        <script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
        <script src="{{asset('assets/vendor/datatables-plugins/dataTables.bootstrap.min.js')}}"></script>
        <script src="{{asset('assets/vendor/datatables-responsive/dataTables.responsive.js')}}"></script>
        <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
        @endsection