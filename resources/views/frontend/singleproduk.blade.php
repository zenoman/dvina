<!DOCTYPE html>
<!--
	ustora by freshdesignweb.com
	Twitter: https://twitter.com/freshdesignweb
	URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Page - Ustora Demo</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="{{asset('user_aset/css/bootstrap.min.css')}}">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('user_aset/css/font-awesome.min.css')}}">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{asset('user_aset/css/owl.carousel.css')}}">
    <link rel="stylesheet" href="{{asset('user_aset/style.css')}}">
    <link rel="stylesheet" href="{{asset('user_aset/css/responsive.css')}}">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                             @if(!Session::get('user_name'))
                            <li><a href="{{url('/loginUser')}}"><i class="fa fa-user"></i> Login</a></li>
                            @else
                            <li><a href="cart.html"><i class="fa fa-shopping-cart"></i>Keranjang Saya</a></li>
                            @endif
                            <!--li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li-->
                            <li><a href="{{url('/login')}}"><i class="fa fa-users"></i>Login Admin</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    @if(Session::get('user_name'))
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">{{Session::get('user_name')}}</span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Edit Profile</a></li>
                                    <li><a href="{{url('/login/logoutuser')}}">Logout</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="{{asset('user_aset/img/logo.png')}}"></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                  
                    @if(Session::get('user_name'))
                    <div class="shopping-item">
                        <a href="cart.html">Keranjang - <span class="cart-amunt">$100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="{{url('/')}}">Home</a></li>
                        <li><a href="{{url('/semuaproduk')}}">Semua Produk</a></li>
                        <li><a href="single-product.html">Hubungi Kami</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
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
                                        <ins>{{"Rp ". number_format(($barang->harga_barang-$barang->diskon),0,',','.')}}</ins> <del>{{"Rp ". number_format($barang->harga_barang,0,',','.')}}</del>
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
                                        
                                        <button class="add_to_cart_button pull-right" type="submit">Add to cart</button>
                                    </form>   
                            </div>   
                            <div class="col-sm-12">
                                
                            
                                <div class="product-inner">
                                    
                                    <div role="tabpanel">
                                        <ul class="product-tab" role="tablist">
                                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Deskripsi</a></li>
                                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Warna Tersedia</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                <h2>Product Description</h2>  
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>

                                                <p>Mauris placerat vitae lorem gravida viverra. Mauris in fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam facilisis lobortis. In malesuada pulvinar neque a consectetur. Nunc aliquam gravida purus, non malesuada sem accumsan in. Morbi vel sodales libero.</p>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="profile">
                                                <h2>Reviews</h2>
                                                <div class="submit-review">
                                                  
                                                </div>
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

  <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="copyright">
                        <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                    </div>
                </div>
                
               
            </div>
        </div>
    </div> 
   
    <!-- Latest jQuery form server -->
    <script src="{{asset('user_aset/js/jquery.min.js')}}"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="{{asset('user_aset/js/bootstrap.min.js')}}"></script>
    
    <!-- jQuery sticky menu -->
    <script src="{{asset('user_aset/js/owl.carousel.min.js')}}"></script>
    <script src="{{asset('user_aset/js/jquery.sticky.js')}}"></script>
    
    <!-- jQuery easing -->
    <script src="{{asset('user_aset/js/jquery.easing.1.3.min.js')}}"></script>
    
    <!-- Main Script -->
    <script src="{{asset('user_aset/js/main.js')}}"></script>
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
  </body>
</html>