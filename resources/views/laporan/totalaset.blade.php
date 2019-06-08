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
                    <h1 class="page-header">Laporan Total Aset</h1>

                </div>
            </div>
            <div class="row">

                <div class="col-lg-12">
                    @if (session('status'))
                    <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('status') }}
                    </div>
                    @endif
                    
                    <br><br>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            List Data Aset
                        </div>

                        <div class="panel-body">

                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                  <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Nama Barang</th>
                                        <th>Kategori</th>
                                        <th>Harga Beli</th>
                                        <th>Stok</th>
                                        <th>Subtotal</th>
                                   
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $i=0;
                                    $totalnyabu = 0;
                                    ?>
                                    @foreach($barang as $row)
                                    <?php $i++; 
                                    $totalnyabu +=$row->tot;
                                    ?>
                                    <tr>
                                        <td>{{$i}}</td>
                                        <td>{{$row->kode_barang}}</td>
                                        <td>{{$row->barang}}</td>
                                        <td>{{$row->kategori}}</td>
                                        <td>{{"Rp ". number_format($row->harga_beli,0,',','.')}}</td>
                                        
                                        <td>{{$row->total}} Pcs</td>
                                       <td>{{"Rp ". number_format($row->tot,0,',','.')}}</td>
                                    </tr>
                                    @endforeach
                                    
                                </tbody>
                            </table>
                                 {{ $barang->links() }}
                                 <h3>Total : {{"Rp ". number_format($totalnyabu,0,',','.')}}</h3>
                            <div class="pull-right">
                               <button id="btncetak" class="btn btn-primary"><i class="fa fa-print"></i> Print</button>
                            </div>
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <div id="hidden_div" style="display: none;">
            <h4>List Data Aset</h4>
            <table width="100%" border="1">
                                  <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode</th>
                                        <th>Nama Barang</th>
                                        <th>Kategori</th>
                                        <th>Harga Beli</th>
                                        <th>Stok</th>
                                        <th>Subtotal</th>
                                   
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $i=0;
                                    ?>
                                    @foreach($barangg as $row2)
                                    <?php $i++;
                                    ?>
                                    <tr>
                                        <td>{{$i}}</td>
                                        <td>{{$row2->kode_barang}}</td>
                                        <td>{{$row2->barang}}</td>
                                        <td>{{$row2->kategori}}</td>
                                        <td>{{"Rp ". number_format($row2->harga_beli,0,',','.')}}</td>
                                        
                                        <td>{{$row2->total}} Pcs</td>
                                       <td>{{"Rp ". number_format($row2->tot,0,',','.')}}</td>
                                    </tr>
                                    @endforeach
                                    
                                </tbody>
                            </table>
                            <h3>Total : {{"Rp ". number_format($totalnyabu,0,',','.')}}</h3>
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
    $('#btncetak').click(function(){
        
         var print_div = document.getElementById("hidden_div");
var print_area = window.open();
print_area.document.write(print_div.innerHTML);
print_area.document.close();
print_area.focus();
print_area.print();
print_area.close();
        
        });
    </script>
        @endsection