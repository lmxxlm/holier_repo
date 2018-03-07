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
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="assets/library/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link href="assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css" rel="stylesheet">
<link href="assets/library/icons/pictoicons/css/picto-foundry-general.css" rel="stylesheet">
<link href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css" rel="stylesheet">
<link href="assets/css/productAdmin/frame.css" rel="stylesheet">
<link href="assets/css/productAdmin/datetimepickerReview.css" rel="stylesheet">
<link href="assets/css/productAdmin/product.css" rel="stylesheet">
<link href="assets/css/productAdmin/withdrawal.css" rel="stylesheet">
<style type="text/css">
.positionRelative{position:relative;}
.redWarning{position:absolute; background:red; right:-5px; top:-5px; font-size:10px; padding:3px 5px;}
tbody td{ font-size:12px;}
.orderDetail{}
.orderDetail p{ border-bottom:1px solid #eee; color:#000; line-height:40px;}
.orderDetail span{ width:100px; color:#999; display:inline-block;}
</style>
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
				<li class="active">转院订单已提现</li>
			</ol>
			<ul id="myTab" class="nav nav-tabs">
			    <li ><a href="withdrawForRecureOrder.html" class="urlConvert" data-val="0" onFocus="this.blur()">待提现</a></li>
			    <li class="active"><a href="haveWithdrawalForTransfers.html" class="urlConvert" data-val="1" onFocus="this.blur()">已提现</a></li>
                <li><a href="rejectForTransfers.html" class="urlConvert" data-val="2" onFocus="this.blur()">已驳回</a></li>
            </ul>       
            <form method="post" id="searchForm" action="${mainUrl}search_transfers_withdraw.do">
            <input type="hidden" name="search_status" value="2">
            <input type="hidden" name="cp" value="1">
            <input type="hidden" name="ps" value="${pageparam.ps}">
            <input type="hidden" name="token" value="${token}">
			<div class="searchBar row">
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="pay_account_name"
							placeholder="支付宝或银行卡用户名" autocomplete="off" value="${bsq.pay_account_name}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="doctor_id"
							placeholder="用户ID" autocomplete="off" value="${bsq.doctor_id}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="addPat col-md-3 col-xs-3">
				    <div class="input-group">
						<input type="text" class="form-control" name="submit_time_start"
							placeholder="预订开始时间" value="${bsq.submit_time_start}">
					</div>
				</div>
				<div class="addPat col-md-3 col-xs-3" style="margin-left:-81px;">
				    <div class="input-group">
						<input type="text" class="form-control" name="submit_time_end"
							placeholder="预订结束时间" value="${bsq.submit_time_end}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search" style="color:black;"></i> </span>
					</div>
				</div>
				<div class="addPat col-md-3 col-xs-3" style="padding-left:0px; padding-top:10px;">
				    <div class="input-group">
						<input type="text" class="form-control" name="orderid"
							placeholder="订单号" autocomplete="off" value="${bsq.orderid}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search" style="color:black;"></i> </span>
					</div>
				</div>
			</div>
			</form>
			<div class="mainBody">
<!-- 				已提现页面 -->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						  <th width="8%">订单</th>
						  <th width="8%">方式</th>
						  <th width="10%">账号</th>
						  <th width="8%">用户名</th>
                          <th width="10%">开户行</th>
                          <th width="5%">金额</th>
                          <th width="8%">申请人</th>
                          <th width="8%">用户ID</th>
                          <th width="9%">医院</th>
                          <th width="8%">科室</th>
                          <th width="8%">时间</th>
                          <th width="10%">提现时间</th>
                        </tr>
					</thead>
					<tbody>
					    <c:if test="${noRecord==true}">
					       <tr>
						     <td colspan="13">没有更多数据了。</td>
						   </tr>
					    </c:if>
					    <c:forEach  items="${data}" var="record">
					        <tr>
							    <td><a href="javascript:void(0)" data-id="${record.orderid }" class="orderDetail">${record.orderid }</a></td>
								<td>${record.account_type}</td>
								<td>${record.pay_accountid}</td>
								<td>${record.pay_account_name}</td>
								<td>${record.open_bank}</td>	
								<td>${record.amount}</td>			
								<td>${record.doctor_name}</td>
								
								<td>${record.doctor_id}</td>
								<td>${record.doctor_hospital}</td>
								<td>${record.doctor_department}</td>
								<td>${record.submit_time}</td>
								<td>${record.deal_time}</td>
							</tr>
					    
					    </c:forEach>
					</tbody>
				</table>
			    <div align="center">
					 <ul class="pagination">
						 <li <c:if test="${pageparam.cp == 1}"> class="disabled"</c:if>>
						     <a href="javascript:void(0);" data-cp="${pageparam.cp-1}" data-ps="${pageparam.ps}">上一页</a>
						 </li>
						 <li <c:if test="${record.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
						     <a href="javascript:void(0);" data-cp="${pageparam.cp+1}" data-ps="${pageparam.ps}">下一页</a>	
						 </li>
					 </ul>
					 <input type="hidden" name="page" value="${pageparam.cp}">
				</div>
				<!--如果找到用户 end-->
	       </div>
		</div>
	 </div>
     <!--模态框  订单详情 -->
     <div class="modal fade" id="orderDetailModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
               <div class="modal-content">
                    <div class="modal-header">
                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                         </button>
                         <h4 class="modal-title" id="myModalLabel">
                              订单详情
                         </h4>
                     </div>
                    <div class="modal-body">
                        <div class="orderDetail">
                         <p><span>订单号:</span><span data-name="orderNum">KF20160730AJ</span></p>
                         <p><span>主管医生:</span><span data-name="chargeDoc">苗美丽</span></p>
                         <p><span>患者:</span><span data-name="patient">成月饼</span></p>
                         <p><span>康复医院:</span ><span data-name="kfHos">&nbsp;-&nbsp;双床病房</span></p>
                         <p><span>提现金额:</span><span data-name="money">200</span></p>
                         </div>
                    </div>
                    <div class="modal-footer">
                         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
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
	<script src="assets/script/productAdmin/frame.js"></script>
	<script>
	$(function(){
		//查看订单详情
		//先初始化订单详情模态框；
		function orderDetailModalInit(){
		    $('#orderDetailModal span[data-name="orderNum"]').html('');
		    $('#orderDetailModal span[data-name="chargeDoc"]').html('');
		    $('#orderDetailModal span[data-name="patient"]').html('');
		    $('#orderDetailModal span[data-name="kfHos"]').html('');
		    $('#orderDetailModal span[data-name="money"]').html('');
		} 
		//点击订单
		$('a.orderDetail').click(function(){
			orderDetailModalInit();
			
			var orderid=$(this).attr('data-id');
			 if(!orderid){
	        	alert("未找到对应的转院订单。");
	        	return false;
	        }
			var token=$('input[name="token"]').val();
	        if(!token){
	        	alert("页面token已经过期。");
	        	return false;
	        }
		
			var questArr={
				orderid:orderid,
				token:token
			}
			
			var questURL=runParams.mainUrl+'get_kf_transfer_order_detail_data.do';;
			
			$.post(questURL,questArr,function(result){
				if(result.status==1){
					$('#orderDetailModal span[data-name="orderNum"]').html(result.data.orderid);
				    $('#orderDetailModal span[data-name="chargeDoc"]').html(result.data.doctor_name);
				    $('#orderDetailModal span[data-name="patient"]').html(result.data.patient_name);
				    $('#orderDetailModal span[data-name="kfHos"]').html(result.data.doctor_hospital);
				    $('#orderDetailModal span[data-name="money"]').html(result.data.reward);
				    $('#orderDetailModal').modal();
				}else{
					alert("没详情");
					return false;
				}
			});
			
		});
		
		
		//时间弹出
			//时间弹出
		$('input[name="submit_time_start"],input[name="submit_time_end"]').datetimepicker({
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
		
		
		$('.pagination a').click(function(){
			var ps = $(this).attr('data-ps');
			var cp = $(this).attr('data-cp');
			$('#searchForm input[name="ps"]').val(ps);
			$('#searchForm input[name="cp"]').val(cp);
			$('#searchForm').submit();
	    });
		
		
		//搜索：
		$('.input-group-addon').click(function(){
		    $('#searchForm').submit();
		});
	});
	
	
	</script>
</body>
</html>