$(function(){
	function initModal(){
	    $('#adminModal input[name="doctorName"]').val('');
		$('#adminModal input[name="doctorId"]').val('');
		$('#adminModal input[name="quantity"]').val(0);
		$('#adminModal input[name="type"][value="1"]').attr('checked',true);
		$('#adminModal textArea[name="reason"]').val('');
	}
	//点击添加按钮
	$('.addPat button').click(function(){
		initModal();
	    $('#adminModal').modal();
	});
	//点击详情
	$('.detail').click(function(){
		var id = $(this).attr('data-id');
		if(!id){
		    alert("未找到该添补项！");
			return false;
		}
		//根据id获取这条数据
		var questURL = runParams.mainUrl+'/getBeansOperationById.do';
		var questArr = {
			id:id
		};
		$.post(questURL,questArr,function(result){
			//result = eval('('+result+')');
			if(1==result.status){
				$('#detailModal .d-doctorName').html(result.data.accountName);
		        $('#detailModal .d-doctorId').html(result.data.accountId);
		        $('#detailModal .d-quantity').html(result.data.amount);
		        $('#detailModal .d-type').html(result.data.type);
		        $('#detailModal .d-reason').html(result.data.reason);
				$('#detailModal .d-dateTime').html(result.data.time_str);
				$('#detailModal .d-id').html(result.data.historyId);
				$('#detailModal .d-admin').html(result.data.writePerson);
				$('#detailModal').modal();
			}else{
				alert("未找到该添补项！");
			    return false;
			}
		});
	});
	//点击提交
	$('#doSubmit').click(function(){
	    doAdd();
	});
	//添加逻辑
	function doAdd(){
		var doctorName = $('#adminModal input[name="doctorName"]').val();
		var doctorId = $('#adminModal input[name="doctorId"]').val();
		var reason = $('#adminModal textarea[name="reason"]').val();
		var type = $('#adminModal input[name="type"]:checked').val();
		var quantity = parseInt($('#adminModal input[name="quantity"]').val());
		var token = $('input[name="token"]').val();
		if(!doctorId){
			alert("宿主姓名需要从匹配到的下拉列表中选择！");
			return false;
		}
		if(!reason){
			alert("请输入添补理由！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		var questURL = runParams.mainUrl+'addBeanOperation.do';
		//后台需要额外添加字段：操作时间，添加人，操作号
		var questArr = {
			accountId:doctorId,
			reason:reason,
			type:type,
			amount:quantity,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.href=runParams.mainUrl+'beansOperation.html';
			}else{
				alert('添加失败！');
				return false;
			}
		});
	}
	
	//医生智能搜索
	$('.searchResultForDoctor').parent().find('.form-control').keyup(function(){
		var obj = $(this);
	    var searchVar = $(this).val();
		var questURL = runParams.mainUrl+'searchDoctorByNameLimit10.do';
		var questArr = {
			searchVar:searchVar
		};
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
				  htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].referHospital+'&nbsp;—&nbsp;'+con[i].referDepartments+'&nbsp;—&nbsp;'+con[i].doctorTitle+'</i></a></li>';
				}
				obj.parent().siblings('.searchResultForDoctor').html(htmlstr).show();
			}else{
				obj.parent().siblings('.searchResultForDoctor').hide();
			}
		});
	});
	$(".searchResultForDoctor li a").live('click',function(){
		var p_obj = $(this).parents('.searchResultForDoctor');
		p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
		p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-docid"));
		p_obj.hide();
	});
	
});