$(function(){
	$('.selectSimulate .dropdown-menu a').click(function(){
		var parentObj = $(this).parents('.selectSimulate');
		var fixStr = '<span class="caret"></span>';
		parentObj.children('.selectData').val($(this).attr('data-val'));
		parentObj.children('.dropdown-toggle').html($(this).html()+fixStr);
	});
	$("#save").click(function(){
		var searchType = $('input[name="searchType"]').val();
		var searchText = $('input[name="searchText"]').val();
		var token = $('input[name="token"]').val();

		if(!searchText){
			alert("请输入搜索内容！");
			return false;
		}
		if(!searchType){
			alert("请选择搜索类别！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		$("#searchForm").submit();
	});
	$("#addDoc").click(function(){
		var doctorId = $('input[name="doctorId"]').val();
		var type = $('select[name="type"]').val();
		var doctorName = $('input[name="doctorName"]').val();
		var doctorSex = $('input[name="doctorSex"]').val();
		var referHospital = $('input[name="referHospital"]').val();
		referHospital = referHospital.replace(/，/g,',');
		var referDepartments = $('input[name="referDepartments"]').val();
		referDepartments = referDepartments.replace(/，/g,',');
		var subreferDepartments = $('input[name="subreferDepartments"]').val();
		subreferDepartments = subreferDepartments.replace(/，/g,',');
		var token = $('input[name="token"]').val();

		var defaultPass = '123456';
		var password = hex_md5(doctorName+defaultPass);

		if(!doctorId){
			alert("请填写用户Id！");
			return false;
		}
//		var re = /^1\d{10}$/;
//		if (!re.test(doctorId)) {
//			alert("医生的ID必须是正确格式的手机号码！");
//			return false;
//		}
		if(isNaN(doctorId)){
			alert("用户id必须是数字！");
			return false;
		}

		if(!doctorName){
			alert("请至少填写医生姓名！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		//验证doctorId的唯一性
		var questURL = runParams.mainUrl+'validDoctorId.do';
		var questArr = {
				type:type,
				doctorId:doctorId
		};      
		$.post(questURL,questArr,function(result){
			if(0==result){  
				//id重复
				alert("该医生Id已存在！请重新添加。");
				return false;
			}else{
				var questURL = runParams.mainUrl+'addDocInfo.do';
				var questArr = {
						name:doctorName,
						gender:doctorSex,
						referHospital:referHospital,
						referDepartments:referDepartments,
						sub_refer_departments:subreferDepartments,
						token:token,
						type:type,
						telePhone:doctorId,
						accountId:doctorId
				};
				$.post(questURL,questArr,function(result){
					if(1==result){
						alert("医生已添加！")
						location.href="chooseAccountDoc.html";
					}else{
						alert('添加失败！');
						return false;
					}
				});
			}
		});
	});
	$("#addPat").click(function(){
		var patientId = $('input[name="patientId"]').val();
		var patientName = $('input[name="patientName"]').val();
		var patientSex = $('input[name="patientSex"]').val();
		var filingHospital = $('input[name="filingHospital"]').val();
		var currentHospital = $('input[name="currentHospital"]').val();
		var token = $('input[name="token"]').val();

		var defaultPass = '123456';
		var password = hex_md5(patientName+defaultPass);

		if(!patientId){
			alert("请填写用户Id！");
			return false;
		}
		
		var re = /^1\d{10}$/;
		if (!re.test(patientId)) {
			alert("患者的ID必须是正确格式的手机号码！");
			return false;
		}

		if(!patientName){
			alert("请至少填写患者姓名！");
			return false;
		}
		if(!token){
			alert("非法提交！");
			return false;
		}
		//验证patientId的唯一性
		var questURL = runParams.mainUrl+'validPatientId.do';
		var questArr = {
				patientId:patientId
		};
		$.post(questURL,questArr,function(result){
			if(0==result){
				//id重复
				alert("该患者Id已存在！请重新添加。");
				return false;
			}else{
				var questURL = runParams.mainUrl+'addPatInfo.do';
				var questArr = {
						name:patientName,
						gender:patientSex,
						filingHospital:filingHospital,
						currentHospital:currentHospital,
						token:token,
						mobilePhone:patientId,
						accountId:patientId
				};   
				$.post(questURL,questArr,function(result){
					if(1==result){
						alert("患者已添加！")
						location.href="chooseAccountPat.html";
					}else{
						alert('添加失败！');
						return false;
					}
				});
			}     
		});
	});
	//医院智能搜索
	$('.searchResultForHospital').siblings('input').keyup(function(){
		var obj = $(this);
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
				obj.siblings('.searchResultForHospital').html(htmlstr).show();
			}else{
				obj.siblings('.searchResultForHospital').hide();
			}
		});
	});
	$(".searchResultForHospital li a").live('click',function(){
		$(this).parents('.searchResultForHospital').siblings('input').val($(this).find("span").html());
		$(this).parents('.searchResultForHospital').hide();
	});
});