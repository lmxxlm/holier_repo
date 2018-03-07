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
<title>CA管理后台</title>
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
<style>
.searchBar{ margin-top:0;}
#productStatus{ margin:12px; margin-bottom:0;}
.nav-tabs > li > a{background:#dedede;}
</style>
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
				<li class="active">订单列表</li>
			</ol>
			<ul id="productStatus" class="nav nav-tabs">
			   <li <c:if test="${status == '未支付'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="未支付" data-toggle="tab" onfocus="this.blur()">未支付</a></li>
			   <li <c:if test="${status == '已预订'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="已预订" data-toggle="tab" onfocus="this.blur()">已预订</a></li>
			   <li <c:if test="${status == '已确认'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="已确认" data-toggle="tab" onfocus="this.blur()">已确认</a></li>
			   <li <c:if test="${status == '重新确认'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="重新确认" data-toggle="tab" onfocus="this.blur()">重新确认</a></li>
			   <li <c:if test="${status == '已支付'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="已支付" data-toggle="tab" onfocus="this.blur()">已支付</a></li>
			   <li <c:if test="${status == '积分待派发'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="积分待派发" data-toggle="tab" onfocus="this.blur()">积分待派发</a></li>
			   <li <c:if test="${status == '已完成'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="已完成" data-toggle="tab" onfocus="this.blur()">已完成</a></li>
			   <li <c:if test="${status == '所有订单'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="所有订单" data-toggle="tab" onfocus="this.blur()">所有订单</a></li>
			   <li <c:if test="${status == '已作废'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="已作废" data-toggle="tab" onfocus="this.blur()">作废订单</a></li>
		    </ul>
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
						<option value="">全部分类</option>
						<c:forEach items="${categorys}" var="category">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="addPat col-md-3 col-xs-3"></div>
			</div>
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token }">
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
								<td colspan="8">暂无订单。</td>
							</tr>
						</c:if>
						<c:forEach items="${oro.records}" var="order">
							<tr>
								<td>${order.orderId}</td>
								<td>${order.patient.name}</td>
								<td>${order.requesterName}</td>
								<td>${order.owner.name}</td>
								<td>${order.pcname}</td>
								<td><c:choose><c:when test="${order.pcname ne '特需门诊'}">${order.startDate}/${order.endDate}</c:when><c:otherwise>--</c:otherwise></c:choose></td>
								<td>${order.status}</td>
								<td class="td1">
								<a href="orderDetail.html?id=${order.orderId}">
								<span class="glyphicon glyphicon-zoom-in"></span>详情</a>&nbsp;&nbsp;
								<a href="javascript:void(0)" data-id="${order.orderId}" class="deleteOrder">
								<span class="glyphicon glyphicon-remove"></span>删除订单</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pager">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="javascript:void(0)" data-link="${mainUril}allOrder.html?cp=${oro.pageView.back}&&ps=${searchParam.ps}" data-status="${status}">上一页</a>
						</li>
						<li     
							<c:if test="${oro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="javascript:void(0)" data-link="${mainUril}allOrder.html?cp=${oro.pageView.next}&&ps=${searchParam.ps}" data-status="${status}">下一页</a>
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
	<script>
	$(function(){
		$('.deleteOrder').click(function(){
			var id = $(this).attr('data-id');
			var token = $('input[name="token"]').val();
		    if(confirm('确定要删除这条订单吗？')){
		    	var questURL = runParams.mainUrl+'deleteOrderById.do';
				var questArr = {
						id:id,
						token:token
						};
				$.post(questURL,questArr,function(result){
					if(1==result){
						alert('删除成功！');  
						location.reload();
					}else{
						alert('删除失败！');
						return false;
					}
				});
			}
		});
		$('.urlConvert').click(function(){
			status = encodeURIComponent($(this).attr('data-val'));
			location.href=runParams.mainUrl+"allOrder.html?status="+status;
		});
		$('.pager a').click(function(){
			status = encodeURIComponent($(this).attr('data-status'));
			location.href=$(this).attr('data-link')+"&&status="+status;
		});
	});
	</script>
</body>
</html>