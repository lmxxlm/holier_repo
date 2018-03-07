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
				<li class="active">产品预订</li>
			</ol>
			<form action="${mainUrl}product_search.do" method="post" id="searchForm">
			<input type="hidden" name="cp" value="${searchParam.cp}">
			<input type="hidden" name="ps" value="${searchParam.ps}">
			<div class="searchBar row">
				<div class="smartSearch col-md-3 col-xs-3">
					<div class="input-group">
						<input type="hidden" name="hostId" value="${hostId}">
                        <input type="text" class="form-control" name="owner" placeholder="请输入专家姓名" autocomplete="off" value="${owner}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="col-md-3 col-xs-3">
					<select class="form-control" name="pcid">
						<!--载入时赋值，对应option加selected-->   
						<option value="">全部分类</option>
						<c:forEach items="${categorys}" var="category">
							<option value="${category.id}" <c:if test="${category.id == pcid}">selected</c:if>>${category.name}</option>
						</c:forEach>
					</select>    
				</div>
				<div class="addPat col-md-6 col-xs-6"></div>
			</div>
			<!--  <input type="hidden" name="token" value="${token}">-->
			</form>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>编号</th>
							<th>产品名称</th>
							<th>专家</th>
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
								<td class="td1">
								    <a href="productDetail.html?postType=bookProduct&productId=${product.productId}" data-id="${product.productId}" class="showProduct">
									<span class="glyphicon glyphicon-euro"></span>预订</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
					<!-- <a href="${mainUril}bookProduct.html?cp=${pro.pageView.back}&&ps=${searchParam.ps}">上一页</a> -->
					    <a href="javascript:void(0);" data-cp="${pro.pageView.back}" data-ps="${searchParam.ps}">上一页</a>
						</li>
						<li     
							<c:if test="${pro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
					<!-- <a href="${mainUril}bookProduct.html?cp=${pro.pageView.next}&&ps=${searchParam.ps}">下一页</a> -->
					     <a href="javascript:void(0);" data-cp="${pro.pageView.next}" data-ps="${searchParam.ps}">下一页</a>		
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
				</div>
				<!--如果找到用户 end-->
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
	<script>
	
	//医生智能搜索
	$('.searchResultForDoctor').parent().find('.form-control').keyup(function(){
		var obj = $(this);
		var searchVar = $(this).val();
		var questURL = runParams.mainUrl+'searchDoctorByNameLimit10.do';
		var questArr = {
			searchVar:searchVar
		};
		$.post(questURL,questArr,function(result){
			if(1==result.status){   
				var con = result.data;
				var htmlstr = '';
				for(var i=0;i<con.length;i++){
				  htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].referHospital+'&nbsp;—&nbsp;'+con[i].referDepartments+'&nbsp;—&nbsp;'+con[i].doctorTitle+'</i></a></li>';
				}
				obj.parent().siblings('.searchResultForDoctor').html(htmlstr).show();
			}else{
				obj.parent().siblings('.searchResultForDoctor').hide();
			}
		});
	});
	$(".searchResultForDoctor li a").live('click',function(){
		var p_obj = $(this).parents('.searchResultForDoctor');
		p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
		p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-docid"));
		p_obj.hide();
	});
	$(function(){
		$('.input-group-addon').click(function(){
			//====
				var owner=$('.smartSearch input[name="owner"]').val();
			    var hostId=$('.smartSearch input[name="hostId"]').val();
			    owner=="" ? hostId=" ":hostId;
			    $('.smartSearch input[name="hostId"]').val(hostId);
			//====
			$('#searchForm input[name="cp"]').val(1);
		    $('#searchForm').submit();
		});
		$('select[name="pcid"]').change(function(){
			$('#searchForm input[name="cp"]').val(1);
			$('#searchForm').submit();
		});
	});
	$('.pagination a').click(function(){
		var cp=$(this).attr("data-cp");
		$('#searchForm input[name="cp"]').val(cp);
		$('#searchForm').submit();
	});
	</script>
</body>
</html>