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
<%@ include file="commons/runParams.html"%>
<title>MA后台</title>
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
<link href="assets/css/medex/frame_ad.css" rel="stylesheet">
<link href="assets/css/medex/frame.css" rel="stylesheet">
<link href="assets/css/medex/datetimepickerReview.css"
	rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
<link href="assets/css/medex/pat_list.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
#timeForm .input-group > .form-control {
  
}
.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
    min-height: 1px;
    padding-left: 0px;
    padding-right: 0px;
    position: relative;
}
#TimeSave{
    background: #7293cf none repeat scroll 0 0 !important;
    border: 1px solid #999;
    color: #fff;
}
</style>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
<input type="hidden" name="currentUserId" value="${currentUserId}">
<input type="hidden" name="currentUserType" value="${currentUserType}">
	<div class="container-fluid">
		<!-- leftmenu -->
		<%@ include file="commons/leftMenu_ad.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="commons/topMenu_ad.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li class="active">病例审核</li>
			</ol>
			
			
			<div class="searchBar row">
			
				
			</div>
			<div class="mainBody">
				<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>订单号</th>
						<th>患者姓名</th>
						<th>套餐标题</th>
						<th>下级医姓名</th>
						<th>预定时间</th>
						<th>订单状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderlist}" var="order" >
						<tr>
							<td>${order.order_id}</td>
							<td>${order.patient_name}</td>
							<td>${order.sp_title}</td>
							<td>${order.lower_doctor_name}</td>
							<td>${order.order_time}</td>
							<td>${order.status}</td>
							
							<td class="td2"><a
								href="${mainUrl}checkCase?order_id=${order.order_id}">审核病例</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		 
			  <ul class="pager">
				<li ><a
					href="${mainUril}caseCheck.html?cp=${page.cp-1}&&ps=${page.ps}">上一页</a>
				</li>
				<li
					><a
					href="${mainUril}caseCheck.html?cp=${page.cp+1}&&ps=${page.ps}">下一页</a>
				</li>
			 </ul>
			 
			 <input type="hidden" name="nopage" value='${nopage}'></input>
				<!-- 分页结束 -->
				<!--如果找到用户 end-->
			 </div>
		</div>
	</div>


	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
	<script src="assets/script/medex/chooseAccount.js"></script>
	<script type="text/javascript">
	$(function(){
		var nopage=$('input[name="nopage"]').val();
		if(nopage){
			$('.pager').hide();
		}else{
			$('.pager').show();
		};
		
		
		
		$('input[name="startDate"],input[name="endDate"]').datetimepicker({
			language:  'zh-CN',
			format: 'yyyy-mm-dd',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			forceParse: 0,
			startView: 2,
			minView: 2
		  });
		
		
	
		
	   
	   
	   $("#TimeSave").click(function(){
		   
			var type = $('input[name="type"]').val();
			var startDate = $('input[name="startDate"]').val();
			var endDate = $('input[name="endDate"]').val();
			var token = $('input[name="token"]').val();

			if(!startDate){
				alert("请输入搜索内容！");
				return false;
			}
			if(!endDate){
				alert("请输入搜索内容！");
				return false;
			}
			if(!searchType){
				alert("请选择搜索类别！");
				return false;
			}
			if(!token){
				alert("非法提交！");
				return false;
			}
			
			$("#timeForm").submit();
			
			
			
		});
		
	});
	
	</script>
</body>
</html>