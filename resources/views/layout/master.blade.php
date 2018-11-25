@if(!Session::get('username'))
<script type="text/javascript">
    window.location.href = '{{url("/validatelogin")}}';
</script>
@endif
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{csrf_token()}}">
    <title>
        @yield('title')
    </title>
    @yield('favicon')
    
    <!-- Bootstrap Core CSS -->
    <link href="{{asset('assets/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="{{asset('assets/vendor/metisMenu/metisMenu.min.css')}}" rel="stylesheet">
        @yield('css')
    <!-- Custom CSS -->
    <link href="{{asset('assets/dist/css/sb-admin-2.css')}}" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="{{asset('assets/vendor/font-awesome/css/font-awesome.min.css')}}" rel="stylesheet" type="text/css">
    <!-- Vue Js -->
   <!--  <script src="{{asset('js/app.js')}}" defer></script> -->
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Welcome {{Session::get('username')}}</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts" id="barnotiv">
                    	</ul>
                	</li>
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="{{url('/logout')}}"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="{{url('/dashboard')}}"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="{{url('/admin')}}"><i class="fa fa-user fa-fw"></i> Admin</a>
                        </li>
                        <li>
                            <a href="{{url('/jual')}}"><i class="fa fa-cart-plus fa-fw"></i> Transaksi Barang</a>
                        </li>
                        <li>
                            <a href="{{url('/pesan')}}"><i class="fa fa-tags fa-fw"></i> Pemesanan Barang</a>
                        </li>
                        <li>
                            <a href="{{url('/user')}}"><i class="fa fa-users fa-fw"></i> User</a>
                        </li>
                        <li>
                            <a href="{{url('/kategori')}}"><i class="fa fa-th-large fa-fw"></i> Kategori</a>
                        </li>

                        <li>
                            <a href="{{url('/barang')}}"><i class="fa fa-cube fa-fw"></i> Barang</a>
                        </li>
                        <li>
                            <a href="{{url('/slider')}}"><i class="fa fa-image fa-fw"></i> Slider</a>
                        </li>
                        <li>
                            <a href="{{url('bank')}}"><i class="fa fa-credit-card"></i> Rekening Toko</a>
                        </li>
                        <li>
                            <a href="{{url('/setting')}}"><i class="fa fa-gear fa-fw"></i> Setting</a>
                        </li>
                        </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="app">
            @yield('content')
        </div>

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="{{asset('assets/vendor/jquery/jquery.min.js')}}"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="{{asset('assets/vendor/bootstrap/js/bootstrap.min.js')}}"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="{{asset('assets/vendor/metisMenu/metisMenu.min.js')}}"></script>

    
    <!-- Custom Theme JavaScript -->

    <script src="{{asset('assets/js/bootstrap-notify.js')}}"></script>
	<script src="{{asset('assets/js/bootstrap-notify.min.js')}}"></script>
    <script src="{{asset('assets/dist/js/sb-admin-2.js')}}"></script>
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    
    @yield('js')

    <script src="{{asset('assets/js/notifikasi.js')}}"></script>
</body>

</html>