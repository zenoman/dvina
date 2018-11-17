@extends('layout.masteruser')

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
        <li class="active"><a href="{{url('/hubungikami')}}">Hubungi Kami</a></li>
    </ul>
    @endsection                
    
    @section('content')
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
    @endsection
    