$(function(){
    $('.selectSimulate .dropdown-menu a').click(function(){
	    var parentObj = $(this).parents('.selectSimulate');
		var fixStr = '<span class="caret"></span>';
		parentObj.children('.selectData').val($(this).attr('data-val'));
		parentObj.children('.dropdown-toggle').html($(this).html()+fixStr);
	});
    $('input[name="birthday"],input[name="timeOfFFD"]').datetimepicker({
        language:  'zh-CN',
		format: 'yyyy-mm-dd',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    }); 
	$("#save").click(function(){
		//人口学
        var patientName = $('input[name="patientName"]').val();
		var patientSex = $('input[name="patientSex"]').val();
		var birthday = $('input[name="birthday"]').val();
		var birthAddr = $('input[name="birthAddr"]').val();
		var country = $('input[name="country"]').val();
		var nationality = $('input[name="nationality"]').val();
		var IdentityId = $('input[name="IdentityId"]').val();
		var residenceAddress = $('input[name="residenceAddress"]').val();
		var education = $('input[name="education"]').val();
		var maritalStatus = $('input[name="maritalStatus"]').val();
        //社会经济学
		var kindOfCensus = $('input[name="kindOfCensus"]').val();
		var address = $('input[name="address"]').val();
		var zipCode = $('input[name="zipCode"]').val();
		var mobilePhone = $('input[name="mobilePhone"]').val();
		var email = $('input[name="email"]').val();
		var typeOfJob = $('input[name="typeOfJob"]').val();
		var workUnit = $('input[name="workUnit"]').val();
		//系统信息
		var weixinNum = $('input[name="weixinNum"]').val();
		var qqNum = $('input[name="qqNum"]').val();
		var timeOfFFD = $('input[name="timeOfFFD"]').val();
		var filingPerson = $('input[name="filingPerson"]').val();
		var filingHospital = $('input[name="filingHospital"]').val();
        var currentHospital = $('input[name="currentHospital"]').val();
		//var responsibilityExpert = $('input[name="responsibilityExpert"]').val();
		//var responsibilityExpertId = $('input[name="responsibilityExpertId"]').val();
		var healthSeneschal = $('input[name="healthSeneschal"]').val();
		var healthSeneschalId = $('input[name="healthSeneschalId"]').val();
		//var responsibilityDoctor = $('input[name="responsibilityDoctor"]').val();
		//var responsibilityDoctorId = $('input[name="responsibilityDoctorId"]').val();
		var currentStatus = $('input[name="currentStatus"]').val();
		var patientLabels = $('input[name="patientLabels"]').val();
		patientLabels = patientLabels.replace(/，/g,',');
		var disease = $('input[name="disease"]').val();
		//亲属信息
		var countOfChildren = $('input[name="countOfChildren"]').val();
		var father = $('input[name="father"]').val();
		var mother = $('input[name="mother"]').val();
		var contactName = $('input[name="contactName"]').val();
		var contactTel = $('input[name="contactTel"]').val();
        //社会保障信息
		var categoryOfMI = $('input[name="categoryOfMI"]').val();
		var numberOfMI = $('input[name="numberOfMI"]').val();
		var numberOfDC = $('input[name="numberOfDC"]').val();
		//基本健康信息
		var bloodType = $('input[name="bloodType"]').val();
		var allergies = $('input[name="allergies"]').val();
		allergies = allergies.replace(/，/g,',');
		var warningRiskFactors = $('input[name="warningRiskFactors"]').val();
		warningRiskFactors = warningRiskFactors.replace(/，/g,',');
		var vaccinationHistory = $('input[name="vaccinationHistory"]').val();
		vaccinationHistory = vaccinationHistory.replace(/，/g,',');
		var diseaseHistory = $('input[name="diseaseHistory"]').val();
		diseaseHistory = diseaseHistory.replace(/，/g,',');
		var GeneticDiseaseHistory = $('input[name="GeneticDiseaseHistory"]').val();
		GeneticDiseaseHistory = GeneticDiseaseHistory.replace(/，/g,',');
		var healthRiskFactors = $('input[name="healthRiskFactors"]').val();
		healthRiskFactors = healthRiskFactors.replace(/，/g,',');
		var disability = $('input[name="disability"]').val();
		var relativesHealthConditions = $('input[name="relativesHealthConditions"]').val();
		
		//日程管理
		var date_of_record = $('input[name="date_of_record"]').val();
		var operation_date = $('input[name="operation_date"]').val();
		var consultation_date = $('input[name="consultation_date"]').val();
		
		var token = $('input[name="token"]').val();
		var patientId = $('input[name="patientId"]').val();
        
		if(!patientName){
		    alert("请至少填写患者姓名！");
			return false;
		}  
		var questURL = runParams.mainUrl+'editPatInfo.do';
		var questArr = {
			name:patientName,
			gender:patientSex,
			birthday:birthday,
			birthAddr:birthAddr,
			country:country,
			nationality:nationality,
			IdentityId:IdentityId,
			residenceAddress:residenceAddress,
			education:education,
			maritalStatus:maritalStatus,
			kindOfCensus:kindOfCensus,
			address:address,
			zipCode:zipCode,
			mobilePhone:mobilePhone,
			email:email,
			typeOfJob:typeOfJob,
			workUnit:workUnit,
			weixinNum:weixinNum,
			qqNum:qqNum,
			timeOfFFD:timeOfFFD,
			filingPerson:filingPerson,
			filingHospital:filingHospital,
			currentHospital:currentHospital,
			healthSeneschal:healthSeneschal,
			healthSeneschalId:healthSeneschalId,
			currentStatus:currentStatus,
			patientLabels:patientLabels,
			disease:disease,
			countOfChildren:countOfChildren,
			father:father,
			mother:mother,
			contactName:contactName,
			contactTel:contactTel,
			categoryOfMI:categoryOfMI,
			numberOfMI:numberOfMI,
			numberOfDC:numberOfDC,
			bloodType:bloodType,
			allergies:allergies,
			warningRiskFactors:warningRiskFactors,
			vaccinationHistory:vaccinationHistory,
			diseaseHistory:diseaseHistory,
			GeneticDiseaseHistory:GeneticDiseaseHistory,
			healthRiskFactors:healthRiskFactors,
			disability:disability,
			relativesHealthConditions:relativesHealthConditions,
			
			date_of_record:date_of_record,
			operation_date:operation_date,
			consultation_date:consultation_date,
			
			token:token,
			accountId:patientId
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert("修改已经保存")
				location.reload();
			}else{
				alert('修改失败！');
				return false;
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