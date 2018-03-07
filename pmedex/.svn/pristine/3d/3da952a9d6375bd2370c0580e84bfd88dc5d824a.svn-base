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
				<li class="active">应派发金币列表</li>
			</ol>
			<div class="searchBar row">
			</div>
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token}">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>订单id</th>
							<th>订单类型</th>
							<th>订单进度</th>
							<th>进度时间</th>
							<th>用户账号</th>
							<th>奖励金额</th>
							<th>发放状态</th>
						</tr>
					</thead>
					<tbody>
							
						<c:if test="${noOrder== true}">
							<tr>
								<td colspan="9">无应派发金币记录。</td>
							</tr>
						</c:if>
						<c:forEach items="${orderlist}" var="order">
							<tr>
								<td>${order.orderid}</td>
								<td>${order.order_type}</td>
								<td>${order.progress}</td>
								<td>${order.time}</td>
								<td>${order.reward.accountId}</td>
								<td>${order.reward.amount}</td>
								<td>
								<c:choose>
                                     <c:when test="${order.reward.pay == true}">
                                                                                                                                                     已派发
                                     </c:when>  
                                     <c:otherwise>
                                                                                                                                                     未派发   
                                     </c:otherwise>
                                </c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li >
					     <a href="${mainUril}jb_to_pay.html?cp=${page.cp-1}&&ps=${page.ps}" >上一页</a>
						</li>
						<li     
							>
						 <a href="${mainUril}jb_to_pay.html?cp=${page.cp+1}&&ps=${page.ps}" >下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">  
					<input type="hidden" name="ps" value="${searchParam.ps}">
				</div>
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
	
	<!-- 模态框 -->
	<div class="modal fade" id="refuseModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="refuseModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="refuseModalLabel">驳回理由</h4>
                 </div>
                 <div class="modal-body">
                    <textarea class="form-control notebook" rows="4"
							name="reason" placeholder="请输入驳回理由"></textarea>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="token" value="${token }"> 
                    <input type="hidden" name="orderid" value="${orderid }"> 
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary  doReject" name="doReject">确认驳回</button>
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
</body>
</html>