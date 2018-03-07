$(function(){   
		initTime();
	    function initTime(){
	    	var startTime = $('.input-group input[name="startTime"]').val();
	    	var endTime=$('.input-group input[name="endTime"]').val();
	    	if(!startTime){
	    		$('.input-group input[name="startTime"]').val('2015-01-01');
	    	}
	    	if(!endTime){
	    		var d = new Date();
				var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
				$('.input-group input[name="endTime"]').val(str);
	    	}
		}
		$('#searchTime').click(function(){
			initTime();
			var startTime = $('.input-group input[name="startTime"]').val();
			var endTime = $('.input-group input[name="endTime"]').val();
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
			$('#searchForm').submit();
		});
		 $('input[name="startTime"],input[name="endTime"]').datetimepicker({
			  language:'zh-CN',
			  format: 'yyyy-mm-dd',
			  weekStart: 1,
			  todayBtn:  1,
			  autoclose: 1,
			  todayHighlight: 1,
			  forceParse: 0,
			  startView: 2,
			  minView: 2
			  /*pickerPosition:'top-left'  改变弹出框的方向的*/
		  });
		//tab页面跳转页面
		$('.urlConvert').click(function(){
			var link = $(this).attr('data-link');
			location.href=runParams.mainUrl+link;
			$(this).attr('data-link').val('');
		});
		$('.input-group-addon').click(function(){
			initTime();
			$("#searchForm").submit();
		});
	});