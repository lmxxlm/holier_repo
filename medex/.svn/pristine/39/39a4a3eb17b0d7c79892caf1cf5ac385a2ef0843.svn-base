$(function(){
    $('#txt').keyup(function(){
	    if($(this).val().length > 36){    
			$(this).val($(this).val().substring(0,36));          
		}else{
			$('.len span').html(36 - $(this).val().length);
		}
	});
	$('#addQotdBtn').click(function(){
		if($('#txt').val()==''){
		    alert('请输入每日一言内容！');
			return false;
		}
		$('#detailDocScheduleModal .modal-body').html($('#txt').val());
	    $('#detailDocScheduleModal').modal();
	});
	//添加
	$('#doSubmit').click(function(){
	    var patientId = $('input[name="patientId"]').val();
		var content = $('#txt').val();
		var token = $('input[name="token"]').val();
		var type = 0;//0 - 文字  1 - 图片
		if(!patientId){
		    alert('未找到当前病人！');
			return false;
		}
		if(!token){
		    alert('页面非法提交！');
			return false;
		}
		if(!content){
		    alert('请输入内容！');
			return false;
		}
		var questURL = runParams.mainUrl+'patient/addQotd.do';
		var questArr = {
			content:content,
			token:token,
			patientId:patientId,
			type:type
		};
		$.post(questURL,questArr,function(result){
		    if(1==result){
				location.reload();
			}else{
				alert('添加失败！');
			}
		})
	});
	//点击删除
	$('.qotdUnit .glyphicon-remove').parent('.btn').click(function(){
		var token = $('input[name="token"]').val();
		var qotdId = $(this).siblings('input[name="qotdId"]').val();
		if(!qotdId){
		    alert('未找到该条记录！');
			return false;
		}
		if(confirm('确定要删除这条记录吗？')){
		    var questArr = {
		    	sweetId:qotdId,
				token:token
			};
			var questURL = runParams.mainUrl+'patient/qotdDelete.do';
			$.post(questURL,questArr,function(result){
				if(1==result){
				    location.reload();;
				}else{
				    alert(result.message);
					return false;
				}
			});
		}
	});
	//获取更多
	$('.getMore').click(function(){
		var time = $(this).children('input[name="lastTime"]').val();//当前载入的最早的时间，用于获取更多
		var patientId = $('input[name="patientId"]').val();
		var type = 0;//0 - 文字  1 - 图片
		if(!time){
		    alert('已经是最早的数据了！');
			return false;
		}
		if(!patientId){
		    alert('未找到当前用户，请重新选择用户！');
			return false;
		}
		var questURL = runParams.mainUrl+'patient/getQotdByTimeLimit10.do';
		var questArr = {
			time:time,
			patientId:patientId,
			type:0
		};
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");
            var htmlstr = '';
			if(1==result.status){
				var len = result.data.length;
				for(var i=0;i<len;i++){
				    var con = result.data[i];
					var publish_str = '';
					if(con.status==1){
						//已发布
					    publish_str = '&nbsp;&nbsp;<a href="javascript:void(0)" class="noLink">[&nbsp;当前发布&nbsp;]</a>';
					}
					htmlstr += '<div class="qotdUnit"><div class="notebook"><p><div class="btn-group btn-group-xs"><a href="#this" class="btn btn-default" title="删除这条记录"><span class="glyphicon glyphicon-remove"></span></a><input type="hidden" name="qotdId" value="'+con.sweetId+'"></div><i class="glyphicon glyphicon-time"></i>&nbsp;&nbsp;'+con.time_str+publish_str+'</p><p><i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;'+con.content+'</p></div></div>';
				}
				$('.getMore').children('input[name="lastTime"]').val(result.lastTime);
				$('.getMore').before(htmlstr);
				if(result.isEnd == 0){ 
				    //已经取完
					$('.getMore').hide();
				}
				var obj = document.getElementById('content');
	            obj.scrollTop=obj.scrollHeight;
			}else{
				$('.getMore').hide();
			}
		});
	});
});