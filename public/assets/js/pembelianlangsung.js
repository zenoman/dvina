$(document).ready(function(){
	carikode();
	var kodebarangnya='';
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
						$("#harga").val(item.harga_barang);
						$("#diskon").val(item.diskon);
						$('#kodebarangnya').val(item.kode_barang);
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
	
});