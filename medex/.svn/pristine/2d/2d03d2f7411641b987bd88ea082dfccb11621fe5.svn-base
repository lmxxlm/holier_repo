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
.mainBody{ margin-top:0;}
#productStatus{ margin:12px; margin-bottom:0;}
.nav-tabs > li > a{background:#dedede;}

.logUnit{ padding:15px 12px; border-bottom:1px solid #ccc;}
.logUnit a{ font-weight:bold;}
.logUnit span{ color:#999; float:right;}
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
				<c:if test="${user_type == 'patient'}"><li class="active">患者动态</li></c:if>
				<c:if test="${user_type == 'doctor'}"><li class="active">医生动态</li></c:if>
			</ol>
			<ul id="productStatus" class="nav nav-tabs">
               <li <c:if test="${user_type == 'patient'}">class="active"</c:if>><a href="userLog.html?user_type=patient" onfocus="this.blur()">患者动态</a></li>
			   <li <c:if test="${user_type == 'doctor'}">class="active"</c:if>><a href="userLog.html?user_type=doctor" onfocus="this.blur()">医生动态</a></li>
		    </ul>
			<div class="mainBody">
			    <c:if test="${noRecord == true}">
                    <div class="logUnit">暂无动态。</div>
                </c:if>
			    <c:forEach items="${uro.logs}" var="logs" varStatus="status">
				<div class="logUnit">
				    <a href="<c:if test="${logs.user_type == 'patient'}">patient/pat_info.html?patientId=${logs.userid}</c:if><c:if test="${logs.user_type == 'doctor'}">doctor/doc_info.html?doctorId=${logs.userid}</c:if>">
				    ${logs.name}</a>&nbsp;${logs.log_desc}
				    <span>${logs.log_time}</span>
				    <div style="clear:both;"></div>
				</div>
				</c:forEach>
				<c:if test="${noRecord != true}">
				<!-- 分页开始 -->
				<ul class="pager">
				<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
				    <a href="${mainUril}userLog.html?cp=${uro.pageView.back}&ps=${searchParam.ps}&user_type=${user_type}">上一页</a>
				</li>
				<li
					<c:if test="${uro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
					<a href="${mainUril}userLog.html?cp=${uro.pageView.next}&ps=${searchParam.ps}&user_type=${user_type}">下一页</a>
				</li>
			    </ul>
				<!-- 分页结束 -->
				</c:if>
			</div>
		</div>
	</div>


	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
</body>
</html>