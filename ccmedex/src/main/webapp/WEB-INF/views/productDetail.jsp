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
<title>CallCenter管理后台</title>
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
<link href="assets/css/productAdmin/productDetail.css" rel="stylesheet">
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
				<li><a href="#">Home</a></li>${maplist}
			</ol>
			<div class="mainBody row">
				<div class="col-md-9 col-lg-9">
					<div class="calendartitle">
						<span class="timeHeadline"></span><span
							class="glyphicon glyphicon-time"><input type="hidden"
							name="sTime" value=""><input type="hidden" name="eTime"
							value=""> </span>
					</div>
					<div class="calendarList">
						<input type="hidden" name="productId" value="${product.productId}">
						<table border="1" cellspacing="0" cellpadding="0"
							class="infoTable" width="100%">
							<input type="hidden" name="token" value="${token }">
							<input type="hidden" name="currentTime" value="${currentTime}">
							<c:if test="${product.pcname ne '特需门诊' and product.pcname ne '挂专家号'}">
							<tr>
								<td class="td1">服务次数：</td>
								<td colspan="5" class="td3">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="请输入该周服务次数" name="serviceCount"
											value="${product.serviceCount }"
											onkeyup="value=value.replace(/[^\d]/g,'')"
											onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
										<span class="input-group-addon editServiceCount">确定修改</span>
									</div>
								</td>
							</tr>
							</c:if>
							<tr>
								<td class="td1">产品分类：</td>
								<td class="td2">${product.pcname }</td>
								<td class="td1">产品宿主：</td>
								<td class="td2">${product.hostName }</td>
								<td class="td1">是否启用：</td>
								<td class="td2">${product.isValid }</td>
							</tr>
							<tr>
								<td class="td1">产品定价：</td>
								<td class="td2">${product.score_total_mark }</td>
								<td class="td1">预付定金：</td>
								<td class="td2">${product.booking_price }</td>
								<td class="td1">隐藏价格：</td>
								<td class="td2"><c:if test="${product.hiddenPrice == 0}">隐藏</c:if><c:if test="${product.hiddenPrice == 1}">显示</c:if></td>
							</tr>
							<tr>
								<td class="td1">积分返还：</td>
								<td colspan="5" class="td3" style="padding-left: 15px;">
									返给转诊医生：<b>${product.score_returned_requester}</b>；&nbsp;&nbsp;返给被转诊专家：<b>${product.score_returned_transfer}</b>；&nbsp;&nbsp;保留：<b>${product.score_self}</b>；
								</td>
							</tr>
							<tr>
								<td class="td1">积分补贴：</td>
								<td colspan="5" class="td3" style="padding-left: 15px;">
									补贴给转诊医生：<b>${product.score_subsidy_requester}</b>；&nbsp;补贴给被转诊专家：<b>${product.score_subsidy_transfer}</b>；&nbsp;总补贴额度：<b>${product.score_total_subsidy}</b>；
								</td>
							</tr>
						   <c:if test="${product.pcname ne '特需门诊' and product.pcname ne '挂专家号'}">
							<tr>
								<td class="td1">服务时间：</td>
								<td colspan="5" class="td3" style="padding-left: 15px;"><b>${product.startTime_str}</b>&nbsp;&nbsp;至&nbsp;&nbsp;<b>${product.endTime_str}</b>
								</td>
							</tr>
							</c:if>
							<tr>
								<td class="td1">服务内容：</td>
								<td colspan="5" class="td3">
									<div class="e-description notebook">${product.description}</div>
								</td>
							</tr>
							<tr>
								<td class="td1">注意事项：</td>
								<td colspan="5" class="td3">
									<div class="e-note notebook">${product.note}</div>
								</td>
							</tr>
							<c:if test="${product.pcname ne '特需门诊' and product.pcname ne '挂专家号'}">
							<tr>
								<td class="td1">服务预订：</td>
								<td colspan="5" class="td3" style="padding-left: 15px;">
									该周服务次数剩余：&nbsp;<span id="numRemain"></span>&nbsp;次。<span id="bookAllow" style="display:none;"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;预定</button></span>
								    <div class="bookOrder">
								        <input type="hidden" name="week" value="">
								        <input type="hidden" name="hostId" value="${product.hostId}">
								        <input type="hidden" name="serviceType" value="${product.pcname}">
								        <div class="form-group smartSearch">
								            <label for="patientName">患者姓名</label>
											<input type="hidden" name="patientId" value="">
											<div class="input-group">
												<input type="text" class="form-control" name="patientName" placeholder="请输入患者姓名" autocomplete="off">
										        <span class="input-group-addon checkRepeatOrder" style="cursor:pointer;">检查重复订单</span>
											</div>
											<ul class="searchResultForPatient">
												<li><a href="javascript:void(0)"></a></li>
											</ul>
										</div>
								        <div class="form-group">
											<label for="requester_type">申请人类型</label>
											<div>
											    <label class="radio-inline"><input type="radio" name="requester_type" value="医生" checked>下级医生</label>
												<label class="radio-inline"><input type="radio" name="requester_type" value="患者">患者本人</label>   
											</div>
										</div>
										<div class="form-group smartSearch requesterDoc">
											<div>
												<label for="requesterName">申请人姓名</label>
												<input type="hidden" name="requesterId" value="">
                                                <input type="text" class="form-control" name="requesterName" placeholder="请输入申请人姓名" autocomplete="off">
											</div>
											<ul class="searchResultForDoctor">
												<li><a href="javascript:void(0)"></a></li>
											</ul>
										</div>
										<button type="button" class="btn btn-primary btn-block submitOrder"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;生成未支付订单</button>
								    </div>
								</td>
							</tr>
							</c:if>
						</table>
					</div>
				</div>
				<div class="col-md-3 col-lg-3">
					<div class="panel panel-default calendarBox">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-calendar"></span>&nbsp;选择时间段
							</h3>
						</div>
						<div class="panel-body">
							<table border="0" cellspacing="0" cellpadding="0"
								class="yearInput">
								<tr>
									<td class="td1"><input type="text" class="form-control"
										name="d-year" value="" placeholder="今年的年份" readonly></td>
									<td>&nbsp;年</td>
								</tr>
							</table>
							<div class="weeklist"></div>
						</div>
					</div>
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
	<script src="assets/plugins/tools/weekTime.js"></script>
	<script src="assets/script/productAdmin/frame.js"></script>
	<script src="assets/script/productAdmin/productDetail.js"></script>
	<script>
	    $('.checkRepeatOrder').click(function(){
	    	var patientId = $('input[name="patientId"]').val();
	    	if(!patientId){
	    		alert('请输入患者姓名！');
	    		return false;
	    	}
	    	var questURL = runParams.mainUrl+'checkRepeatOrder.do';
    		var questArr = {
    			patientId:patientId
    		};
    		$.post(questURL,questArr,function(result){
    			if(1==result){
    				alert('请注意：该患者在过去的48小时内有预订订单，请核实信息！');
    			}else{
    				alert('可直接预订。');
    			}
    		});
	    });
	</script>
</body>
</html>