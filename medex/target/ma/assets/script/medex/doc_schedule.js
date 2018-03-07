$(function(){
	/*
    公共部分=========================================================================
	 */
	//获取时间
	var nowdate = new Date();
	var dateFix = nowdate.getHours();
	//$('.timeHeadline').html(getLocalDate(nowdate,3));
	//$('input[name="currentDate"]').val(getLocalDate(nowdate,2));
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
		var doctorId = $('input[name="doctorId"]').val();
		location.href=runParams.mainUrl+'doctor/schedule.html?day='+getLocalDate(dateobj,2)+'&doctorId='+doctorId;
		//$('.timeHeadline').html(getLocalDate(dateobj,3));
		//$('input[name="currentDate"]').val(getLocalDate(dateobj,2));
	}).show();
	$('#datetimepicker').datetimepicker("update", $('input[name="currentDate"]').val());
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
	//修改删除特效
	$('.appointments .glyphicon-edit').parent('.btn').hover(function(){
		$(this).parent().parent('li').css('background','#dedede');
	},function(){
		$(this).parent().parent('li').css('background','#none');
	});
	$('.appointments .glyphicon-remove').parent('.btn').hover(function(){
		$(this).parent().parent('li').css('textDecoration','line-through');
	},function(){
		$(this).parent().parent('li').css('textDecoration','none');
	});
	//重复重做
	var nextYear = '';
	getOneYearLater();
	function getOneYearLater(){
		var unixTime = nowdate.getTime()/1000+60*60*24*365;
		var newDate = new Date(unixTime*1000);
		nextYear = getLocalDate(newDate,2);
	}
	$('input[name="endDate"]').datetimepicker({
		language:  'zh-CN',
		format: 'yyyy-mm-dd',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0,
		startView: 2,
		minView: 2,
		pickerPosition:'top-left',
		endDate:nextYear
	});
	//重复天数点击逻辑
	$('input[name="repeat"]').click(function(){
		if($(this).val()!=0){
			$(this).parents('.form-repeat').next('.form-endDate').slideDown(200);
		}else{
			$(this).parents('.form-repeat').next('.form-endDate').slideUp(200);
		}
	});
	//添加病人智能搜索
	$('input[name="schedulePat"]').keyup(function(){
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
				obj.siblings('.searchResult').html(htmlstr).show();
			}else{
				obj.siblings('.searchResult').hide();
			}
		});
	});

	$(".searchResult li a").live('click',function(){
		$(this).parents('.searchResult').siblings('input[name="schedulePat"]').val($(this).children('span').html());
		$(this).parents('.searchResult').siblings('input[name="schedulePatId"]').val($(this).attr('data-patid'));
		$(this).parents('.searchResult').hide();
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
	$('.time').each(function(){
		var h = parseInt($(this).html().split(':')[0],10);
		var am = [0,1,2,3,4,5,6,7,8,9,10,11];
		var pm = [12,13,14,15,16,17,18,19,20,21,22,23];
		if($.inArray(h,am)>=0){
			$(this).children('span').html('am');
		}else if($.inArray(h,pm)>=0){
			$(this).children('span').html('pm');
		}
	});

	/*
    添加日程模态框=========================================================================
	 */	
	$('.addSchedule').click(function(){
		reflushScheduleModal();
		$('#addPatScheduleModal input[name="actionType"]').val('add');
		$('#addPatScheduleModal').modal();
	});
	//内容预设
	$('#addPatScheduleModal input[name="scheduleType"]').click(function(){
		$('#addPatScheduleModal textarea[name="scheduleContent"]').val('日程-'+$(this).val());
	});
	//模态框重置
	function reflushScheduleModal(){
		$('#addPatScheduleModal input[name="scheduleType"][value="门诊"]').attr('checked',true);
		$('#addPatScheduleModal .smartSearch').show();
		$('#addPatScheduleModal .form-repeat').show();
		$('#addPatScheduleModal input[name="repeat"][value="0"]').attr('checked',true);
		$('#addPatScheduleModal .form-endDate').hide();
		$('#addPatScheduleModal input[name="endDate"]').val(nextYear);
		$('#addPatScheduleModal textarea[name="scheduleContent"]').val('日程-手术');
		$('#addPatScheduleModal input[name="schedulePat"]').val('');
		$('#addPatScheduleModal input[name="schedulePatId"]').val('');
	}
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
	//点击scheduleType逻辑
	$('#addPatScheduleModal input[name="scheduleType"]').click(function(){
		if($(this).val()=='门诊'||$(this).val()=='手术'){
			$('#addPatScheduleModal .smartSearch').slideDown(200);
		}else{
			$('#addPatScheduleModal .smartSearch').hide();
		}
	});
	//点击修改
	$('.editNormal').click(function(){
		var scheduleType = $(this).siblings('input[name="e-scheduleType"]').val();
		var scheduleContent = $(this).siblings('input[name="e-scheduleContent"]').val();
		var schedulePat = $(this).siblings('input[name="e-schedulePat"]').val();
		var schedulePatId = $(this).siblings('input[name="e-schedulePatId"]').val();
		var scheduleId = $(this).siblings('input[name="e-scheduleId"]').val();
		var startTime = $(this).siblings('input[name="e-startTime"]').val();
		var endTime = $(this).siblings('input[name="e-endTime"]').val();
		$('#addPatScheduleModal .form-repeat').hide();
		$('#addPatScheduleModal .form-endDate').hide();
		if(!scheduleId||!startTime||!endTime){
			alert("日常项目数据不完整！请删除该项数据。");
			return false;
		}
		if(scheduleType=='门诊'||scheduleType=='手术'){
			if(!schedulePat||!schedulePatId){
				alert("日常项目数据不完整！请删除该项数据。");
				return false;
			}
			$('#addPatScheduleModal .smartSearch').show();
		}else{
			$('#addPatScheduleModal .smartSearch').hide();
		}
		$('#addPatScheduleModal input[name="schedulePat"]').val(schedulePat);
		$('#addPatScheduleModal input[name="schedulePatId"]').val(schedulePatId);
		$('#addPatScheduleModal input[name="scheduleId"]').val(scheduleId);
		//绑定时间
		var h1 = startTime.split(':')[0];
		var h2 = endTime.split(':')[0];
		var htmlstr1 = '<option value="'+h1+':00">'+h1+':00</option><option value="'+h1+':15">'+h1+':15</option><option value="'+h1+':30">'+h1+':30</option><option value="'+h1+':45">'+h1+':45</option>';
		var htmlstr2 = '<option value="'+h2+':00">'+h2+':00</option><option value="'+h2+':15">'+h2+':15</option><option value="'+h2+':30">'+h2+':30</option><option value="'+h2+':45">'+h2+':45</option>';
		$('#addPatScheduleModal select[name="startTime"]').html(htmlstr1).val(startTime);
		$('#addPatScheduleModal select[name="endTime"]').html(htmlstr2).val(endTime);
		timeReflushFit(1);
		timeReflushFit(3);
		//绑定修改模态框
		$('#addPatScheduleModal input[name="scheduleType"][value="'+scheduleType+'"]').attr('checked',true);
		$('#addPatScheduleModal textarea[name="scheduleContent"]').val(scheduleContent);	
		$('#addPatScheduleModal input[name="actionType"]').val('edit');
		$('#addPatScheduleModal').modal();
	});
	//点击删除
	$('.deleteNormal').click(function(){
		var scheduleId = $(this).siblings('input[name="e-scheduleId"]').val();
		var startTime = $(this).siblings('input[name="e-startTime"]').val();
		var endTime = $(this).siblings('input[name="e-endTime"]').val();
		var token = $('input[name="token"]').val();
		if(!scheduleId){
			alert('未找到该日程项！');
			return false;
		}
		var questArr = {
				scheduleId:scheduleId,
		};
		var questURL = runParams.mainUrl+'doctor/getDoctorScheduleByscheduleId.do';
		$.post(questURL,questArr,function(result){
			if(0==result.data.repeat){
				//非重复日程
				deleteScheduleSingle(scheduleId,startTime,endTime)
			}else{
				//重复日程
				$('#deleteConfirm .d-endDate').html(result.data.endDate_str);
				$('#deleteConfirm input[name="d-scheduleId"]').val(result.data.scheduleId);
				$('#deleteConfirm input[name="d-startTime"]').val(result.data.startTime_str);
				$('#deleteConfirm input[name="d-endTime"]').val(result.data.endTime_str);
				$('#deleteConfirm input[name="d-groupId"]').val(result.data.groupId);
				$('#deleteConfirm').modal();
			}
		});
	});
	$('#doDeleteGroup').click(function(){
		var endDate = $('#deleteConfirm .d-endDate').html();
		var startTime = $('#deleteConfirm input[name="d-startTime"]').val();
		var endTime = $('#deleteConfirm input[name="d-endTime"]').val();
		var groupId = $('#deleteConfirm input[name="d-groupId"]').val();
		deleteScheduleGroup(groupId,startTime,endTime,endDate);
	});
	$('#doDeleteSingle').click(function(){
		var scheduleId = $('#deleteConfirm input[name="d-scheduleId"]').val();
		var startTime = $('#deleteConfirm input[name="d-startTime"]').val();
		var endTime = $('#deleteConfirm input[name="d-endTime"]').val();
		deleteScheduleSingle(scheduleId,startTime,endTime);
	});
	//单条删除
	function deleteScheduleSingle(scheduleId,startTime,endTime){
		var token = $('input[name="token"]').val();
		if(!scheduleId){
			alert('未找到该日程项！');
			return false;
		}
		if(!token){
			alert('页面非法提交！');
			return false;
		}
		if(confirm('确定要删除“'+startTime+'”到“'+endTime+'”的这条日程吗？')){
			var questArr = {
					scheduleId:scheduleId,
					token:token
			};
			var questURL = runParams.mainUrl+'doctor/doScheduleDelete.do';
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
	//整组删除
	function deleteScheduleGroup(groupId,startTime,endTime,endDate){
		var token = $('input[name="token"]').val();
		if(!groupId){
			alert('未找到该日程组！');
			return false;
		}
		if(!token){
			alert('页面非法提交！');
			return false;
		}
		if(confirm('确定要删除截止至“'+endDate+'”,'+startTime+'”到“'+endTime+'的这组日程吗？')){
			var questArr = {
					groupId:groupId,
					token:token
			};
			var questURL = runParams.mainUrl+'doctor/doScheduleDeleteByGroupId.do';
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
	//点击提交
	$('#addPatScheduleModal button[name="addSchedule"]').click(function(){
		beforeScheduleSubmit();
	});
	function beforeScheduleSubmit(){
		var scheduleType = $('#addPatScheduleModal input[name="scheduleType"]:checked').val();
		var schedulePat = $('#addPatScheduleModal input[name="schedulePat"]').val();
		var schedulePatId = $('#addPatScheduleModal input[name="schedulePatId"]').val();
		var actionType = $('#addPatScheduleModal input[name="actionType"]').val();
//		if(scheduleType=='门诊'||scheduleType=='手术'){
//			if(!schedulePat){
//				alert('请输入患者名字！');
//				return false;
//			}
//			if(schedulePatId){
//				//根据患者id和名字验证有效性
//				var questArr = {
//						schedulePat:schedulePat,
//						schedulePatId:schedulePatId
//				};
//				var questURL = runParams.mainUrl+'patient/validPatByIdAndName.do';
//				$.post(questURL,questArr,function(result){
//					if(1==result.status){
//						if(actionType=='edit'){
//							doScheduleEdit();
//						}
//						if(actionType=='add'){
//							doScheduleAdd();
//						}
//					}else{
//						//如果没找到，根据输入的患者姓名继续查找
//						validPatByName();
//					}
//				});
//			}
//			if(!schedulePatId){
//				//如果没找到，根据输入的患者姓名继续查找
//				validPatByName();
//			}
//		}else{
//			if(actionType=='edit'){
//				doScheduleEdit();
//			}
//			if(actionType=='add'){
//				doScheduleAdd();
//			}
//		}
		
		if(actionType=='edit'){
			doScheduleEdit();  
		}
		if(actionType=='add'){
			doScheduleAdd();
		}
	}
	function validPatByName(){
		var schedulePat = $('#addPatScheduleModal input[name="schedulePat"]').val();
		var actionType = $('#addPatScheduleModal input[name="actionType"]').val();
		var questArr = {
				schedulePat:schedulePat
		};  
		var questURL = runParams.mainUrl+'patient/validPatByName.do';
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				var len = result.data.length;
				if(len>1){
					alert('您输入的该患者存在重名，请根据输入时的下拉提示选择病人！');
					return false;
				}
				if(len==1){
					$('#addPatScheduleModal input[name="schedulePatId"]').val(result.data[0].patientId);
					if(actionType=='edit'){
						doScheduleEdit();
					}
					if(actionType=='add'){
						doScheduleAdd();
					}
				}
			}else{
				//还是没找到
				alert('未找到您输入的这个患者，请重新输入！');
				return false;
			}
		});
	}
	function doScheduleAdd(){
		var startTime = $('#addPatScheduleModal select[name="startTime"]').val();
		var endTime = $('#addPatScheduleModal select[name="endTime"]').val();
		var scheduleType = $('#addPatScheduleModal input[name="scheduleType"]:checked').val();
		var schedulePat = $('#addPatScheduleModal input[name="schedulePat"]').val();
		var schedulePatId = $('#addPatScheduleModal input[name="schedulePatId"]').val();
		var repeat = $('#addPatScheduleModal input[name="repeat"]:checked').val();
		var endDate = $('#addPatScheduleModal input[name="endDate"]').val();
		var scheduleContent = $('#addPatScheduleModal textarea[name="scheduleContent"]').val();
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var doctorId = $('input[name="doctorId"]').val();
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
		if(!doctorId){
			alert("未找到该医生或该页面已过期，请重新登录！");
			return false;
		}
		if(repeat!=0&&!endDate){
			alert("请设置重复结束时间！");
			return false;
		}
		var questArr = {
				day:day,
				token:token,
				doctorId:doctorId,
				startTime:startTime,
				endTime:endTime,
				scheduleType:scheduleType,
				repeat:repeat,
				endDate:endDate,
				scheduleContent:scheduleContent,
				schedulePatient:schedulePat,
				patientId:schedulePatId
		};
		//如果repeat不为零，需要为这些添加项添加同一个groupId
		//添加过程中每天都需要查重
		//错误返回在result.message中
		var questURL = runParams.mainUrl+'doctor/doScheduleAdd.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				location.reload();
			}else{  
				alert(result.message);
			}
		});
	}
	function doScheduleEdit(){
		var startTime = $('#addPatScheduleModal select[name="startTime"]').val();
		var endTime = $('#addPatScheduleModal select[name="endTime"]').val();
		var scheduleType = $('#addPatScheduleModal input[name="scheduleType"]:checked').val();
		var schedulePat = $('#addPatScheduleModal input[name="schedulePat"]').val();
		var schedulePatId = $('#addPatScheduleModal input[name="schedulePatId"]').val();
		var scheduleContent = $('#addPatScheduleModal textarea[name="scheduleContent"]').val();
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var doctorId = $('input[name="doctorId"]').val();
		var scheduleId = $('#addPatScheduleModal input[name="scheduleId"]').val();
		if(!scheduleId){
			alert("未找到该日程项！");
			return false;
		}
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
		if(!doctorId){
			alert("未找到该医生或该页面已过期，请重新登录！");
			return false;
		}

		var questArr = {
				day:day,
				token:token,
				doctorId:doctorId,
				startTime:startTime,
				endTime:endTime,
				scheduleType:scheduleType,
				scheduleContent:scheduleContent,
				schedulePat:schedulePat,
				patientId:schedulePatId,
				scheduleId:scheduleId
		};
		//对今天的日程需要查重
		var questURL = runParams.mainUrl+'doctor/doScheduleEdit.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				location.reload();
			}else{
				alert(result.message);
			}
		});
	}

	/*
    门诊排班模态框=========================================================================
	 */
	$('.addOps1').click(function(){
		var t_obj = new Date($('input[name="currentDate"]').val());
		var n_obj = new Date(nowdate.toLocaleDateString());
		var t = t_obj.getTime();
		var n = n_obj.getTime();
		if(t<n){alert('只能对今天及以后的时间进行排班安排。');return false;}
		reflushOps1Modal();
		$('#ops1Modal').modal();
	});
	//模态框重置
	function reflushOps1Modal(){
		$('#ops1Modal .form-repeat').show();
		$('#ops1Modal input[name="repeat"][value="0"]').attr('checked',true);
		$('#ops1Modal .form-endDate').hide();
		$('#ops1Modal input[name="endDate"]').val(nextYear);
		$('#ops1Modal input[name="additionalRegistration"]').val(5);
		$('#ops1Modal textarea[name="scheduleContent"]').val('门诊排班时间');
	}
	//弹出框起始时间设定
	timeReflush1(1);
	timeReflush1(3);
	$('.timeSolutionOps1 tr').eq(1).children('.td1').children('select').change(function(){
		timeReflush1(1);
	});
	$('.timeSolutionOps1 tr').eq(1).children('.td2').children('select').change(function(){
		timeReflush1(1);
	});
	$('.timeSolutionOps1 tr').eq(3).children('.td1').children('select').change(function(){
		timeReflush1(3);
	});
	$('.timeSolutionOps1 tr').eq(3).children('.td2').children('select').change(function(){
		timeReflush1(3);
	});
	function timeReflush1(index){
		var timeBlock = $('.timeSolutionOps1 tr').eq(index).children('.td1').children('select').val();
		$('.timeSolutionOps1 tr').eq(index).children('.td2').children('select').hide();
		var obj = $('.timeSolutionOps1 tr').eq(index).children('.td2').children('select[name="'+timeBlock+'"]');
		obj.show();
		var timeBlock1 = obj.val();
		var obj1 = $('.timeSolutionOps1 tr').eq(index).children('.td3').children('.d-default');
		var htmlstr = '<option value="'+timeBlock1+':00">'+timeBlock1+':00</option><option value="'+timeBlock1+':15">'+timeBlock1+':15</option><option value="'+timeBlock1+':30">'+timeBlock1+':30</option><option value="'+timeBlock1+':45">'+timeBlock1+':45</option>';
		obj1.html(htmlstr);
	}
	function timeReflushFit1(index){
		var timeBlock = $('.timeSolutionOps1 tr').eq(index).children('.td3').children('select').val();
		var h = timeBlock.split(':')[0];
		var obj = $('.timeSolutionOps1 tr').eq(index).children('.td2').children('select').children('option[value="'+h+'"]');
		obj.attr('selected',true);
		$('.timeSolutionOps1 tr').eq(index).children('.td2').children('select').hide();
		obj.parent().show();
		var timeBlock1 = obj.parent().attr('name');
		$('.timeSolutionOps1 tr').eq(index).children('.td1').children('select').children('option[value="'+timeBlock1+'"]').attr('selected',true);
	}
	//点击删除
	$('.deleteOpst').click(function(){
		var shiftId = $(this).siblings('input[name="e-shiftId"]').val();
		var startTime = $(this).siblings('input[name="e-startTime"]').val();
		var endTime = $(this).siblings('input[name="e-endTime"]').val();
		var token = $('input[name="token"]').val();
		if(!shiftId){
			alert('未找到该排班记录！');
			return false;
		}
		var questArr = {
				shiftId:shiftId,
		};
		var questURL = runParams.mainUrl+'doctor/getOutPatientScheduleByshiftId.do';
		$.post(questURL,questArr,function(result){
			if(0==result.data.repeat){
				//非重复日程
				deleteOpstSingle(shiftId,startTime,endTime)
			}else{
				//重复日程
				$('#deleteConfirmOpst .d-endDate').html(result.data.endDate_str);
				$('#deleteConfirmOpst input[name="d-shiftId"]').val(result.data.shiftId);
				$('#deleteConfirmOpst input[name="d-startTime"]').val(result.data.startTime_str);
				$('#deleteConfirmOpst input[name="d-endTime"]').val(result.data.endTime_str);
				$('#deleteConfirmOpst input[name="d-shiftGroupId"]').val(result.data.shiftGroupId);
				$('#deleteConfirmOpst').modal();
			}
		});
	});
	$('#doDeleteGroupOpst').click(function(){
		var endDate = $('#deleteConfirmOpst .d-endDate').html();
		var startTime = $('#deleteConfirmOpst input[name="d-startTime"]').val();
		var endTime = $('#deleteConfirmOpst input[name="d-endTime"]').val();
		var shiftGroupId = $('#deleteConfirmOpst input[name="d-shiftGroupId"]').val();
		deleteOpstGroup(shiftGroupId,startTime,endTime,endDate);
	});
	$('#doDeleteSingleOpst').click(function(){
		var shiftId = $('#deleteConfirmOpst input[name="d-shiftId"]').val();
		var startTime = $('#deleteConfirmOpst input[name="d-startTime"]').val();
		var endTime = $('#deleteConfirmOpst input[name="d-endTime"]').val();
		deleteOpstSingle(shiftId,startTime,endTime);
	});
	//单条删除
	function deleteOpstSingle(shiftId,startTime,endTime){
		var token = $('input[name="token"]').val();
		if(!shiftId){
			alert('未找到该排班记录！');
			return false;
		}
		if(!token){
			alert('页面非法提交！');
			return false;
		}  
		if(confirm('删除这条排班将同时删除下面的门诊预约，是否继续？')){
			//删除门诊排班和下面的预约
			var questArr = {
					shiftId:shiftId,
					token:token
			};
			var questURL = runParams.mainUrl+'doctor/doOpstDelete.do';
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
	//整组删除
	function deleteOpstGroup(shiftGroupId,startTime,endTime,endDate){
		var token = $('input[name="token"]').val();
		if(!shiftGroupId){
			alert('未找到该排班组！');
			return false;
		}
		if(!token){
			alert('页面非法提交！');
			return false;
		}
		if(confirm('确定要删除截止至“'+endDate+'”,'+startTime+'”到“'+endTime+'的排班安排以及下面所有的门诊预约吗？')){
			//删除所有门诊排班和下面的预约
			var questArr = {
					shiftGroupId:shiftGroupId,
					token:token
			};
			var questURL = runParams.mainUrl+'doctor/doOpstDeleteByGroupId.do';
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
	//修改号数
	$('.editAG').click(function(){
		var ag = parseInt($(this).siblings('.e-additionalRegistration').html(),10);
		var obj = $(this).siblings('.btn-group');
		var startTime = obj.children('input[name="e-startTime"]').val();
		var endTime = obj.children('input[name="e-endTime"]').val();
		var shiftId = obj.children('input[name="e-shiftId"]').val();
		$('#editAGModal .st').html(startTime);
		$('#editAGModal .et').html(endTime);
		$('#editAGModal input[name="c-additionalRegistration"]').val(ag);
		$('#editAGModal input[name="c-shiftId"]').val(shiftId);
		$('#editAGModal').modal();
	});
	$('#editAGModal button[name="doAGEdit"]').click(function(){
		var additionalRegistration = $('#editAGModal input[name="c-additionalRegistration"]').val();
		var shiftId = $('#editAGModal input[name="c-shiftId"]').val();
		var token = $('input[name="token"]').val();
		if(!token){
			alert("非法提交！");
			return false;
		}
		if(!shiftId){
			alert("未找到当前的日程项！");
			return false;
		}
		if(!additionalRegistration){
			alert("请填写加号数量！");
			return false;
		}
		var questArr = {
				token:token,
				shiftId:shiftId,
				additionalRegistration:additionalRegistration
		};
		var questURL = runParams.mainUrl+'doctor/doOpstAdditionalRegistrationEdit.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				location.reload();
				//不跳转页面
//				$('input[name="e-shiftId"][value="'+shiftId+'"]').parent().siblings('.e-additionalRegistration').html(result.data.additionalRegistration);
//				$('#editAGModal').modal('hide')
			}else{
				alert(result.message);
			}
		});
	});
	//点击提交
	$('#ops1Modal button[name="addOutPatientSchedule"]').click(function(){
		doOutPatientScheduleAdd();
	});
	function doOutPatientScheduleAdd(){
		var startTime = $('#ops1Modal select[name="startTime"]').val();
		var endTime = $('#ops1Modal select[name="endTime"]').val();
		var scheduleType ='门诊排班';
		var repeat = $('#ops1Modal input[name="repeat"]:checked').val();
		var endDate = $('#ops1Modal input[name="endDate"]').val();
		var scheduleContent = $('#ops1Modal textarea[name="scheduleContent"]').val();
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var doctorId = $('input[name="doctorId"]').val();
		var additionalRegistration = $('#ops1Modal input[name="additionalRegistration"]').val();
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
		if(!doctorId){
			alert("未找到该医生或该页面已过期，请重新登录！");
			return false;
		}
		if(repeat!=0&&!endDate){
			alert("请设置重复结束时间！");
			return false;
		}
		if(!additionalRegistration){
			alert("请填写加号数量！");
			return false;
		}
		var questArr = {
				day:day,
				token:token,
				doctorId:doctorId,
				startTime:startTime,
				endTime:endTime,
				scheduleType:scheduleType,
				repeat:repeat,
				endDate:endDate,
				scheduleContent:scheduleContent,
				additionalRegistration:additionalRegistration
		};
		//如果repeat不为零，需要为这些添加项添加同一个groupId
		//添加过程中每天都需要查重
		//错误返回在result.message中
		var questURL = runParams.mainUrl+'doctor/doOutPatientScheduleAdd.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				location.reload();
			}else{
				alert(result.message);
			}
		});
	}
	/*
    门诊预约模态框=========================================================================
	 */	
	$('.addOps2').click(function(){
		var t_obj = new Date($('input[name="currentDate"]').val());
		var n_obj = new Date(nowdate.toLocaleDateString());
		var t = t_obj.getTime();
		var n = n_obj.getTime();
		if(t<n){alert('只能对今天及以后的时间进行门诊预约。');return false;}
		reflushOps2Modal();
		$('#ops2Modal input[name="actionType"]').val('add');
		$('#ops2Modal').modal();
	});
	//模态框重置
	function reflushOps2Modal(){
		//从数据库中取出当天的门诊池，必须还有余票
		var day = $('input[name="currentDate"]').val();
		var doctorId = $('input[name="doctorId"]').val();
		var questArr = {
				day:day,
				doctorId:doctorId,
				scheduleType:'门诊排班'
		};   
		var questURL = runParams.mainUrl+'doctor/getAvalibleOutPatientScheduleWithDay.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
					htmlstr += '<option value="'+con[i].shiftId+'">'+con[i].decription+'</option>';
				}
				$('#ops2Modal select[name="shiftId"]').html(htmlstr);
			}else{
				var htmlstr = '<option value="0">当天的门诊排班未创建或所有排班余票已放完。</option>';
				$('#ops2Modal select[name="shiftId"]').html(htmlstr);	
			}
		});
		$('#ops2Modal .smartSearch').show();
		$('#ops2Modal textarea[name="scheduleContent"]').val('特需门诊预约');
		$('#ops2Modal input[name="schedulePat"]').val('');
		$('#ops2Modal input[name="schedulePatId"]').val('');
	}
	//点击修改
	$('.editOps').click(function(){
		var scheduleContent = $(this).siblings('input[name="e-scheduleContent"]').val();
		var schedulePat = $(this).siblings('input[name="e-schedulePat"]').val();
		var schedulePatId = $(this).siblings('input[name="e-schedulePatId"]').val();
		var scheduleId = $(this).siblings('input[name="e-scheduleId"]').val();
		var shiftId = $(this).siblings('input[name="e-shiftId"]').val();
		if(!scheduleId){
			alert("日常项目数据不完整！请删除该项数据。");
			return false;
		}
		$('#ops2Modal input[name="schedulePat"]').val(schedulePat);
		$('#ops2Modal input[name="schedulePatId"]').val(schedulePatId);
		$('#ops2Modal input[name="scheduleId"]').val(scheduleId);
		$('#ops2Modal textarea[name="scheduleContent"]').val(scheduleContent);	
		$('#ops2Modal input[name="actionType"]').val('edit');
		//从数据库中取出当天的门诊池
		//默认显示当前的门诊池
		//如果要修改门诊池，则选择项必须还有余票
		var day = $('input[name="currentDate"]').val();
		var doctorId = $('input[name="doctorId"]').val();
		var questArr = {
				day:day,
				doctorId:doctorId,
				scheduleType:'门诊排班'
		};
		var questURL = runParams.mainUrl+'doctor/getAvalibleOutPatientScheduleWithDay.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
					if(shiftId==con[i].shiftId){
						htmlstr += '<option selected value="'+con[i].shiftId+'">'+con[i].decription+'</option>';
					}
					else{
						htmlstr += '<option  value="'+con[i].shiftId+'">'+con[i].decription+'</option>';
					}
				}
				$('#ops2Modal select[name="shiftId"]').html(htmlstr);
			}else{
				var htmlstr = '<option value="0">当天的门诊排班未创建或所有排班余票已放完。</option>';
				$('#ops2Modal select[name="shiftId"]').html(htmlstr);	
			}
		});
		$('#ops2Modal').modal();
	});
	//点击删除
	$('.deleteOps').click(function(){
		var scheduleId = $(this).siblings('input[name="e-scheduleId"]').val();
		var startTime = $(this).siblings('input[name="e-startTime"]').val();
		var endTime = $(this).siblings('input[name="e-endTime"]').val();
		var token = $('input[name="token"]').val();
		if(!scheduleId){
			alert('未找到该日程项！');
			return false;
		}
		if(confirm('确定要删除“'+startTime+'”到“'+endTime+'”的门诊预约吗？')){
			var questArr = {
					scheduleId:scheduleId,
					token:token
			};
			var questURL = runParams.mainUrl+'doctor/doScheduleDelete.do';
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
	//点击提交
	$('#ops2Modal button[name="addOutPatientAppoint"]').click(function(){
		beforeOpsSubmit();
	});
	function beforeOpsSubmit(){
		var schedulePat = $('#ops2Modal input[name="schedulePat"]').val();
		var schedulePatId = $('#ops2Modal input[name="schedulePatId"]').val();
		var actionType = $('#ops2Modal input[name="actionType"]').val();
		if(!schedulePat){
			alert('请输入患者名字！');
			return false;
		}
		if(schedulePatId){
			//根据患者id和名字验证有效性
			var questArr = {
					schedulePat:schedulePat,
					schedulePatId:schedulePatId
			};
			var questURL = runParams.mainUrl+'patient/validPatByIdAndName.do';
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					if(actionType=='edit'){
						doOutPatientAppointEdit();
					}
					if(actionType=='add'){
						doOutPatientAppointAdd();
					}
				}else{
					//如果没找到，根据输入的患者姓名继续查找
					validPatByName();
				}
			});
		}
		if(!schedulePatId){
			//如果没找到，根据输入的患者姓名继续查找
			validPatByName();
		}
	}
	function validPatByName(){
		var schedulePat = $('#ops2Modal input[name="schedulePat"]').val();
		var actionType = $('#ops2Modal input[name="actionType"]').val();
		var questArr = {
				schedulePat:schedulePat
		};  
		var questURL = runParams.mainUrl+'patient/validPatByName.do';
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				var len = result.data.length;
				if(len>1){
					alert('您输入的该患者存在重名，请根据输入时的下拉提示选择病人！');
					return false;
				}
				if(len==1){
					$('#ops2Modal input[name="schedulePatId"]').val(result.data[0].patientId);
					if(actionType=='edit'){
						doOutPatientAppointEdit();
					}
					if(actionType=='add'){
						doOutPatientAppointAdd();
					}
				}
			}else{
				//还是没找到
				alert('未找到您输入的这个患者，请重新输入！');
				return false;
			}
		});
	}
	function doOutPatientAppointAdd(){
		var scheduleType = '门诊预约';
		var schedulePat = $('#ops2Modal input[name="schedulePat"]').val();
		var schedulePatId = $('#ops2Modal input[name="schedulePatId"]').val();
		var scheduleContent = $('#ops2Modal textarea[name="scheduleContent"]').val();
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var doctorId = $('input[name="doctorId"]').val();
		var shiftId =$('#ops2Modal select[name="shiftId"]').val();
		if(!day){
			alert("未获取当天时间！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		if(!doctorId){
			alert("未找到该医生或该页面已过期，请重新登录！");
			return false;
		}
		if(shiftId=='0'){
			alert("请选择一个门诊排班！");
			return false;
		}
		var questArr = {
				day:day,
				token:token,
				doctorId:doctorId,
				scheduleType:scheduleType,
				scheduleContent:scheduleContent,
				patientId:schedulePatId,
				shiftId:shiftId
		};
		var questURL = runParams.mainUrl+'doctor/doOutPatientAppointAdd.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				location.reload();
			}else{  
				alert(result.message);
			}
		});
	}
	function doOutPatientAppointEdit(){
		var scheduleType = '门诊预约';
		var schedulePat = $('#ops2Modal input[name="schedulePat"]').val();
		var schedulePatId = $('#ops2Modal input[name="schedulePatId"]').val();
		var scheduleContent = $('#ops2Modal textarea[name="scheduleContent"]').val();
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var doctorId = $('input[name="doctorId"]').val();
		var shiftId = $('#ops2Modal select[name="shiftId"]').val();
		var scheduleId = $('#ops2Modal input[name="scheduleId"]').val();
		if(!shiftId){
			alert("未找到该日程项！");
			return false;
		}
		//比较时间有效性
		if(!day){
			alert("未获取当天时间！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		if(!doctorId){
			alert("未找到该医生或该页面已过期，请重新登录！");
			return false;
		}
		if(shiftId == '0'){
			alert("请选择一个门诊排班！");
			return false;
		}
		var questArr = {
				day:day,
				token:token,
				doctorId:doctorId,
				scheduleType:scheduleType,
				scheduleContent:scheduleContent,
				patientId:schedulePatId,
				shiftId:shiftId,
				scheduleId:scheduleId
		};
		var questURL = runParams.mainUrl+'doctor/doOutPatientAppointEdit.do';
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
