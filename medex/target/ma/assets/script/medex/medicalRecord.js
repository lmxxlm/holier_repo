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
	//换行事件
	$('#addPatientModal textarea[name="content"]').bind('keydown',function(event){
        if(event.keyCode=="13") {
        	var text = $(this).val();
			$(this).val(text);
        }   
    });
	
	/*
	function getMedicalImageList(){
		var targetObj = $('.medicalImageList');
		var id = $('input[name="medicalRecordId"]').val();
		var questURL = runParams.mainUrl+'patient/getMedicalImageListById.do';
		var questArr = {
			medical_recordId:id
		};
		targetObj.html('<a class="virtual_img" href="javascript:void(0)" title="新增影像"><span class="glyphicon glyphicon-plus-sign"></span></a>');
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				for(var i=0;i<result.data.length;i++){
			        targetObj.children('.virtual_img').before('<div class="imgUnit"><a href="'+result.data[i].fileName+'" target="_blank"><img src="'+result.data[i].large+'"></a><a href="javascript:void(0)" class="delete" data-path="'+result.data[i].fileName+'">删除</a></div>');
				}
			}
		});  
	}
	getMedicalImageList();
	
	//点击时间
	$('.timeLine a:not(".getMore")').live('click',function(){
		$('.timeLine a').removeClass('active');
		$(this).addClass('active');
	    var id = $(this).attr('data-id');
		if(id){
		    //从数据库中取出这条数据
			var questArr = {
				medical_recordId:id
			};
			var questURL = runParams.mainUrl+'patient/findMedicalRecordById.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					$('#h-type').html(result.data.type);
					$('#h-record_person').html(result.data.chronicler);
					$('#h-content').html(result.data.htmlContent);
					$('#h-time').html(result.data.time_str);    
					$('input[name="medicalRecordId"]').val(result.data.medical_recordId);
					getMedicalImageList();
				}else{
					alert('未找到该条记录！');
					return false;
				}
			});
		}else{
		    return false;
		}
	});
	*/
	//点击更多
	$('.getMore').click(function(){
		var lastTime = $('input[name="lastTime"]').val();
		var patientId = $('input[name="patientId"]').val();
		if(!patientId){
		    alert('未找到当前的病人！');  
			return false;
		}
		if(lastTime){
		    //根据lastTimeId的值取出后面10条数据
			var questArr = {
				time:lastTime,
				patientId:patientId
			};
			var questURL = runParams.mainUrl+'patient/findMedicalTimeRecordByTime.do';
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					//如果找到了，并且取完后还有数据
					var len = result.data.length;
					var htmlstr = '';
					for(i=0;i<len;i++){
					    htmlstr += '<li><a href="javascript:void(0)" class="alphaHalf"  onFocus="this.blur()" data-id="'+result.data[i].medical_recordId+'">'+result.data[i].time_str_ch+'</a></li>';
					}   
					$('input[name="lastTime"]').val(result.data[len-1].time);
					$(".timeLine li:nth-last-child(2)").after(htmlstr);
					var obj = document.getElementById('timeLine');
	                obj.scrollTop=obj.scrollHeight;
	                $(".alphaHalf").animate({
						   opacity: 1
						},500,function(){
						    $(".alphaHalf").removeClass('alphaHalf');
						});

				}else if(2==result.status){
				    //如果找到了，并且已经取完了
					var len = result.data.length;
					var htmlstr = '';
					for(i=0;i<len;i++){
					    htmlstr += '<li><a href="javascript:void(0)" onFocus="this.blur()"  class="alphaHalf" data-id="'+result.data[i].medical_recordId+'">'+result.data[i].time_str_ch+'</a></li>';
					}
					$(".timeLine li:nth-last-child(2)").after(htmlstr);
					$('.getMore').parent('li').hide(); 
					var obj = document.getElementById('timeLine');
	                obj.scrollTop=obj.scrollHeight;
	                $(".alphaHalf").animate({
						   opacity: 1
						},500,function(){
						    $(".alphaHalf").removeClass('alphaHalf');
						});

				}else{
					$('.getMore').parent('li').hide();
				}
			});
		}
	});
	$('.addRecord').click(function(){
		$('#addPatientModal select[name="type"]').val('住院记录');
		$('#addPatientModal input[name="record_person"]').val($('input[name="defaultRecordPerson"]').val());
	    $('#addPatientModal textarea[name="content"]').val('');
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
	/*
	//点击删除
	$('.recordArea .glyphicon-remove').parent('.btn').click(function(){
		var token = $('input[name="token"]').val();
		var medicalRecordId = $(this).siblings('input[name="medicalRecordId"]').val();
		if(!medicalRecordId){
		    alert('未找到该条记录！');  
			return false;
		}
		if(confirm('确定要删除这条记录吗？')){
		    var questArr = {
		    	medical_recordId:medicalRecordId,
				token:token
			};
			var questURL = runParams.mainUrl+'patient/medicalRecordDelete.do';
			$.post(questURL,questArr,function(result){
				if(1==result){
				    location.reload();
				}else{
				    alert(result.message);
					return false;
				}
			});
		}
	});
	*/
	//点击修改
	$('.recordArea .glyphicon-edit').parent('.btn').click(function(){
	    var medicalRecordId = $(this).siblings('input[name="medicalRecordId"]').val();
		if(!medicalRecordId){
		    alert('未找到该条记录！');
			return false;
		}
		//从数据库中取出这条数据
		var questArr = {
			medical_recordId:medicalRecordId
		};
		var questURL = runParams.mainUrl+'patient/findMedicalRecordById.do';
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				$('#addPatientModal select[name="type"]').val(result.data.type);
				$('#addPatientModal input[name="record_person"]').val(result.data.chronicler);
				$('#addPatientModal textarea[name="content"]').val(result.data.content);
				$('input[name="actionType"]').val('edit');
				$('#addPatientModal').modal(); 
			}else{
				alert('未找到该条记录！');
				return false;
			}
		});
	});
	//添加逻辑
	function doAdd(){
		var type = $('select[name="type"]').val();
		var record_person = $('input[name="record_person"]').val();
		var content = $('textarea[name="content"]').val();
		var token = $('input[name="token"]').val();
		var patientId = $('input[name="patientId"]').val();
		if(!patientId){
		    alert('未找到当前用户，请退出系统重新选择用户！');
			return false;
		}
		if(!token){
		    alert('无效的页面提交，请刷新页面！');
			return false;
		} 
		if(!record_person){
		    alert('请输入记录人！');
			return false;
		}
		if(!content){
		    alert('请输入内容！');
			return false;
		}
	    var questURL = runParams.mainUrl+'patient/medicalRecordAdd.do';
		//时间在后台添加，操作的当前时间，这里不再传至后台
		var questArr = {
			patientId:patientId,
			type:type,
			chronicler:record_person,
			content:content,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.reload();
			}else{
				alert('添加失败！');
				return false;
			}
		});
	};
	function doEdit(){
		var type = $('select[name="type"]').val();
		var record_person = $('input[name="record_person"]').val();
		var content = $('textarea[name="content"]').val();
		var token = $('input[name="token"]').val();
		var patientId = $('input[name="patientId"]').val();
		var id = $('input[name="medicalRecordId"]').val();
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
		if(!record_person){
		    alert('请输入记录人！');
			return false;
		}
		if(!content){
		    alert('请输入内容！');
			return false;
		}
	    var questURL = runParams.mainUrl+'patient/medicalRecordEdit.do';
		//时间在后台添加，操作的当前时间，这里不再传至后台
		var questArr = {
			patientId:patientId,
			medical_recordId:id,
			type:type,
			chronicler:record_person,
			content:content,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.reload(); 
			}else{
				alert('修改失败！');
				return false;
			}
		});
	};
});