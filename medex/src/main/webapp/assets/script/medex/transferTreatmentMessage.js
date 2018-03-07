$(function(){
	//点击受理
    $('.doQuest').click(function(){
	    var id = $(this).attr('data-id');
		if(!id){
		    alert('未找到该条记录！');
			return false;
		}
		//从数据库中取出这条数据
		var questArr = {
				transferRecordId:id
		};
		var questURL = runParams.mainUrl+'findTransferRecordById.do';
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				$('#doQuestModal .data_requester_name').html(result.data.requesterName);
				$('#doQuestModal .data_doctor_name').html(result.data.doctorName);
				$('#doQuestModal .data_patient_name').html(result.data.patientName);
				$('#doQuestModal .data_requestTime').html(result.data.requestTime_str);
				$('#doQuestModal input[name="transferRecordId"]').val(result.data.transferRequestId);
				$('#doQuestModal').modal();
			}else{
				alert('未找到该条记录！');
				return false;
			}
		});
	});
	//查看详情
	$('.detail').click(function(){
	    var id = $(this).attr('data-id');
		if(!id){
		    alert('未找到该条记录！');
			return false;
		}
		//从数据库中取出这条数据
		var questArr = {
				transferRecordId:id
		};
		var questURL = runParams.mainUrl+'findTransferRecordById.do';
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				$('#detailModal .data_requester_name').html(result.data.requesterName);
				$('#detailModal .data_doctor_name').html(result.data.doctorName);
				$('#detailModal .data_patient_name').html(result.data.patientName);
				$('#detailModal .data_requestTime').html(result.data.requestTime_str);
				$('#detailModal .data_checkTime').html(result.data.confirmTime_str);
				$('#detailModal .data_status').html(result.data.transferStatus);
				$('#detailModal .data_remark').html(result.data.remark);
				$('#detailModal').modal();
			}else{
				alert('未找到该条记录！');
				return false;
			}
		});
	});
	//点击拒绝
	$('.refuse').click(function(){
		editStatus('已拒绝');
	});
	//点击批准
	$('.access').click(function(){
	    editStatus('已批准');
	});
	//修改状态
	function editStatus(status){
        var remark = $('#doQuestModal textarea[name="remark"]').val();
		var id = $('#doQuestModal input[name="transferRecordId"]').val();
		var token = $('input[name="token"]').val();
		if(!id){
		    alert('未找到该条记录！');
			return false;
		}
		var questArr = {
			transferRequestId:id,
			remark:remark,
			status:status,
			token:token
		};
		var questURL = runParams.mainUrl+'editTransferRecordById.do';
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.reload();
			}else{
				alert('操作失败！');
				return false;
			}
		});
	}
	//病人智能搜索
	$('.searchResultForPatient').siblings('input').keyup(function(){
		var obj = $(this);
	    var searchVar = $(this).val();
		var questURL = runParams.mainUrl+'searchPatientByNameLimit10.do';
		var questArr = {
			searchVar:searchVar
		};
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
				  htmlstr += '<li><a href="javascript:void(0)" data-patid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].gender+'&nbsp;—&nbsp;'+con[i].birthday+'&nbsp;—&nbsp;'+con[i].disease+'</i></a></li>';
				}
				obj.siblings('.searchResultForPatient').html(htmlstr).show();
			}else{
				obj.siblings('.searchResultForPatient').hide();
			}
		});
	});
	$(".searchResultForPatient li a").live('click',function(){
		var p_obj = $(this).parents('.searchResultForPatient');
		p_obj.siblings('input[type="text"]').val($(this).find("span").html());
		p_obj.siblings('input[type="hidden"]').val($(this).attr("data-patid"));
		p_obj.hide();
	});   
	//医生智能搜索
	$('.searchResultForDoctor').siblings('input').keyup(function(){
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
				obj.siblings('.searchResultForDoctor').html(htmlstr).show();
			}else{
				obj.siblings('.searchResultForDoctor').hide();
			}  
		});
	});
	$(".searchResultForDoctor li a").live('click',function(){
		var p_obj = $(this).parents('.searchResultForDoctor');
		p_obj.siblings('input[type="text"]').val($(this).find("span").html());
		p_obj.siblings('input[type="hidden"]').val($(this).attr("data-docid"));
		p_obj.hide();
	});
	//分页功能
	$('#prevPage:not(.disabled)').click(function(){
		var page =  parseInt($('input[name="page"]').val()) - 1;
	    $('input[name="page"]').val(page);
		$('#searchForm').submit();
	});
	$('#nextPage:not(.disabled)').click(function(){
		var page =  parseInt($('input[name="page"]').val()) + 1;
	    $('input[name="page"]').val(page);
		$('#searchForm').submit();
	});
});