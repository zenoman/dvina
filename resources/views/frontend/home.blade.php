@extends('layout/masteruser')

    @section('header')
    @foreach($websettings as $webset)
    <title>{{$webset->webName}}</title>
    <link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
    @endforeach
    @endsection
   
                
    @section('cart')
    @if(Session::get('user_name'))
    @if($totalkeranjang > 0)
    <div class="shopping-item">
        <a href="cart.html">Keranjang - 
            <span class="cart-amunt">
            @foreach($totalbayar as $tb)
            {{"Rp ". number_format($tb->newtotal,0,',','.')}}
            @endforeach
            </span> 
        <i class="fa fa-shopping-cart"></i> 
            @if($totalkeranjang>0)
            <span class="product-count">{{$totalkeranjang}}</span>
            @endif
        </a>
    </div>
    @endif
    @endif
    @endsection
    
    @section('navigation')
    <ul class="nav navbar-nav">
        <li class="active"><a href="{{url('/')}}">Home</a></li>
        <li><a href="{{url('/semuaproduk')}}">Semua Produk</a></li>
        <li><a href="{{url('/hubungikami')}}">Hubungi Kami</a></li>
    </ul>
    @endsection
                
    @section('content')
    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					@foreach($sliders as $slider)
                    <li>
                        
						<img src="{{asset('img/slider/'.$slider->foto)}}" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								iPhone <span class="primary">6 <strong>Plus</strong></span>
							</h2>
							<h4 class="caption subtitle">Dual SIM</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
					@endforeach
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-child"></i>
                        <p>Harga Murah</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>Pengiriman Rapi</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-rocket"></i>
                        <p>Respon Cepat</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>Produk Berkuwalitas</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Produk Terbaru</h2>
                        <div class="product-carousel">
                            @foreach($barangbaru as $barangterbaru)
                            <div class="single-product">
                                <div class="product-f-image">
                                    @php
                                    $kode_barang = $barangterbaru->kode_barang;
                                    $foto = DB::table('gambar')
                                    ->where('kode_barang', $kode_barang)
                                    ->limit(1)
                                    ->get();
                                    @endphp
                                    @foreach($foto as $ft)
                                    <img src="{{asset('img/barang/'.$ft->nama)}}" alt="">
                                    @endforeach
                                    <div class="product-hover">
                                       <a href="{{url('/detailbarang/'.$barangterbaru->id)}}" class="add-to-cart-link"><i class="fa fa-eye"></i> Detail</a>
                                    </div>
                                </div>
                                
                                <h2><a>{{$barangterbaru->barang}}</a></h2>

                                <div class="product-carousel-price">
                                    @if($barangterbaru->diskon > 0)
                                    @php
                                    $hargadiskon = $barangterbaru->harga_barang - ($barangterbaru->diskon/100*$barangterbaru->harga_barang); 
                                    @endphp
                                    <ins>{{"Rp ". number_format($hargadiskon,0,',','.')}}</ins>
                                    <del>{{"Rp ". number_format($barangterbaru->harga_barang,0,',','.')}}</del>
                                    <p>{{"Stok : ".$barangterbaru->total}}</p>
                                    @else
                                    <ins>{{"Rp ". number_format($barangterbaru->harga_barang,0,',','.')}}</ins>
                                    <p>{{"Stok : ".$barangterbaru->total}}</p>
                                    @endif
                                </div>                            
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
        
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <h2 class="section-title">Anda Mungkin Suka</h2>
            <div class="row">
                @foreach($barangsuges as $suges)
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                          @php
                                    $kode_barang = $suges->kode_barang;
                                    $foto = DB::table('gambar')
                                    ->where('kode_barang', $kode_barang)
                                    ->limit(1)
                                    ->get();
                                    @endphp
                                    @foreach($foto as $ft)
                                    <div class="product-upper">
                                    <img src="{{asset('img/barang/'.$ft->nama)}}" alt="">
                                    </div>
                                    @endforeach
                       
                        <h2><a>{{$suges->barang}}</a></h2>
                        <div class="product-carousel-price">
                              @if($suges->diskon > 0)
                                    @php
                                    $hargadiskon = $suges->harga_barang - ($suges->diskon/100*$suges->harga_barang); 
                                    @endphp
                                    <ins>{{"Rp ". number_format($hargadiskon,0,',','.')}}</ins>
                                    <del>{{"Rp ". number_format($suges->harga_barang,0,',','.')}}</del>
                                    <p>{{"Stok : ".$suges->total}}</p>
                                    @else
                                    <ins>{{"Rp ". number_format($suges->harga_barang,0,',','.')}}</ins>
                                    <p>{{"Stok : ".$suges->total}}</p>
                                    @endif
                        </div>  
                        
                        <div class="product-option-shop">
                            <!--a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Tambah Ke Keranjang</a-->
                             <a href="{{url('/detailbarang/'.$suges->id)}}" class="add_to_cart_button">Detail Produk</a>
                        </div>                       
                    </div>
                </div>
                @endforeach
                
            </div>
        </div>
    </div>  
   @endsection
    
    