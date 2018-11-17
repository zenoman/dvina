@extends('layout/masteruser')

    @section('header')
    @foreach($websettings as $webset)
    <title>{{$webset->webName}}</title>
    <link rel="shortcut icon" type="image" href="{{asset('img/setting/'.$webset->ico)}}">
    @endforeach
    @endsection
 
    @section('cart')        
    @if(Session::get('user_name'))
    <div class="shopping-item">
        <a href="cart.html">Keranjang - <span class="cart-amunt">$100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
    </div>
    @endif
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
                        <h2>Deskripsi Produk</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Products</h2>
                        <div class="thubmnail-recent">
                            <img src="{{asset('user_aset/img/product-thumb-1.jpg')}}" class="recent-thumb" alt="">
                            <h2><a href="">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$100.00</del>
                            </div>                             
                        </div>
                       
                        <div class="thubmnail-recent">
                            <img src="{{asset('user_aset/img/product-thumb-1.jpg')}}" class="recent-thumb" alt="">
                            <h2><a href="">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$100.00</del>
                            </div>                             
                        </div>
                        <div class="thubmnail-recent">
                            <img src="{{asset('user_aset/img/product-thumb-1.jpg')}}" class="recent-thumb" alt="">
                            <h2><a href="">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$100.00</del>
                            </div>                             
                        </div>
                    </div>
                </div>
                
                <div class="col-md-8">
                    @foreach($databarang as $barang)
                    <div class="product-content-right">
                        
                        <div class="row">
                            <div class="col-sm-6 text-center">
                                <div class="product-images">
                                    <div class="product-main-img">
                                    @php
                                    $kode_barang = $barang->kode_barang;
                                    $foto = DB::table('gambar')
                                    ->where('kode_barang', $kode_barang)
                                    ->limit(1)
                                    ->get();
                                    @endphp
                                    @foreach($foto as $ft)
                                    <img src="{{asset('img/barang/'.$ft->nama)}}" alt="" width="auto">
                                    @endforeach
                                    </div>
                                    
                                </div>
                             </div>
                            <div class="col-sm-6">
                                <h2 class="product-name">
                                
                                    {{ $barang->barang }}
                                </h2>
                                    <div class="product-inner-price" style="font-size: 20px;">
                                       
                                        @if($barang->diskon > 0)
                                        <ins>{{"Rp ". number_format(($barang->harga_barang-($barang->diskon/100*$barang->harga_barang)),0,',','.')}}</ins> <del>{{"Rp ". number_format($barang->harga_barang,0,',','.')}}</del>
                                        @else
                                        <ins>{{"Rp ". number_format($barang->harga_barang,0,',','.')}}</ins>
                                        @endif
                                    </div>    
                                    
                                    <form action="/tambahkeranjang" method="post" class="cart form-horizontal" >
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">Warna </label>
                                            <div class="col-sm-10">
                                                <select name="warna" class="form-control" placeholder="pilih warna">
                                                <option selected disabled hidden>pilih warna</option>
                                                @php 
                                                $warnas = DB::table('tb_barangs')
                                                        ->where('kode',$barang->kode_barang)
                                                        ->get();
                                                @endphp
                                                    @foreach($warnas as $warna)
                                                    <option value="{{$warna->idbarang.'-'.$warna->stok}}">{{$warna->warna}}</option>
                                                    @endforeach
                                                
                                            </select></div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">Stok</label>
                                            <div class="col-sm-10"><input type="number" id="stok" class="form-control" name="jumlah" required readonly></div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">Jumlah</label>
                                            <div class="col-sm-10">
                                                <input type="number" id="jumlah" class="form-control" max="???" name="jumlah" min="1" required>
                                            </div>
                                            
                                        </div>
                                        <input type="hidden" name="kode_barang" value="{{$barang->kode_barang}}">
                                        {{ csrf_field() }}
                                        
                                        <div class="pull-right">
                                        <button type="submit">Masukan Keranjang</button>
                                        <button type="button" onclick="window.history.go(-1);" class="tombol-merah">Kembali</button>    
                                        </div>
                                        
                                    </form>   
                            </div>   
                            <div class="col-sm-12">
                                
                            
                                <div class="product-inner">
                                    
                                    <div role="tabpanel">
                                      
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                <h2>Deskripsi Produk</h2>  
                                                <p>
                                                    {{$barang->deskripsi}}
                                                </p>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                    </div> 
                    @endforeach                   
                </div>
            </div>
        </div>
    </div>
    @endsection
  
    @section('jspage')
    <script type="text/javascript">
        $('select').on('change', function (e) {
            var optonselected = $("option:selected", this);
            var value = this.value;
            var datanya = value.split("-");
        $('#stok').val(datanya[1]);
        $('#jumlah').attr({
            "max":datanya[1]
        });
        })
    </script>
    @endsection
  