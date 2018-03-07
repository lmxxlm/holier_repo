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
<%@ include file="./c/runParams.html"%> 
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
<link href="assets/css/productAdmin/quickPayList.css" rel="stylesheet">
<link href="assets/css/productAdmin/withdrawal.css" rel="stylesheet">
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
		<%@ include file="./c/leftMenu.jsp"%>
		<div id="content">
			<%@ include file="./c/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li class="active">提现订单</li>
			</ol>
			<ul id="myTab" class="nav nav-tabs">
                <li <c:if test="${status == '1'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="1" data-toggle="tab" onFocus="this.blur()">已提现</a></li>
                <li <c:if test="${status == '0'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="0" onFocus="this.blur()">未提现</a></li>
            </ul>       
            <form method="post" id="searchForm" action="${mainUrl}search_quickPayOrder.do">
            <input type="hidden" name="search_status" value="<c:if test="${status == '1'}">已提现</c:if><c:if test="${status == '0'}">未提现</c:if>">
			<div class="searchBar row">
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="search_orderId"
							placeholder="请输入订单号" autocomplete="off" value="${search_orderId}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="search_name"
							placeholder="请输入患者或专家姓名" autocomplete="off" value="${search_name}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="addPat col-md-6 col-xs-6"></div>
			</div>
			</form>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
                          <th>用户编号</th>
                          <th>申请人</th>
                          <th>医院</th>
                          <th>科室</th>
                          <th>支付宝账号</th>
                          <th>取现金额</th>
                          <th>账户类型</th>
                          <th>开户行</th>
                          <th>申请时间</th>
                          <th>操作</th>
                        </tr>
					</thead>
					<tbody>
						<c:if test="${noRecord == true}">
						   <tr>
						     <td colspan="10">请添加产品。</td>
						   </tr>
						</c:if>
						<c:forEach items="${qpro.records}" var="records">
							<tr>
								<td>${records.userid}</td>
								<td>${records.username}</td>
								<td>${records.hospital}</td>
								<td>${records.department}</td>
								<td>${records.payAccountId}</td>
								<td>${records.account_type}</td>
								<td>${records.open_bank}</td>
								<td>${records.amount}</td>
								<td>${records.request_time}</td>
								<td>
                                   <a href="javascript:void(0)" data-id="${records.orderId}" class="Withdraw" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-zoom-in"></span>详情</a>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			    <div align="center">
					 <ul class="pagination">
						 <li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							 href="${mainUril}quickPayOrder.html?status=${status}&&cp=${qpro.pageView.back}&&ps=${searchParam.ps}">上一页</a>
						 </li>
						 <li     
							 <c:if test="${qpro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							 href="${mainUril}quickPayOrder.html?status=${status}&&cp=${qpro.pageView.next}&&ps=${searchParam.ps}">下一页</a>
						 </li>
					 </ul>
					 <input type="hidden" name="page" value="${searchParam.cp}">
				</div>
				<!--如果找到用户 end-->
	       </div>
		</div>
	 </div>
    <!--模态框 -->
     <div class="modal fade" id="myModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
               <div class="modal-content">
                    <div class="modal-header">
                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                         </button>
                         <h4 class="modal-title" id="myModalLabel">
                              <h4 class="modal-title" id="adminModalLabel">已提现详情</h4>
                         </h4>
                     </div>
                    <div class="modal-body">
                         <div class="form-group">
                             <label for="id">操作id</label>
                             <input type="text" placeholder="操作id" name="id" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="userid">取现用户</label>
                              <input type="text" placeholder="取现用户" name="userid" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="username">申请人姓名</label>
                              <input type="text" placeholder="申请人姓名" name="username" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="type">取现用户类型</label>
                              <input type="text" placeholder="取现用户类型" name="type" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                            <label for="payAccountId">取现用户支付宝账号</label>
                            <input type="text" placeholder="取现用户支付宝账号" name="payAccountId" class="form-control" value="2" autocomplete="off" readonly >
                        </div>
                         <div class="form-group">
                              <label for="payAccountName">取现用户支付宝用户名</label>
                              <input type="text" placeholder="取现用户支付宝用户名" name="payAccountName" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                          <div class="form-group">
	                           <label for="account_type">账户类型</label>
	                           <input type="text" placeholder="账户类型 "  name="account_type" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="open_bank">开户行</label>
                              <input type="text" placeholder="开户行" name="open_bank" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         
                         <div class="form-group">
                              <label for="amount">申请取现金额</label>
                              <input type="text" placeholder="申请取现金额" name="amount" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="scoreBalance">扣除金币数</label>
                              <input type="text" placeholder="扣除金币数" name="scoreBalance" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="request_time">申请提现时间</label>
                              <input type="text" placeholder="申请提现时间" name="request_time" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="draw_time">提现成功时间</label>
                              <input type="text" placeholder="提现成功时间" name="draw_time" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="remark">备注</label>
                              <input type="text" placeholder="备注" name="remark" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="reject_reason">驳回原因</label>
                              <input type="text" placeholder="驳回原因" name="reject_reason" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="request_status">申请状态</label>
                              <input type="text" placeholder="申请状态" name="request_status" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="person">录入人</label>
                              <input type="text" placeholder="录入人" name="person" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="hospital">医院</label>
                              <input type="text" placeholder="医院" name="hospital" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="department">科室</label>
                              <input type="text" placeholder="科室" name="department" class="form-control" value="2" autocomplete="off" readonly >
                         </div>   
                    </div>
                    <div class="modal-footer">
                         <input type="hidden" name="token" value="">
                         <input type="hidden" name="actionType" value=""> 
                         <input type="hidden" name="productId" value="">
                         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                         <input id="qrtx" type="button" class="btn btn-primary" value="确认提现">
                    </div>
               </div>
          </div>
       </div>    
     <!------>
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
	<script src="assets/script/productAdmin/quickPayList.js"></script>
	<script src="assets/script/productAdmin/abc.js"></script>
	<script>
	$('.urlConvert').click(function(){
		status = encodeURIComponent($(this).attr('data-val'));
		location.href=runParams.mainUrl+"quickPayOrder.html?status="+status;
	});
	$('.input-group-addon').click(function(){
	    $('#searchForm').submit();
	});
	</script>
</body>
</html>