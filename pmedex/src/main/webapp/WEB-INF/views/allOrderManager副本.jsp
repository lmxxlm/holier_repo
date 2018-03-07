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
<style>
 #detailModal .td1{font-weight:bold;}
 #detailModal td{text-align:center;}
</style>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<%@ include file="./commons/leftMenu.jsp"%>
		<div id="content">
			<%@ include file="./commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap" >
				<li><a href="#">Home</a></li>
				<li class="active">手术订单管理</li>
			</ol>
			<ul id="myTab" class="nav nav-tabs" style="margin-top:15px;padding-left:10px;">
			    <li class="active"><a href="allOrderManager.html" class="urlConvert" data-val="0" onFocus="this.blur()">所有订单</a></li>
			    <li ><a href="newOrderManager.html" class="urlConvert" data-val="1" onFocus="this.blur()">待完成订单</a></li>
            </ul>
			<div class="searchBar row">
			</div>
			  
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token}">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>订单id</th>
							<th>套餐标题</th>
							<th>患者姓名</th>
							<th>下级医生姓名</th>
							<th>预定时间</th>
							<th>价格</th>
							<th>状态</th>
							<th>操作</th>
							
						</tr>
					</thead>
					<tbody>
							
						<c:if test="${noOrder== true}">
							<tr>
								<td colspan="9">请添加订单。</td>
							</tr>
						</c:if>
						<c:forEach items="${orderlist}" var="order">
							<tr>
								<td>${order.order_id}</td>
								<td>${order.sp_title}</td>
								<td>${order.patient_name}</td>
								<td>${order.lower_doctor_name}</td>
								<td>${order.order_time}</td>
								<td>${order.price}</td>
								<td class="status">${order.status}</td>
								<td class="td1"><a href="javascript:void(0)" 
								 data-id="${order.order_id}"
								 data-spTitle="${order.sp_title}"
								 data-patientName="${order.patient_name}"
								 data-lowerDoctorName="${order.lower_doctor_name}"
								 data-orderTime="${order.order_time}"
								 data-price="${order.price}"
								 data-status="${order.status}"
								
								 data-patientIDcard="${order.patient_IDcard }"
								 data-patientTel="${order.patient_tel}"
								 data-favoree="${order_favoree}"
								 data-relation="${order_relation}"
								 data-operativeTime="${order_operative_time}"
								 class="detail"><span class="glyphicon glyphicon-zoom-in"></span>详情</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li  <c:if test="${page.cp == 1}"> class="disabled"</c:if>>
					     <a href="${mainUril}allOrderManager.html?cp=${page.cp-1}&&ps=${page.ps}" >上一页</a>
						</li>
						<li  <c:if test="${order.pageView.last == page.cp}"> class="disabled"</c:if>>
						 <a href="${mainUril}allOrderManager.html?cp=${page.cp+1}&&ps=${page.ps}" >下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${page.cp}">  
					<input type="hidden" name="ps" value="${page.ps}">
				</div>
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
	
	
	<!--模态框  -->
	<div class="modal fade" id="detailModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="detailModalLabel">所有订单</h4>
                 </div>
                 <div class="modal-body">
                    <table border="1" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                    <tr>
                      <td class="td1">订单id：</td>
                      <td class="td2"><span class="data-id"></span></td>
                      <td class="td1">套餐标题：</td>
                      <td class="td2"><span class="data-spTitle"></span></td>
                      <td class="td1">患者姓名：</td>
                      <td class="td2"><span class="data-patientName"></span></td>
                    </tr>
                    <tr>
                      <td class="td1">下级医生姓名：</td>
                      <td class="td2"><span class="data-lowerDoctorName"></span></td>
                      <td class="td1">预定时间：</td>
                      <td class="td2"><span class="data-orderTime"></span></td>
                      <td class="td1">价格：</td>
                      <td class="td2"><span class="data-price"></span></td>
                    </tr>
                    <tr>
                     <td class="td1">状态：</td>
                      <td class="td2"><span class="data-status"></span></td>
                      <td class="td1">患者（被保险人）身份证：</td>
                      <td class="td2"><span class="data-patientIDcard"></span></td>
                      <td class="td1">电话：</td>
                      <td class="td2"><span class="data-patientTel"></span></td>
                    </tr>
                    <tr>
                     <td class="td1">受益人：</td>
                      <td class="td2"><span class="data-favoree"></span></td>
                      <td class="td1">被保险人与受益人关系：</td>
                      <td class="td2"><span class="data-relation"></span></td>
                      <td class="td1">手术时间：</td>
                      <td class="td2"><span class="data-operativeTime"></span></td>
                    </tr>
                  </table>
                 </div>
                 <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                 </div>
              </div>
           </div>
        </div>
	<!--  -->
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
	   $(function(){
		   $('.detail').on('click',function(){
			   $('#detailModal').find('span').html('');
			   var id=$(this).attr('data-id');
			   var questArr={
					   id:id
			   };
			   var questURL=runParams.mainUrl+'showDetailById.do';
			   $.post(questURL,questArr,function(result){
				   if(result){
					   $('#detailModal').find('span[class="data-id"]').html(result.data.order_id);
					   $('#detailModal').find('span[class="data-spTitle"]').html(result.data.sp_title);
					   $('#detailModal').find('span[class="data-patientName"]').html(result.data.patient_name);
					   $('#detailModal').find('span[class="data-lowerDoctorName"]').html(result.data.lower_doctor_name);
					   $('#detailModal').find('span[class="data-orderTime"]').html(result.data.order_time);
					   $('#detailModal').find('span[class="data-price"]').html(result.data.price);
					   $('#detailModal').find('span[class="data-status"]').html(result.data.status);
					   
					   
					   $('#detailModal').find('span[class="data-patientIDcard"]').html(result.data.patientIDcard);
					   $('#detailModal').find('span[class="data-patientTel"]').html(result.data.patientTel);
					   $('#detailModal').find('span[class="data-favoree"]').html(result.data.favoree);
					   $('#detailModal').find('span[class="data-relation"]').html(result.data.relation);
					   $('#detailModal').find('span[class="data-operativeTime"]').html(result.data.operativeTime);
					   $('#detailModal').modal();
				   }else{
					   alert("查看详情失败");
					   return false;
				   }
			   });
			   
			   $('#detailModal').find('span[class="data-id"]').html($(this).attr('data-id'));
			   $('#detailModal').find('span[class="data-spTitle"]').html($(this).attr('data-spTitle'));
			   $('#detailModal').find('span[class="data-patientName"]').html($(this).attr('data-patientName'));
			   $('#detailModal').find('span[class="data-lowerDoctorName"]').html($(this).attr('data-lowerDoctorName'));
			   $('#detailModal').find('span[class="data-orderTime"]').html($(this).attr('data-orderTime'));
			   $('#detailModal').find('span[class="data-price"]').html($(this).attr('data-price'));
			   $('#detailModal').find('span[class="data-status"]').html($(this).attr('data-status'));
			   $('#detailModal').find('span[class="data-patientIDcard"]').html($(this).attr('data-patientIDcard'));
			   $('#detailModal').find('span[class="data-patientTel"]').html($(this).attr('data-patientTel'));
			   $('#detailModal').find('span[class="data-favoree"]').html($(this).attr('data-favoree'));
			   $('#detailModal').find('span[class="data-relation"]').html($(this).attr('data-relation'));
			   $('#detailModal').find('span[class="data-operativeTime"]').html($(this).attr('data-operativeTime'));
			   
			 
		   });
		   
	   });
	</script>
</body>
</html>