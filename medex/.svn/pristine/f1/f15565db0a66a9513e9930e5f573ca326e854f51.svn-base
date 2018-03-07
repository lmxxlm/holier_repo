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
	margin-top: 0;
}

#productStatus {
	margin: 12px;
	margin-bottom: 0;
}

.nav-tabs>li>a {
	background: #dedede;
}

.table td:first-child {
	width: 20%;
	text-align: right;
	padding-right: 12px;
	background: #F5F5F5;
	vertical-align: middle;
}

.dateInput {
	cursor: pointer !important;
}

textarea {
	padding: 5px !important;
	line-height: 25px;
}

.oriMeeting {
	display: none;
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
				<li><a href="#">诊室</a>
				</li>
				<li class="active">创建新服务</li>
			</ol>
			<ul id="productStatus" class="nav nav-tabs">
				<li><a href="createConferenceView.html" onfocus="this.blur()">创建新诊室</a></li>
				<li class="active"><a href="javascript:void(0)" onfocus="this.blur()">绑定诊室</a></li>
			</ul>
			<div class="mainBody">
				<table class="table table-hover">
					<thead>
						<tr>
							<th colspan="2"><span class="glyphicon glyphicon-arrow-right"></span>&nbsp;&nbsp;<a href="http://121.40.154.6/" target="_blank">创建临时诊室</a>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>*&nbsp;诊室号：</td>
							<td><input name="meeting_id" type="text" class="form-control" style="width: 200px; float: left;"
								placeholder="请输入 诊室号后按获取按钮" />
							<button type="button" class="btn btn-primary checkMeetingId" style="float: left; margin-left: 10px;">获取诊室数据</button>
								<span class="checkVal" style="float: left; margin-left: 10px; margin-top: 8px;"></span><input type="hidden" value="" name="validId">
							</td>
						</tr>
						<tr class="oriMeeting">
							<td>*&nbsp;固定诊室标题：</td>
							<td><input name="meetingTopic" type="text" class="form-control" placeholder="请输入 固定诊室标题" />
							</td>
						</tr>
						<tr class="oriMeeting">
							<td>*&nbsp;固定诊室密码：</td>
							<td><input name="meetingPwd" type="text" class="form-control" placeholder="密码只能是数字" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
							</td>
						</tr>
						<tr class="oriMeeting">
							<td>*&nbsp;诊室持续时间：</td>
							<td><input name="meetingDuration" type="text" class="form-control" placeholder="几分钟" style="width: 100px; float: left;" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /><span
								style="float: left; margin-left: 10px; margin-top: 8px;">分钟</span>
							</td>
						</tr>
						<tr class="oriMeeting">
							<td>*&nbsp;预约开始时间：</td>
							<td><input name="meetingStartTime" type="text"  class="form-control dateInput" placeholder="请选择时间" readonly />
							</td>
						</tr>
						<tr class="oriMeeting">
							<td>*&nbsp;主持人密码：</td>
							<td><input name="hostPwd" type="text" class="form-control" placeholder="只能是数字组合" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
							</td>
						</tr>
						<tr>
							<td>*&nbsp;服务场景：</td>
							<td><select name="type" class="form-control">
							        <option value="doctor">名医电视诊室</option>
									<option value="community">社区医疗服务诊室</option>
									<option value="ma" selected>健康管家咨询</option>
							</select>
							</td>
						</tr>
						<tr class="yhz_doctor">
							<td>*&nbsp;与会者--医生：</td>
							<td>
								<div class="smartSearch">
									<input type="hidden" name="doctor_id" value="" /> <input type="text" name="doctor_name" class="form-control"
										placeholder="请输入医生姓名" autocomplete="off" value="" />
									<ul class="searchResultForDoctor">
										<li><a href="javascript:void(0)"></a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr class="yhz_patient">
							<td>*&nbsp;与会者--患者：</td>
							<td>
								<div class="smartSearch">
									<input type="hidden" name="patient_id" value="" /> <input type="text" name="patient_name" class="form-control"
										placeholder="请输入患者姓名" autocomplete="off" value="" />
									<ul class="searchResultForPatient">
										<li><a href="javascript:void(0)"></a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr class="yhz_ma">
							<td>*&nbsp;与会者--主持人(MA)：</td>
							<td>
								<div class="smartSearch">
									<input type="hidden" name="ma_id" value="" /> <input type="text" name="ma_name" class="form-control"
										placeholder="请输入主持人（医助）姓名" autocomplete="off" value="" />
									<ul class="searchResultForMA">
										<li><a href="javascript:void(0)"></a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td>用户名：</td>
							<td><input name="userName" type="text" class="form-control" placeholder="请输入用户名，保持唯一性" value="好乐医" />
							</td>
						</tr>
						<tr>
							<td>显示名：</td>
							<td><input name="userDisplayName" type="text" class="form-control" placeholder="请输入显示名" value="好乐医" />
							</td>
						</tr>
						<tr>
							<td>诊室简介：</td>
							<td><textarea name="meetingContent" class="form-control" placeholder="请输入诊室简介" style="padding: 12px !important;">好乐医视频服务</textarea>
							</td>
						</tr>
						<tr>
							<td>持续时间（展示）：</td>
							<td><input name="showTime" type="text" class="form-control" placeholder="几分钟" value="10" style="width: 100px; float: left;"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" /><span
								style="float: left; margin-left: 10px; margin-top: 8px;">分钟</span>
							</td>
						</tr>
						<tr>
							<td>最大支持人数：</td>
							<td><input name="maxAttendNum" type="text" class="form-control" placeholder="请输入最大支持人数" value="3" />
							</td>
						</tr>
						<tr>
							<td><input type="hidden" value="${token}" name="token" />
							</td>
							<td><button type="button" class="btn btn-primary" id="save" name="submit">绑定诊室</button>
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
		function dateToUnix(timeStr){
			var time_arr = timeStr.replace(/:/g,'-').replace(/ /g,'-').split("-");
			var datum = new Date(Date.UTC(time_arr[0],time_arr[1]-1,time_arr[2],time_arr[3]-8,time_arr[4],time_arr[5]));
			return datum.getTime()/1000;
		}
		initType();
		$('select[name="type"]').change(function(){
			initType();
		});
		function initType(){
			var type = $('select[name="type"]').val();
    		switch(type){
    		case 'ma':
    			$('.yhz_doctor').hide();
    			$('.yhz_patient').hide();
    			$('.yhz_ma').show();
    			break;
    		case 'doctor':
    			$('.yhz_doctor').show();
    			$('.yhz_patient').show();
    			$('.yhz_ma').show();
    			break;
    		case 'community':
    			$('.yhz_doctor').show();
    			$('.yhz_patient').show();
    			$('.yhz_ma').show();
    			break;
    		}
		}
		//时间弹出
    	$('input[name="meetingStartTime"]').datetimepicker({
            language:  'zh-CN',
    		format: 'yyyy-mm-dd hh:ii',
    		weekStart: 1,
    		todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		forceParse: 0,
    		startView: 2,
    		minView: 0
        });
    	//医生智能搜索
		$('.searchResultForDoctor').parent().children('.form-control').bind('keyup',function(){
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
		$('.searchResultForPatient').parent().children('.form-control').bind('keyup',function(){
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
		$('.searchResultForMA').parent().children('.form-control').bind('keyup',function(){
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
		//获取诊室
		$('.checkMeetingId').click(function(){
			var meeting_id = $('input[name="meeting_id"]').val();
			if(!meeting_id){
				alert('请先输入诊室号。');
				return false;
			}
			var questURL = runParams.mainUrl+'getMeetingInfo.do';
			var questArr = {
					meetingId:meeting_id
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var xmldoc = $.parseXML(result.data);
					var obj = $(xmldoc).find('TbMeetingResult');
					var xml_result = obj.children('result').text();
					if(xml_result=='0'){
						$('.checkVal').html("<font color='green'>该诊室号可用</font>");
						$('input[name="validId"]').val('1');
						var obj = $(xmldoc).find('meetinginfo');
						var meetingId = obj.children('meetingId').text();
						var meetingTopic = obj.children('meetingTopic').text();
						var MeetingOriPwd = obj.children('MeetingOriPwd').text();
						var MeetingHostPwd = obj.children('MeetingHostPwd').text();
						var start_time = obj.children('meetingStartTime').text();
						var meetingState = obj.children('meetingState').text();
						var isMeetingLock = obj.children('isMeetingLock').text();
						var keep_time = obj.children('MeetingDuration').text();
						var meetingStartTime = '';
						var MeetingDuration = '';
						//特殊处理
						if(start_time){
							meetingStartTime = getLocalDate(start_time,3);
						}
						if(keep_time){
							MeetingDuration = parseInt(keep_time)/60+'分钟';
						}
						switch(meetingState){
						    case '9':meetingState = '已关闭';break;
						    case '2':meetingState = '进行中';break;
						    case '1':meetingState = '预约中';break;
						}
						$('input[name="meetingTopic"]').val(meetingTopic);
						$('input[name="meetingPwd"]').val(MeetingOriPwd);
						$('input[name="meetingDuration"]').val(MeetingDuration);
						$('input[name="meetingStartTime"]').val(meetingStartTime);
						$('input[name="hostPwd"]').val(MeetingHostPwd);
						$('.oriMeeting').show();
					}else{
						$('.checkVal').html("<font color='red'>没有这个诊室！</font>");
						$('input[name="validId"]').val('');
					}
				}else{
					$('.checkVal').html("<font color='red'>获取诊室数据出错！</font>");
					$('input[name="validId"]').val('');
				}
			},'json')
		});
		//提交绑定
		function beforeSub(){
			var validId = $('input[name="validId"]').val();
			if(!validId){
				alert('该诊室号不可用！');
				return false;
			}
			var type = $('select[name="type"]').val();
			var meetingDuration = $('input[name="meetingDuration"]').val();
			var meetingStartTime = $('input[name="meetingStartTime"]').val()+':00';
			var patient_id = $('input[name="patient_id"]').val();
			var doctor_id = $('input[name="doctor_id"]').val();
			var ma_id = $('input[name="ma_id"]').val();
			//时间转换
			meetingDuration = parseInt(meetingDuration)*60;
			meetingStartTime = dateToUnix(meetingStartTime);
			var meetingEndTime = meetingStartTime+meetingDuration;
			meetingStartTime*=1000;
			meetingEndTime*=1000;
			//验证绑定
			switch(type){
				case 'ma':
					if(!ma_id){
						alert('请绑定MA！');
						return false;
					}
					break;
				case 'doctor':
				case 'community':	
					if(!patient_id||!doctor_id||!ma_id){
						alert('请绑定医生、患者和MA！');
						return false;
					}
					break;
				default:alert('无效的诊室类型！');return false;
			}
			var questURL = runParams.mainUrl+'valid_conf_time.do';
			var questArr = {
					ma_id:ma_id,
					patient_id:patient_id,
					doctor_id:doctor_id,
					meetingStartTime:meetingStartTime,
					meetingEndTime:meetingEndTime,
					type:type
			};
			$.post(questURL,questArr,function(result){
				if(result){
					//alert();
				    subForm();
				}else{
					alert("该时间段内已经有诊室安排。");
				}
			})
		}
		function subForm(){
			var userName = $('input[name="userName"]').val();
			var userDisplayName = $('input[name="userDisplayName"]').val();
			var meeting_id = $('input[name="meeting_id"]').val();
			var meetingTopic = $('input[name="meetingTopic"]').val();
			var meetingPwd = $('input[name="meetingPwd"]').val();
			var meetingDuration = $('input[name="meetingDuration"]').val();
			var meetingStartTime = $('input[name="meetingStartTime"]').val()+':00';
			var hostPwd = $('input[name="hostPwd"]').val();
			var maxAttendNum = $('input[name="maxAttendNum"]').val();
			var meetingContent = $('textarea[name="meetingContent"]').val();
			var type = $('select[name="type"]').val();
			var showTime = $('input[name="showTime"]').val();
			var token = $('input[name="token"]').val();
			var patient_id = $('input[name="patient_id"]').val();
			var patient_name = $('input[name="patient_name"]').val();
			var doctor_id = $('input[name="doctor_id"]').val();
			var doctor_name = $('input[name="doctor_name"]').val();
			var ma_id = $('input[name="ma_id"]').val();
			var ma_name = $('input[name="ma_name"]').val();
			
			if(!userName){
				alert("请输入用户名！");
				return false;
			}
			if(!userDisplayName){
				alert("请输入显示名！");
				return false;
			}
			if(!meeting_id){
				alert("请输入诊室号！");
				return false;
			}
			if(!meetingTopic){
				alert("请输入诊室标题！");
				return false;
			}
			if(!meetingPwd){
				alert("请输入诊室密码！");
				return false;
			}
			if(!meetingDuration){
				alert("请输入诊室持续时间！");
				return false;
			}
			if(!meetingStartTime){
				alert("请输入服务开始时间！");
				return false;
			}
			if(!hostPwd){
				alert("请输入主持人密码！");
				return false;
			}
			if(!showTime){
				alert("请输入展示持续时间！");
				return false;
			}
			if(!token){
				alert("页面已过期，请刷新页面！");
				return false;
			}
			
			//时间转换
			meetingDuration = parseInt(meetingDuration)*60;
			showTime = parseInt(showTime)*60;
			meetingStartTime = dateToUnix(meetingStartTime);
			
			//绑定数据库
			meetingStartTime *= 1000;
			var questURL = runParams.mainUrl+'bindMeetingAction.do';
			var questArr = {
					meeting_id:meeting_id,
					meeting_pwd:meetingPwd,
					patient_id:patient_id,
					patient_name:patient_name,
					doctor_id:doctor_id,
					doctor_name:doctor_name,
					ma_id:ma_id,
					ma_name:ma_name,
					start_time:meetingStartTime,
					keep_time:meetingDuration,
					type:type,
					show_time:showTime
			};
			$.post(questURL,questArr,function(result){
				if(result){
					alert('创建成功！');
                    location.href=runParams.mainUrl+'siteListView.html';
				}else{
					alert('创建失败！');
					location.reload();
				}
			},'json')
		}
		$('button[name="submit"]').click(function(){
			beforeSub();
		});
	});
	</script>
</body>
</html>