$(function(){
	//获取时间
	var nowdate = new Date();
	var dateFix = nowdate.getHours();
//	$('.timeHeadline').html(getLocalDate(nowdate,3));
//	$('input[name="currentDate"]').val(getLocalDate(nowdate,2));
	$('#datetimepicker').datetimepicker({
		language:  'zh-CN',
		format: 'yyyy-mm-dd',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	}).on('changeDate', function(ev){
		//ev.date.valueOf() < date-start-display.valueOf()
		//时间bug修正
		var fixArr = [16,17,18,19,20,21,22,23];
		var date = ev.date.valueOf()/1000;
		if($.inArray(dateFix,fixArr)>=0){
//			date = date-24*60*60;
		}
		date *= 1000;
		var dateobj = new Date(date);
		var patId = $('input[name="patId"]').val();
		location.href=runParams.mainUrl+'patient/schedule.html?day='+getLocalDate(dateobj,2)+'&patientId='+patId;
//		$('.timeHeadline').html(getLocalDate(dateobj,3));
//		$('input[name="currentDate"]').val(getLocalDate(dateobj,2));
	}).show();
	$('#datetimepicker').datetimepicker("update",$('input[name="currentDate"]').val());
	function getLocalDate(unixTime,type){
		var year = unixTime.getFullYear();
		var month = unixTime.getMonth()+1;
		var day = unixTime.getDate();
		var returnDate;
		switch(type){
		case 2:returnDate = year+'-'+month+'-'+day;break;
		case 3:returnDate = year+'年'+month+'月'+day+'日';break;
		default:returnDate = year+'/'+month+'/'+day;
		}
		return returnDate;
	}
	//内容预设
	$('input[name="scheduleType"]').click(function(){
		$('textarea[name="scheduleContent"]').val($(this).val());
	});
	$('input[name="scheduleType2"]').click(function(){
		$('textarea[name="scheduleContent2"]').val($(this).val());
	});
	//添加日程弹出框
	$('.tabMenu li').click(function(){
		$('.tabMenu li').removeClass('active');
		$(this).addClass('active');
		var id = $(this).attr('data-tab');
		$('.addScheduleCon').hide();
		$('#'+id).show();
		$('input[name="tabPage"]').val(id);
	});
	$('input[name="isRepeat"]').click(function(){
		if($(this).val()==1){
			$('.form-repeat').slideDown(200);
		}else{
			$('.form-repeat').hide();
		}
	});
	//弹出框起始时间设定
	timeReflush(1);
	timeReflush(3);
	$('.timeSolution tr').eq(1).children('.td1').children('select').change(function(){
		timeReflush(1);
	});
	$('.timeSolution tr').eq(1).children('.td2').children('select').change(function(){
		timeReflush(1);
	});
	$('.timeSolution tr').eq(3).children('.td1').children('select').change(function(){
		timeReflush(3);
	});
	$('.timeSolution tr').eq(3).children('.td2').children('select').change(function(){
		timeReflush(3);
	});
	function timeReflush(index){
		var timeBlock = $('.timeSolution tr').eq(index).children('.td1').children('select').val();
		$('.timeSolution tr').eq(index).children('.td2').children('select').hide();
		var obj = $('.timeSolution tr').eq(index).children('.td2').children('select[name="'+timeBlock+'"]');
		obj.show();
		var timeBlock1 = obj.val();
		var obj1 = $('.timeSolution tr').eq(index).children('.td3').children('.d-default');
		var htmlstr = '<option value="'+timeBlock1+':00">'+timeBlock1+':00</option><option value="'+timeBlock1+':15">'+timeBlock1+':15</option><option value="'+timeBlock1+':30">'+timeBlock1+':30</option><option value="'+timeBlock1+':45">'+timeBlock1+':45</option>';
		obj1.html(htmlstr);
	}
	function timeReflushFit(index){
		var timeBlock = $('.timeSolution tr').eq(index).children('.td3').children('select').val();
		var h = timeBlock.split(':')[0];
		var obj = $('.timeSolution tr').eq(index).children('.td2').children('select').children('option[value="'+h+'"]');
		obj.attr('selected',true);
		$('.timeSolution tr').eq(index).children('.td2').children('select').hide();
		obj.parent().show();
		var timeBlock1 = obj.parent().attr('name');
		$('.timeSolution tr').eq(index).children('.td1').children('select').children('option[value="'+timeBlock1+'"]').attr('selected',true);
	}
	//模态框重置
	function reflushScheduleModal(){
		$('.tabMenu li[data-tab="daily"] a').show();
		$('.tabMenu li[data-tab="event"] a').show();
		$('.tabMenu li[data-tab="daily"]').click();
		$('#addPatScheduleModal input[name="isRepeat"]').attr('disabled',false);
		$('#addPatScheduleModal input[name="scheduleType"][value="服药"]').attr('checked',true);
		$('#addPatScheduleModal input[name="isRepeat"][value="0"]').attr('checked',true);
		$('.form-repeat').hide();
		$('#addPatScheduleModal input[name="scheduleRepeatVal"]').val(2);
		$('#addPatScheduleModal select[name="scheduleRepeatUnit"]').val('天');
		$('#addPatScheduleModal textarea[name="scheduleContent"]').val('');

		$('#addPatScheduleModal input[name="scheduleType2"][value="门诊"]').attr('checked',true);
		$('#addPatScheduleModal input[name="scheduleDoctor"]').val($('#addPatScheduleModal input[name="responsibilityDoctor"]').val());
		$('#addPatScheduleModal textarea[name="scheduleContent2"]').val('');
		$('#addPatScheduleModal input[name="tabPage"]').val('daily');

		$('input[name="validDoctor"]').val('y');
		$('#addPatScheduleModal textarea[name="scheduleContent2"]').val($('input[name="scheduleType2"]:checked').val());
		$('#addPatScheduleModal textarea[name="scheduleContent"]').val($('input[name="scheduleType"]:checked').val());
	}
	$('.addSchedule').click(function(){
		reflushScheduleModal();
		$('input[name="actionType"]').val('add');
		$('#addPatScheduleModal').modal();
	});
	$('.timeline-bottom-info .glyphicon-remove').parent('a').click(function(){
		var scheduleId = $(this).siblings('input[name="e-scheduleId"]').val();
		var startTime = $(this).siblings('input[name="e-startTime"]').val();
		var endTime = $(this).siblings('input[name="e-endTime"]').val();
		var token = $('input[name="token"]').val();
		if(!scheduleId){
			alert('未找到该日程项！');
			return false;
		}
		if(confirm('确定要删除“'+startTime+'”到“'+endTime+'”的这条日程吗？')){
			var questArr = {
					token:token,
					scheduleId:scheduleId
			};
			var questURL = runParams.mainUrl+'patient/doScheduleDelete.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					location.reload();
				}else{
					alert(result.message);
				}
			});
		}
	});
	$('.timeline-bottom-info .glyphicon-edit').parent('a').click(function(){
		var type = $(this).siblings('input[name="e-type"]').val();
		var scheduleId = $(this).siblings('input[name="e-scheduleId"]').val();
		var startTime = $(this).siblings('input[name="e-startTime"]').val();
		var endTime = $(this).siblings('input[name="e-endTime"]').val();
		$('input[name="validDoctor"]').val('y');
		if(!type||!scheduleId||!startTime||!endTime){
			alert("日常项目数据不完整！请删除该项数据。");
			return false;
		}
		$('#addPatScheduleModal input[name="scheduleId"]').val(scheduleId);
		$('#addPatScheduleModal input[name="tabPage"]').val(type);
		//绑定时间
		var h1 = startTime.split(':')[0];
		var h2 = endTime.split(':')[0];
		var htmlstr1 = '<option value="'+h1+':00">'+h1+':00</option><option value="'+h1+':15">'+h1+':15</option><option value="'+h1+':30">'+h1+':30</option><option value="'+h1+':45">'+h1+':45</option>';
		var htmlstr2 = '<option value="'+h2+':00">'+h2+':00</option><option value="'+h2+':15">'+h2+':15</option><option value="'+h2+':30">'+h2+':30</option><option value="'+h2+':45">'+h2+':45</option>';
		$('#addPatScheduleModal select[name="startTime"]').html(htmlstr1).val(startTime);
		$('#addPatScheduleModal select[name="endTime"]').html(htmlstr2).val(endTime);
		timeReflushFit(1);
		timeReflushFit(3);
		if(type=='event'){
			$('.tabMenu li[data-tab="daily"] a').hide();
			$('.tabMenu li[data-tab="event"] a').show();
			$('.tabMenu li[data-tab="event"]').click();
			var scheduleType2 = $(this).siblings('input[name="e-scheduleType2"]').val();
			var scheduleContent2 = $(this).siblings('input[name="e-scheduleContent2"]').val();
			var scheduleDoctor = $(this).siblings('input[name="e-scheduleDoctor"]').val();
			//绑定修改模态框
			$('#addPatScheduleModal input[name="scheduleType2"][value="'+scheduleType2+'"]').attr('checked',true);
			$('#addPatScheduleModal input[name="scheduleDoctor"]').val(scheduleDoctor);
			$('#addPatScheduleModal textarea[name="scheduleContent2"]').val(scheduleContent2);
		}
		if(type=='daily'){
			$('.tabMenu li[data-tab="daily"] a').show();
			$('.tabMenu li[data-tab="event"] a').hide();
			$('.tabMenu li[data-tab="daily"]').click();
			var scheduleType = $(this).siblings('input[name="e-scheduleType"]').val();
			var scheduleContent = $(this).siblings('input[name="e-scheduleContent"]').val();
			$('#addPatScheduleModal input[name="isRepeat"]').attr('disabled',true);
			var isRepeat = 0;
			var scheduleRepeatVal = 1;
			var scheduleRepeatUnit = '天';
			//绑定修改模态框
			$('#addPatScheduleModal input[name="scheduleType"][value="'+scheduleType+'"]').attr('checked',true);
			$('#addPatScheduleModal input[name="isRepeat"][value="'+isRepeat+'"]').attr('checked',true);
			$('.form-repeat').hide();
			$('#addPatScheduleModal input[name="scheduleRepeatVal"]').val(scheduleRepeatVal);
			$('#addPatScheduleModal select[name="scheduleRepeatUnit"]').val(scheduleRepeatUnit);
			$('#addPatScheduleModal textarea[name="scheduleContent"]').val(scheduleContent);
		}
		$('input[name="actionType"]').val('edit');
		$('#addPatScheduleModal').modal();
	});
	$('button[name="addSchedule"]').click(function(){
		if($('input[name="actionType"]').val()=='add'){
			doScheduleAdd();
		}
		if($('input[name="actionType"]').val()=='edit'){
			doScheduleEdit();
		}
	});
	function validTime(st,et){
		var st_arr = st.split(':');
		var et_arr = et.split(':');
		var h1 = parseInt(st_arr[0]);
		var m1 = parseInt(st_arr[1]);
		var h2 = parseInt(et_arr[0]);
		var m2 = parseInt(et_arr[1]);
		var returnVal = true;
		if(h1==h2){
			if(m1>=m2) returnVal = false;
		}
		if(h1>h2){ returnVal = false; }
		return returnVal;
	}
	function doScheduleAdd(){
		var startTime = $('select[name="startTime"]').val();
		var endTime = $('select[name="endTime"]').val();
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var patId = $('input[name="patId"]').val();
		var type = $('input[name="tabPage"]').val();
		//比较时间有效性
		if(!validTime(startTime,endTime)){
			alert("结束时间必须在开始时间之后！");
			return false;
		}    
		if(!day){
			alert("未获取当天时间！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		if(!patId){
			alert("未找到该病人或该页面已过期，请重新登录！");
			return false;
		}
		if(!type){
			alert("请选择日程类型！");
			return false;
		}
		if(type=='daily'){
			var scheduleType = $('input[name="scheduleType"]:checked').val();
			var isRepeat = $('input[name="isRepeat"]:checked').val();
			var scheduleRepeatVal = $('input[name="scheduleRepeatVal"]').val();
			var scheduleRepeatUnit = $('select[name="scheduleRepeatUnit"]').val();
			var scheduleContent = $('textarea[name="scheduleContent"]').val();
			var questArr = {
					day:day,
					token:token,  
					patientId:patId,
					type:type,
					startTime:startTime,
					endTime:endTime,
					scheduleType:scheduleType,
					isRepeat:isRepeat,    
					scheduleRepeatVal:scheduleRepeatVal,
					scheduleRepeatUnit:scheduleRepeatUnit,
					scheduleContent:scheduleContent
			};     
			var questURL = runParams.mainUrl+'patient/doScheduleAdd.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					location.reload();
				}else{
					alert(result.message);
				}
			});
		}
		if($('input[name="tabPage"]').val()=='event'){
			var scheduleType2 = $('input[name="scheduleType2"]:checked').val();
			var scheduleDoctor = $('input[name="scheduleDoctor"]').val();
			var doctorId = $('input[name="doctorId"]').val();
			var scheduleContent2 = $('textarea[name="scheduleContent2"]').val();
			if($('input[name="validDoctor"]').val()=='n'||!doctorId){
				alert('您还没有选择医生！');
				return false;
			}
			var questArr = {
					day:day,
					token:token,
					patientId:patId,
					type:type,
					startTime:startTime,
					endTime:endTime,  
					scheduleType:scheduleType2, 
					scheduleDoctor:scheduleDoctor,
					doctorId:doctorId,
					scheduleContent:scheduleContent2
			};
			var questURL = runParams.mainUrl+'patient/doScheduleAdd.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					location.reload();
				}else{
					alert(result.message);
				}
			});
		}
	}
	function doScheduleEdit(){
		var startTime = $('select[name="startTime"]').val();
		var endTime = $('select[name="endTime"]').val();
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var patId = $('input[name="patId"]').val();
		var type = $('input[name="tabPage"]').val();
		var scheduleId = $('input[name="scheduleId"]').val();
		//比较时间有效性
		if(!scheduleId){
			alert("未找到该日程项！");
			return false;
		}
		if(!validTime(startTime,endTime)){
			alert("结束时间必须在开始时间之后！");
			return false;
		}
		if(!day){
			alert("未获取当天时间！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		if(!patId){
			alert("未找到该病人或该页面已过期，请重新登录！");
			return false;
		}
		if(!type){
			alert("请选择日程类型！");
			return false;
		}
		if(type=='daily'){
			var scheduleType = $('input[name="scheduleType"]:checked').val();
			var isRepeat = "0";
			var scheduleRepeatVal = "1";
			var scheduleRepeatUnit = "天";
			var scheduleContent = $('textarea[name="scheduleContent"]').val();
			var questArr = {
					day:day,
					token:token,
					patientId:patId,
					type:type,
					startTime:startTime,
					endTime:endTime,
					scheduleType:scheduleType,
					isRepeat:isRepeat,
					scheduleRepeatVal:scheduleRepeatVal,
					scheduleRepeatUnit:scheduleRepeatUnit,
					scheduleContent:scheduleContent,
					scheduleId:scheduleId
			};
			var questURL = runParams.mainUrl+'patient/doScheduleEdit.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					location.reload();
				}else{
					alert(result.message);
				}
			});
		}
		if($('input[name="tabPage"]').val()=='event'){
			var scheduleType2 = $('input[name="scheduleType2"]:checked').val();
			var scheduleDoctor = $('input[name="scheduleDoctor"]').val();
			var doctorId = $('input[name="doctorId"]').val();
			var scheduleContent2 = $('textarea[name="scheduleContent2"]').val();
			if($('input[name="validDoctor"]').val()=='n'||!doctorId){
				alert('您还没有选择医生！');
				return false;
			}
			var questArr = {
					day:day,
					token:token,
					patientId:patId,
					type:type,
					startTime:startTime,
					endTime:endTime,
					scheduleType:scheduleType2,
					scheduleDoctor:scheduleDoctor,
					doctorId:doctorId,
					scheduleContent:scheduleContent2,
					scheduleId:scheduleId
			};
			var questURL = runParams.mainUrl+'patient/doScheduleEdit.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					location.reload();
				}else{
					alert(result.message);
				}
			});
		}
	}
	$('#addPatScheduleModal input[name="scheduleDoctor"]').keyup(function(){
		$('input[name="validDoctor"]').val('n');
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
					htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].referHospital+'&nbsp;—&nbsp;'+con[i].referDepartments+'</i></a></li>';
				}
				$('.searchResult').html(htmlstr).show();
			}else{
				$('.searchResult').hide();
			}
		});
	});
	$(".searchResult li a").live('click',function(){
		$('#addPatScheduleModal input[name="scheduleDoctor"]').val($(this).children('span').html());
		$('#addPatScheduleModal input[name="doctorId"]').val($(this).attr('data-docid'));
		$('input[name="validDoctor"]').val('y');
		$('.searchResult').hide();
	});
	$('.timeline-bottom-info .glyphicon-hand-right').parent('a').click(function(){
		var scheduleId = $(this).siblings('input[name="e-scheduleId"]').val();
		var startTime = $(this).siblings('input[name="e-startTime"]').val();
		var endTime = $(this).siblings('input[name="e-endTime"]').val();
		var token = $('input[name="token"]').val();
		if(!scheduleId){
			alert('未找到该日程项！');
			return false;
		}
		if(confirm('确定要将“'+startTime+'”到“'+endTime+'”的这条日程标记为已完成状态吗？')){
			var questArr = {
					token:token,
					scheduleId:scheduleId   
			};   
			var questURL = runParams.mainUrl+'patient/doScheduleDone.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					location.reload();
				}else{
					alert(result.message);
				}
			});
		}
	});
});