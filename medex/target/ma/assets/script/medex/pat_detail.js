$(function(){
	var docId = $('input[name="docId"]').val();
	var token = $('input[name="token"]').val();
    $(".deletePat").click(function(){
		var name = $(this).attr('data-name');
		var id = $(this).attr('data-id');
	    if(confirm('确定要把患者“'+name+'"从列表中删除吗？')){
			var questURL = runParams.mainUrl+'doPatDeleteAction.do';
			var questArr = {
					doctorId:docId,
					token:token,
					patientId:id
					};
			$.post(questURL,questArr,function(result){
				if(1==result){
					alert('删除成功！');  
					location.href=runParams.mainUrl+"doctor/pat_list.html?doctorId="+docId;
				}else{
					alert('删除失败！');
					return false;
				}
			});
		}
	});
});