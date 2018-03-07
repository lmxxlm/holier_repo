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
<link href="assets/css/productAdmin/quickPayList.css" rel="stylesheet">
<link href="assets/css/productAdmin/beansOperation.css" rel="stylesheet">
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
				<li class="active">快捷支付</li>
			</ol>
			<ul id="myTab" class="nav nav-tabs">
                <li <c:if test="${status == '1'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="1" data-toggle="tab" onFocus="this.blur()">已支付</a></li>
                <li <c:if test="${status == '0'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="0" onFocus="this.blur()">未支付</a></li>
            </ul>
            <form method="post" id="searchForm" action="${mainUrl}search_quickPayOrder.do">
            <input type="hidden" name="search_status" value="<c:if test="${status == '1'}">已支付</c:if><c:if test="${status == '0'}">未支付</c:if>">
            <!--  下一页
            <input type="hidden" name="cp" value="${searchParam.cp}">
			<input type="hidden" name="ps" value="${searchParam.ps}">
			<input type="hidden" name="status" value="${status}">
			-->
			<div class="searchBar row" style="margin-top:0;">
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
                         <th>订单编号</th>
                         <th>支付人ID</th>
                         <th>支付人姓名</th>
                         <th>支付类型</th>
                         <th>患者</th>
                         <th>专家</th>
                         <th>服务类型</th>
                         <th>充值金额</th>
                         <th>操作</th>
                      </tr>
					</thead>
					<tbody>
						<c:if test="${noRecord == true}">
							<tr>
								<td colspan="7">请添加产品。</td>
							</tr>
						</c:if>
						<c:forEach items="${qpro.records}" var="records">
							<tr>
								<td>${records.orderId}</td>
								<td>${records.userid}</td>
								<td>${records.userName}</td>
								<td>${records.type}</td>
								<td>${records.patientName}</td>
								<td>${records.expertName}</td>
								<td>${records.serviceType}</td>
								<td>${records.amount}</td>
								<td>
                                   <a href="javascript:void(0)" data-id="${records.orderId}" class="showProduct"><span class="glyphicon glyphicon-zoom-in"></span>详情</a>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
						 <a href="${mainUril}quickPayOrder.html?status=${status}&&cp=${qpro.pageView.back}&&ps=${searchParam.ps}">上一页</a>
						<!--<a href="javascript:void(0);" class="pre">上一页</a>--> 
						</li>
						<li     
							<c:if test="${qpro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
						   <a href="${mainUril}quickPayOrder.html?status=${status}&&cp=${qpro.pageView.next}&&ps=${searchParam.ps}">下一页</a> 
						<!--  <a href="javascript:void(0);" class="next">下一页</a>-->
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
					<input type="hidden" name="pagePre" value="${qpro.pageView.back}">
					<input type="hidden" name="pageNext" value="${qpro.pageView.next}">
				</div>
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
	<!-- 模态框 -->
      <div class="modal fade" id="myModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-header">
                      <button type="button" class="close" 
                         data-dismiss="modal" aria-hidden="true">
                            &times;
                      </button>
                      <h4 class="modal-title" id="myModalLabel">
                          <h4 class="modal-title" id="adminModalLabel">快捷订单-<span class="orderId"></span>的详情</h4>
                      </h4>
                </div>
                <div class="modal-body">
                    <table border="1" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                    <tr>
                      <td class="td1" >订单号：</td>
                      <td class="td2"><span class="orderId" ></span></td>
                      <td class="td1">申请时间：</td>
                      <td class="td2"><span class="time_str"></span></td>
                      <td class="td1">状态：</td>
                      <td class="td2"><span class="status" ></span></td>
                    </tr>
                    <tr>
                      <td class="td1">支付人ID：</td>
                      <td class="td2"><span class="userid" ></span></td>
                      <td class="td1">支付人：</td>
                      <td class="td2"><span class="userName" ></span></td>
                      <td class="td1">患者:</td>
                      <td class="td2"><span class="patientName" ></span></td>
                    </tr>
                    <tr>
                      <td class="td1">专家ID：</td>
                      <td class="td2"><span class="expertId"></span></td>
                      <td class="td1">专家：</td>
                      <td class="td2"><span class="expertName"></span></td>
                      <td class="td1">专家号码:</td>
                      <td class="td2"><span class="expertPhone"></span></td>
                    </tr>
                     <tr>
                      <td class="td1">服务类型：</td>
                      <td class="td2"><span class="serviceType"></span></td>
                      <td class="td1">支付方式：</td>
                      <td class="td2"><span class="type"></span></td>
                      <td class="td1">支付金额:</td>
                      <td class="td2"><span class="amount"></span></td>
                    </tr>
                    <tr>
                      <td class="td1">联系人：</td>
                      <td class="td2"><span class="contactName"></span></td>
                      <td class="td1">联系人号码：</td>
                      <td class="td2"><span class="contactPhone"></span></td>
                      <td class="td1"></td>
                      <td class="td2"></td>
                    </tr>
                    <tr>
                      <td class="td1">责任MA：</td>
                      <td class="td2"><span class="maName"></span></td>
                      <td class="td1">责任CA：</td>
                      <td class="td2"><span class="caName"></span></td>
                      <td class="td1"></td>
                      <td class="td2"></td>
                    </tr>
                  </table>
                </div>
               <div class="modal-footer">
                    <input type="hidden" name="token" value="${token}">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
	<script src="assets/script/productAdmin/quickPayList.js"></script>
	<script>
    /*
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
	
	*/	
	</script>
</body>
</html>