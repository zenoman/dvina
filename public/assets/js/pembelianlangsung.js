$(document).ready(function(){
	carikode();
	$('#caribarang').focus();
	//===========================================cari kode
	function carikode(){
			$.ajax({
			url:'/carikode',
			dataType:'json',
			success:function(data){
				noresi = data;
				$("#noresi").html(noresi);
			}
		});
		}

	//=============================================cari barang
	$('#caribarang').select2({
		placeholder: 'Cari barang',
		ajax:{
			url:'/caribarang',
			dataType:'json',
			delay:250,
			processResults: function (data){
				return {
					results : $.map(data, function (item){
						return {
							id: item.kode_barang,
							text: item.barang
						}
					})
				}
			},
			cache: true
		}
	});
	//=================================================
	$('#caribarang').on('select2:select',function(e){
		$('#panelnya').loading('toggle');
			var kode = $(this).val();
			$.ajax({
                type: 'GET',
                url: '/carihasilbarang/'+kode,
                success:function (data){
				return {
					results : $.map(data, function (item){
						$("#nama_barang").val(item.barang);
						$("#harga").val(rupiah(item.harga_barang));
						$("#diskon").val(item.diskon);
						cariwarna(item.kode_barang);
					})}
				 
				},
            });
		});

	
	//=============================================

	function cariwarna(kode){
		$.ajax({
			url:'/cariwarna/'+kode,
			dataType:'json',
			success:function(data){
				$('#cariwarna option').each(function() {
    				if ( $(this).val() != 'ph' ) {
       				 $(this).remove();
    			}});
    			$('#cariwarna')
         				.append($("<option></option>")
                    	.attr("value",'ph')
                    	.attr("data-stok",'')
                    	.attr('selected','')
                    	.attr('disabled','')
                    	.attr('hidden','')
                    	.text('pilih warna')); 
				$('#stok').val('');
				$('#jumlah').val('');
				return {
					results : $.map(data, function (item){
						$('#cariwarna')
         				.append($("<option></option>")
                    	.attr("value",item.idbarang)
                    	.attr("data-stok",item.stok)
                    	.text(item.warna)); 
					
					})}
			},
              complete: function (data) {
                $('#panelnya').loading('stop');
                $('#cariwarna').focus();
              }
		});
	}
	//===============================================
	$('#cariwarna').on('change', function() {
  		var stok = $(this).find(':selected').attr('data-stok')
  		$('#stok').val(stok);
	});

	//===============================================
	$('#tambahbarang').click(function(){

		if($('#nama_barang').val()=='' || $('#stok').val()=='' || $('#jumlah').val()==''){
			$.notify({message: 'Maaf, Data harus di isi'},{type: 'danger'});
		}else{
			if(parseInt($('#jumlah').val()) > parseInt($('#stok').val())){
				$.notify({message: 'Maaf, Stok tidak cukup'},{type: 'danger'});	
			}else{
				$('#panelnya').loading('toggle');
				var barang = $("#caribarang").select2('data');
            	var kode_barang = barang[0].id;
            	var hargabarang = $('#harga').val().replace('.','');
            	var totalawal = parseInt(hargabarang) * parseInt($('#jumlah').val());
				var totaldiskon = parseInt($('#diskon').val())/100*parseInt(hargabarang) * parseInt($('#jumlah').val());
				var total = totalawal-totaldiskon;
				
				$.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: '/tambahdetail',
                    type: 'POST',
                    data:{
                    	'idwarna': $('#cariwarna').val(),
                    	'faktur': $('#noresi').html(),
    					'kodebarang': kode_barang,
    					'barang': $('#nama_barang').val(),
    					'harga': hargabarang,
    					'jumlah': $('#jumlah').val(),
    					'totalawal': totalawal,
    					'diskon': $('#diskon').val(),
    					'total': total,
                    	},
                    success: function () {
                    	alert('Berhasil menambahkan barang');
                    	bersih();
                    	getdata();
                    },complete:function(){
                    	$('#panelnya').loading('stop');
                    }
                });
			}
		}
	});

	//==================================================
	function getdata(){
		var noresi = $('#noresi').html();
		$.ajax({
            type:'GET',
            dataType:'json',
            url: '/caridetailbarang/'+noresi,
            success:function(data){
                managerow(data);
            },error:function(){
            }
        });
	}
	//=================================================
	function managerow(data){
		var rows ='';
			$.each(data,function(key, value){
                rows = rows + '<tr>';
                rows = rows + '<td class="text-center"><button type="button" class="btn btn-warning" onclick="halo('+value.id+')"><i class="fa fa-trash"></i></button></td>';
                rows = rows + '<td class="text-center">' +value.barang+'</td>';
                rows = rows + '<td class="text-center">'+value.idwarna+'</td>';
                rows = rows + '<td class="text-right"> Rp. ' +rupiah(value.harga)+'</td>';
                rows = rows + '<td class="text-center">' +value.jumlah+'</td>';
                rows = rows + '<td class="text-center">' +value.diskon+'</td>';
                rows = rows + '<td class="text-right"> Rp. ' +rupiah(value.total)+'</td>';
                rows = rows + '</tr>';
            });
            $("#tubuh").html(rows);
	}

	//==================================================================
    function halo(id){
    var foo='bar';
    if(foo=='bar'){
     var isgood = confirm('hapus ? ');
     if(isgood == true){
     	$('#panelnya').loading('toggle');
           $.ajax({
                    type:'GET',
                    dataType:'json',
                    url: '/hapusdetailbarang/'+id,
                    success:function(){
                        alert('Data dihapus')
                        getdata();
                    },error:function(){
                       alert('Data dihapus');
                        getdata();
                    },complete:function(){
                    	$('#panelnya').loading('stop');
                    }
                });
     }   
    }
    }
    window.halo=halo;
	//=================================================
	function bersih(){
		$("#caribarang").val(null).trigger('change');
		$('#cariwarna option').each(function(){
    		if ( $(this).val() != 'ph' ) {
       		$(this).remove();
    		}});
    	$('#cariwarna')
         		.append($("<option></option>")
                   .attr("value",'ph')
                   .attr("data-stok",'')
                   .attr('selected','')
                   .attr('disabled','')
                   .attr('hidden','')
                   .text('pilih warna')); 
		$('#stok').val('');
		$('#jumlah').val('');
		$('#nama_barang').val('');
		$('#diskon').val('');
		$('#caribarang').focus();
	}

	//==================================================
		function rupiah(bilangan){
			var	number_string = bilangan.toString(),
			sisa 	= number_string.length % 3,
			rupiah 	= number_string.substr(0, sisa),
			ribuan 	= number_string.substr(sisa).match(/\d{3}/gi);
			
		if (ribuan) {
			separator = sisa ? '.' : '';
			rupiah += separator + ribuan.join('.');
		}
			return rupiah;
		}
	
});