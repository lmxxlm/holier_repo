function deleteSingle(_id,title){
    if(confirm('确定要删除“'+title+'"吗？')){
	    var questURL = runParams.mainUrl+'tab/doHospitalDeleteAction.do';
		var questArr = {
				_id:_id
				};
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert('删除成功！');
				location.reload();
			}
			else{   
				alert('删除失败！');
				return false;
			}  
		});
	}
}