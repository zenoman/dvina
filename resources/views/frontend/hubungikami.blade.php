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
                        <li class="active"><a href="single-product.html">Hubungi Kami</a></li>
                        <!--li><a href="cart.html">Cart</a></li>
                        <li><a href="checkout.html">Checkout</a></li>
                        <li><a href="#">Category</a></li>
                        <li><a href="#">Others</a></li>
                        <li><a href="#">Contact</a></li-->
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
                        <h2>Hubungi Kami</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="single-product-area">
        <div class="container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126486.11387369903!2d112.03784828547029!3d-7.822487605206616!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7858fb7bf1947d%3A0x4027a76e3531190!2sGurah%2C+Kediri%2C+Jawa+Timur!5e0!3m2!1sid!2sid!4v1542003545581" width="1135" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
        <div class="panel panel-default">
                        <div class="panel-heading">
                            Isi Data Dibawah Ini Sesuai Perintah !
                        </div>
                        <div class="panel-body">
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
  </body>
</html>