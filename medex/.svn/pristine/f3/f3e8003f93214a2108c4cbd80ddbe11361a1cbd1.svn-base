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
<title>选择一个要操作的用户 -- MEDEX (v1.0.0)</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
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
		<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Medex</a>
			</div>
			<div class="hidden-xs">
				<form class="navbar-form navbar-left" id="searchForm" role="search"
					action="searchTransferRecord.do" method="post">
					<div class="form-group smartSearch">
						<input type="text" class="form-control" name="requester_name"
							placeholder="申请医生">
						<input type="hidden" name="requester_id" value="">
						<ul class="searchResultForDoctor"></ul>
					</div>    
					<div class="form-group smartSearch">
						<input type="text" class="form-control" name="doctor_name"
							placeholder="转诊医生">
						<input type="hidden" name="doctor_id" value="">
						<ul class="searchResultForDoctor"></ul>
					</div>
					<div class="form-group smartSearch">
						<input type="text" class="form-control" name="patient_name"
							placeholder="患者姓名">
						<input type="hidden" name="patient_id" value="">
						<ul class="searchResultForPatient"></ul>
					</div>
					<div class="form-group">
						<select class="form-control" name="status">
							<option value="不限" selected>不限</option>
							<option value="申请中">申请中</option>
							<option value="已批准">已批准</option>
							<option value="已拒绝">已拒绝</option>
						</select>
					</div>
					<input type="hidden" name="token" value="${token}"> <input
						type="hidden" name="page" value="1">
					<button type="submit" class="btn btn-default" id="save">筛选</button>
				</form>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">退出</a>
				</li>
			</ul>
			<div>
				<p class="navbar-text navbar-right">
					<a href="access.html">返回首页</a>
				</p>
			</div>
		</nav>
		<div class="content">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>申请医生</th>
						<th>转诊医生</th>
						<th>患者姓名</th>
						<th>申请时间</th>
						<th>审核时间</th>
						<th>转诊状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${trro.records}" var="record" varStatus="status">
						<tr>
							<td>${record.requesterName}</td>
							<td>${record.doctorName}</td>
							<td>${record.patientName}</td>
							<td>${record.requestTime_str}</td>
							<td>${record.confirmTime_str}</td>
							<td>${record.transferStatus}</td>
							<c:choose>
								<c:when test="${record.transferStatus eq '申请中' }">
									<td><a href="javascript:void(0)" class="doQuest"
										data-id="${record.transferRequestId}">受理</a>
									</td>
								</c:when>
								<c:otherwise>
									<td><a href="javascript:void(0)" class="detail"
										data-id="${record.transferRequestId}">查看详细</a>
									</td>  
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${nopage==false}">
				<ul class="pager">
					<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
						href="${mainUril}transferTreatmentMessage.html?cp=${dro.pageView.back}&&ps=${searchParam.ps}">上一页</a>
					</li>
					<li
						<c:if test="${dro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
						href="${mainUril}transferTreatmentMessage.html?cp=${dro.pageView.next}&&ps=${searchParam.ps}">下一页</a>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
	<!--受理模态框-->
	<div class="modal fade" id="doQuestModal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="doQuestModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="doQuestModalLabel">受理转诊申请请求</h4>
				</div>
				<div class="modal-body">
					<div class="modalcon">
						申请医生：<span class="data_requester_name">赵琼</span> 转诊医生：<span
							class="data_doctor_name">侯德珠</span> 患者：<span
							class="data_patient_name">王进</span> 申请时间：<span
							class="data_requestTime">2015/03/12</span>
					</div>
					<textarea name="remark" placeholder="可以输入拒绝或通过的原因"
						class="form-control notebook"></textarea>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="transferRecordId" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
					<button type="button" class="btn btn-primary refuse">拒绝</button>
					<button type="button" class="btn btn-primary access">批准</button>
				</div>
			</div>
		</div>
	</div>
	<!--详情模态框-->
	<div class="modal fade" id="detailModal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="detailModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="detailModalLabel">转诊申请请求详情</h4>
				</div>
				<div class="modal-body">
					<div class="modalcon1">
						<p>
							申请医生：<span class="data_requester_name">赵琼</span> 转诊医生：<span
								class="data_doctor_name">侯德珠</span> 患者：<span
								class="data_patient_name">王进</span>
						</p>
						<p>
							申请时间： <span class="data_requestTime">2015/03/12</span> 审核时间： <span
								class="data_checkTime">2015/03/14</span> 审核结果： <span
								class="data_status">已拒绝</span>
						</p>
						<p>备注：<span class="data_remark"></span></p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/script/medex/transferTreatmentMessage.js"></script>
</body>
</html>
