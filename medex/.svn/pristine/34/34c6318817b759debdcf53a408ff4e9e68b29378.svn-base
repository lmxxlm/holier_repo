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
	$('input[name="checkoutTime"]').datetimepicker({
        language:  'zh-CN',
		format: 'yyyy-mm-dd hh:ii',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0,
		todayBtn:  1
    });
	//点击第一大类
	$('.level1 a').click(function(){
		$(this).siblings('a').removeClass('active');
		$(this).addClass('active');	
		var level1 = $(this).html();
		var questURL = runParams.mainUrl+'patient/getLevel2TestnormFromLevel1.do';
		var questArr = {
			searchVar:level1
		};
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				var htmlstr = '';  
				for(var i=0;i<result.data.length;i++){
				  htmlstr += '<a href="Javascript:void(0)">'+result.data[i]+'</a>';
				}
				$('.level2').html(htmlstr);	
				$('.level3').html('请先选择第二大类');	
			}else{
				alert('未找到第二大类！');
			}
		});  
	});
	//点击第二大类
	$('.level2 a').live('click',function(){
		$(this).siblings('a').removeClass('active');
		$(this).addClass('active');
		var level2 = $(this).html();
		var questURL = runParams.mainUrl+'patient/getLevel3TestnormFromLevel2.do';
		var questArr = {
			searchVar:level2
		};
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				var htmlstr = '';
				for(var i=0;i<result.data.length;i++){
				  htmlstr += '<a href="Javascript:void(0)">'+result.data[i]+'</a>';
				}
				$('.level3').html(htmlstr);	
			}else{
				alert('未找到这个分类下的检验单！');
			}
		});  
	});
	//点击第三大类
	$('.level3 a').live('click',function(){
		$(this).siblings('a').removeClass('active');
		$(this).addClass('active');
		var level3 = $(this).html();
		$('#currentSheet').html(level3);
		$('input[name="checkoutTime"]').val('');
		$('.loading').show();
		var questURL = runParams.mainUrl+'patient/getTestnormListByLevel3.do';
		var questArr = {
			searchVar:level3
		}; 
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
			if(1==result.status){
				var id = result.data.id;//检验指标的id
				var name = result.data.name;//检验指标的名字
				var units = result.data.units;//检验指标的单位
				var standard = result.data.standard;//检验指标标准值
				var type = result.data.type;//定性还是定量
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
					 formhtmlstr += '<li class="'+style+'"><select class="form-control"><option>阴性</option><option>阳性</option></select><span>'+id[i]+'</span></li>';
				  }else{
					 formhtmlstr += '<li class="'+style+'"><input type="text" name="" class="form-control"><span>'+id[i]+'</span></li>';
				  }
				}
				$('.sheet .index').html(namehtmlstr);
				$('.sheet .unit').html(unitshtmlstr);
				$('.sheet .standard').html(standardhtmlstr);
				$('.sheet .formArea').html(formhtmlstr);
				$('#sheetBody').show();
				$("#menu,#content").getNiceScroll().resize();
			}else{
				alert('未找到这张检验单！');
			}
			$('.loading').hide();
		});  
	});
	//提交表单
	$('.addCheckout').click(function(){
	    var patientId = $('input[name="patientId"]').val();
		var token = $('input[name="token"]').val();
		var level3 = $('#currentSheet').html();
		var checkoutTime = $('input[name="checkoutTime"]').val();
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
		var questURL = runParams.mainUrl+'patient/addCheckout.do';
		$.post(questURL,questArr,function(result){
			if(1==result){
				location.href=runParams.mainUrl+'patient/checkReport.html?patientId='+patientId;
			}else{
				alert('添加失败！');  
			}
		});
	});
});