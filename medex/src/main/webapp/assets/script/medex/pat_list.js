$(function(){
	var docId = $('input[name="docId"]').val();
    $('input[name="searchPat"]').keyup(function(){
	    var searchVar = $(this).val();
		var questURL = runParams.mainUrl+'searchPatByDocIdLimit10.do';
		var questArr = {
			doctorId:docId,
			searchVar:searchVar
		};
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
				  htmlstr += '<li><a href="javascript:void(0)"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].disease+'&nbsp;—&nbsp;'+con[i].currentStatus+'</a></li>';
				}
				$('.searchResult').html(htmlstr).show();
			}else{
				$('.searchResult').hide();
			}
		});
	});
    $('input[name="patientName"]').keyup(function(){
	    var searchVar = $(this).val();
		var questURL = runParams.mainUrl+'searchPatExceptDocIdLimit10.do';
		var questArr = { 
			doctorId:docId,
			searchVar:searchVar
		};
		$.post(questURL,questArr,function(result){
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
				  htmlstr += '<li><a href="javascript:void(0)"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].disease+'&nbsp;—&nbsp;'+con[i].currentStatus+'&nbsp;—&nbsp;<i>'+con[i].accountId+'</i></a></li>';
				}
				$('.searchResultForAdd').html(htmlstr).show();
			}else{
				$('.searchResultForAdd').hide();
			}
		});
	});
	$(".searchResult li a").live('click',function(){
	    $('input[name="searchPat"]').val($(this).find("span").html());
		$('.searchResult').hide();
	});
	$(".searchResultForAdd li a").live('click',function(){
		var patName = $(this).find("span").html();
		var patId = $(this).find("i").html();
	    $('input[name="patientName"]').val(patName);
		$('input[name="patId"]').val(patId);
		$('.searchResultForAdd').hide();
		$(".patInfo").html("正在定位该患者，请稍后...");
		var questURL = runParams.mainUrl+'searchPatByPatId.do';
		var questArr = {
			patientId:patId
		};
		$.get(questURL,questArr,function(result){
			if(1==result.status){
				var con = result.data;
				var htmlstr = '';
				var htmlstr = '<p>姓名：<span>'+con.name+'</span></p><p>性别：<span>'+con.gender+'</span></p><p>疾病：<span>'+con.disease+'</span></p><p>状态：<span>'+con.currentStatus+'</span></p><p>建档医院：<span>'+con.filingHospital+'</span></p><p>当前医院：<span>'+con.currentHospital+'</span></p><p>责任专家：<span>'+con.responsibilityExpert+'</span></p><p>责任医生：<span>'+con.responsibilityDoctor+'</span></p>';
				$(".patInfo").html(htmlstr);
			}else{
				$(".patInfo").html("没有找到这个患者。");  
			}
		});
	});
	$('.searchBar .input-group-addon').click(function(){
	    var searchVar = $('input[name="searchPat"]').val();
		var token = $('input[name="token"]').val();
		if(!docId){
		    alert("当前的医生账号已退出登录");
			return false;
		}
		if(!searchVar){
		    alert("请输入患者的名字");
			return false;
		}
		if(!token){
		    alert("非法提交！");
			return false;
		}
		$("#searchPatForm").submit();
	});
	$('#addPatSubmit').click(function(){
		var patId = $('input[name="patId"]').val();
		var token = $('input[name="tokenForAdd"]').val();
		var docId = $('input[name="docId"]').val();
		if(!patId){
		    alert("未选择患者！");
			return false;
		}
		if(!token){
		    alert("非法提交！");
			return false;
		}
		var questURL = runParams.mainUrl+'addPatByPatId.do';
		var questArr = {
			patientId:patId,
			token:token,
			doctorId:docId
		};   
		$.post(questURL,questArr,function(result){
			if(1==result){   
				//location.reload();  
				location.href = runParams.mainUrl+"doctor/pat_list?doctorId="+docId;
			}else{
				$(".patInfo").html("没有找到这个患者。");
			}
		});
	});
	$(".deletePat").click(function(){
		var name = $(this).attr('data-name');
		var docId = $('input[name="docId"]').val();
		var token = $('input[name="token"]').val();
		var id = $(this).attr('data-id');
	    if(confirm('确定要把患者“'+name+'"从列表中删除吗？')){
			var questURL = runParams.mainUrl+'doPatDeleteAction.do';
			var questArr = {
					doctorId:docId,
					token:token,
					patientId:id
					};
			$.post(questURL,questArr,function(result){
				if(1==result){
					alert('删除成功！');
					location.href = runParams.mainUrl+"doctor/pat_list?doctorId="+docId;
				}else{
					alert('删除失败！');
					return false;
				}
			});
		}
	});

});