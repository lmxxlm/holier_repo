$(function(){
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
    function setRightMenu(){
	    var r_height = $(window).height()-90;
		r_height = r_height>400?r_height:400;
		var a_height = r_height/8;
		var paddingTop = (a_height-50)/2;
		$('.rightMenu').height(r_height);
		$('.rightMenu a').height(a_height);
		$('.rightMenu a i').css('paddingTop',paddingTop);	
	}
	$('.getMore').each(function(){
        var h = $(this).siblings('.recordUnit').height()-4;
		$(this).height(h);
		$(this).css('lineHeight',h+'px');
    });
	$('.addCheckout').click(function(){
		var patientId = $('input[name="patientId"]').val();
	    location.href='checkReportAdd.html?patientId='+patientId;
	});
	$('.recordUnit').live('mouseover',function(){
	    $(this).find('.edit').show();
        $(this).find('.delete').show();
	}); 
	$('.recordUnit').live('mouseout',function(){
	    $(this).find('.edit').hide();
        $(this).find('.delete').hide();
	});
	//点击第一大类
	$('.leftMenu').children('a').click(function(){
		var obj = $(this).next('.subtitle');
		if(obj.css('display')=='none'){
			$('.leftMenu .subtitle').slideUp(200);
			$(this).siblings('a').children('.icon-minus-symbol').attr('class','icon-add-symbol');
			$(this).siblings('a').removeClass('active');
			
			obj.slideDown(200,function(){
		    	$("#menu,#content").getNiceScroll().resize();
		    });
			$(this).children('.icon-add-symbol').attr('class','icon-minus-symbol');
			$(this).addClass('active');
		}else{
		    obj.slideUp(200);
			$(this).children('.icon-minus-symbol').attr('class','icon-add-symbol');
			$(this).removeClass('active');
		}
	});
	//获取更多
	$('.getMore').click(function(){
	    var level3 = $(this).siblings('input[name="testName"]').val();//检验单的名字
		var time = $(this).siblings('input[name="lastTime"]').val();//当前载入的最早的时间，用于获取更多
		var patientId = $('input[name="patientId"]').val();
        if(!level3){
		    alert('未找到这张检验单！');
			return false;
		}
		if(!time){
		    alert('已经是最早的数据了！');
			return false;
		}
		if(!patientId){
		    alert('未找到当前用户，请重新选择用户！');
			return false;
		}
		var questURL = runParams.mainUrl+'patient/getUserTestListByTimeAndNameLimit5.do';
		var questArr = {
			thirdName:level3,
			lastTime:time,
			patientId:patientId
		};
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
            var htmlstr = '';
			if(1==result.status){
				var len = 0;
				for(var time in result.data.valueMap){
					len++;
					var datalist = result.data.valueMap[time];
					htmlstr += '<ul class="recordUnit"><li class="title"><span>'+time+'</span><a href="javascript:void(0)" class="edit glyphicon glyphicon-edit" title="修改"></a><a href="javascript:void(0)" class="delete glyphicon glyphicon-remove" title="删除"></a></li>';
					for(var k=0;k<datalist.length;k++){
						var style = '';
						if(k%2!=0) style="odd";
						if(datalist[k].rv_type==1){
							//定量
						    if(datalist[k].status==1){
							    //偏高
								htmlstr += '<li class="'+style+'"><a href="javascript:void(0)" class="up">'+datalist[k].value+'&nbsp;<span class="glyphicon glyphicon-arrow-up"></span></a></li>';
							}else if(datalist[k].status==-1){
							    //偏低
								htmlstr += '<li class="'+style+'"><a href="javascript:void(0)" class="down">'+datalist[k].value+'&nbsp;<span class="glyphicon glyphicon-arrow-down"></span></a></li>';
							}else{
							    //正常
								htmlstr += '<li class="'+style+'"><a href="javascript:void(0)">'+datalist[k].value+'</a></li>'; 
							}
						}else{
							//定性
						    if(datalist[k].status==false){
							    //不正常
								htmlstr += '<li class="'+style+'"><a href="javascript:void(0)" class="up">'+datalist[k].value+'</a></li>';
							}else{
							    //正常
								htmlstr += '<li class="'+style+'"><a href="javascript:void(0)">'+datalist[k].value+'</a></li>'; 
							}
						}
						
					}
					htmlstr += '</ul>';
				}
				var obj = $('input[name="testName"][value="'+level3+'"]');
				obj.siblings('input[name="lastTime"]').val(result.data.lastTime);
				var widthstr = len*120;
				$('.recordUnitWrap').width($('.recordUnitWrap').width()+widthstr);
				obj.siblings('.getMore').before(htmlstr);
				if(result.isEnd == 0){
				    //已经取完
					obj.siblings('.getMore').hide();
				}
			}else{
				var obj = $('input[name="testName"][value="'+level3+'"]');
				obj.siblings('.getMore').hide();
			}
		});
	});
	//点击删除
	$('.recordUnit .glyphicon-remove').click(function(){
		var token = $('input[name="token"]').val();
		var level3 = $(this).parents('.recordUnit').siblings('input[name="testName"]').val();
		var checkoutTime = $(this).siblings('span').html();
		var patientId = $('input[name="patientId"]').val();
		if(!patientId){
		    alert('未找到当前病人！');
			return false;
		}
		if(!token){
		    alert('页面非法提交！');
			return false;
		}
		if(!level3){
		    alert('未找到当前检验单！');
			return false;
		}
		if(!checkoutTime){
		    alert('未找到当前时间的检验单！');
			return false;
		}
		if(confirm('确定要删除这条记录吗？')){
		    var questArr = {
				thirdName:level3,
				time:checkoutTime,
				patientId:patientId,
				token:token
			};
			var questURL = runParams.mainUrl+'patient/checkoutDelete.do';
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
	//点击修改
	$('.recordUnit .glyphicon-edit').live('click',function(){
		var level3 = $(this).parents('.recordUnit').siblings('input[name="testName"]').val();
		var time = $(this).siblings('span').html();
		var patientId = $('input[name="patientId"]').val();
		$('#currentTime').html(time);
		$('#currentTest').html(level3);
		$('input[name="currentTime"]').val(time);
		$('input[name="currentSheet"]').val(level3);
		$('.loading').show();
        $('#addPatientModal').modal();
		
		var questURL = runParams.mainUrl+'patient/getTestnormListForUserByTime.do';
		var questArr = {
			thirdName:level3,//第三类（检验单）名字
			time:time,    //检验时间
			patientId:patientId
		};    
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				var id = result.data.id;//检验指标的id
				var name = result.data.name;//检验指标的名字
				var units = result.data.units;//检验指标的单位
				var standard = result.data.standard;//检验指标标准值
				var type = result.data.type;//定性还是定量
				var userdata = result.data.userdata;//用户数据
				var namehtmlstr = '<li class="title">'+level3+'</li>';
				var unitshtmlstr = '<li class="title">单位</li>';
				var standardhtmlstr = '<li class="title">正常值</li>';
				var formhtmlstr = '<li class="title">用户检验数据</li>';
				for(var i=0;i<name.length;i++){
				  var style = '';
				  if(i%2!=0) style="odd";
				  namehtmlstr += '<li class="'+style+'">'+name[i]+'</li>';
				  unitshtmlstr += '<li class="'+style+'">'+units[i]+'</li>';
				  standardhtmlstr += '<li class="'+style+'">'+standard[i]+'</li>';
				  if(type[i]==2){
					 if(userdata[i]=='阳性'){
					     formhtmlstr += '<li class="'+style+'"><select class="form-control"><option>阴性</option><option selected>阳性</option></select><span>'+id[i]+'</span></li>';
					 }else{
						 formhtmlstr += '<li class="'+style+'"><select class="form-control"><option selected>阴性</option><option>阳性</option></select><span>'+id[i]+'</span></li>';
					 } 
				  }else{
					 formhtmlstr += '<li class="'+style+'"><input type="text" name="" value="'+userdata[i]+'" class="form-control"><span>'+id[i]+'</span></li>';
				  }
				}
				$('.sheet .index').html(namehtmlstr);
				$('.sheet .unit').html(unitshtmlstr);
				$('.sheet .standard').html(standardhtmlstr);
				$('.sheet .formArea').html(formhtmlstr);
				$('.sheet').show();
			}else{
				alert('检验单载入出错！');
			}
			$('.loading').hide();
		});
	});
	//提交表单
	$('#doSubmit').click(function(){
	    var patientId = $('input[name="patientId"]').val();
		var token = $('input[name="token"]').val();
		var checkoutTime = $('input[name="currentTime"]').val();
		var level3 = $('input[name="currentSheet"]').val();
		var checkoutJsonData = [];
		if(!patientId){
		    alert('未找到当前病人！');
			return false;
		}
		if(!token){
		    alert('页面非法提交！');
			return false;
		}
		if(!level3){
		    alert('未找到当前检验单！');
			return false;
		}
		if(!checkoutTime){
		    alert('请填写检验时间！');
			return false;
		}
		var questArr = {
			patientId:patientId,
			token:token,
			thirdName:level3,
			checkoutTime:checkoutTime,
			checkoutData:''
		};
		$('.formArea .form-control').each(function(){	
		    var value = $(this).val();
			var key = $(this).next('span').html();
			var checkoutArr = {
				"value":value,
				"key":key
			}
			checkoutJsonData.push(checkoutArr);
		});
        questArr.checkoutData = JSON.stringify(checkoutJsonData);
		var questURL = runParams.mainUrl+'patient/editCheckout.do';
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.reload();
			}else{
				alert('修改失败！');
			}
		});
	});
})