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
				<li class="active">转诊池管理</li>
			</ol>
			<div class="searchBar row">
				<form class="navbar-form navbar-left" id="searchForm" role="search"
					action="${mainUrl}searchAccountForTreatmentList.do" method="post">
					<div class="form-group smartSearch">
						<input type="text" class="form-control" name="referHospital"  value="${referHospital}"
							placeholder="医院名称">
						<ul class="searchResultForHospital"></ul>
					</div>
					<div class="form-group smartSearch">
						<input type="text" class="form-control" name="referDepartments"  value="${referDepartments}"
							placeholder="科室名称">   
					</div>
					<input type="hidden" name="token" value="${token}">
					<button type="submit" class="btn btn-default" id="save">筛选</button>
				</form>
				<form class="navbar-form navbar-left" role="search"
					action="${mainUrl}searchAccountForTreatmentListByName.do" method="post">
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
			</div>
			<div class="mainBody">
				<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>姓名</th>
						<th>性别</th>
						<th>医院</th>
						<th>科室</th>
						<th>职务</th>
						<th>职称</th>
						<th>转诊</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dro.doctors}" var="doctor" varStatus="status">
						<tr>
							<td>${doctor.name}</td>
							<td><c:choose>
									<c:when test="${empty doctor.gender}">
  暂无
   </c:when>
									<c:otherwise>
   ${doctor.gender}
   </c:otherwise>
								</c:choose></td>
							<td>${doctor.referHospital}</td>
							<td>${doctor.referDepartments}</td>
							<td>${doctor.doctorPosition}</td>
							<td>${doctor.doctorTitle}</td>
							<td class="td2">
							<input type="checkbox" name="transferTreatment"  value="1" <c:if test="${doctor.transble == true}">checked</c:if>>
							<input type="hidden" name="doctorId" value="${doctor.accountId}">
							</td>
						</tr>  
					</c:forEach>
				</tbody>
			</table>
			
			<ul class="pager">
			<c:if test="${nopage==false}">
				<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
					href="${mainUril}transferTreatmentList.html?cp=${dro.pageView.back}&&ps=${searchParam.ps}">上一页</a>
				</li>
				<li
					<c:if test="${dro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
					href="${mainUril}transferTreatmentList.html?cp=${dro.pageView.next}&&ps=${searchParam.ps}">下一页</a>
				</li>
				</c:if>
				<li class="submit"><a href="#">确定转诊设置</a></li>
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
	<script src="assets/script/medex/transferTreatmentList.js"></script>
</body>
</html>