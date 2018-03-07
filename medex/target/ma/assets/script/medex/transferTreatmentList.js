$(function(){
    //转诊设置
	$('.submit a').click(function(){
		var token = $('input[name="token"]').val();
		var confirmIdJsonData = [];
		if(!token){
		    alert('页面非法提交！');
			return false;
		}    
		var questArr = {
			token:token,
			confirmIdList:''
		};
		$('input[name="transferTreatment"]').each(function(){
			var key = $(this).next('input[name="doctorId"]').val();
			if($(this).attr('checked')){
				var value = true; 
			}else{
				var value = false;    
			}
			var transferArr = {
				"value":value,
				"key":key
			}
			confirmIdJsonData.push(transferArr);
		});
        questArr.confirmIdList = JSON.stringify(confirmIdJsonData);
		var questURL = runParams.mainUrl+'editTranasferTreatmentInfo.do';
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert("设置成功！");
				location.href= runParams.mainUrl+'transferTreatmentList.html';
			}else{
				alert('修改失败！');
			}
		});
	});
	//医院智能搜索
	$('.searchResultForHospital').siblings('input').keyup(function(){
		var obj = $(this);
	    var searchVar = $(this).val();
		var questURL = runParams.mainUrl+'searchHospitalByNameLimit10.do';
		var questArr = {
			searchVar:searchVar
		};
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
				  htmlstr += '<li><a href="javascript:void(0)"><span>'+con[i]+'</span></a></li>';
				}
				obj.siblings('.searchResultForHospital').html(htmlstr).show();
			}else{
				obj.siblings('.searchResultForHospital').hide();
			}
		});
	});
	$(".searchResultForHospital li a").live('click',function(){
		$(this).parents('.searchResultForHospital').siblings('input').val($(this).find("span").html());
		$(this).parents('.searchResultForHospital').hide();
	});
});