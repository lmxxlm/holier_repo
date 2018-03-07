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
				<li class="active">产品一览</li>
			</ol>
			<div class="searchBar row">
				<div class="smartSearch col-md-3 col-xs-3">
					<div class="input-group">
						<input type="hidden" name="docId" value="${hostId}"> <input
							type="text" class="form-control" name="owner"
							placeholder="请输入宿主姓名" autocomplete="off" value="${hostName}">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-search"></i> </span>
					</div>
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="col-md-3 col-xs-3">
					<select class="form-control" name="productCategory">
						<!--载入时赋值，对应option加selected-->   
						<option value="">全部分类</option>
						<c:forEach items="${categorys}" var="category">
							<option value="${category.id}" <c:if test="${category.id == type}">selected</c:if>>${category.name}</option>
						</c:forEach>
					</select>    
				</div>
				<div class="addPat col-md-6 col-xs-6">
					<button type="button" class="btn btn-primary pull-right"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span>增加产品
					</button>
				</div>
			</div>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>编号</th>
							<th>产品名称</th>
							<th>宿主</th>
							<th>所需积分/金额</th>
							<th>积分返还</th>
							<th>积分补贴</th>
							<th>周服务次数</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${noproduct == true}">
							<tr>
								<td colspan="9">请添加产品。</td>
							</tr>
						</c:if>
						<c:forEach items="${pro.products}" var="product">
							<tr>
								<td>${product.productId}</td>
								<td>${product.pcname}</td>
								<td>${product.hostName}</td>
								<td>${product.score_total_mark}</td>
								<td>${product.score_returned_transfer}/${product.score_returned_requester}/${product.score_self}</td>
								<td>${product.score_subsidy_transfer}/${product.score_subsidy_requester}</td>
								<td>${product.serviceCount}</td>
								<td>${product.isValid}</td>
								<td class="td1"><a
									href="productDetail.html?productId=${product.productId}"
									data-id="${product.productId}" class="showProduct"><span
										class="glyphicon glyphicon-zoom-in"></span>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="javascript:void(0)" data-id="${product.productId}"
									class="editProduct"><span class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="javascript:void(0)" data-id="${product.productId}"
									class="deleteProduct"><span
										class="glyphicon glyphicon-remove"></span>删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
					     <!--   <a href="${mainUril}product.html?cp=${pro.pageView.back}&&ps=${searchParam.ps}" data-page="${pro.pageView.back}">上一页</a>-->
						    <a href="javascript:void(0);" data-page="${pro.pageView.back}" data-ps="${searchParam.ps}">上一页</a>
						</li>
						<li     
							<c:if test="${pro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
						    <a href="javascript:void(0);" data-page="${pro.pageView.next}" data-ps="${searchParam.ps}">下一页</a>
						 <!--<a href="${mainUril}product.html?cp=${pro.pageView.next}&&ps=${searchParam.ps}" data-page="${pro.pageView.next}">下一页</a>--> 	
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
								name="host" placeholder="请输入宿主姓名" autocomplete="off">
						</div>
						<ul class="searchResultForDoctor">
							<li><a href="javascript:void(0)"></a></li>
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
						<label for="description">服务内容</label>
						<textarea class="form-control notebook" rows="4"
							name="description" placeholder="请输入服务内容"></textarea>
					</div>
					<div class="form-group">
						<label for="note">注意事项</label>
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
					<input type="hidden" name="token" value="${token }"> <input
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
	<script src="assets/script/productAdmin/product.js"></script>
	<script>
	function searchProduct(){
	    var host = $('input[name="docId"]').val();
		var type = encodeURIComponent($('select[name="productCategory"]').val());
		var cp = $('input[name="page"]').val();
		var ps = $('input[name="ps"]').val();
		var name=encodeURI($('.smartSearch input[name="owner"]').val())
		//if(!name) host="";
		//三目运算符
		name =="" ? host="":host;
		location.href=runParams.mainUrl+'product.html?hostId='+host+'&pcid='+type+'&cp='+cp+'&ps='+ps+'&name='+name;
	}
	$('.input-group-addon').click(function(){
		$('input[name="page"]').val(1);
	    searchProduct();
	});
	$('select[name="productCategory"]').change(function(){
	    $('input[name="page"]').val(1);
	    searchProduct();
	});
	//点击分页链接
	$('.pagination a').click(function(){
	    var page = $(this).attr('data-page');
	    var ps = $(this).attr('data-ps');
		$('input[name="page"]').val(page);
		$('input[name="ps"]').val(ps);
		searchProduct();
	});
	</script>
</body>
</html>