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
<%@ include file="./commons/runParams.html"%>
<title>OP后台</title>
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
<link href="assets/css/productAdmin/frame.css" rel="stylesheet">
<link href="assets/css/productAdmin/datetimepickerReview.css"
	rel="stylesheet">
<link href="assets/css/productAdmin/product.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<%@ include file="./commons/leftMenu.jsp"%>
		<div id="content">
			<%@ include file="./commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li><a href="productOwner.html">宿主列表</a></li>
				<li class="active">${doctor.name}的产品列表</li>
			</ol>
			<div class="searchBar">
				<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<strong>${doctor.name}</strong>&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${doctor.auth == true}">已认证</c:if><c:if test="${doctor.auth == false}"><font color="red">未认证</font></c:if>&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;${doctor.doctorTitle}&nbsp;&nbsp;&nbsp;&nbsp;
		        <c:choose><c:when test="${empty doctor.referDepartments}"></c:when><c:otherwise><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;${doctor.referDepartments}</c:otherwise></c:choose>
			</div>
			<div class="mainBody">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>编号</th>
							<th>产品名称</th>
							<th>宿主</th>
							<th>所需积分/金额</th>
							<th>积分返还</th>
							<th>积分补贴</th>
							<th>周服务次数</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<%--<c:if test="${noproduct == true}">
							<tr>
								<td colspan="9">该医生暂无产品</td>
							</tr>
						</c:if>
						<c:forEach items="${pro.products}" var="product">
							<tr>
								<td>${product.productId}</td>
								<td>${product.pcname}</td>
								<td>${product.hostName}</td>
								<td>${product.score_total_mark}</td>
								<td>${product.score_returned_transfer}/${product.score_returned_requester}/${product.score_self}</td>
								<td>${product.score_subsidy_transfer}/${product.score_subsidy_requester}</td>
								<td>${product.serviceCount}</td>
								<td>${product.isValid}</td>
								<td class="td1"><a
									href="productDetail.html?productId=${product.productId}&&postType=host"
									data-id="${product.productId}" class="showProduct"><span
										class="glyphicon glyphicon-earphone"></span>详情</a></td>
							</tr>
						</c:forEach>--%>
						<tr>
							<td>123456${product.productId}</td>
							<td>产品1${product.pcname}</td>
							<td>宿主1${product.hostName}</td>
							<td>20美元${product.score_total_mark}</td>
							<td>10${product.score_returned_transfer}/20${product.score_returned_requester}/30${product.score_self}</td>
							<td>20${product.score_subsidy_transfer}/30${product.score_subsidy_requester}</td>
							<td>5${product.serviceCount}</td>
							<td>预定${product.isValid}</td>
							<td class="td1"><a
									href="productDetail.html?productId=${product.productId}&&postType=host"
									data-id="${product.productId}" class="showProduct"><span
									class="glyphicon glyphicon-earphone"></span>详情</a></td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="${mainUril}ownerProduct.html?cp=${pro.pageView.back}&&ps=${searchParam.ps}&&hostId=${hostId}">上一页</a>
						</li>
						<li     
							<c:if test="${pro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="${mainUril}ownerProduct.html?cp=${pro.pageView.next}&&ps=${searchParam.ps}&&hostId=${hostId}">下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
				</div>
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
	<script src="assets/script/productAdmin/frame.js"></script>
	<script src="assets/script/productAdmin/product.js"></script>
</body>
</html>