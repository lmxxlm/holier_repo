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
<style>
td a img{width:30px;height:30px;}
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
				<li><a href="#">Home</a></li>
				<li class="active">康复转院订单管理</li>
			</ol>
			<div class="searchBar row">
			</div>
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token}">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>订单id</th>
							<th >医院</th>
							<th >小结图片</th>
							<th>患者姓名</th>
							<th>患者手机号</th>
							<th>医生姓名</th>
							<th>医生手机号</th>
							<th>预定时间</th>
							<th>入住时间</th>
							<th>状态</th>
							<th>是否生效</th>
							<th style="text-align:center;">操作</th>
						</tr>
					</thead>
					<tbody>
							
						<c:if test="${noOrder== true}">
							<tr>
								<td colspan="9">无转院订单。</td>
							</tr>
						</c:if>
						<c:forEach items="${orderlist}" var="order">
							<tr>
								<td>${order.orderid}</td>
								<td>${order.hospital_name}</td>
								<td>
								  <c:forEach items="${order.report_images}" var="image">
                                   <a href="${image.fileName}" target="_blank" class="conImg"><img src="${image.middle}"/></a>
                                  </c:forEach>
                                </td>
								<td>${order.patient_name}</td>
								<td>${order.patient_phone}</td>
								<td>${order.doctor_name}</td>
								<td>${order.doctor_id}</td>
								<td>${order.create_time}</td>
								<td>${order.check_in_time}</td>
								<td>${order.status}</td>
								<td>
								<c:choose>
									<c:when test="${order.open == false}">
 未生效
   </c:when>
									<c:otherwise>
已生效
   </c:otherwise>
								</c:choose>
								</td>
								<td style="text-align:center;">	
								<c:if test="${order.status eq '待转院确认'}">
								     <c:if test="${order.open == false}">
									     <button data-id="${order.orderid}" type="button" class="btn btn-primary " name="open" >通过</button>					
								     </c:if>
								     <c:if test="${order.open == true}">
									     <button data-id="${order.orderid}" type="button" class="btn btn-primary " name="close" >驳回</button>					
								     </c:if>
								     <!-- 
								      <button data-id="${order.orderid}" type="button" class="btn btn-primary " name="pass" >确认转院</button>
								     <button data-id="${order.orderid}" type="button" class="reject btn btn-default " name="reject" style="margin-top:7px;">驳回申请</button>
								     -->
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li >
					     <a href="${mainUril}kfTransferOrder.html?cp=${page.cp-1}&&ps=${page.ps}" >上一页</a>
						</li>
						<li     
							>
						 <a href="${mainUril}kfTransferOrder.html?cp=${page.cp+1}&&ps=${page.ps}" >下一页</a>
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
	<div class="modal fade" id="refuseModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="refuseModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="refuseModalLabel">驳回理由</h4>
                 </div>
                 <div class="modal-body">
                    <textarea class="form-control notebook" rows="4"
							name="reason" placeholder="请输入驳回理由"></textarea>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="token" value="${token }"> 
                    <input type="hidden" name="orderid" value="${orderid }"> 
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary  doReject" name="doReject">确认驳回</button>
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
	<script>
	    $(function(){
	    	//点击添加按钮
	    	$('.reject').click(function(){
	    		var orderid = $(this).attr('data-id');
	    	    $('#refuseModal input[name="orderid"]').val(orderid);
	    	    $('#refuseModal').modal('show');
	    	});
	    	
	    	//订单开启
	    	$('button[name="open"]').on('click',function(){
	    		var id=$(this).attr('data-id');
	    		var token=$('input[name="token"]').val();
	    		
	    		var questArr={orderid:id,token:token}
	    		var questURL=runParams.mainUrl+"kf_order_open.do"
	    		$.post(questURL,questArr,function(result){
	    			if(result){
	    				alert("订单已开启");
	    				location.reload();
	    			}else{
	    				alert("操作失败");
	    				return false;
	    			} 
	    		});
	    	});
	    	//订单关闭
	    	$('button[name="close"]').on('click',function(){
	    		var id=$(this).attr('data-id');
	    		var token=$('input[name="token"]').val();
	    		
	    		var questArr={orderid:id,token:token}
	    		var questURL=runParams.mainUrl+"kf_order_close.do"
	    		$.post(questURL,questArr,function(result){
	    			if(result){
	    				alert("订单已关闭");
	    				location.reload();
	    			}else{
	    				alert("操作失败");
	    				return false;
	    			} 
	    		});
	    	});
	    	
	    	//确认转院
	    	$('button[name="pass"]').on('click',function(){
	    		var id=$(this).attr('data-id');
	    		var token=$('input[name="token"]').val();
	    		
	    		var questArr={orderid:id,token:token}
	    		var questURL=runParams.mainUrl+"kf_order_confirm.do"
	    		$.post(questURL,questArr,function(result){
	    			if(result){
	    				alert("订单已确认");
	    				location.reload();
	    			}else{
	    				alert("操作失败");
	    				return false;
	    			} 
	    		});
	    	});
	    	
	    	//驳回
	    	$('button[name="doReject"]').on('click',function(){
	    		var orderid=$('#refuseModal input[name="orderid"]').val();
	    		var reason=$('#refuseModal textarea[name="reason"]').val();
	    		var token=$('#refuseModal input[name="token"]').val();
	    		
	    		if(!reason){
	    			alert("请填写驳回理由！");
	    			return false;
	    		}
	    		var questArr={
	    				orderid:orderid,
	    				reason:reason,
	    				token:token
	    				}
	    		var questURL=runParams.mainUrl+"kf_order_reject.do"
	    		$.post(questURL,questArr,function(result){
	    			if(result){
	    				alert("订单已驳回");
	    				location.reload();
	    			}else{
	    				alert("操作失败");
	    				return false;
	    			} 
	    		});
	    	});
	    });
	</script>
</body>
</html>