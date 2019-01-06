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
                    <h1 class="page-header">Detail Pembelian</h1>

                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                
                <div class="col-lg-12">
                    @foreach($kode as $kd)
                    <div class="well well-sm">
                        <h4>Faktur : {{$kd->faktur}}</h4>
                        <table>
                            <tr>
                                <td>Tanggal Beli</td>
                                <td>&nbsp;:&nbsp;{{$kd->tgl}}</td>
                            </tr>
                            <tr>
                               <td>Pembeli</td>
                                <td>&nbsp;:&nbsp;
                                 @php
                                 $datauser = DB::table('tb_users')
                                 ->where('id',$kd->iduser)
                                 ->get();
                                 @endphp
                                 @foreach($datauser as $usr)
                                    {{$usr->username}}
                                 @endforeach
                                </td>
                            </tr>
                            <tr>
                                <td>Metode Pembayaran</td>
                                <td>&nbsp;:&nbsp;
                                    @php
                                 $databank = DB::table('tb_bank')
                                 ->where('id',$kd->pembayaran)
                                 ->get();
                                 @endphp
                                 @foreach($databank as $bank)
                                    {{$bank->nama_bank}}
                                 @endforeach
                                </td>
                            </tr>
                            <tr>
                                <td>Alamat Tujuan</td>
                                <td>&nbsp;:&nbsp;{{$kd->alamat_tujuan}}</td>
                            </tr>
                            <tr>
                                <td>Keterangan</td>
                                <td>&nbsp;:&nbsp;{{$kd->keterangan}}</td>
                            </tr>
                        </table>
                    </div>
                    @endforeach
                    @if (session('status'))
                    <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('status') }}
                    </div>
                    @endif
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            List barang yang dibeli
                        </div>
                        <!-- /.panel-heading -->

                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode Barang</th>
                                        <th>Nama Barang</th>
                                        <th>Jumlah</th>
                                        <th>harga</th>
                                        <th>diskon</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                     $no =1;
                                    @endphp
                                    @foreach($data as $row)
                                    <tr>
                                        <td>{{$no++}}</td>
                                        <td>{{$row->kode_barang}}</td>
                                        <td>{{$row->barang}}</td>
                                        <td>{{$row->jumlah}}</td>
                                        <td class="text-right">{{"Rp ". number_format($row->harga,0,',','.')}}</td>
                                        <td>{{$row->diskon}}%</td>
                                        <td class="text-right">
                                            {{"Rp ". number_format($row->total,0,',','.')}}
                                        </td>
                                    </tr>
                                     @endforeach
                                </tbody>
                              
                            </table>
                            <div class="well well-sm text-right">

                                <h4>Subtotal : {{"Rp ". number_format($kd->total,0,',','.')}}</h4>
                                <h4>Ongkir : {{"Rp ". number_format($kd->ongkir,0,',','.')}}</h4>
                                <h3>Total Akhir : {{"Rp ". number_format($kd->total_akhir,0,',','.')}}</h3>
                             </div>
                             <a onclick="window.history.go(-1);" class="btn btn-danger pull-right">Kembali</a>
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
        
        @endsection