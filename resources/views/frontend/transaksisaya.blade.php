@extends('layout/masteruser')
	
	@section('header')
    	@foreach($websettings as $webset)
    		<title>{{$webset->webName}}</title>
    		<link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
    	@endforeach
    @endsection
    @section('navigation')
    <ul class="nav navbar-nav">
        <li><a href="{{url('/')}}">Home</a></li>
        <li><a href="{{url('/semuaproduk')}}">Semua Produk</a></li>
        <li><a href="{{url('/hubungikami')}}">Hubungi Kami</a></li>
    </ul>
    @endsection
    @section('logo')
     @foreach($websettings as $webset)
     <h1><a href="{{url('/')}}"><img src="{{asset('img/setting/'.$webset->logo)}}"></a></h1>
    @endforeach
    @endsection
    @section('content')
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Transaksi Saya</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
               <div class="col-md-12">
                    <div class="product-content-right">
                        <div class="woocommerce">
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-name">Faktur</th>
                                            <th class="product-thumbnail">Tanggal</th>
                                            <th class="product-price">Total Harga</th>
                                            <th class="product-quantity">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	@foreach($transaksis as $transaksi)
                                        <tr class="cart_item">
                                            
                                            <td class="product-name text-primary">
                                            	
                                                    <a href="#" data-toggle="modal" data-target="#myModal{{$transaksi->id}}" style="color:#428bca;">
                                                       {{$transaksi->faktur}} 
                                                    </a>
                                                
                                            </td>
                                             <div class="modal fade" id="myModal{{$transaksi->id}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">Daftar Barang Yang Di beli</h4>
                                        </div>
                                        <div class="modal-body">
                                            @php
                                            $detailnya = DB::table('tb_details')
                                            ->where('faktur',$transaksi->faktur)
                                            ->get();
                                            @endphp
                                            @foreach($detailnya as $dtail)
                                        {{$dtail->faktur}}
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                                            <td class="product-name">
                                            	{{$transaksi->tgl}}
                                            </td>
                                            <td class="product-quantity">
                                            	<span class="amount">
                                                @if($transaksi->total_akhir=='')
                                            	{{"Rp ". number_format($transaksi->total,0,',','.')}}
                                                @else
                                                {{"Rp ". number_format($transaksi->total_akhir,0,',','.')}}
                                                @endif
                                                </span>
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">
                                                    @if($transaksi->status=='dibaca' || $transaksi->status=='terkirim')
                                                    Menunggu Persetujuan
                                                    @else
                                                    {{$transaksi->status}}
                                                    @endif
                                            	</span> 
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                {{ $transaksis->links() }}
                                <div class="woocommerce-info">NB: Pastikan Menyertakan Faktur Pada Berita Transfer. Jika Ada yang Keluhan Atau Kurang Jelas, Hubungi CP Kami Di Tab Hubungi Kami 
                            	</div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>
    
    @endsection