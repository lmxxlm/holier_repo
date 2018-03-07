$(function(){
	setNowYear();
	function setNowYear(){
		var startTime = $('input[name="currentTime"]').val();
	    var nowdate = new Date(startTime);
	    var nowyear = nowdate.getFullYear();
		$('input[name="d-year"]').val(nowyear);
		var dayInWeekOfYear = getDayInWeekOfYear(getLocalDate(nowdate,2),1).split('-');
		setWeekListForToday(dayInWeekOfYear[1]);
	}
	$('input[name="d-year"]').datetimepicker({
        language:  'zh-CN',
		format: 'yyyy',
		startDate:'2015',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0,
		startView: 4,
		minView: 4
    }).on('changeDate', function(ev){
		setWeekList();
		getWeekData(1);
	}).show();
	function setWeekListForToday(index){
		var weekCount = getNumOfWeeks($('input[name="d-year"]').val());
		var htmlstr = '';
		for(i=1;i<=weekCount;i++){
			if(i==index){
			    htmlstr += '<a href="javascript:void(0)" data-index="'+i+'" class="active">第'+i+'周</a>';
			}else{
			    htmlstr += '<a href="javascript:void(0)" data-index="'+i+'">第'+i+'周</a>';
			}
		}
		$('.weeklist').html(htmlstr);
		getWeekData(index);
	}
	function setWeekList(){
		var weekCount = getNumOfWeeks($('input[name="d-year"]').val());
		var htmlstr = '';
		for(i=1;i<=weekCount;i++){
		    htmlstr += '<a href="javascript:void(0)" data-index="'+i+'">第'+i+'周</a>';
		}
		$('.weeklist').html(htmlstr);
	}
	$('.weeklist a').live('click',function(){
	    getWeekData($(this).attr('data-index'));
	});
	function getWeekData(index){
		$('.weeklist a').removeClass('active');
		$('.weeklist a[data-index="'+index+'"]').addClass('active');
		var timeArr = mm($('input[name="d-year"]').val(),index).split('||');
		$('.timeHeadline').html(timeArr[0]+'&nbsp;至&nbsp;'+timeArr[1]);
		$('input[name="sTime"]').val(timeArr[0]);
		$('input[name="eTime"]').val(timeArr[1]);
		$('input[name="currentTime"]').val(timeArr[0]);
		$('input[name="week"]').val(index);
		//根据起止时间拿出对应的服务次数
		var productId = $('input[name="productId"]').val();
		if(!productId){
		    alert('未找到该产品！');
			return false;
		}
		var questURL = runParams.mainUrl+'getServiceCountByTime.do';
		var questArr = {
			startTime_str:timeArr[0],  
			endTime_str:timeArr[1],   
			productId:productId
		};
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				$('input[name="serviceCount"]').val(result.data.serviceCount);	
				$('#numRemain').html(result.data.numRemain);
				if(result.data.numRemain){
					$('#bookAllow').show();
				}else{
					$('#bookAllow').hide();
				}
			}else{
			    $('input[name="serviceCount"]').val('');
			    $('#numRemain').html('0');
			    $('#bookAllow').hide();
			}
		});
	}
	$('.editServiceCount').click(function(){
	    var sTime = $('input[name="sTime"]').val();
		var eTime = $('input[name="eTime"]').val();
		var postType = $('input[name="menuIndex"]').val();
		var serviceCount = $('input[name="serviceCount"]').val();
		var productId = $('input[name="productId"]').val();
		var token = $('input[name="token"]').val();
		var currentTime = $('input[name="currentTime"]').val();
		if(!productId||!sTime||!eTime||!serviceCount){
		    alert('产品数据不完整！');
			return false;
		}
		var questURL = runParams.mainUrl+'editServiceCount.do';
		var questArr = {
			startTime_str:sTime,
			endTime_str:eTime,
			serviceCount:serviceCount,
			productId:productId,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert('设置成功！');
				location.href=runParams.mainUrl+"productDetail.html?productId="+productId+"&postType="+postType+"&currentTime="+currentTime;
			}else{     
			    alert('设置失败！');
			}  
		});
	});
	$('#bookAllow button').click(function(){
		$('.bookOrder').show('fast',function(){
			$("#menu,#content").getNiceScroll().resize();
		});
		$('input[name="patientName"]').val('');
		$('input[name="patientId"]').val('');
		$('input[name="requesterName"]').val('');
		$('input[name="requesterId"]').val('');
		$('input[name="requester_type"][value="医生"]').attr('checked',true);
	});
	$('input[name="requester_type"]').click(function(){
		if($(this).val()=="患者"){
			$('.requesterDoc').hide();
			$('.requesterDoc').find('input[type="text"]').val('');
			$('.requesterDoc').find('input[type="hidden"]').val('');
		}
        if($(this).val()=="医生"){
			$('.requesterDoc').show();
		}
	});
	$('.submitOrder').click(function(){
		var week = $('input[name="week"]').val();
		var startDate = $('input[name="sTime"]').val();
		var endDate = $('input[name="eTime"]').val();
		var patientId = $('input[name="patientId"]').val();
		var requesterId = '';
		var requester_type = $('input[name="requester_type"]:checked').val();
		var hostId = $('input[name="hostId"]').val();
		var serviceId = $('input[name="productId"]').val();
		var serviceType = $('input[name="serviceType"]').val();
		var token = $('input[name="token"]').val();
        if(!week){
        	alert("未找到订单所在周！");
        	return false;
        }
        if(!startDate){
        	alert("未找到订单开始时间！");
        	return false;
        }
        if(!endDate){
        	alert("未找到订单结束时间！");
        	return false;
        }
        if(!patientId){
        	alert("未填写预订的患者！");
        	return false;
        }
        if(!requester_type){
        	alert("未填写申请人类型！");
        	return false;
        }
        if(!hostId){
        	alert("未找到宿主ID！");
        	return false;
        }
        if(!serviceId){
        	alert("未找到这个产品！");
        	return false;
        }
        if(!serviceType){
        	alert("未找到产品类型！");
        	return false;
        }
        if(requester_type=='患者'){
			requesterId = patientId;
		}
        if(requester_type=='医生'){
        	requesterId = $('.requesterDoc').find('input[type="hidden"]').val();
		}
        if(!requesterId){
        	alert("未填写申请人！");
        	return false;
        }
        if(!token){
        	alert("非法提交！");
        	return false;
        }
        var questURL = runParams.mainUrl+'submitOrderForOP.do';
		var questArr = {
			week:week,
			startDate:startDate,
			endDate:endDate,
			patientId:patientId,
			requesterId:requesterId,
			requester_type:requester_type,
			hostId:hostId,
			serviceId:serviceId,
			serviceType:serviceType,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){   
				alert('已经生成未支付订单。');
				location.href=runParams.mainUrl+"allOrder.html?status=未支付";
			}else if(-1==result){
				alert('提交失败，请勿重复提交！');
				location.reload();
			}
			else{ 
				alert('订单创建失败。');
				location.reload();
			}
		});
	});
	//患者智能搜索
	$('.searchResultForPatient').parent().find('.form-control').keyup(function(){
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
				obj.parent().siblings('.searchResultForPatient').html(htmlstr).show();
			}else{
				obj.parent().siblings('.searchResultForPatient').hide();
			}
		});
	});
	$(".searchResultForPatient li a").live('click',function(){
		var p_obj = $(this).parents('.searchResultForPatient');
		p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
		p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-patid"));
		p_obj.hide();
	});
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