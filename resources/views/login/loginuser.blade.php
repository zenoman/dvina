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
    <title>Login User</title>
    
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
   
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="{{asset('user_aset/img/logo.png')}}"></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                  
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
   
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Login User</h2>
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
                        <h2 class="sidebar-title">Login </h2>
                        @if(session('errorlogin'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('errorlogin') }}
                    </div>
                    @endif
                        <form action="{{url('/loginUser')}}" method="post">
                            <input type="text" placeholder="Masukan Username" class="input-text" name="username">
                            <input style="width: 100%" type="password" placeholder="Masukan Password" name="password" class="input-text"><br><br>
                            {{ @csrf_field() }}
                            <input type="submit" value="Login">
                        </form>
                    </div>
                    
                </div>
                
                <div class="col-md-8">
                     @if (session('status'))
                    <div class="alert alert-success alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('status') }}
                    </div>
                    @elseif(session('statuserror'))
                    <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                {{ session('statuserror') }}
                    </div>
                    @endif
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <div class="woocommerce-info">Belum Punya Akun ? <a class="showlogin" data-toggle="collapse" href="#login-form-wrap" aria-expanded="false" aria-controls="login-form-wrap">Klik disini untuk membuat</a>
                            </div>

                            <form id="login-form-wrap" class="login collapse" method="post" action="{{url('/login/register')}}" enctype="multipart/form-data">
                            <p>Isi data diri yang diminta di bawah ini, pastikan data diri tersebut valid dan dapat di pertanggung jawabkan.</p>
                                <p class="form-row form-row-first">
                                    <label>Nama
                                    </label>
                                    <input type="text" name="nama" class="form-control" style="width: 100%" value="{{ old('nama') }}" required>
                                     @if($errors->has('nama'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('nama')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Username
                                    </label>
                                    <input type="text" name="username" class="form-control" style="width: 100%" value="{{ old('username') }}" required>
                                     @if($errors->has('username'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('username')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Password
                                    </label>
                                    <input type="password" name="password" class="form-control" style="width: 100%" value="{{ old('password') }}" required>
                                     @if($errors->has('password'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('password')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Konfirmasi Password
                                    </label>
                                    <input type="password" name="konfirmasi_password" class="form-control" style="width: 100%" value="{{ old('konfirmasi_password') }}" required>
                                     @if($errors->has('konfirmasi_password'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('konfirmasi_password')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Email
                                    </label>
                                    <input type="email" name="email" class="form-control" style="width: 100%" value="{{ old('email') }}" required>
                                      @if($errors->has('email'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('email')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>No Telfon
                                    </label>
                                    <input type="text" name="no_telfon" class="form-control" style="width: 100%" value="{{ old('no_telfon') }}" required>
                                  @if($errors->has('no_telfon'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('no_telfon')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Alamat
                                    </label>
                                    <input type="text" name="alamat" class="form-control" style="width: 100%" value="{{ old('alamat') }}" required>
                                      @if($errors->has('alamat'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('alamat')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Kota
                                    </label>
                                    <input type="text" name="kota" class="form-control" style="width: 100%" value="{{ old('kota') }}" required>
                                      @if($errors->has('kota'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('kota')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Provinsi
                                    </label>
                                   <select class="form-control"name="provinsi">
                                                <option value="aceh">Aceh</option>
                                        <option valuer="sumatera utara">Sumatera Utara</option>
                                        <option valuer="sumatera barat">Sumatera Barat</option>
                                        <option valuer="riau">Riau</option>
                                        <option valuer="kepuluan riau">Kepulauan Riau</option>
                                        <option valuer="jambi">Jambi</option>
                                        <option valuer="sumatera selatan">Sumatera Selatan</option>
                                        <option valuer="bangka belitung">Bangka Belitung</option>
                                        <option valuer="bengkulu">Bengkulu</option>
                                        <option valuer="lampung">Lampung</option>
                                        <option valuer="jakarta">DKI Jakarta</option>
                                        <option valuer="jawa barat">Jawa Barat</option>
                                        <option valuer="banten">Banten</option>
                                        <option valuer="jawa tengah">Jawa Tengah</option>
                                        <option valuer="yogyakarta">Yogyakarta</option>
                                        <option valuer="jawa timur">Jawa Timur</option>
                                        <option valuer="bali">Bali</option>
                                        <option valuer="NTB">NTB</option>
                                        <option valuer="NTT">NTT</option>
                                        <option valuer="kalimantan utara">Kalimantan Utara</option>
                                        <option valuer="kalimantan barat">Kalimantan Barat</option>
                                        <option valuer="kalimantan tengah">Kalimantan Tengah</option>
                                        <option valuer="kalimantan selatan">Kalimantan Selatan</option>
                                        <option valuer="kalimantan timur">Kalimantan Timur</option>
                                        <option valuer="sulawesi utara">Sulawesi Utara</option>
                                        <option valuer="sulawesi barat">Sulawesi Barat</option>
                                        <option valuer="sulawesi tengah">Sulawesi Tengah</option>
                                        <option valuer="sulawesi tenggara">Sulawesi Tenggara</option>
                                        <option valuer="sulawesi selatan">Sulawesi Selatan</option>
                                        <option valuer="gorontalo">Gorontalo</option>
                                        <option valuer="maluku">Maluku</option>
                                        <option valuer="maluku utara">Maluku Utara</option>
                                        <option valuer="papua barat">Papua Barat</option>
                                        <option valuer="papua">Papua</option>
                                            </select>
                                              @if($errors->has('provinsi'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('provinsi')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Kode Pos
                                    </label>
                                    <input type="text" name="kode_pos" class="form-control" style="width: 100%" value="{{ old('kode_pos') }}" required>
                                      @if($errors->has('kode_pos'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('kode_pos')}}
                                         </div>
                                        @endif
                                </p>
                                <p class="form-row form-row-first">
                                    <label>Foto KTP
                                    </label>
                                    <input type="file" name="gambar_ktp" required>
                                     @if($errors->has('gambar_ktp'))
                                        <div class="alert alert-danger">
                                        {{ $errors->first('gambar_ktp')}}
                                         </div>
                                        @endif
                                </p>
                                <div class="clear"></div>
                                <p class="form-row">
                                    {{csrf_field()}}

                                    <input type="submit" value="Simpan" class="button">
                                </p>
                                

                                <div class="clear"></div>
                            </form>
                        </div>                       
                    </div>                    
                </div>
            </div>
        </div>
    </div>


    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>u<span>Stora</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">User Navigation </h2>
                        <ul>
                            <li><a href="">My account</a></li>
                            <li><a href="">Order history</a></li>
                            <li><a href="">Wishlist</a></li>
                            <li><a href="">Vendor contact</a></li>
                            <li><a href="">Front page</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="">Mobile Phone</a></li>
                            <li><a href="">Home accesseries</a></li>
                            <li><a href="">LED TV</a></li>
                            <li><a href="">Computer</a></li>
                            <li><a href="">Gadets</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <input type="email" placeholder="Type your email">
                            <input type="submit" value="Subscribe">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
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