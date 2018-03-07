function deleteSingle(power_id,power_name){
    if(confirm('确定要删除“'+power_name+'"吗？')){
	    var questURL = runParams.mainUrl+'tab/doPowerDeleteAction.do';
		var questArr = {
				power_id:power_id
				};
		$.post(questURL,questArr,function(result){
			if(result == true){
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
function deleteAll(){
	var len = $('input[class="selectall_unit"]:checked').length;
	if(len==0){
	    alert('请先勾选要删除的账号！');
		return false;
	}
	var accountIdArr = [];
	$('input[class="selectall_unit"]:checked').each(function(){
		accountIdArr.push($(this).val());
	});
	accountIdArr = accountIdArr.join(',');
    if(confirm('确定要删除这'+len+'个标签吗？')){
	    var questURL = runParams.mainUrl+'tab/doPowerDeleteAllAction.do';
		var questArr = {powerId:powerIdArr};
		$.post(questURL,questArr,function(result){
			if(1==result){  
				alert('删除成功！');
				location.reload();
			}else if(3==result){
				alert("删除失败！选择的对象中包含自己当前登录账号");
				return false;
			}
			else{
				alert('删除失败！');
				return false;
			}
		});
	}
}