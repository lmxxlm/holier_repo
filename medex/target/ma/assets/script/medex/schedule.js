$(function(){
	var nowdate = new Date();
	var dateFix = nowdate.getHours();
	$('.timeHeadline').html(getLocalDate(nowdate,3));
	$('input[name="currentDate"]').val(getLocalDate(nowdate,2));
	getSchedule($('input[name="currentDate"]').val());
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
			date = date-24*60*60;
		}
		date *= 1000;
		var dateobj = new Date(date);
		$('.timeHeadline').html(getLocalDate(dateobj,3));
		$('input[name="currentDate"]').val(getLocalDate(dateobj,2));
		getSchedule($('input[name="currentDate"]').val());
	}).show();
	
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
	$('.calendarTable .td2').bind("mouseover",function(){
		$(this).addClass("tdhover");
	});
	$('.calendarTable .td2').bind("mouseout",function(){
		$(this).removeClass("tdhover");
	});
	function getSchedule(datetime){
		$('.box:not(.clone)').remove();
		var doctorId = $('input[name="doctorId"]').val();
	    var questArr = {
			day:datetime,
			doctorId:doctorId
		};
		var questURL = runParams.mainUrl+'doctor/getSchedule.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
//			var result = {"scheduleData":[{"category":"daily","content":"2","doctorId":"d37f570","endDate":1426089600000,"endDate_str":"2015-03-12","endTime":0.5,"endTime_str":"00:30","end_current_date_time":1426091400000,"end_date_time":1426091400000,"nurseId":"","patientId":"","repeat":1,"repeatUnit":"天","scheduleId":"14261162937620631","startDate":1426089600000,"startDate_str":"2015-03-12","startTime":0.25,"startTime_str":"00:15","start_current_date_time":1426090500000,"start_date_time":1426090500000,"status":0,"status_c":"未完成","type":"门诊","who":"doctor"}]};
			for(i=0;i<result.scheduleData.length;i++){
				var t = result.scheduleData[i];
				//获取起始时间字符
				var data_st = $('div[data-sd="'+t.startTime_str+'"]').attr('data-st');
				var data_et = $('div[data-ed="'+t.endTime_str+'"]').attr('data-et');
				//获得高度
				var height = (t.end_current_date_time-t.start_current_date_time)/(1000*60*15)*20;
				//获得坐标点
				var top = $('div[data-sd="'+t.startTime_str+'"]').attr('data-point');
				var obj = $('.clone').clone(true).css({top:top+'px',height:height+'px'}).removeClass('clone');
				var content1 = cutstr(t.content,36);
				
				obj.find('span.st').html(data_st);
				obj.find('span.et').html(data_et);
				obj.find('.scheduleContentInline').html('<i class="glyphicon glyphicon-tag"></i><span class="scheduleType">'+t.type+'</span><i class="glyphicon glyphicon-list-alt"></i><span class="scheduleContent">'+content1+'</span><i class="glyphicon glyphicon-retweet"></i><span class="scheduleRepeatVal">'+t.repeat+'</span><span class="scheduleRepeatUnit">'+t.repeatUnit+'</span>');
		        obj.find('.scheduleContentBlock').html('<i class="glyphicon glyphicon-tag"></i><span class="scheduleType">'+t.type+'</span><i class="glyphicon glyphicon-list-alt"></i><span class="scheduleContent">'+t.content+'</span><i class="glyphicon glyphicon-retweet"></i><span class="scheduleRepeatVal">'+t.repeat+'</span><span class="scheduleRepeatUnit">'+t.repeatUnit+'</span>');
				if(height==20){
					obj.find('.scheduleContentInline').show();
					obj.find('table').hide();
				}else{
					obj.find('.scheduleContentInline').hide();
					obj.find('table').show();
				}
				obj.find('.addSchedule').hide();
				obj.find('input[name="scheduleGroupId"]').val(t.scheduleId);
				obj.find('input[name="sd"]').val(t.startTime_str);
				obj.find('input[name="ed"]').val(t.endTime_str);
				$('.calendarBody').prepend(obj);
			}
		});
	}
});
$(function(){
	var unitHeight = 20;//15分钟的像素高度
	var globalZindex = 1;
	var globalStep = 0;//验证移动过程中是向上移动还是向下
	var globalStepPull = 0;//验证拉动过程中是向上移动还是向下
	var currentObj = null;//当前的操作对象
	var dragObj = {
		x:0,
		y:0,
		id:null
	}
	var pullObj = {
		x:0,
		y:0,
		h:15,
		id:null
	}
	$('.box>.drag').on('mousedown',function(e){
		var fa = $(this).parent('.box');
		fa.css('zIndex',globalZindex++);
		dragObj.x = e.pageX-parseInt(fa.css('left'),10);
		dragObj.y = e.pageY-parseInt(fa.css('top'),10);
		dragObj.id = fa;
		globalStep = parseInt(fa.css('top'),10);
		//透明处理
		fa.addClass("alphaHalf");
		//解除hover特效
		$('.calendarTable .td2').unbind("mouseover");
		$('.calendarTable .td2').unbind("mouseout");
	});
	$('.box>.pull').on('mousedown',function(e){
		var fa = $(this).parent('.box');
		fa.css('zIndex',globalZindex++);
		pullObj.x = e.pageX;
		pullObj.y = e.pageY;
		pullObj.h = $(this).siblings('.drag').height();
		pullObj.id = fa;
		globalStepPull = pullObj.y;
		//透明处理
		fa.addClass("alphaHalf");
		//解除hover特效
		$('.calendarTable .td2').unbind("mouseover");
		$('.calendarTable .td2').unbind("mouseout");
	});
	$(document).mousemove(function(evte){
		if(dragObj.id){
			var step = evte.pageY-dragObj.y;
			var maxStep = 1920-dragObj.id.height();
			if(step%unitHeight==0){
				//验证重合，预设st需要改动一个unit高度20
				var st = parseInt($(dragObj.id).css("top").replace("px",""));
				var returnval = 1;
				if(step<globalStep) st-=20;
				if(step>globalStep) st+=20;
				var et = st+$(dragObj.id).height();
				$('.box:not(.clone)').not(dragObj.id).each(function(){
					var top = parseInt($(this).css("top").replace("px",""));
					var buttom = top+$(this).height();
					if((st>top&&st<buttom)||(et>top&&et<buttom)||(st==top&&et==buttom)||(st==top&&et>buttom)||(st<top&&et==buttom)){
						//$(document).mouseup();
						returnval = 0;
						return false;
					}
				});
				if(returnval){
					//$(this).css('left',evte.pageX-this.x);
					if(step<0)step=0;
					if(step>maxStep)step=maxStep;
					dragObj.id.css('top',step+'px');
					getTimeSpace(dragObj.id);
					$('.confirmBox').slideDown(300);
				}
			}
		}else if(pullObj.id){
			var step = evte.pageY-pullObj.y;
			var r_height = pullObj.h+step;
			if((step%unitHeight==0)&&(r_height>=(unitHeight-5))){
				//验证重合，预设st需要增加一个unit高度20
				var returnval = 1;
				var st = parseInt($(pullObj.id).css("top").replace("px",""));
				var et = st+$(pullObj.id).height();
				if(evte.pageY<globalStepPull) et-=20;
				if(evte.pageY>globalStepPull) et+=20;
				$('.box:not(.clone)').not(pullObj.id).each(function(){
					var top = parseInt($(this).css("top").replace("px",""));
					var buttom = top+$(this).height();
					if((st>top&&st<buttom)||(et>top&&et<buttom)||(st==top&&et==buttom)||(st==top&&et>buttom)||(st<top&&et==buttom)){
						//$(document).mouseup();
						returnval = 0;
						return false;
					}
				});
				if(returnval){
					if(r_height+st>1935) r_height=1935-st;
					pullObj.id.children('.drag').css('height',r_height+'px');
					pullObj.id.css('height',r_height+5+'px');
					getTimeSpace(pullObj.id);
					//让内容垂直居中
					var scheduleContentInline = pullObj.id.find('.scheduleContentInline');
					var scheduleContentBlock = pullObj.id.find('.scheduleContentBlock');
					if(r_height==15){
						scheduleContentInline.css('display','inline-block');
					    scheduleContentBlock.parents('table').hide();
					}else{
					    scheduleContentBlock.css({height:(r_height-16)+'px'});
						scheduleContentBlock.parents('table').show();
						scheduleContentInline.hide();
					}
					$('.confirmBox').slideDown(300);
				}	
			}
		}else{
			return false;
		}
	});
	$(document).mouseup(function(){    
		if(dragObj.id){
			//去掉透明
			dragObj.id.removeClass("alphaHalf");
			dragObj.id = null;
		}else if(pullObj.id){
			//去掉透明
			pullObj.id.removeClass("alphaHalf");
			pullObj.id = null;
		}else{
			return false;
		}
		//重新绑定hover特效
		$('.calendarTable .td2').bind("mouseover",function(){
			$(this).addClass("tdhover");
		});
		$('.calendarTable .td2').bind("mouseout",function(){
			$(this).removeClass("tdhover");
		});
	});
	$('.calendarTable .td2').click(function(){
		var top = parseInt($(this).attr('data-point'));
		var obj = $('.clone').clone(true).css('top',top+'px').removeClass('clone');
		$('.calendarBody').prepend(obj);
		getTimeSpace(obj);
	});
	function getTimeSpace(obj){
	    var top = parseInt($(obj).css("top").replace("px",""));
		var buttom = top+$(obj).height();
		if(buttom==1920) buttom=0;
		$(obj).find('.st').html($('div[data-point="'+top+'"]').attr('data-st'));
		$(obj).find('.et').html($('div[data-point="'+buttom+'"]').attr('data-st'));
		$(obj).find('input[name="sd"]').val($('div[data-point="'+top+'"]').attr('data-sd'));
		$(obj).find('input[name="ed"]').val($('div[data-point="'+buttom+'"]').attr('data-sd'));
	}
	//删除日程
	$('.box .remove_2').click(function(){
		if(confirm("确定要删除这条日程吗？")){
		    $(this).parents('.box').remove();
		    $('.confirmBox').slideDown(300);
		} 
	});
	//添加日程
	$('.addSchedule').click(function(){
		reflushScheduleModal();
		currentObj = $(this).parents('.box');
		$('#addDocScheduleModal .st').html($(this).siblings('.st').html());
	    $('#addDocScheduleModal .et').html($(this).siblings('.et').html());
	    $('#addDocScheduleModal').modal();
	});
	//修改日程
	$('.box .edit').click(function(){
		reflushScheduleModal();
		currentObj = $(this).parents('.box');
		if(!currentObj.find('input[name="scheduleGroupId"]').val()){alert("请先添加日程。");return false;}
		$('#addDocScheduleModal .st').html($(this).siblings('.st').html());
	    $('#addDocScheduleModal .et').html($(this).siblings('.et').html());
		var scheduleType = currentObj.find('.scheduleContentBlock .scheduleType').html();
		var scheduleContent = currentObj.find('.scheduleContentBlock .scheduleContent').html();
		var scheduleRepeatVal = currentObj.find('.scheduleContentBlock .scheduleRepeatVal').html();
		var scheduleRepeatUnit = currentObj.find('.scheduleContentBlock .scheduleRepeatUnit').html();
		$('#addDocScheduleModal input[name="scheduleType"][value="'+scheduleType+'"]').attr('checked',true);
		$('#addDocScheduleModal textarea[name="scheduleContent"]').val(scheduleContent);
		$('#addDocScheduleModal input[name="scheduleRepeatVal"]').val(scheduleRepeatVal);
		$('#addDocScheduleModal select[name="scheduleRepeatUnit"]').val(scheduleRepeatUnit);
	    $('#addDocScheduleModal').modal();
	});
	//查看日程
	$('.box .zoom_in').click(function(){
		currentObj = $(this).parents('.box');
		if(!currentObj.find('input[name="scheduleGroupId"]').val()){alert("请先添加日程。");return false;}
		$('#detailDocScheduleModal .st').html($(this).siblings('.st').html());
	    $('#detailDocScheduleModal .et').html($(this).siblings('.et').html());
		var scheduleType = currentObj.find('.scheduleContentBlock .scheduleType').html();
		var scheduleContent = currentObj.find('.scheduleContentBlock .scheduleContent').html();
		var scheduleRepeatVal = currentObj.find('.scheduleContentBlock .scheduleRepeatVal').html();
		var scheduleRepeatUnit = currentObj.find('.scheduleContentBlock .scheduleRepeatUnit').html();
		$('.detailDocScheduleModalUl').html('<li>'+scheduleType+'</li><li>'+scheduleContent+'</li><li>从今天开始连续'+scheduleRepeatVal+scheduleRepeatUnit+'</li>');
	    $('#detailDocScheduleModal').modal();
	});
	//模态框重置
	function reflushScheduleModal(){
	    $('#addDocScheduleModal input[name="scheduleType"][value="门诊"]').attr('checked',true);
		$('#addDocScheduleModal textarea[name="scheduleContent"]').val('');
		$('#addDocScheduleModal input[name="scheduleRepeatVal"]').val(1);
		$('#addDocScheduleModal select[name="scheduleRepeatUnit"]').val('天');
	}
	//添加模态框中的确定按钮
	$('#addDocScheduleModal button[name="addSchedule"]').click(function(){
	    var scheduleType = $('#addDocScheduleModal input[name="scheduleType"]:checked').val();
		var scheduleContent = $('#addDocScheduleModal textarea[name="scheduleContent"]').val();
		var scheduleContent1 = cutstr(scheduleContent,36);
		var scheduleRepeatVal = parseInt($('#addDocScheduleModal input[name="scheduleRepeatVal"]').val());
		var scheduleRepeatUnit = $('#addDocScheduleModal select[name="scheduleRepeatUnit"]').val();
		if(!scheduleContent){
		    alert('请填写日程内容！');
			return false;
		}
		currentObj.find('.scheduleContentInline').html('<i class="glyphicon glyphicon-tag"></i><span class="scheduleType">'+scheduleType+'</span><i class="glyphicon glyphicon-list-alt"></i><span class="scheduleContent">'+scheduleContent1+'</span><i class="glyphicon glyphicon-retweet"></i><span class="scheduleRepeatVal">'+scheduleRepeatVal+'</span><span class="scheduleRepeatUnit">'+scheduleRepeatUnit+'</span>');
		currentObj.find('.scheduleContentBlock').html('<i class="glyphicon glyphicon-tag"></i><span class="scheduleType">'+scheduleType+'</span><i class="glyphicon glyphicon-list-alt"></i><span class="scheduleContent">'+scheduleContent+'</span><i class="glyphicon glyphicon-retweet"></i><span class="scheduleRepeatVal">'+scheduleRepeatVal+'</span><span class="scheduleRepeatUnit">'+scheduleRepeatUnit+'</span>');
		if(currentObj.height()==20){
		    currentObj.find('.scheduleContentInline').show();
			currentObj.find('table').hide();
		}else{
		    currentObj.find('.scheduleContentInline').hide();
			currentObj.find('table').show();
		}
		currentObj.find('.addSchedule').hide();
		if(!currentObj.find('input[name="scheduleGroupId"]').val()){
			var date = new Date();
		    currentObj.find('input[name="scheduleGroupId"]').val(date.getTime()+RndNum(4));
		}
		$('#addDocScheduleModal').modal('hide');
		$('.confirmBox').slideDown(300);
	});
	$('.confirmBox .remove').click(function(){
	    $('.confirmBox').hide();
	});
	//确认按钮提交逻辑
	$('.confirmBox .submit').click(function(){
		$('.confirmBox').hide();
		$('.loading').html('<span class="glyphicon glyphicon-refresh"></span>正在提交日程设置...').slideDown(300);
		var day = $('input[name="currentDate"]').val();
		var token = $('input[name="token"]').val();
		var doctorId = $('input[name="doctorId"]').val();
		var scheduleJsonData = [];
		var questArr = {
			day:day,
			token:token,
			doctorId:doctorId,
			scheduleData:''
		};
	    $('.box:not(.clone)').each(function(){	
		    var startTime = $(this).find('input[name="sd"]').val();
			var endTime = $(this).find('input[name="ed"]').val();
			var scheduleType = $(this).find('.scheduleContentBlock .scheduleType').html();
			var scheduleContent = $(this).find('.scheduleContentBlock .scheduleContent').html();
			var scheduleRepeatVal = $(this).find('.scheduleContentBlock .scheduleRepeatVal').html();
			var scheduleRepeatUnit = $(this).find('.scheduleContentBlock .scheduleRepeatUnit').html();
			var scheduleGroupId = $(this).find('input[name="scheduleGroupId"]').val();
			if(scheduleGroupId&&scheduleContent&&startTime&&endTime){
				var scheduleArr = {
				    "startTime":startTime,
					"endTime":endTime,
					"scheduleType":scheduleType,
					"scheduleContent":scheduleContent,
					"scheduleRepeatVal":scheduleRepeatVal,
					"scheduleRepeatUnit":scheduleRepeatUnit,
					"scheduleGroupId":scheduleGroupId
				}
				scheduleJsonData.push(scheduleArr);
			}
		});
        questArr.scheduleData = JSON.stringify(scheduleJsonData);
		var questURL = runParams.mainUrl+'doctor/doSchedule.do';
		//添加、修改逻辑
		//1、根据day删除这个day的所有记录
		//2、根据groupId，删除所有相同groupId的记录，当天前（可操作）的记录
		//3、添加当天记录，添加重复项的记录，每天都需要验证重复时间
		$.post(questURL,questArr,function(result){
			var jsonObj = eval("("+result+")");
			if(1==jsonObj.status){
				$('.loading').html('<span class="glyphicon glyphicon-ok"></span>日程设置已保存。');
				$('input[name="token"]').val(jsonObj.token);
				setTimeout(function(){
				    $('.loading').slideUp(300);
				},1000);
			}else if(3==jsonObj.status){
				alert('重复日程项冲突，请根据接下来几天的日程重新规划，设置失败！');
				$('.loading').hide();
				return false;
			}else{
				alert('设置失败！');
				$('.loading').hide();
				return false;
			}
		});
	});
	//确认按钮框定位
	function getConfirmBoxPosition(){
	    var w_width = $(window).width();
	    $('.confirmBox').css('left',(w_width-362)/2+'px');
	}
	getConfirmBoxPosition();
	window.onresize = function(){
        getConfirmBoxPosition();
    }
	//不可选中设置
	if(navigator.appName == "Microsoft Internet Explorer"){
		var ieVersion = navigator.appVersion;
	    if(ieVersion.match(/9./i)=="9."||ieVersion.match(/8./i)=="8."||ieVersion.match(/7./i)=="7."||ieVersion.match(/6./i)=="6."){
		    var omitformtags = ["input", "textarea"];//设置可以的元素名称
			omitformtags = "|"+ omitformtags.join("|") + "|";
			document.onselectstart = function disableselect(){
				if (omitformtags.indexOf("|"+event.srcElement.tagName.toLowerCase()+"|")==-1){return false;}
			}
		}
	}
});