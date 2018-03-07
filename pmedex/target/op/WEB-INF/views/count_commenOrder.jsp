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
<link href="assets/css/productAdmin/Statistics.css" rel="stylesheet">
<link href="assets/css/productAdmin/tableToExcel.css" rel="stylesheet">
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
				<li class="active">订单统计</li>
			</ol>
			<!-- 
			<%@ include file="./commons/countTopMenu.jsp"%>
			-->
			<ul id="productStatus" class="nav nav-tabs">
			    <li ><a href="javascript:void(0)" data-link="count_doctorCoins.html" class="urlConvert"  data-toggle="tab" onfocus="this.blur()">医生金币统计</a></li>
			    <li  class="active"><a href="javascript:void(0)" data-link="count_commenOrder.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">普通订单</a></li>
			   <li ><a href="javascript:void(0)" data-link="count_orderIncome.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">快捷订单</a></li>
               <li ><a href="javascript:void(0)" data-link="count_sendCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">手动派发</a></li>
               <li ><a href="javascript:void(0)" data-link="count_returnCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">自动派发</a></li>
               <li><a href="javascript:void(0)" data-link="count_withdraw.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">提现统计</a></li>
		    </ul>
		    <form method="post" id="searchForm" action="${mainUrl}optj_search_commenOrder.do">
		    <input type="hidden" name="token" value="${token}">
			<div class="searchBar row">
				<div class="addPat col-md-2 col-xs-2" style="padding-right:2px; padding-left:0px;">
				    <div class="input-group " >
						<input type="text" class="form-control " name="startTime" readonly
							placeholder="开始时间"  value="${startTime}" >
					</div>
				</div>
				<div class="addPat col-md-2 col-xs-2" style="padding-left:2px;">
				    <div class="input-group " >
                        <input type="text" class="form-control " name="endTime" readonly
                        placeholder="结束时间"  value="${endTime}" >  
					</div>
				</div>
				<div class="addPat col-md-2 col-xs-2" style="padding-left:2px;">
				    <div class="input-group " >
                       <button class="btn btn-primary timeSearch" type="button" id="searchTime">搜索</button> 
					</div>
				</div>
				<div class="addPat col-md-6 col-xs-6" style="padding-right:0;">
				    <span class=" pull-right" style="margin-top:8px">
						总量：<b style="color:red; font-size:18px;">${oir.count}</b>
					</span>
				</div>
			</div>
			</form>
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token }">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>日期</th>
							<th >订单收入</th>
							<th >订单号</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${noorder == true}">
							<tr>
								<td colspan="8">暂无订单</td>
							</tr>
						</c:if>
						<c:forEach items="${oir.records}" var="order">
							<tr>
								<td>${order.date}</td>
								<td>${order.amount}</td>
								<td>${order.orderId}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="addPat col-md-2 col-xs-2 pull-right" style="padding-left:2px;">
				  <button class="btn btn-primary " type="button" id="showAll" >显示搜索数据</button>
				</div> 
				<c:if test="${noorder == false}">
				<div align="center">
					<ul class="pager">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="${mainUril}count_commenOrder.html?cp=${oir.pageView.back}&&ps=${searchParam.ps}&&startTime=${startTime}&&endTime=${endTime}" data-link="" >上一页</a>
						</li>
						<li     
							<c:if test="${oro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="${mainUril}count_commenOrder.html?cp=${oir.pageView.next}&&ps=${searchParam.ps}&&startTime=${startTime}&&endTime=${endTime}" data-link="" >下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
				</div>
				</c:if>
				<!--如果找到用户 end-->
			</div>
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
	<script src="assets/script/productAdmin/tableToExcelPlugin.js"></script>
    <script src="assets/script/productAdmin/tableToExcel.js"></script>
	<script src="assets/script/productAdmin/count.js"></script>
	<script>
	$(function(){ 
		$('#showAll').click(function(){
			window.open("${mainUril}showCommenOrder.html","_blank")
		});
		function searchProduct(){
			var startTime = $('input[name="startTime"]').val();
			var endTime = $('input[name="endTime"]').val();
			location.href=runParams.mainUrl+'count_commenOrder.html?startTime='+startTime+'&endTime'+endTime;
		}
	});
    var x=${order.date};
	
    
    var str = x+","+"x, 2, 3, 4";
    //var str = "博客, 域名\nBlog, 2\njb51.net, 3";
	var uri = 'data:text/csv;charset=utf-8,' + str;
	
	var downloadLink = document.createElement("a");
	downloadLink.href = uri;
	downloadLink.download = "export.csv";
	
	document.body.appendChild(downloadLink);
	downloadLink.click();
	document.body.removeChild(downloadLink);
	</script>
	
</body>
</html>