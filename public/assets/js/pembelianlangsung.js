$(document).ready(function(){
	carikode();
	//===========================================
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
});