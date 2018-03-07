<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=”zh”> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=”zh”> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=”zh”> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=”zh”>
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ include file="commons/runParams.html"%>
<title>MA后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/medex/frame_ad.css" rel="stylesheet">
<link href="assets/css/medex/datetimepickerReview.css" rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
<link href="assets/css/medex/pat_list.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
.mainBody {
	margin-top: 12px;
}

.table td:first-child {
	width: 20%;
	text-align: right;
	padding-right: 12px;
	background: #F5F5F5;
	vertical-align: middle;
}
</style>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<input type="hidden" name="currentUserId" value="${currentUserId}">
	<input type="hidden" name="currentUserType" value="${currentUserType}">
	<div class="container-fluid">
		<!-- leftmenu -->
		<%@ include file="commons/leftMenu_ad.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="commons/topMenu_ad.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a>
				</li>
				<li><a href="#">视频服务</a>
				</li>
				<li><a href="siteListView.html">服务预约列表</a>
				</li>
				<li class="active">创建新服务</li>
			</ol>
			<div class="mainBody">
				<table class="table table-hover">
					<thead>
						<tr>
							<th colspan="2">视频服务预约详情</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>诊室号：</td>
							<td class="meetingId"></td>
						</tr>
						<tr>
							<td>诊室类型：<input type="hidden" name="type" value="" /></td>
							<td class="type"></td>
						</tr>
						<tr>
							<td>固定诊室标题：</td>
							<td class="meetingTopic"></td>
						</tr>
						<tr>
							<td>诊室开始时间：</td>
							<td class="meetingStartTime"></td>
						</tr>
						<tr>
							<td>诊室持续时间：</td>
							<td class="MeetingDuration"></td>
						</tr>
						<tr>
							<td>展示持续时间：</td>
							<td class="showTime"></td>
						</tr>
						<tr>
							<td>固定诊室密码：</td>
							<td class="MeetingOriPwd"></td>
						</tr>
						<tr>
							<td>主持人密码：</td>
							<td class="MeetingHostPwd"></td>
						</tr>
						<tr>
							<td>状态：</td>
							<td class="meetingState"></td>
						</tr>
						<tr class="yhz_doctor">
							<td>与会者--医生：</td>
							<td>
								<div class="smartSearch">
									<input type="hidden" name="doctor_id"   disabled="disabled" value="" /> <input
										type="text" name="doctor_name" class="form-control"
										placeholder="请输入医生姓名" autocomplete="off" value="" readonly/>
									<ul class="searchResultForDoctor">
										<li><a href="javascript:void(0)"></a>
										</li>
									</ul>
								</div></td>
						</tr>
						<tr class="yhz_patient">
							<td>与会者--患者：</td>
							<td>
								<div class="smartSearch">
									<input type="hidden" name="patient_id"   disabled="disabled" value="" /> <input
										type="text" name="patient_name" class="form-control"
										placeholder="请输入患者姓名" autocomplete="off" value="" readonly/>
									<ul class="searchResultForPatient">
										<li><a href="javascript:void(0)"></a>
										</li>
									</ul>
								</div></td>
						</tr>
						<tr class="yhz_ma">
							<td>与会者--主持人(MA)：</td>
							<td>
								<div class="smartSearch">
									<input type="hidden" name="ma_id"   value="" /> <input
										type="text" name="ma_name" class="form-control"
										placeholder="请输入主持人（医助）姓名" autocomplete="off" value="" readonly/>
									<ul class="searchResultForMA">
										<li><a href="javascript:void(0)"></a>
										</li>
									</ul>
								</div></td>
						</tr>
						<tr>
							<td><input type="hidden" value="${token}" name="token" /> <input
								type="hidden" value="${meeting_id}" name="meeting_id" /> <input
								type="hidden" value="" name="meeting_pwd" /> <input
								type="hidden" value="" name="start_time" /> <input
								type="hidden" value="" name="keep_time" />
								<input type="hidden" value="" name="showTime" />
								</td>
							<td><button type="button" class="btn btn-primary bindMeeting" id="save" name="submit">绑定诊室</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script
		src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script
		src="assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
	<script>
	$(function(){
		getMeetingInfo();
		function getMeetingInfo(){
			var meeting_id = $('input[name="meeting_id"]').val();
			if(!meeting_id){
				alert('未找到该诊室。');
				return false;
			}
			var questURL = runParams.mainUrl+'getMeetingInfo.do';
			var questArr = {
					meetingId:meeting_id
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var xmldoc = $.parseXML(result.data);
					var obj = $(xmldoc).find('meetinginfo');
					var meetingId = obj.children('meetingId').text();
					var meetingTopic = obj.children('meetingTopic').text();
					var MeetingOriPwd = obj.children('MeetingOriPwd').text();
					var MeetingHostPwd = obj.children('MeetingHostPwd').text();
					var start_time = obj.children('meetingStartTime').text();
					var meetingState = obj.children('meetingState').text();
					var isMeetingLock = obj.children('isMeetingLock').text();
					var keep_time = obj.children('MeetingDuration').text();
					//特殊处理
					var meetingStartTime = getLocalDate(start_time,3);
					var MeetingDuration = parseInt(keep_time)/60+'分钟';
					switch(meetingState){
					    case '9':meetingState = '已关闭';break;
					    case '2':meetingState = '进行中';break;
					    case '1':meetingState = '预约中';break;
					}
					
					//获取这条绑定记录
                    var questURL = runParams.mainUrl+'findMeetingById.do';
                    var questArr = {
                    	meeting_id:meetingId
                    };
                    $.post(questURL,questArr,function(result){
                    	var patient_name = '',
                    	    patient_id = '',
                    	    doctor_name = '',
                    	    doctor_id = '',
                    	    ma_name = '',
                    	    ma_id = '',
                    	    type = '',
                    	    type_str = '',
                    	    showTime_str = '',
                    	    showTime = '';
                    	if(1==result.status){
                    		patient_name = result.data.patient_name;
                    		patient_id = result.data.patient_id;
                    		doctor_id = result.data.doctor_id;
                    		doctor_name = result.data.doctor_name;
                    		ma_id = result.data.ma_id;
                    		ma_name = result.data.ma_name;
                    		type = result.data.type;
                    		//暂从数据库取数据
                    		var startT = getLocalDate(result.data.start_time/1000,3);
        					var keepT = parseInt(result.data.keep_time)/60+'分钟';
                    		switch(type){
                    		case 'ma':
                    			type_str='健康管家咨询';
                    			$('.type').html(type_str);
                    			$('.yhz_doctor').hide();
                    			$('.yhz_patient').hide();
                    			$('.yhz_ma').show();
                    			break;
                    		case 'doctor':
                    			type_str='名医电视诊室';
                    			$('.type').html(type_str);
                    			$('.yhz_doctor').show();
                    			$('.yhz_patient').show();
                    			$('.yhz_ma').show();
                    			break;
                    		case 'community':
                    			type_str='社区医疗服务诊室';
                    			$('.type').html(type_str);
                    			$('.yhz_doctor').show();
                    			$('.yhz_patient').show();
                    			$('.yhz_ma').show();
                    			break;
                    		}
                    		showTime = result.data.show_time;
                    		showTime_str = parseInt(showTime)/60+'分钟';	
                    	}
						$('.meetingId').html(meetingId);
						$('.meetingTopic').html(meetingTopic);
						$('.MeetingOriPwd').html(MeetingOriPwd);
						$('.MeetingHostPwd').html(MeetingHostPwd);
						$('.meetingStartTime').html(startT);
						$('.meetingState').html(meetingState);
						$('.MeetingDuration').html(keepT);
						$('input[name="patient_id"]').val(patient_id);
						$('input[name="patient_name"]').val(patient_name);
						$('input[name="doctor_id"]').val(doctor_id);
						$('input[name="doctor_name"]').val(doctor_name);
						$('input[name="ma_id"]').val(ma_id);
						$('input[name="ma_name"]').val(ma_name);
						$('input[name="keep_time"]').val(keep_time);
						$('input[name="meeting_pwd"]').val(MeetingOriPwd);
						$('input[name="start_time"]').val(start_time);
						$('input[name="showTime"]').val(showTime);
						$('.showTime').html(showTime_str);
						$('.type').html(type_str);
						$('input[name="type"]').val(type);
                    },'json');
					
				}else{
					alert(result.data);
					return false;
				}
			},'json');
		}
		function getLocalDate(t,type){
			var unixTime = new Date(t*1000);
			var year = unixTime.getFullYear();
			var month = unixTime.getMonth()+1;
			var day = unixTime.getDate();
			var hh = unixTime.getHours();
			var mm = unixTime.getMinutes();
			var ss = unixTime.getSeconds();
			var returnDate;
			switch(type){
				case 2:returnDate = year+'-'+month+'-'+day;break;
				case 3:returnDate = year+'年'+month+'月'+day+'日';break;
				default:returnDate = year+'/'+month+'/'+day;
			}
			returnDate += "&nbsp;"+hh+":"+mm;
			return returnDate;
		}
		//提交绑定
		$('.bindMeeting').live('click',function(){
			var meeting_id = $('input[name="meeting_id"]').val();
			var patient_id = $('input[name="patient_id"]').val();
			var patient_name = $('input[name="patient_name"]').val();
			var doctor_id = $('input[name="doctor_id"]').val();
			var doctor_name = $('input[name="doctor_name"]').val();
			var ma_id = $('input[name="ma_id"]').val();
			var ma_name = $('input[name="ma_name"]').val();
			if(!meeting_id){
				alert('未找到这个诊室！');
				return false;
			}
			switch(type){
			case 'ma':
				if(!ma_id||!ma_name){
					alert('请绑定MA！');
					return false;
				}
				break;
			case 'doctor':
			case 'community':	
				if(!patient_id||!patient_name||!doctor_id||!doctor_name||!ma_id||!ma_name){
					//alert(meeting_id+'||'+meeting_pwd+'||'+patient_id+'||'+patient_name+'||'+doctor_id+'||'+doctor_name+'||'+ma_id+'||'+ma_name+'||'+start_time+'||'+keep_time);
					alert('请绑定医生、患者和MA！');
					return false;
				}
				break;
			default:alert('无效的诊室类型！');return false;
			}
			var questURL = runParams.mainUrl+'updateMeetingAction.do';
			var questArr = {
					meeting_id:meeting_id,
					patient_id:'',
					patient_name:'',
					doctor_id:'',
					doctor_name:'',
					ma_id:'',  
					ma_name:''
			};
			$.post(questURL,questArr,function(result){
				if(result){
					alert('绑定成功！');
                    location.href=runParams.mainUrl+'siteListView.html';
				}else{
					alert('绑定失败！');
				}
				//location.reload();
			},'json')
		});
		//医生智能搜索
		$('.searchResultForDoctor').parent().find('.form-control').live('keyup',function(){
			var obj = $(this);
		    var searchVar = $(this).val();
			var questURL = runParams.mainUrl+'searchDoctorByNameLimit10.do';
			var questArr = {
				searchVar:searchVar
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var con = result.data;
					var htmlstr = '';
					for(var i=0;i<con.length;i++){
					  htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].referHospital+'&nbsp;—&nbsp;'+con[i].referDepartments+'&nbsp;—&nbsp;'+con[i].doctorTitle+'</i></a></li>';
					}
					obj.siblings('.searchResultForDoctor').html(htmlstr).show();
				}else{
					obj.siblings('.searchResultForDoctor').hide();
				}
			});
		});
		$(".searchResultForDoctor li a").live('click',function(){
			var p_obj = $(this).parents('.searchResultForDoctor');
			p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
			p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-docid"));
			p_obj.hide();
		});
		//患者智能搜索
		$('.searchResultForPatient').parent().find('.form-control').live('keyup',function(){
			var obj = $(this);
		    var searchVar = $(this).val();
			var questURL = runParams.mainUrl+'searchPatientByNameLimit10.do';
			var questArr = {
				searchVar:searchVar
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var con = result.data;
					var htmlstr = '';
					for(var i=0;i<con.length;i++){
					  htmlstr += '<li><a href="javascript:void(0)" data-patid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].disease+'&nbsp;—&nbsp;'+con[i].currentStatus+'</a></li>';
					}
					obj.siblings('.searchResultForPatient').html(htmlstr).show();
				}else{
					obj.siblings('.searchResultForPatient').hide();
				}
			});
		});
		$(".searchResultForPatient li a").live('click',function(){
			var p_obj = $(this).parents('.searchResultForPatient');
			p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
			p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-patid"));
			p_obj.hide();
		});
		//MA智能搜索
		$('.searchResultForMA').parent().find('.form-control').live('keyup',function(){
			var obj = $(this);
		    var searchVar = $(this).val();
			var questURL = runParams.mainUrl+'searchMAByNameLimit10.do';
			var questArr = {
				searchVar:searchVar
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var con = result.data;
					var htmlstr = '';
					for(var i=0;i<con.length;i++){
					  htmlstr += '<li><a href="javascript:void(0)" data-maid="'+con[i].ma_id+'"><span>'+con[i].ma_name+'</span></a></li>';
					}
					obj.siblings('.searchResultForMA').html(htmlstr).show();
				}else{
					obj.siblings('.searchResultForMA').hide();
				}
			});
		});
		$(".searchResultForMA li a").live('click',function(){
			var p_obj = $(this).parents('.searchResultForMA');
			p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
			p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-maid"));
			p_obj.hide();
		});
	});
	</script>
</body>
</html>