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
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/productAdmin/login.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
</head>
<body onkeydown="keyLogin(event);">
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<div class="loginbox">
			<div class="nav">
				<span class="glyphicons lock"><i></i> </span>登录到&nbsp;&nbsp;<span
					class="themColor">holier&nbsp;&nbsp;CallCenter订单中心</span>
			</div>
			<div class="lockline">
				<span class="glyphicons lock"><i></i> </span>
			</div>
			<div class="loginbody">
				<div class="form-group">
					<label for="name">用户名</label> <input type="text"
						class="form-control" id="username" name="username"
						value="${accountId}" placeholder="请输入用户名">
				</div>   
				<div class="form-group">
					<label for="name">密码</label> <input type="password"
						class="form-control" id="password" name="password"
						value="" placeholder="请输入密码">
				</div>
				<input type="hidden" name="token" value="${token}">
				<button type="button" class="btn btn-default btn-block" id="submit">登录</button>
				<div class="checkbox">
					<label><input type="checkbox" name="rememberDetail"
						<c:if test="${autoLogin == true}">checked="checked"</c:if>
						value="1">记住用户名</label><span id="worn_failed"></span><span
						id="worn_success">登录成功</span><span id="worn_loading">登录中...</span>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
	<script src="assets/script/productAdmin/login.js"></script>
</body>
</html>
