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
	href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/productAdmin/frame.css" rel="stylesheet">
<link href="assets/css/productAdmin/productOwner.css" rel="stylesheet">
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
				<li><a href="#">Home</a>
				</li>
				<li class="active">待确认订单列表</li>
			</ol>
			<div class="searchBar row">
				<div class="col-md-3 col-xs-3" style="padding-left: 0;">
					<div class="input-group">
						<input type="text" class="form-control" name="orderId"
							placeholder="订单号" autocomplete="off" value=""> <span
							class="input-group-addon"><i
							class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="smartSearch col-md-3 col-xs-3">
					<div class="input-group">
						<input type="hidden" name="docId" value="${hostId}"> <input
							type="text" class="form-control" name="owner"
							placeholder="患者/申请人/宿主姓名" autocomplete="off" value=""> <span
							class="input-group-addon"><i
							class="glyphicon glyphicon-search"></i> </span>
					</div>
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="col-md-3 col-xs-3">
					<select class="form-control" name="productCategory">
						<!--载入时赋值，对应option加selected-->
						<c:forEach items="${categorys}" var="category">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="addPat col-md-3 col-xs-3"></div>
			</div>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>订单号</th>
							<th>患者</th>
							<th>申请者</th>
							<th>宿主</th>
							<th>产品类型</th>
							<th>时间段</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${noorder == true}">
							<tr>
								<td colspan="8">暂无待确认订单。</td>
							</tr>
						</c:if>
						<c:forEach items="${oro.records}" var="order">
							<c:if test="${order.pcname ne '特需门诊'}">
							<tr>
								<td>${order.orderId}</td>
								<td>${order.patient.name}</td>
								<td>${order.requesterName}</td>
								<td>${order.owner.name}</td>
								<td>${order.pcname}</td>
								<td>第${order.week}周</td>
								<td>${order.status}</td>
								<td class="td1"><a
										href="orderConfirmDetail.html?orderId=${order.orderId}"><span
											class="glyphicon glyphicon-edit"></span>确认订单</a>
								</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="${mainUril}orderConfirm.html?cp=${oro.pageView.back}&&ps=${searchParam.ps}">上一页</a>
						</li>
						<li
							<c:if test="${oro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="${mainUril}orderConfirm.html?cp=${oro.pageView.next}&&ps=${searchParam.ps}">下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
				</div>
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/script/productAdmin/frame.js"></script>
</body>
</html>