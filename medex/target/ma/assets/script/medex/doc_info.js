$(function(){
    $('.selectSimulate .dropdown-menu a').click(function(){
	    var parentObj = $(this).parents('.selectSimulate');
		var fixStr = '<span class="caret"></span>';
		parentObj.children('.selectData').val($(this).attr('data-val'));
		parentObj.children('.dropdown-toggle').html($(this).html()+fixStr);
	});
	$("#save").click(function(){
        var doctorName = $('input[name="doctorName"]').val();
        var type = $('input[name="type"]').val();
		var identityID = $('input[name="identityID"]').val();
		var departPhone = $('input[name="departPhone"]').val();
		var doctorSex = $('input[name="doctorSex"]').val();
		var school = $('input[name="school"]').val();
		var education = $('input[name="education"]').val();
		var doctorPosition = $('input[name="doctorPosition"]').val();
		var doctorTitle = $('select[name="doctorTitle"]').val();
		var telePhone = $('input[name="telePhone"]').val();
		var email = $('input[name="email"]').val();
		var weixinNum = $('input[name="weixinNum"]').val();
		var qqNum = $('input[name="qqNum"]').val();
		var remark = $('textarea[name="remark"]').val();
		var referHospital = $('input[name="referHospital"]').val();
		referHospital = referHospital.replace(/，/g,',');
		var referDepartments = $('input[name="referDepartments"]').val();
		referDepartments = referDepartments.replace(/，/g,',');
		var subreferDepartments = $('input[name="subreferDepartments"]').val();
		subreferDepartments = subreferDepartments.replace(/，/g,',');
		var academicPositions = $('input[name="academicPositions"]').val();
		academicPositions = academicPositions.replace(/，/g,',');
		var specialties = $('input[name="specialties"]').val();
		specialties = specialties.replace(/，/g,',');
		var token = $('input[name="token"]').val();
		var doctorId = $('input[name="doctorId"]').val();
        
		if(!doctorName){
		    alert("请至少填写医生姓名！");
			return false;
		}
		var questURL = runParams.mainUrl+'editDocInfo.do';
		var questArr = {
			name:doctorName,
			type:type,
			identityID:identityID,
			departPhone:departPhone,
			gender:doctorSex,
			school:school,
			education:education,
			doctorPosition:doctorPosition,
			doctorTitle:doctorTitle,
			telePhone:telePhone,
			email:email,
			weixinNum:weixinNum,
			qqNum:qqNum,
			remark:remark,
			referHospital:referHospital,
			referDepartments:referDepartments,
			sub_refer_departments:subreferDepartments,
			academicPositions:academicPositions,
			specialties:specialties,
			token:token,
			accountId:doctorId
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