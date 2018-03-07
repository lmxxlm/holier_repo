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
				<li><a href="#">Home</a></li>
				${maplist}
			</ol>
			<div class="searchBar row">
				<div class="smartSearch col-md-3 col-xs-3">
				    <form name="hostSearch" action="searchAccountForProductOwner.do" method="post">
					<div class="input-group">
						<input type="hidden" name="docId" value="${hostId}"> <input
							type="text" class="form-control" name="owner"
							placeholder="请输入宿主姓名" autocomplete="off" value="${host}">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-search"></i>
						</span>
					</div>
					<ul class="searchResultForDoctor"></ul>
					</form>
				</div>
				<div class="addPat col-md-9 col-xs-9" style="padding-right:0;">
				    <a href="serviceProvide" class="btn btn-primary pull-right"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span>设定宿主医生
					</a>
				</div>
			</div>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>宿主名</th>
							<th>性别</th>
							<th>医院</th>
							<th>科室</th>
							<th>职称</th>
							<th>产品</th>
							<th>操作</th>
							<th style="text-align:center;">好乐医服务</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${noowner==true}">
						<tr>
							<td colspan="8">${noownerStr}</td>
						</tr>
						</c:if>
						<c:forEach items="${poro.owners}" var="owner">
							<tr>
								<td>${owner.name}</td>
								<td>${owner.gender}</td>
								<td>${owner.referHospital}</td>
								<td>${owner.referDepartments}</td>
								<td>${owner.doctorTitle}</td>
								<td><a href="ownerProduct.html?hostId=${owner.ownerId}">${owner.pcount}</a>
								</td>
								<td class="td1"><a href="ownerProduct.html?hostId=${owner.ownerId}"
									data-id="${owner.ownerId}" class="productOwnerDetail"><span
										class="glyphicon glyphicon-zoom-in"></span>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="javascript:void(0)" data-id="${owner.ownerId}"
									data-name="${owner.name}" class="addProduct"><span
										class="glyphicon glyphicon-plus"></span>添加产品</a>
								</td>
								<td class="td2" style="text-align:center;">
							        <input type="checkbox" name="HLYService"  value="1" <c:if test="${owner.HLYService == true}">checked</c:if>>
							        <input type="hidden" name="doctorId" value="${owner.ownerId}">
							    </td>
							</tr>
						</c:forEach>
						<tr>
					        <td colspan="7">&nbsp;</td>
					        <td class="submit" style="text-align:center;"><a href="javascript:void(0)" class="btn btn-primary">确定设置</a></td>
					    </tr>
					</tbody>
				</table>
				<div align="center">
					<ul class="pager">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="${mainUril}productOwner.html?cp=${poro.pageView.back}&&ps=${searchParam.ps}">上一页</a>
						</li>
						<li     
							<c:if test="${poro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="${mainUril}productOwner.html?cp=${poro.pageView.next}&&ps=${searchParam.ps}">下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
				</div>
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
	<!-- 模态框 -->
	<div class="modal fade" id="adminModal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="adminModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="adminModalLabel">产品操作</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="type">产品分类</label> <select class="form-control"
							name="type">
							<option value="0" selected>选择产品分类</option>
							<c:forEach items="${categorys}" var="category">
								<option value="${category.id}">${category.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group smartSearch">
						<div>
							<label for="host">宿主</label> <input type="hidden" name="hostId"
								value=""> <input type="text" class="form-control"
								name="host" readonly
								style="background-image: none; cursor: not-allowed !important;"
								placeholder="请输入宿主姓名" autocomplete="off">
						</div>
						<ul class="searchResultForDoctor">
							<li><a href="javascript:void(0)"></a>
							</li>
						</ul>
					</div>
					<div class="float-form">
						<div class="form-group">
							<label for="score_cost">产品积分/金额</label> <input type="text"
								placeholder="请输入产品积分/金额" readonly name="score_total_mark"
								class="form-control readonlyInput" value="0"
								style="cursor: not-allowed !important">
						</div>
						<div class="form-group">
							<label for="score_cost">返还给转诊医生</label> <input type="text"
								placeholder="请输入返还给转诊医生的积分" name="score_returned_requester"
								class="form-control" value="0"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="form-group">
							<label for="score_cost">返还给被转诊专家</label> <input type="text"
								placeholder="请输入返还给被转诊专家的积分" name="score_returned_transfer"
								class="form-control" value="0"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="form-group">
							<label for="score_cost">自留积分</label> <input type="text"
								placeholder="请输入自留的积分" name="score_self" class="form-control"
								value="0" onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<span class="icon1 hidden-xs">=</span> <span
							class="icon2 hidden-xs">+</span> <span class="icon3 hidden-xs">+</span>
						<div class="clearfix"></div>
					</div>
					<div class="float-form">
						<div class="form-group">
							<label for="score_cost">总补贴积分</label> <input type="text"
								placeholder="请输入总补贴积分" readonly name="score_total_subsidy"
								class="form-control readonlyInput" value="0"
								style="cursor: not-allowed !important">
						</div>
						<div class="form-group">
							<label for="score_cost">补贴给转诊医生</label> <input type="text"
								placeholder="请输入补贴给转诊医生的积分" name="score_subsidy_requester"
								class="form-control" value="0"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="form-group">
							<label for="score_cost">补贴给被转诊专家</label> <input type="text"
								placeholder="请输入补贴给被转诊专家的积分" name="score_subsidy_transfer"
								class="form-control" value="0"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<span class="icon1 hidden-xs">=</span> <span
							class="icon2 hidden-xs">+</span>
						<div class="clearfix"></div>
					</div>
					<div class="form-group hideLine">
						<label for="description">预付定金/预付积分</label> <input type="text"
							placeholder="请输入预付定金" name="booking_price" class="form-control"
							value="0" onkeyup="value=value.replace(/[^\d]/g,'')"
							onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
					</div>
					<div class="form-group">
						<label for="description">服务内容（200字以内）</label>
						<textarea class="form-control notebook" rows="4"
							name="description" placeholder="请输入服务内容"></textarea>
					</div>
					<div class="form-group">
						<label for="note">注意事项（200字以内）</label>
						<textarea class="form-control notebook" rows="4" name="note"
							placeholder="请输入注意事项"></textarea>
					</div>
					<div class="form-group hideLine">
						<label for="score_returned">每周服务次数</label> <input type="text"
							placeholder="请输入每周的服务次数" name="serviceCount" class="form-control"
							value="3" onkeyup="value=value.replace(/[^\d]/g,'')"
							onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
					</div>
					<div class="form-group hideLine">
						<label for="score_returned">服务开始和结束时间</label>
						<div class="clearfix"></div>
						<input type="text" class="form-control inputDT" name="startTime"
							placeholder="请选择开始时间" readonly> <input type="text"
							class="form-control inputDT" name="endTime" placeholder="请选择结束时间"
							readonly>
						<div class="clearfix"></div>
					</div>
					<div class="form-group">
						<label for="hiddenPrice">是否隐藏价格</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="hiddenPrice" value="0" checked>隐藏</label> <label
								class="radio-inline"><input type="radio" name="hiddenPrice"
								value="1">显示</label>
						</div>
					</div>
					<div class="form-group">
						<label for="isValid">是否启用</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="isValid" value="启用" checked>启用</label> <label
								class="radio-inline"><input type="radio" name="isValid"
								value="不启用">不启用</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token}"> <input
						type="hidden" name="actionType" value=""> <input
						type="hidden" name="productId" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="doSubmit">确认</button>
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
	<script src="assets/script/productAdmin/productOwner.js"></script>
</body>
</html>