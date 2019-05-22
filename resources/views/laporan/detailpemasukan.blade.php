@extends('layout.master')
@foreach($websettings as $webset)
@section('title',$webset->webName)
@section('favicon')
    <link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
@endsection
@endforeach

@section('css')
    <link href="{{asset('assets/vendor/datatables-plugins/dataTables.bootstrap.css')}}" rel="stylesheet">
    <link href="{{asset('assets/vendor/datatables-responsive/dataTables.responsive.css')}}" rel="stylesheet">
@endsection
@section('content')
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Laporn Detail Pemasukan Tanggal {{$tgl1}} Sampai {{$tgl2}} </h2>

                </div>
            </div>
            <div class="row">

                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            List Data Detail Pengeluaran
                        </div>

                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Tgl</th>
                                        <th>Faktur</th>
                                        <th>Kode Brg</th>
                                        <th>Pembeli</th>
                                        <th>Nama Brg</th>
                                        <th>Harga</th>
                                        <th>Harga Beli</th>
                                        <th>Diskon</th>
                                        <th>Hasil</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php 
                                    $i=1;
                                    @endphp
                                    @foreach($data as $row)
                                  <tr>
                                      <td>{{$i++}}</td>
                                      <td>{{$row->tgl}}</td>
                                      <td>{{$row->faktur}}</td>
                                      <td>{{$row->kode_barang}}</td>
                                      <td>{{$row->username}}</td>
                                      <td>{{$row->barang_jenis}}</td>
                                      <td>
                                          {{"Rp ".number_format($row->harga,0,',','.')}} x {{$row->jumlah}} Pcs
                                      </td>
                                      <td>
                                          {{"Rp ".number_format($row->harga_beli,0,',','.')}} x {{$row->jumlah}} Pcs
                                      </td>
                                      <td>{{$row->diskon}} %</td>
                                      <td>
                                        @php
                                            $hsil = $row->total - $row->harga_beli*$row->jumlah;
                                        @endphp
                                        {{"Rp ".number_format( $hsil,0,',','.')}}
                                        </td>
                                  </tr>
                                  @endforeach
                                </tbody>
                            </table>
                            <div class="text-right">
                                <a href="{{url('/cetakdetailpemasukan/'.$tgl1.'/'.$tgl2)}}" class="btn btn-primary" target="_blank()"><i class="fa fa-print"></i> Print</a>

                                <a href="{{url('/exsportdetailpemasukan/'.$tgl1.'/'.$tgl2)}}" class="btn btn-success"><i class="fa fa-file-excel-o"></i> Exsport Excel</a>

                                <a onclick="window.history.go(-1);" class="btn btn-danger">Kembali</a>
                            </div>
                            
                            {{ $data->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endsection
        @section('js')
        <script src="{{asset('assets/vendor/datatables/js/jquery.dataTables.min.js')}}"></script>
        <script src="{{asset('assets/vendor/datatables-plugins/dataTables.bootstrap.min.js')}}"></script>
        <script src="{{asset('assets/vendor/datatables-responsive/dataTables.responsive.js')}}"></script>
        <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true,
            'paging':false
        });
    });
    </script>
        @endsection