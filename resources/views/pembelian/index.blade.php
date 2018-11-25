@extends('layout.master')
@foreach($websettings as $webset)
@section('title',$webset->webName)
@section('favicon')
<link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
@endsection
@endforeach

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
                    <h1 class="page-header">List Pembelian</h1>

                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">

                <div class="col-lg-12">
                    @if (session('status'))
                    <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('status') }}
                    </div>
                    @endif
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            List Data Pembelian
                        </div>
                        <!-- /.panel-heading -->

                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Faktur</th>
                                        <th>Pembeli</th>
                                        <th>No. telp</th>
                                        <th>Tanggal</th>
                                        <th>Pembayaran</th>
                                        <th>Status</th>
                                        <th class="text-center">Aksi</th>
                                        <!--th>Level</th-->
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1;?>
                                    @foreach($pembelians as $row)
                                    <?php $no = $i++;?>
                                    <tr>
                                        <td>{{$no}}</td>
                                        <td>{{$row->faktur}}</td>
                                        <td>{{$row->username}}</td>
                                        <td>{{$row->telp}}</td>
                                        <td>{{$row->tgl}}</td>
                                        <td>{{$row->nama_bank}}</td>
                                        <td>
                                            @if($row->status=='terkirim' || $row->status=='dibaca')
                                            Menunggu Persetujuan
                                            @elseif($row->status=='diterima')
                                            Menunggu Pembayaran
                                            @elseif($row->status=='ditolak')]
                                            Di Tolak
                                            @endif
                                        </td>
                                        <td class="text-center">
                                            @if($row->status=='terkirim' || $row->status=='dibaca')
                                            <a href="{{url('/pembelian/'.$row->id.'/terima')}}" onclick="return confirm('Terima Pembelian Ini ?')" class="btn btn-success btn-sm">Terima</a>
                                            <a onclick="return confirm('Tolak Pembelian Ini ?')" class="btn btn-danger btn-sm">Tolak</a>
                                            @elseif($row->status=='diterima')
                                            Menunggu Pembayaran
                                            @elseif($row->status=='ditolak')]
                                            Di Tolak
                                            @endif                              
                                        </td>
                                    </tr>
                                   @endforeach
                                </tbody>
                            </table>
                            {{$pembelians->links()}}
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
            responsive: true,
            "paging":false
        });
    });
    </script>
        @endsection