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
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
.mainBody{ padding:12px;}
.table th{ background:#fff;}
.table td{vertical-align:middle !important;}
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
				<li class="active">积分兑换比率设定</li>
			</ol>
			<div class="mainBody">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th colspan="5">积分兑换比率设定</th>
						</tr>
					</thead>
					<tbody>
					    <tr>
					        <td width="20%" height="50">&nbsp;</td>
					        <td width="5%">1</td>
					        <td width="5%">:</td>
					        <td width="15%"><input type="text" class="form-control" placeholder="${scoreRate}" name="rate" value=""></td>
					        <td>&nbsp;&nbsp;<button type="button" class="btn btn-primary submit" onFocus="this.blur()">确认修改</button></td>
					    </tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
    <input type="hidden" name="token" value="${token}">
	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/script/productAdmin/frame.js"></script>
	<script>
	$(function(){
		$('.submit').click(function(){
			var rate = $('input[name="rate"]').val();
			var token = $('input[name="token"]').val();
			if(!rate){
			    alert('请填写兑换比率！');
				return false;
			}
			if(!token){
			    alert('非法提交！');
				return false;
			}
			var questURL = runParams.mainUrl+'updateRate.do';
			var questArr = {
				rate:rate,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(result){
					alert('设定已保存！');
					location.reload();
				}else{
					alert("操作失败！"); 
				    return false;
				}
			});
		});
	});
	</script>
</body>
</html>