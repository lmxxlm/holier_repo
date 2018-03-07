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
				<li><a href="#">订单操作</a>
				</li>
				<li class="active">派发积分</li>
			</ol>
			<form method="post" id="searchForm" action="${mainUrl}search_pfjf.do">
		    <input type="hidden" name="token" value="${token}">
		    <input type="hidden" name="status" value="${status}">
		    <input type="hidden" name="cp" value="${searchParam.cp}">
			<input type="hidden" name="ps" value="${searchParam.ps}">
			<div class="searchBar row">
				<div class="col-md-3 col-xs-3" style="padding-left: 0;">
					<div class="input-group">
						<input type="text" class="form-control" name="orderId"
							placeholder="订单号" autocomplete="off" value="${orderId}">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="smartSearch col-md-3 col-xs-3">
					<div class="input-group">
						<input type="text" class="form-control" name="name"
							placeholder="患者/专家" autocomplete="off" value="${name}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="addPat col-md-3 col-xs-3">
				    <div class="input-group">
						<input type="text" class="form-control" name="date"
							placeholder="请选择预订时间"  value="${date}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search" style="color:black;"></i> </span>
					</div>
				</div>
				<div class="col-md-3 col-xs-3">
					<select class="form-control" name="category">
						<!--载入时赋值，对应option加selected-->
						<option value="">全部分类</option>
						<c:forEach items="${categorys}" var="category">
							<option value="${category.name}" <c:if test="${category.name == category_q}">selected</c:if>>${category.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			</form>
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token }">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>订单号</th>
							<th>患者</th>
							<th>下级医生</th>
							<th>上级医生</th>
							<th>产品类型</th>
							<th>时间段</th>
							<th>余款</th>
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
						    <c:if test="${order.pcname ne '特需门诊' and order.pcname ne '挂专家号'}">
							<tr>
								<td>${order.orderId}</td>
								<td>${order.patient.name}</td>
								<td>${order.requesterName}</td>
								<td>${order.owner.name}</td>
								<td>${order.pcname}</td>
								<td><c:choose><c:when test="${order.pcname ne '特需门诊'}">${order.startDate}/${order.endDate}</c:when><c:otherwise>--</c:otherwise></c:choose></td>
								<td>${order.product.score_total_mark-order.product.booking_price}</td>
								<td class="td1">
								<a href="orderDetail.html?postType=pfjf&id=${order.orderId}">
								<span class="glyphicon glyphicon-zoom-in"></span>派发积分</a>
								<!-- &nbsp;&nbsp;
								<a href="javascript:void(0)" data-id="${order.orderId}" class="deleteOrder">
								<span class="glyphicon glyphicon-remove"></span>删除订单</a> -->
								</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
						<!-- <a href="${mainUril}order_pfjf.html?cp=${oro.pageView.back}&&ps=${searchParam.ps}">上一页</a> -->
							<a href="javascript:void(0);" class="pre">上一页</a>
						</li>
						<li     
							<c:if test="${oro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
						<!-- <a href="${mainUril}order_pfjf.html?cp=${oro.pageView.next}&&ps=${searchParam.ps}">下一页</a> -->
							<a href="javascript:void(0);" class="next">下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
					<input type="hidden" name="pagePre" value="${oro.pageView.back}">
					<input type="hidden" name="pageNext" value="${oro.pageView.next}">
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
	<script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
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
		//时间弹出
		$('input[name="date"]').datetimepicker({
	        language:  'zh-CN',
			format: 'yyyy-mm-dd',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			forceParse: 0,
			startView: 2,
			minView: 2
	    });
		$('.input-group-addon').click(function(){
			$('#searchForm input[name="cp"]').val(1);
		    $('#searchForm').submit();
		});
		$('select[name="category"]').change(function(){
			$('#searchForm input[name="cp"]').val(1);
			$('#searchForm').submit();
		});
		$('.pagination .pre').click(function(){
			var pagePre=$('input[name="pagePre"]').val();
			$('#searchForm input[name="cp"]').val(pagePre);
			$('#searchForm').submit();
        });
		$('.pagination .next').click(function(){
			var pageNext=$('input[name="pageNext"]').val();
			$('#searchForm input[name="cp"]').val(pageNext);
			$('#searchForm').submit();
		});
	});
	</script>
</body>
</html>