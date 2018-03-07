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
<%@ include file="../commons/runParams.html"%>
<title>MA后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="../assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="../assets/css/medex/frame.css" rel="stylesheet">
<link href="../assets/css/medex/pat_list.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="../assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="../assets/library/modernizr/modernizr.js"></script>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<!-- leftmenu -->
		<%@ include file="../commons/leftMenu_doc.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="../commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li class="active">${doctorName}的患者管理</li>
			</ol>
			<div class="searchBar row">
				<div class="smartSearch col-md-4 col-xs-4">    
					<form action="${mainUrl}doctor/searchPatResult.do" method="post"
						name="searchPatForm" id="searchPatForm">
						<div class="input-group">
							<input type="text" class="form-control" name="searchPat"
								placeholder="搜索该医生下的病人" autocomplete="off"> <span
								class="input-group-addon"><i
								class="glyphicon glyphicon-search"></i> </span>
						</div>
						<ul class="searchResult"></ul>
						<input type="hidden" name="docId" value="${doctorId}"> <input
							type="hidden" name="token" value="${token}">
					</form>
				</div>
				<div class="addPat col-md-8 col-xs-8">  
					<button type="button" class="btn btn-primary pull-right"
						data-toggle="modal" data-target="#addPatientModal"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span>增加病人
					</button>
					<!-- 增加病人的模态框 -->
					<div class="modal fade" id="addPatientModal" data-backdrop="false"
						tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="patModalLabel">为该医生新增一个患者</h4>
								</div>
								<div class="modal-body">
									<div class="form-group smartSearch">
										<label for="patientName">姓名</label> <input type="hidden"
											name="patId" value=""> <input type="hidden"
											name="tokenForAdd" value="${token}"> <input
											type="text" class="form-control" name="patientName"
											placeholder="请输入患者姓名" autocomplete="off">
										<ul class="searchResultForAdd"></ul>
									</div>
									<div class="patInfo">请先输入患者姓名。</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" id="addPatSubmit">确认添加</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mainBody">
				<!--如果未找到用户-->
				<c:if test="${hit == false}">
					<div class="notFonud">没有找到该患者。</div>
				</c:if>
				<!--如果找到用户 end-->
				<!--如果医生下面没有患者-->
				<c:if test="${hasPatients == false}">
					<div class="notFonud">该医生还没有患者。</div>
				</c:if>
				<!--如果医生下面没有患者 end-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>姓名</th>
							<th>性别</th>
							<th>所患疾病</th>
							<th>建档时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pro.patients}" var="patient"
							varStatus="status">
							<tr>
								<td>${patient.name}</td>
								<td><c:choose>
										<c:when test="${patient.gender eq '男'}">
  男
   </c:when>
										<c:when test="${patient.gender eq '女'}">
  女
   </c:when>
										<c:otherwise>  
   暂无
   </c:otherwise>
									</c:choose></td>
								<td>${patient.disease}</td>
								<td>${patient.timeOfFFD}</td>
								<td>${patient.currentStatus}</td>
								<td class="td1"><a
									href="${mainUrl}doctor/pat_detail?patientId=${patient.accountId}"><span
										class="glyphicon glyphicon-zoom-in"></span>详细</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="${mainUrl}patient/schedule.html?patientId=${patient.accountId}"><span class="glyphicon glyphicon-list-alt"></span>日程</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="javascript:void(0)" data-id="${patient.accountId}"
									data-name="${patient.name}" class="deletePat"><span
										class="glyphicon glyphicon-remove"></span>移除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 分页开始 -->
				<c:if test="${page == true}">
					<div align="center">
						<ul class="pagination">
							<c:forEach items="${pro.pages}" var="p">
								<li><a href="${p.url}">${p.p}</a></li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				<!-- 分页结束 -->
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>


	<script src="../assets/library/jquery/jquery.min.js"></script>
	<script src="../assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="../assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/plugins/nprogress/nprogress.js"></script>
	<script src="../assets/script/medex/frame.js"></script>
	<script src="../assets/script/medex/pat_list.js"></script>
</body>
</html>