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
<link href="assets/css/medex/datetimepickerReview.css" rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
<link href="assets/css/medex/pat_list.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
a.img {
	width: 5em;
	height: 6em;
	display: inline-block;
	border: 1px dashed #878787;
}

a.img:not (:first-child ){
	width: 5em;
	height: 6em;
	display: inline-block;
	border: 1px dashed #878787;
	margin-left: 1em;
}

p.img_x {
	border-bottom: 1px solid #878787;
	padding-bottom: 0.5em;
}

img {
	display: inline-block;
	margin: 0;
	padding: 0;
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
				<li><a href="#">Home</a>
				</li>
				<li class="active">审核病例</li>
			</ol>


			<div class="searchBar row"></div>
			<div class="mainBody">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th><h5>审核病例</h5>
							</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>订单号</td>
							<td>${orderDetail.order_id}</td>
						</tr>
						<tr>
							<td>患者姓名</td>
							<td>${orderDetail.patient_name}</td>
						</tr>
						<tr>
							<td>套餐标题</td>
							<td>${orderDetail.sp_title}</td>
						</tr>
						<tr>
							<td>下级医姓名</td>
							<td>${orderDetail.lower_doctor_name}</td>
						</tr>
						<tr>
							<td>预约时间</td>
							<td>${orderDetail.order_time}</td>
						</tr>
						<tr>
							<td>订单状态</td>
							<td>${orderDetail.status}</td>
						</tr>
					</tbody>
				</table>
				<!-- - -->
				<div>
					<p>
					<h5>病例图片</h5>
					</p>
					<div>
						<c:forEach items="${imageList}" var="record">
							<p>
								<strong>${record.type_show}</strong>
							</p>
							<p class="img_x">
								<c:forEach items="${record.images}" var="image">
									<a class="img" href="${image.fileName}" target="_blank"><img src="${image.middle}" style="width: 5em;height: 6em;">
									</a>
								</c:forEach>
							</p>
						</c:forEach>

					</div>


					<p>&nbsp;</p>
					<p style="text-align: center;">
						<button class="btn btn-primary "
							style="width: 6em; margin-right: 3em;" id="checkPass"
							data-val="true" onclick="checkCase(this);">审核通过</button>
						<button class="btn btn-default  active "
							style="width: 6em; margin-left: 3em;" id="noPass" data-val="false">不通过
						</button>
					</p>
				</div>

				<!--  -->
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
					<h4 class="modal-title" id="adminModalLabel">
						填写理由<span id="orderId">${order.orderId}</span>
					</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<!--  <label for="reason">添补理由</label>-->
						<textarea class="form-control notebook" rows="4"
							name="noPassReason" placeholder="不通过理由" val=""></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token}"> <input
						type="hidden" name="order_id" value="${orderDetail.order_id}">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
					<button type="button" class="btn btn-primary" id="doSubmit" onclick="checkCase(this);" data-val="false">确认</button>
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
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
	<script type="text/javascript">
		//审核通过
		function checkCase(obj){//不能卸载预加载里
			//是否通过的状态
			var status=$(obj).attr('data-val');
			//获得订单号
			var order_id=$('input[name="order_id"]').val();
			var token=$('input[name="token"]').val();
			var reason=$('textarea[name="noPassReason"]').val();
			var questArr={
					check_status:status,
					order_id:order_id,
					token:token,
					reason:reason
			}
			var questURL=runParams.mainUrl+'checkPass.do';
			$.post(questURL,questArr,function(result){
				if(result){
					alert("审核完成");
					window.location.href=runParams.mainUrl+"caseCheck.html";
				}else{
					alert("审核失败");
					return false;
				};
				
			});
			
		}
	
	    $(function(){
	    	$('#noPass').on('click',function(){
	    		$('#adminModal textarea[name="noPassReason"]').val('');
	    		$('#adminModal').modal();
	    	});
	    });
	</script>
</body>
</html>