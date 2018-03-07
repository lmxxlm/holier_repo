$(function(){
	$('#export').click(function(){
		var tableID=$(".MYtable").attr("id");
		if(tableID!==null){
			saveAsExcel(tableID);
	    }
	 });

    $('.submit').click(function(){
		var tableID=$(".formdata").attr("id");
		if(tableID!==null){
			saveAsExcel(tableID);
	    }
	});
});
