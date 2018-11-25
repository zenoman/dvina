$( document ).ready(function() {
    		checktransaksi();
    		cekbarnotivikasi();
    		setInterval(function(){
    			checktransaksi();
    			cekbarnotivikasi();
    		},7000);

    		function checktransaksi(){
    			 $.ajax({
                    type:'GET',
                    dataType:'json',
                    url: '/cektransaksi',
                    success:function(data){
                       tampilnotifikasi(data);
                    }
                });
    		}

    		function cekbarnotivikasi(){
    			 $.ajax({
                    type:'GET',
                    dataType:'json',
                    url: '/cekbar',
                    success:function(data){
                       tampilbar(data);
                    }
                });
    		}

    		function tampilbar(data){
    			var rows = '';
    			$.each(data,function(key, value){
    				
    				rows = rows + '<li>';
    				rows = rows + '<a href="#">';
                    rows = rows + '<div>';
                    rows = rows + '<i class="fa fa-shopping-cart fa-fw"></i> '+value.username+' Membeli Barang';
                    rows = rows + '</div>';        
                    rows = rows + '</a>';        
                    rows = rows + '</li>';
                    rows = rows + '<li class="divider"></li>';              
                });
                rows = rows+'<li>';
                rows = rows+'<a class="text-center active" href="#"><strong>Lihat Semua Pemberitahuan </strong><i class="fa fa-angle-right"></i>';
                rows = rows +'</a>';
                rows = rows + '</li>';
                rows = rows + '</ul>';
                $("#barnotiv").html(rows);
    		}
    		function tampilnotifikasi(data){
    			$.each(data,function(key, value){
    				$.notify(value.username+" Memesan Barang");
    				
    				$.ajax({
                    type:'GET',
                    dataType:'json',
                    url: '/cektransaksi/'+value.id,
                    error: function(){
                    	Alert('error');
                    }
                	});
    			});
    		}
		});
        