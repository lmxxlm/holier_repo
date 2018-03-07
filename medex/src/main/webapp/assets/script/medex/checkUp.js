$(function(){
	setRightMenu();
	$(window).resize(setRightMenu);
	$('#content').scroll(function(){
		var st = $(this).scrollTop();
		var dis = $('#menu').css('display');
		if(st>90){
			$('.rightMenu').addClass('fixpos');
		}else{
			$('.rightMenu').removeClass('fixpos');
		}
		if(st>102){
			if(dis=='block'){
				$('.leftMenu').addClass('fixposLeft1');
			}else{
				$('.leftMenu').addClass('fixposLeft2');
			}  
		}else{
			$('.leftMenu').removeClass('fixposLeft1');
			$('.leftMenu').removeClass('fixposLeft2');
		}
	});
	function setLeftMenu(){
		var r_height = 102;
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
	$('#addPatientModal input[name="time"]').datetimepicker({
		language:  'zh-CN',
		format: 'yyyy-mm-dd hh:ii',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0
	});
	//医院智能搜索
	$('input[name="check_hospital"]').keyup(function(){
		var searchVar = $(this).val();
		var questURL = runParams.mainUrl+'searchHospitalByNameLimit10.do';
		var questArr = {
				searchVar:searchVar
		};  
		$.post(questURL,questArr,function(result){  
			if(1==result.status){
				var con = result.data;
				var htmlstr = ''; 
				for(var i=0;i<con.length;i++){
					htmlstr += '<li><a href="javascript:void(0)"><span>'+con[i]+'</span></a></li>';
				}
				$('.searchResult').html(htmlstr).show();
			}else{
				$('.searchResult').hide();
			}
		});
	});  
	$(".searchResult li a").live('click',function(){
		$('input[name="check_hospital"]').val($(this).find("span").html());
		$('.searchResult').hide();
	});  
	$('.addCheckUp').click(function(){
		$('#addPatientModal select[name="category"]').val($('input[name="defaultCategory"]').val());
		$('#addPatientModal input[name="time"]').val('');
		$('#addPatientModal input[name="title"]').val('');
		$('#addPatientModal input[name="check_part"]').val('');
		$('#addPatientModal input[name="check_hospital"]').val($('input[name="currentHospital"]').val());
		$('#addPatientModal input[name="check_person"]').val('');
		$('#addPatientModal textarea[name="check_report"]').val('');
		$('#addPatientModal input[name="actionType"]').val('add');
		$('#addPatientModal').modal();
	});
	$('#doSubmit').click(function(){
		var actionType = $('input[name="actionType"]').val(); 
		if(actionType=='add'){
			doAdd();
		}
		if(actionType=='edit'){
			doEdit();
		}
	});
	//点击更多
	$('.getMore').click(function(){
		var lastTime = $('input[name="lastTime"]').val();
		var patientId = $('input[name="patientId"]').val();
		var category = $('input[name="defaultCategory"]').val();
		if(!patientId){
			alert('未找到当前的病人！');
			return false;
		}
		if(lastTime){
			//根据lastTime的值取出后面10条数据
			var questArr = {
					time:lastTime,
					patientId:patientId,
					category:category
			};
			var questURL = runParams.mainUrl+'patient/findCheckUpListLimit10ByTime.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					//如果找到了，并且取完后还有数据
					var len = result.data.length;  
					var htmlstr = '';
					for(i=0;i<len;i++){
						htmlstr += '<div class="recordUnit">';
						htmlstr +=     '<div class="notebook">';
						htmlstr +=         '<div class="btn-group btn-group-xs leftGroup">';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default active" title="查看文字报告" onFocus="this.blur()">文字报告</a>';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default" title="查看图库" onFocus="this.blur()">检查影像</a>';
						htmlstr +=         '</div>';
						htmlstr +=         '<div class="btn-group btn-group-xs rightGroup">';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default" title="修改这条记录"><span class="glyphicon glyphicon-edit"></span></a>';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default" title="删除这条记录"><span class="glyphicon glyphicon-remove"></span></a>';
						htmlstr +=             '<input type="hidden" name="checkUpId" value="'+result.data[i].check_recordId+'">';
						htmlstr +=         '</div>';
						htmlstr +=         '<p>&nbsp;</p>';
						htmlstr +=         '<p class="title"><strong>'+result.data[i].title+'</strong></p>';
						htmlstr +=         '<p><strong>检查时间：&nbsp;&nbsp;</strong>'+result.data[i].time_str+'</p>';
						htmlstr +=         '<p><strong>检查部位：&nbsp;&nbsp;</strong>'+result.data[i].check_part+'</p>';
						htmlstr +=         '<p><strong>检查医院：&nbsp;&nbsp;</strong>'+result.data[i].check_hospital+'</p>';
						htmlstr +=         '<p><strong>检查人：&nbsp;&nbsp;</strong>'+result.data[i].check_person+'</p>';
						htmlstr +=         '<p><strong>检查报告：&nbsp;&nbsp;</strong></p>';
						htmlstr +=         '<p id="h-content">'+result.data[i].check_report+'</p>';
						htmlstr +=     '</div>';
						htmlstr += '</div>';
					}
					$('input[name="lastTime"]').val(result.data[len-1].time);
					$(".getMore").before(htmlstr);
					var obj = document.getElementById('content');
					obj.scrollTop=obj.scrollHeight;
				}else if(2==result.status){
					//如果找到了，并且已经取完了
					var len = result.data.length;
					var htmlstr = '';
					for(i=0;i<len;i++){
						htmlstr += '<div class="recordUnit">';
						htmlstr +=     '<div class="notebook">';
						htmlstr +=         '<div class="btn-group btn-group-xs leftGroup">';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default active" title="查看文字报告" onFocus="this.blur()">文字报告</a>';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default" title="查看图库" onFocus="this.blur()">检查影像</a>';
						htmlstr +=         '</div>';
						htmlstr +=         '<div class="btn-group btn-group-xs rightGroup">';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default" title="修改这条记录"><span class="glyphicon glyphicon-edit"></span></a>';
						htmlstr +=             '<a href="javascript:void(0)" class="btn btn-default" title="删除这条记录"><span class="glyphicon glyphicon-remove"></span></a>';
						htmlstr +=             '<input type="hidden" name="checkUpId" value="'+result.data[i].check_recordId+'">';
						htmlstr +=         '</div>';
						htmlstr +=         '<p>&nbsp;</p>';
						htmlstr +=         '<p class="title"><strong>'+result.data[i].title+'</strong></p>';
						htmlstr +=         '<p><strong>检查时间：&nbsp;&nbsp;</strong>'+result.data[i].time_str+'</p>';
						htmlstr +=         '<p><strong>检查部位：&nbsp;&nbsp;</strong>'+result.data[i].check_part+'</p>';
						htmlstr +=         '<p><strong>检查医院：&nbsp;&nbsp;</strong>'+result.data[i].check_hospital+'</p>';
						htmlstr +=         '<p><strong>检查人：&nbsp;&nbsp;</strong>'+result.data[i].check_person+'</p>';
						htmlstr +=         '<p><strong>检查报告：&nbsp;&nbsp;</strong></p>';
						htmlstr +=         '<p id="h-content">'+result.data[i].check_report+'</p>';
						htmlstr +=     '</div>';
						htmlstr += '</div>';
					}  
					$('input[name="lastTime"]').val(result.data[len-1].time);
					$(".getMore").before(htmlstr);
					$('.getMore').hide();
					var obj = document.getElementById('content');
					obj.scrollTop=obj.scrollHeight;
				}else{
					$('.getMore').hide();
				}
			});
		}
	});
	//点击删除
	$('.recordUnit .glyphicon-remove').parent('.btn').click(function(){
		var token = $('input[name="token"]').val();
		var checkUpId = $(this).siblings('input[name="checkUpId"]').val();
		var patientId = $('input[name="patientId"]').val();
		var category = $('input[name="defaultCategory"]').val();
		if(!checkUpId){
			alert('未找到该条记录！');
			return false;
		}
		if(confirm('确定要删除这条记录吗？')){
			var questArr = {  
					check_recordId:checkUpId,
					token:token
			};
			var questURL = runParams.mainUrl+'patient/checkUpDelete.do';
			$.post(questURL,questArr,function(result){
				if(1==result){
					location.href=runParams.mainUrl+'patient/checkRecord.html?patientId='+patientId+'&category='+category;
				}else{
					alert(result.message);
					return false;
				}
			});
		}
	});
	//点击修改
	$('.recordUnit .glyphicon-edit').parent('.btn').click(function(){
		var checkUpId = $(this).siblings('input[name="checkUpId"]').val();
		if(!checkUpId){   
			alert('未找到该条记录！');
			return false;
		}  
		//从数据库中取出这条数据
		var questArr = {
				check_recordId:checkUpId  
		};
		var questURL = runParams.mainUrl+'patient/findcheckUpById.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				$('#addPatientModal input[name="t_checkUpId"]').val(result.data.check_recordId);
				$('#addPatientModal select[name="category"]').val(result.data.category);
				$('#addPatientModal input[name="time"]').val(result.data.time_str);
				$('#addPatientModal input[name="title"]').val(result.data.title);
				$('#addPatientModal input[name="check_part"]').val(result.data.check_part);
				$('#addPatientModal input[name="check_hospital"]').val(result.data.check_hospital);
				$('#addPatientModal input[name="check_person"]').val(result.data.check_person);
				$('#addPatientModal textarea[name="check_report"]').val(result.data.check_report);
				$('#addPatientModal input[name="actionType"]').val('edit');
				$('#addPatientModal').modal();
			}else{
				alert('未找到该条记录！');
				return false;
			}
		});
	});
	//添加逻辑
	function doAdd(){
		var category = $('#addPatientModal select[name="category"]').val();
		var time = $('#addPatientModal input[name="time"]').val();
		var title = $('#addPatientModal input[name="title"]').val();
		var check_part = $('#addPatientModal input[name="check_part"]').val();
		var check_hospital = $('#addPatientModal input[name="check_hospital"]').val();
		var check_person = $('#addPatientModal input[name="check_person"]').val();
		var check_report = $('#addPatientModal textarea[name="check_report"]').val();
		var patientId = $('input[name="patientId"]').val();
		var token = $('input[name="token"]').val();
		if(!patientId){
			alert('未找到当前用户，请退出系统重新选择用户！');
			return false; 
		}
		if(!token){
			alert('无效的页面提交，请刷新页面！');
			return false;
		} 
		if(!time){ 
			alert('请输入检查时间！');
			return false;
		}
		if(!title){
			alert('请输入检查单标题！');
			return false;
		}
		if(!check_report){
			alert('请输入检查报告！');
			return false;
		}
		var questURL = runParams.mainUrl+'patient/checkUpAdd.do';
		//时间在后台添加，操作的当前时间，这里不再传至后台
		var questArr = {   
				patientId:patientId,  
				category:category,   
				time_str:time,
				title:title,
				check_part:check_part,  
				check_hospital:check_hospital,
				check_person:check_person,
				check_report:check_report,  
				token:token
		}; 
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.href=runParams.mainUrl+'patient/checkRecord.html?patientId='+patientId+'&category='+category;
			}else{ 
				alert('添加失败！');  
				return false; 
			}
		});
	};
	//修改逻辑
	function doEdit(){
		var category = $('#addPatientModal select[name="category"]').val();
		var time = $('#addPatientModal input[name="time"]').val();
		var title = $('#addPatientModal input[name="title"]').val();
		var check_part = $('#addPatientModal input[name="check_part"]').val();
		var check_hospital = $('#addPatientModal input[name="check_hospital"]').val();
		var check_person = $('#addPatientModal input[name="check_person"]').val();
		var check_report = $('#addPatientModal textarea[name="check_report"]').val();
		var patientId = $('input[name="patientId"]').val();
		var token = $('input[name="token"]').val();
		var id = $('input[name="t_checkUpId"]').val();
		if(!id){
			alert('未找到该条记录！');
			return false;
		}
		if(!patientId){
			alert('未找到当前用户，请退出系统重新选择用户！');
			return false;
		}
		if(!token){
			alert('无效的页面提交，请刷新页面！');
			return false;
		}
		if(!time){
			alert('请输入检查时间！');
			return false;
		}
		if(!title){
			alert('请输入检查单标题！');
			return false;
		}
		if(!check_report){
			alert('请输入检查报告！');
			return false;
		}
		var questURL = runParams.mainUrl+'patient/checkUpEdit.do';
		//时间在后台添加，操作的当前时间，这里不再传至后台
		var questArr = {
				patientId:patientId,
				category:category,
				time_str:time,
				title:title,
				check_part:check_part,
				check_hospital:check_hospital,
				check_person:check_person,
				check_report:check_report,
				token:token,
				check_recordId:id
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.href=runParams.mainUrl+'patient/checkRecord.html?patientId='+patientId+'&category='+category;
			}else{
				alert('修改失败！');
				return false;
			}
		});
	};

	
})