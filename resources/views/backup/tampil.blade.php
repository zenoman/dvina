@extends('layout.master')
@foreach($websettings as $webset)
@section('title',$webset->webName)
@section('favicon')
<link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
@endsection
@endforeach

@section('css')
@endsection

@section('content')
<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Backup Data	Bulan {{$bulan}} Tahun {{$tahun}} </h1>

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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Backup Data
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                               
                                <div class="col-xs-12 text-center">
                                    <div class="huge">{{$totalpengeluaran}}</div>
                                    <div>Total Pengeluaran</div>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                               
                                <div class="col-xs-12 text-center">
                                    <div class="huge">26</div>
                                    <div>Total Pemasukan</div>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                               
                                <div class="col-xs-12 text-center">
                                    <div class="huge">26</div>
                                    <div>Total Detail Pemasukan</div>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                               
                                <div class="col-xs-12 text-center">
                                    <div class="huge">26</div>
                                    <div>Total Pengeluaran Lain</div>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                </div>
            </div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab" aria-expanded="false">Pengeluaran</a>
                                </li>
                                <li class=""><a href="#profile" data-toggle="tab" aria-expanded="false">Pemasukan</a>
                                </li>
                                <li class=""><a href="#messages" data-toggle="tab" aria-expanded="false">Detail Pemasukan</a>
                                </li>
                                <li class=""><a href="#settings" data-toggle="tab" aria-expanded="true">Pemasukan Lain</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                    <h4>Backup Data Pengeluaran</h4>
                                    
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <h4>Backup Data Pemasukan</h4>
                                    
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <h4>Backup Data Detail Pemasukan</h4>
                                    
                                </div>
                                <div class="tab-pane fade" id="settings">
                                    <h4>Backup Data Pemasukan Lain</h4>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
            </div>
        </div>
        @endsection
        @section('js')
       
        @endsection