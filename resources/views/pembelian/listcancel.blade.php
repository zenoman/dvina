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
                    <h1 class="page-header">List Cancel</h1>

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
                            List Data Pembelian Yang Gagal
                        </div>
                        <!-- /.panel-heading -->

                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Faktur</th>
                                        <th>Pembatal</th>
                                        <th>tanggal</th>
                                        <th>Status</th>
                                        <th>Keterangan</th>
										
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1;?>
                                    @foreach($cancels as $row)
                                    <?php $no = $i++;?>
                                    <tr>
                                        <td>{{$no}}</td>
                                         
                                        <td>
                                         <a data-toggle="modal" data-target="#myModal{{$row->id}}">
                                        {{$row->faktur}}
                                        </a>
                                        <div class="modal fade" id="myModal{{$row->id}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">Detail Transaksi</h4>
                                        </div>
                                        <div class="modal-body">
                                            @php
                                    $databarang = DB::table('tb_details')
                                                ->select(DB::raw('tb_details.*,tb_barangs.warna'))
                                                ->join('tb_barangs','tb_barangs.idbarang','=','tb_details.idwarna')
                                                ->where('tb_details.faktur',$row->faktur)
                                                ->get();
                                    @endphp
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                            Nama Barang</th>
                                            <th class="text-center">
                                            Warna</th>
                                            <th class="text-center">
                                            Jumlah</th>
                                            <th class="text-center">Harga</th>
                                            <th class="text-center">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($databarang as $brg)
                                        <tr>
                                            <td>
                                                {{$brg->barang}}
                                            </td>
                                            <td>
                                                {{$brg->warna}}
                                            </td>
                                            <td>
                                                {{$brg->jumlah}}
                                            </td>
                                            <td>
                                                {{"Rp ". number_format($brg->harga,0,',','.')}}
                                            </td>
                                            <td>
                                                {{"Rp ". number_format($brg->total,0,',','.')}}
                                            </td>
                                        </tr>
                                    @endforeach
                                    <tr>
                                        <td colspan="4"><h3>Total</h3></td>
                                        <td colspan="1"><h3>
                                             {{"Rp ". number_format($row->total_akhir,0,',','.')}}
                                        </h3></td>
                                    </tr>
                                    </tbody>
                                </table>
                                        </div>
                                    </div>
                                    </div>
                                    </div>   
                                        </td>
                                        <td>{{$row->username}}</td>
                                        <td>{{$row->tgl}}</td>
                                        <td>{{$row->status}}</td>
                                        <td>{{$row->keterangan}}</td>
                                        
                                    </tr>
                                   @endforeach
                                </tbody>
                            </table>
                            {{ $cancels->links() }}
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
