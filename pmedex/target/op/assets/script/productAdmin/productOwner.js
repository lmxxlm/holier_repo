$(function(){
	//提供好乐医服务设置
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
		$('input[name="HLYService"]').each(function(){
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
		var questURL = runParams.mainUrl+'editHLYServiceProvide.do';
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert("设置成功！");
				location.href= runParams.mainUrl+'productOwner.html';
			}else{
				alert('修改失败！');
			}
		});
	});
	function initModal(){
		$('#adminModal input[name="hostId"]').val('');
		$('#adminModal input[name="host"]').val('');
		$('#adminModal textarea[name="description"]').val('');
		$('#adminModal textarea[name="note"]').val('');	
		$('#adminModal input[name="isValid"][value="1"]').attr('checked',true);
		$('#adminModal input[name="actionType"]').val('');
		$('#adminModal input[name="productId"]').val('');
		$('#adminModal input[name="serviceCount"]').val('3');
		$('#adminModal input[name="startTime"]').val('');
		$('#adminModal input[name="endTime"]').val('');
		$('#adminModal input[name="score_returned_transfer"]').val(0);
		$('#adminModal input[name="score_returned_requester"]').val(0);
		$('#adminModal input[name="score_self"]').val(0);
		$('#adminModal input[name="score_total_mark"]').val(0);
		$('#adminModal input[name="score_subsidy_transfer"]').val(0);
		$('#adminModal input[name="score_subsidy_requester"]').val(0);
		$('#adminModal input[name="score_total_subsidy"]').val(0);
		$('#adminModal input[name="booking_price"]').val(0);
		$('#adminModal select[name="type"]').val(0);
		$('#adminModal input[name="hiddenPrice"][value="0"]').attr('checked',true);
		$('.hideLine').show();
	}
	//区分特需门诊和其他产品
	function checkProductCategory(){
		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
		if(typeVal=='特需门诊'||typeVal=='挂专家号'){
			$('.hideLine').hide();
		}else{
			$('.hideLine').show();
		}
	}
	$('select[name="type"]').change(function(){
		checkProductCategory();
	});
	//点击添加按钮
	$('.addProduct').click(function(){
		initModal();
		var id = $(this).attr('data-id');
		var name = $(this).attr('data-name');
		$('#adminModal input[name="hostId"]').val(id);
		$('#adminModal input[name="host"]').val(name);
		$('#adminModal input[name="actionType"]').val('add');
		$('#adminModal').modal();
	});
	//点击提交
	$('#doSubmit').click(function(){
		var actionType = $('#adminModal input[name="actionType"]').val();
		if(actionType == 'add'){ doAdd(); }
	});
	//添加逻辑
	function doAdd(){
		var type = $('#adminModal select[name="type"]').val();
		var hostId = $('#adminModal input[name="hostId"]').val();
		var description = $('#adminModal textarea[name="description"]').val();
		var note = $('#adminModal textarea[name="note"]').val();	
		var isValid = $('#adminModal input[name="isValid"]:checked').val();
		var serviceCount = parseInt($('#adminModal input[name="serviceCount"]').val());
		var startTime = $('#adminModal input[name="startTime"]').val();
		var endTime = $('#adminModal input[name="endTime"]').val();
		var score_returned_transfer = $('#adminModal input[name="score_returned_transfer"]').val();
		var score_returned_requester = $('#adminModal input[name="score_returned_requester"]').val();
		var score_self = $('#adminModal input[name="score_self"]').val();
		var score_total_mark = $('#adminModal input[name="score_total_mark"]').val();
		var score_subsidy_transfer = $('#adminModal input[name="score_subsidy_transfer"]').val();
		var score_subsidy_requester = $('#adminModal input[name="score_subsidy_requester"]').val();
		var score_total_subsidy = $('#adminModal input[name="score_total_subsidy"]').val();
		var booking_price = $('#adminModal input[name="booking_price"]').val();
		var hiddenPrice = parseInt($('#adminModal input[name="hiddenPrice"]:checked').val());
		var token = $('input[name="token"]').val();
		if(!hostId){
			alert("请输入宿主姓名！");
			return false;
		}
		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
		if(typeVal!='特需门诊'&&typeVal!='挂专家号'){
			if(!serviceCount){
				alert("请输入每周服务次数！");
				return false;
			}
			if(!startTime){
				alert("请输入服务开始时间！");
				return false;
			}
			if(!endTime){
				alert("请输入服务结束时间！");
				return false;
			}
		}
		if(!description){
			alert("请输入服务内容！");
			return false;
		}
		if(!note){
			alert("请输入注意事项！");
			return false;
		}
		if(!score_total_mark){
			alert("请输入产品积分！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		if(description.length>200){
			alert('服务内容的字数需要控制在200字以内！');
			return false;
		}
		if(note.length>200){
			alert('注意事项的字数需要控制在200字以内！');
			return false;
		}
		if(parseInt(booking_price)>parseInt(score_total_mark)){
			alert("定金不能大于定价总额！");
			return false;
		}
		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
		if(typeVal!='特需门诊'&&typeVal!='挂专家号'){
			//验证时间先后
			var datepickArr1 = startTime.split("-");
			var datepickArr2 = endTime.split("-");
			var new_datepick1 = new Date(datepickArr1[0],datepickArr1[1],datepickArr1[2]);
			var new_datepick2 = new Date(datepickArr2[0],datepickArr2[1],datepickArr2[2]);
			if(!new_datepick1 || ! new_datepick2){
				alert("请输入正确的时间格式");
				return false;
			}
			var date_result = (new_datepick2-new_datepick1)/(24*60*60*1000);
			if(date_result<0){
				alert("结束时间不能在开始时间前面，请重新选择");
				return false;
			}
		}
		var questURL = runParams.mainUrl+'addProduct.do';
		var questArr = {
			pcid:type,
			hostId:hostId,
			description:description,
			note:note,
			serviceCount:serviceCount,
			startTime_str:startTime,
			endTime_str:endTime,
			isValid:isValid,
			score_returned_transfer:score_returned_transfer,
			score_returned_requester:score_returned_requester,
			score_self:score_self,
			score_total_mark:score_total_mark,
			score_subsidy_transfer:score_subsidy_transfer,
			score_subsidy_requester:score_subsidy_requester,
			score_total_subsidy:score_total_subsidy,
			booking_price:booking_price,
			hiddenPrice:hiddenPrice,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.href=runParams.mainUrl+"ownerProduct.html?hostId="+hostId;
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
		var questURL = runParams.mainUrl+'searchTransableDoctorByNameLimit10.do';
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
	//顶部搜索
	function searchProduct(){
		var host = $('input[name="docId"]').val();
		var page = $('input[name="page"]').val();
		location.href=runParams.mainUrl+'product.html?host='+host+'&page='+page;
	}
	$('.input-group-addon').click(function(){
		$('input[name="page"]').val(1);
		//searchProduct();
		$('form[name="hostSearch"]').submit();
	});
	//点击分页链接
	$('.pagination a').click(function(){
		var page = $(this).attr('data-page');
		$('input[name="page"]').val(page);
		searchProduct();
	});
	//时间弹出
	$('input[name="startTime"],input[name="endTime"]').datetimepicker({
		language:  'zh-CN',
		format: 'yyyy-mm-dd',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0,
		startView: 2,
		minView: 2,
		pickerPosition:'top-left'
	});
	//加法运算
	$('input[name="score_returned_transfer"],input[name="score_returned_requester"],input[name="score_self"]').keyup(function(){
		var score_returned_transfer = parseInt($('input[name="score_returned_transfer"]').val());
		var score_returned_requester = parseInt($('input[name="score_returned_requester"]').val());
		var score_self = parseInt($('input[name="score_self"]').val());
		$('input[name="score_total_mark"]').val(score_returned_transfer+score_returned_requester+score_self)
	});
	$('input[name="score_subsidy_transfer"],input[name="score_subsidy_requester"]').keyup(function(){
		var score_subsidy_transfer = parseInt($('input[name="score_subsidy_transfer"]').val());
		var score_subsidy_requester = parseInt($('input[name="score_subsidy_requester"]').val());
		$('input[name="score_total_subsidy"]').val(score_subsidy_transfer+score_subsidy_requester)
	});
});