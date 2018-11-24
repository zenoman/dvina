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
                                            


                                            <td class="product-name">
                                            	{{$transaksi->faktur}}
                                            </td>
                                            <td class="product-name">
                                            	{{$transaksi->tgl}}
                                            </td>
                                            <td class="product-quantity">
                                            	<span class="amount">
                                            	{{"Rp ". number_format($transaksi->total,0,',','.')}}
                                                </span>
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">
                                                {{$transaksi->status}}
                                            	</span> 
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="woocommerce-info">NB: Pastikan Menyertakan Faktur Pada Berita Transfer. Jika Ada yang Keluhan Atau Kurang Jelas, Hubungi CP Kami Di Tab Hubungi Kami 
                            	</div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>
    
    @endsection