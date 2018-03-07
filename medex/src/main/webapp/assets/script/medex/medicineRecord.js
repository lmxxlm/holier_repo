$(function(){
	setRecord();
	setRightMenu();
	$(window).resize(setRightMenu);
	$('#content').scroll(function(){
		var st = $(this).scrollTop();
		if(st>90){
		    $('.rightMenu').addClass('fixpos');
		}else{
		    $('.rightMenu').removeClass('fixpos');
		}
	});
	function setRecord(){
	    var t_height = $(window).height()-114;
		$('.recordArea').css('minHeight',t_height);
		$('.timeLine').height(t_height-47);
	}
	function setRightMenu(){
	    var r_height = $(window).height()-90;
		r_height = r_height>400?r_height:400;
		var a_height = r_height/8;
		var paddingTop = (a_height-50)/2;
		$('.rightMenu').height(r_height);
		$('.rightMenu a').height(a_height);
		$('.rightMenu a i').css('paddingTop',paddingTop);	
	}
	$(".timeLine").niceScroll({   
		touchbehavior : false, // 是否在触摸屏下使用
		cursorcolor : "#AF86B9", // 滚动条颜色
		cursoropacitymax : 0, // 滚动条是否透明
		cursorwidth : 4, // 滚动条宽度
		horizrailenabled : false, // 是否水平滚动
		cursorborderradius : 0, // 滚动条是否圆角大小
		autohidemode : true, // 是否隐藏滚动条
		cursorborder : 0 // 滚动条边框大小
	});
	//点击更多
	$('.getMore').click(function(){
		var lastTime = $('input[name="lastTime"]').val();
		var patientId = $('input[name="patientId"]').val();
		if(!patientId){
		    alert('未找到当前的病人！');
			return false;
		}
		if(lastTime){
		    //根据lastTime的值取出后面10条数据
			var questArr = {
				time:lastTime,
				patientId:patientId
			};
			var questURL = runParams.mainUrl+'findmedicineTimeRecordLimit10ByTime.do';
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					//如果找到了，并且取完后还有数据
					var len = result.data.length;
					var htmlstr = '';
					for(i=0;i<len;i++){
					    htmlstr += '<li><a href="javascript:void(0)" class="alphaHalf" onFocus="this.blur()" data-id="'+result.data[i].id+'">'+result.data[i].time1+'</br>'+result.data[i].time2+'</a></li>';
					}
					$('input[name="lastTime"]').val(result.data[len-1].time);
					$(".timeLine li:nth-last-child(2)").after(htmlstr);
					var obj = document.getElementById('timeLine');
	                obj.scrollTop=obj.scrollHeight;
					$(".alphaHalf").animate({
					   opacity: 1
					},"fast",function(){
					    $(".alphaHalf").removeClass('alphaHalf');
					});
				}else if(2==result.status){
				    //如果找到了，并且已经取完了
					var len = result.data.length;
					var htmlstr = '';
					for(i=0;i<len;i++){
					    htmlstr += '<li><a href="javascript:void(0)" class="alphaHalf" onFocus="this.blur()" data-id="'+result.data[i].id+'">'+result.data[i].time1+'</br>'+result.data[i].time2+'</a></li>';
					}
					$(".timeLine li:nth-last-child(2)").after(htmlstr);
					$('.getMore').parent('li').hide();
					var obj = document.getElementById('timeLine');
	                obj.scrollTop=obj.scrollHeight;
					$(".alphaHalf").animate({
					   opacity: 1
					},"fast",function(){
					    $(".alphaHalf").removeClass('alphaHalf');
					});
				}else{
					$('.getMore').parent('li').hide();
				}
			});
		}
	});
	
	$('.timeList p:not(".title")').live('mouseover',function(){
	    if($(this).children('.radioGroup').css('display')=='none'){
			$(this).children('.edit').show();
		}
	});
	$('.timeList p:not(".title")').live('mouseout',function(){
	    $(this).children('.edit').hide();
	});
	$('.timeList .edit').live('click',function(){
		$('.timeList p:not(".title")').children('.radioGroup').hide();
		$('.timeList p:not(".title")').children('.glyphicon').show();
	    $(this).siblings('.glyphicon').hide();
		$(this).siblings('.radioGroup').show();
		$(this).hide();
		$(this).siblings('.radioGroup').children('input[name="status"][value="0"]').attr('checked',true);
	});
	//更新用药状态
	$('.timeList .radioGroup a').live('click',function(){
	    var status = $(this).siblings('input:checked').val();
		var patientId = $('input[name="patientId"]').val();
		var medicine_name = $('input[name="medicine_name"]').val();
		var medicine_date = $(this).parent().siblings('input[name="medicine_date"]').val();
		var time = $('input[name="time"]').val();
		if(!patientId||!status||!medicine_name||!medicine_date){
		    alert('数据不完整，修改失败！');
			return false;
		}
		var questArr = {
			status:status,
			patientId:patientId,
			medicine_name:medicine_name,
			medicine_date:medicine_date,
			time:time
		};
		var questURL = runParams.mainUrl+'patient/updateMedicineStatus.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				var obj = $('input[name="medicine_date"][value="'+result.data.time_str+'"]');
				if(result.data.status){
				    var style = 'glyphicon glyphicon-ok';
				}else{  
				    var style = 'glyphicon glyphicon-remove';
				}
				obj.siblings('.glyphicon').attr('class',style).show();
				obj.siblings('.radioGroup').hide();   
				obj.siblings('.edit').hide();
			}else{  
				alert('修改失败！');
				return false;
			}
		});
	});
	//点击药品
	$('#medicine_item a').live('click',function(){
	    var medicine_name = $(this).html();
		var patientId = $('input[name="patientId"]').val();
		var time = $('input[name="time"]').val();
		$('input[name="medicine_name"]').val(medicine_name);
		if(!medicine_name||!patientId||!time){
		    alert('数据不完整！');
			return false;
		}
		var questArr = {
			medicine_name:medicine_name,
			patientId:patientId,
			time:time
		};
		var questURL = runParams.mainUrl+'patient/getMedicineItem.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){        
				$('.medicineInfo .title span').html(result.data.plan.cnName);
				$('.timeList .title span').html(result.data.plan.cnName);
				$('#h-medicine_startTime').html(result.data.plan.startTime_str);
				$('#h-medicine_endTime').html(result.data.plan.endTime_str);
				$('#h-medicine_time').html(result.data.plan.take_time);
				$('#h-medicine_dose').html(result.data.plan.dosage);
				$('#h-medicine_name').html(result.data.plan.cnName);
				$('#h-medicine_mname').html(result.data.plan.commonName);
				$('#h-medicine_mark').html(result.data.plan.remark);
				
				var tl = result.data.record;
				var len = tl.length;
				var htmlstr = '';
				for(i=0;i<len;i++){
					if(tl[i].status){
						var style = 'glyphicon glyphicon-ok';
					}else{
						var style = 'glyphicon glyphicon-remove';
					}
					htmlstr+= '<p>';
					htmlstr+=     tl[i].time_str;
					htmlstr+=     '<span class="'+style+'"></span>';
					htmlstr+=     '<span class="radioGroup">';
					htmlstr+=     '	<input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;';
					htmlstr+=     '	<input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;';
					htmlstr+=     '	<a href="javascript:void(0)">确定</a>';
					htmlstr+=     '</span>';
					htmlstr+=     '<input type="hidden" name="medicine_date" value="'+tl[i].time_str+'">';
					htmlstr+=     '<a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>';
					htmlstr+= '</p>';
				}
				$('.timeShow').html(htmlstr);
			}else{
				alert('获取失败！');
				return false;
			}
		});
	});
	//点击时间
	$('.timeLine a:not(".getMore")').live('click',function(){
		$('.timeLine a').removeClass('active');
		$(this).addClass('active');
	    var prescriptionId = $(this).attr('data-id');
		if(prescriptionId){
		    //从数据库中取出这条数据
			var questArr = {
				prescriptionId:prescriptionId
			};
			var questURL = runParams.mainUrl+'patient/findmedicineRecordById.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					$('#h-time').html(result.data.time_str);
					$('#h-doctor').html(result.data.doctorName);
					$('input[name="time"]').val(result.data.time);
					var ml = result.data.medicationMap;
					var len = ml.length;
					var htmlstr = '';
					for(var drug in ml){
						htmlstr+='<li><a href="javascript:void(0)">'+drug+'</a></li>';
					}   
					$('#medicine_item').html(htmlstr);
					//载入第一个药品
					$('#medicine_item li:eq(0) a').addClass('.active').click();
				}else{
					alert('未找到该条记录！');
					return false;
				}   
			});
		}else{
		    return false;
		}
	});
	//页面载入时载入第一条用药记录
	$('.timeLine li:eq(0) a').click();
});