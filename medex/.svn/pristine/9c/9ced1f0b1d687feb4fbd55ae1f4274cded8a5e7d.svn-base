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
<link href="assets/library/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link href="assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css" rel="stylesheet">
<link href="assets/library/icons/pictoicons/css/picto-foundry-general.css" rel="stylesheet">
<link href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css" rel="stylesheet">
<link href="assets/css/medex/frame_ad.css" rel="stylesheet">
<link href="assets/css/medex/datetimepickerReview.css" rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
<link href="assets/css/medex/pat_list.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
.mainBody{ margin-top:12px;}
.meetingWrap{ float:left; margin:20px;}
.meetingBox{ border:1px solid #000; background:#dedede; padding:12px; float:left;}
.meetingWrap p{ line-height:25px;}
.meetingWrap p a{ border:1px solid blue; background:#ccc; display:inline-block; padding:5px 10px; text-decoration:none; margin-top:12px;}
.meetingForm{ border:1px solid #000; border-left:none; background:#fff; padding:12px; float:left;}
.meetingForm input{ height:25px; line-height:25px;}

.smartSearch{ padding:0; position:relative;}
.smartSearch ul{ position:absolute; top:100%; left:0; background:#fff; border:1px solid #CCC; border-top:none; padding:0; display:none; box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.176); z-index:99999;}
.smartSearch li{ list-style:none;}
.smartSearch li:nth-child(even){ background:#F9F9F9;}
.smartSearch li a{ padding:5px 12px; margin:0; display:block; color:#505050; min-width:300px; text-decoration:none; font-size:12px;}
.smartSearch li a:hover{ background:#ccc; color:#fff;}
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
				<li><a href="#">Home</a></li>
				<li><a href="#">视频服务</a></li>
				<li class="active">视频服务列表</li>
			</ol>
			<div class="mainBody">
				<input type="hidden" name="token" value="${token}" />
				<div class="meetingList"></div>
				<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>诊室号</th>
						<th>主题</th>
						<th>开始时间</th>
						<th>持续</th>
						<th>医生</th>
						<th>患者</th>
						<th>主持人</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			</div>
		</div>
	</div>
    <input type="hidden" name="token" value="${token}">

	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
    <script>
    $(function(){
		getSiteList();
		function getSiteList(){
			var meetingType = 2;
			var questURL = runParams.mainUrl+'getSiteConferencegListAction.do';
			var questArr = {
				meetingType:parseInt(meetingType)
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var xmldoc = $.parseXML(result.data);
					$(xmldoc).find('meeting').each(function () {
						var meetingId = $(this).children('meetingId').text();
						var meetingTopic = $(this).children('meetingTopic').text();
						var start_time = $(this).children('meetingStartTime').text();
						var meetingStartTime = getLocalDate(start_time,3);
						var meetingState = $(this).children('meetingState').text();
						var hostDisplayName = $(this).children('hostDisplayName').text();
						var meetingRemark = $(this).children('meetingRemark').text();
						var keep_time = $(this).children('meetingDuration').text();
						var meetingDuration = parseInt(keep_time)/60+'分钟';
						var meetingPwd = $(this).children('meetingPwd').text();
						//获取这条绑定记录
	                    var questURL = runParams.mainUrl+'findMeetingById.do';
	                    var questArr = {
	                    	meeting_id:meetingId
	                    };
	                    $.post(questURL,questArr,function(result){
	                    	var patient_name = '<font color="red">未绑定</font>',
	                    	    patient_id = '',
	                    	    doctor_name = '<font color="red">未绑定</font>',
	                    	    doctor_id = '',
	                    	    ma_name = '<font color="red">未绑定</font>',
	                    	    ma_id = '';
	                    	if(1==result.status){
	                    		patient_name = result.data.patient_name;
	                    		patient_id = result.data.patient_id;
	                    		doctor_id = result.data.doctor_id;
	                    		doctor_name = result.data.doctor_name;
	                    		ma_id = result.data.ma_id;
	                    		ma_name = result.data.ma_name;
	                    	}

	                    	var htmlStr = '';
	                    	htmlStr += '<tr>';
	                    	htmlStr += '  <td>'+meetingId+'</td>';
	                    	htmlStr += '  <td>'+meetingTopic+'</td>';
	                    	htmlStr += '  <td>'+meetingStartTime+'</td>';
	                    	htmlStr += '  <td>'+meetingDuration+'</td>';
	                    	htmlStr += '  <td>'+doctor_name+'</td>';
	                    	htmlStr += '  <td>'+patient_name+'</td>';
	                    	htmlStr += '  <td>'+ma_name+'</td>';
	                    	htmlStr += '  <td class="td2">';
							htmlStr += '    <a href="siteDetail.html?meeting_id='+meetingId+'">详情</a>&nbsp;&nbsp;<a href="javascript:void(0)" class="deleteMeeting" data-id="'+meetingId+'">删除</a>&nbsp;&nbsp;<a href="${videoUrl}passport?id='+meetingId+'" target="_blank">进入诊室</a>';
							htmlStr += '  </td>';
	                    	htmlStr += '</tr>';
	                    	if(keep_time==0){ htmlStr = '';}
	                    	$('.table tbody').html($('.table tbody').html()+htmlStr);
	                    },'json')
					});
				}else{
					alert(result.data);
					return false;
				}
			},'json');
		}
		$('.deleteMeeting').live('click',function(){
			var meetingId = $(this).attr('data-id');
			if(!meetingId){
				alert("未找到这个诊室！");
				return false;
			}
            if(confirm("确定要删除“"+meetingId+"”这个诊室吗？")){
            	var questURL = runParams.mainUrl+'deleteConferenceRecord.do';
    			var questArr = {
    				meeting_id:meetingId
    			};
    			$.post(questURL,questArr,function(result){
    				if(1==result){
    					var token = $('input[name="token"]').val();
    	            	if(!token){
    	    				alert("token已过期，请刷新页面！");
    	    				return false;
    	    			}
    	    			var questURL = runParams.mainUrl+'conferenceDeleteAction.do';
    	    			var questArr = {
    	    				meetingId:meetingId,
    	    				token:token
    	    			};
    	    			$.post(questURL,questArr,function(result){
    	    				if(1==result.status){
    	    					var xmldoc = $.parseXML(result.data);
    	    					var obj = $(xmldoc).find('TbMeetingResult');
    	    					var result = obj.children('result').text();
    	    					if(result=='0'){
    	    						alert('删除成功！');  
    	    						location.reload();
    	    					}else{
    	    						alert(obj.children('error').text());
    	    						location.reload();
    	    					}
    	    				}else{
    	    					alert('删除失败！');
    	    					location.reload();
    	    				}
    	    			},'json')
    				}else{
    					alert('删除失败！');
    					location.reload();
    				}
    			},'json')
			}
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
	});
	</script>
</body>
</html>