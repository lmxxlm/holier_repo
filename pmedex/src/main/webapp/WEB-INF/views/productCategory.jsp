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
	href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/productAdmin/frame.css" rel="stylesheet">
<link href="assets/css/productAdmin/productCategory.css"
	rel="stylesheet">
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
				<li><a href="#">Home</a>
				</li>
				<li class="active">产品分类管理</li>
			</ol>
			<div class="searchBar row">
				<div class="smartSearch col-md-4 col-xs-4">
					<!--<form action="searchPatResult.do" method="post" name="searchPatForm" id="searchPatForm">
                        <div class="input-group">
                           <input type="hidden" name="docId" value="">
                           <input type="text" class="form-control" name="searchPat" placeholder="搜索该医生下的病人" autocomplete="off">
                           <input type="hidden" name="token" value="${token}">
                           <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>  
                        </div>
                        <ul class="searchResult"></ul>
                        </form>-->
				</div>
				<div class="addPat col-md-8 col-xs-8">
					<button type="button" class="btn btn-primary pull-right"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span>增加分类
					</button>
				</div>
			</div>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>分类名</th>
							<th>添加人</th>
							<th>添加时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${nocategory == true}">
							<tr>
								<td colspan="5">请添加产品分类。</td>
							</tr>
						</c:if>
						<c:forEach items="${categorys}" var="category">
							<tr>
								<td>${category.name}</td>
								<td>${category.creater}</td>
								<td>${category.creattime_str}</td>
								<td>${category.isValid}</td>
								<td class="td1"><a href="javascript:void(0)"
									data-id="${category.id}" class="editProductCategory"><span
										class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="javascript:void(0)" data-id="${category.id}"
									class="deleteProductCategory"><span
										class="glyphicon glyphicon-remove"></span>删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
					<h4 class="modal-title" id="adminModalLabel">增加一个产品分类</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="productCategoryName">分类名称</label> <input type="text"
							class="form-control" name="productCategoryName"
							placeholder="请输入分类名称">
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
						type="hidden" name="productCategoryId" value="">
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
	<script src="assets/script/productAdmin/frame.js"></script>
	<script src="assets/script/productAdmin/productCategory.js"></script>
</body>
</html>