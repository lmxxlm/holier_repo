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
	href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/medex/frame_ad.css" rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
<link href="assets/css/medex/pat_list.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
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
				<li class="active">医生账户</li>
			</ol>
			<div class="searchBar row">
				<form class="navbar-form navbar-left" role="search"
					action="${mainUrl}searchAccount.do" method="post">
					<div class="input-group">
						<div class="input-group-btn selectSimulate selectSimulate1">
							<input type="hidden" name="searchType"
								<c:choose>
									<c:when test="${empty searchType }">
  value="docName"
   </c:when>
									<c:otherwise>
   value="${searchType}"   
   </c:otherwise>
								</c:choose>
								class="selectData">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown" onFocus="this.blur()">
								<c:choose>
									<c:when test="${searchType == 'docId'}">
   医生ID   
   </c:when>
									<c:when test="${searchType=='docName'}">
   医生姓名
   </c:when>
									<c:otherwise>
     医生姓名
   </c:otherwise>
								</c:choose>

								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#" onFocus="this.blur()"
									data-val="docName">医生姓名</a>
								</li>   
								<li><a tabindex="-1" href="#" onFocus="this.blur()"
									data-val="docId">医生ID</a>
								</li>
							</ul>
						</div>
						<input type="text" class="form-control" name="searchText"
							value=${searchText}>
					</div>
					<input type="hidden" name="token" value="${token}">
					<button type="submit" class="btn btn-default" id="save">查找</button>
				</form>
				<form class="navbar-form navbar-right" role="add">
					<div class="btn-group">
						<a href="validRequest.html" class="btn btn-primary">认证申请列表</a>
						<a href="javascript:void(0)" class="btn btn-primary active">认证操作历史</a>
					</div>
				</form>	
			</div>
			<div class="mainBody">
				<table class="table table-striped table-hover">
				<thead>
					<tr>
					    <th>认证状态</th>
					    <th>审核通过时间</th>
					    <th>审核人</th>
						<th>姓名</th>
						<th>医院</th>
						<th>科室</th>
						<th>职称</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dro.doctors}" var="doctor" varStatus="status">
						<tr>
						    <td>已认证</td>
						    <td>2015-07-12</td>
						    <td>黄卫华</td>
							<td>${doctor.name}</td>
							<td>${doctor.referHospital}</td>
							<td>${doctor.referDepartments}</td>
							<td>${doctor.doctorTitle}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<!-- 分页开始 -->
				<ul class="pager">
				<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
					href="${mainUril}chooseAccountDoc.html?cp=${dro.pageView.back}&&ps=${searchParam.ps}&&authType=${auth}">上一页</a>
				</li>
				<li
					<c:if test="${dro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
					href="${mainUril}chooseAccountDoc.html?cp=${dro.pageView.next}&&ps=${searchParam.ps}&&authType=${auth}">下一页</a>
				</li>
			</ul>
				<!-- 分页结束 -->
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>


	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
	<script src="assets/script/medex/chooseAccount.js"></script>
</body>
</html>