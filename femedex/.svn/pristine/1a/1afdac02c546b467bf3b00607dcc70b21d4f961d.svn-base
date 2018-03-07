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
<link href="assets/css/productAdmin/withdrawal.css" rel="stylesheet">
<style type="text/css">
.positionRelative{position:relative;}
.redWarning{position:absolute; background:red; right:-5px; top:-5px; font-size:10px; padding:3px 5px;}
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
				<li class="active">提现订单</li>
			</ol>
			<ul id="myTab" class="nav nav-tabs">
                <li <c:if test="${status == '1'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="1" data-toggle="tab" onFocus="this.blur()">已提现</a></li>
                <li <c:if test="${status == '0'}">class="active"</c:if>><a href="javascript:void(0)" class="urlConvert" data-val="0" onFocus="this.blur()">未提现</a></li>
                <li class="positionRelative"><a href="withdrawReject.html" onFocus="this.blur()">提现驳回<c:if test="${acount != 0}">（${acount}）</c:if></a></li>
            </ul>       
            <form method="post" id="searchForm" action="${mainUrl}search_withdraw.do">
            <input type="hidden" name="search_status" value="<c:if test="${status == '1'}">已提现</c:if><c:if test="${status == '0'}">未提现</c:if>">
			<div class="searchBar row">
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="search_name"
							placeholder="支付宝用户名" autocomplete="off" value="${search_name}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="search_id"
							placeholder="申请人ID" autocomplete="off" value="${search_id}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="addPat col-md-3 col-xs-3">
				    <div class="input-group">
						<input type="text" class="form-control" name="start_date"
							placeholder="请选择预订开始时间" value="${start_date}">
					</div>
				</div>
				<div class="addPat col-md-3 col-xs-3" style="margin-left:-70px;">
				    <div class="input-group">
						<input type="text" class="form-control" name="end_date"
							placeholder="请选择预订结束时间" value="${end_date}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search" style="color:black;"></i> </span>
					</div>
				</div>
				<div class="addPat col-md-6 col-xs-6"></div>
			</div>
			</form>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						  <th>支付宝账号</th>
                          <th>支付宝用户名</th>
                          <th>取现金额</th>
                          <th>申请人</th>
                          <th>用户ID</th>
                          <th>医院</th>
                          <th>科室</th>
                          <th>申请时间</th>
                          <th>操作</th>
                          <c:if test="${status == '0'}"><th style="text-align:center;">选中</th></c:if>
                        </tr>
					</thead>
					<tbody>
						<c:if test="${noRecord == true}">
						   <tr>
						     <td colspan="10">未找到申请记录。</td>
						   </tr>
						</c:if>
						<c:forEach items="${uro.records}" var="records">
							<tr>
								<td>${records.payAccountId}</td>
								<td>${records.payAccountName}</td>
								<td>${records.amount}</td>
								<td>${records.username}</td>
								<td>${records.userid}</td>
								<td>${records.hospital}</td>
								<td>${records.department}</td>				
								<td>${records.request_time_str}</td>
								<td>
                                   <c:if test="${status == '0'}"><a href="javascript:void(0)" data-id="${records.id}" class="btn btn-primary checkTx">已提现</a>&nbsp;<a href="javascript:void(0)" data-id="${records.id}" data-payAccountId="${records.payAccountId}" data-payAccountName="${records.payAccountName}" data-amount="${records.amount}" class="btn btn-default rejectTx">驳回</a></c:if>
                                   <c:if test="${status == '1'}"><a href="javascript:void(0)" data-id="${records.id}" class="Withdraw"><span class="glyphicon glyphicon-zoom-in"></span>详情</a></c:if>
                                </td>
                                <c:if test="${status == '0'}">
	                                <td class="td2" style="text-align:center;">
								        <!-- <input type="checkbox" name="search_checked"  value="1" <c:if test="${owner.search_checked == true}">checked</c:if>> -->
								        <input type="checkbox" name="search_checked"  value="1" >
								        <input type="hidden" name="recordsId" value="${records.id}">
								    </td>
							    </c:if>
							</tr>
						</c:forEach>
						<c:if test="${status == '0'}">
							<tr>
						        <td colspan="9">&nbsp;</td>
						        <td class="mulity_submit" style="text-align:center;"><a href="javascript:void(0)" class="btn btn-primary">批量提现</a></td>
						    </tr>
					    </c:if>
					</tbody>
				</table>
			    <div align="center">
					 <ul class="pagination">
						 <li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							 href="${mainUril}withdraw.html?status=${status}&&cp=${uro.pageView.back}&&ps=${searchParam.ps}">上一页</a>
						 </li>
						 <li     
							 <c:if test="${uro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							 href="${mainUril}withdraw.html?status=${status}&&cp=${uro.pageView.next}&&ps=${searchParam.ps}">下一页</a>
						 </li>
					 </ul>
					 <input type="hidden" name="page" value="${searchParam.cp}">
				</div>
				<!--如果找到用户 end-->
				<input type="hidden" name="status" value=${status}>
				
	       </div>
		</div>
	 </div>
    <!--模态框 -->
     <div class="modal fade" id="myModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
               <div class="modal-content">
                    <div class="modal-header">
                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                         </button>
                         <h4 class="modal-title" id="myModalLabel">
                              提现详情
                         </h4>
                     </div>
                    <div class="modal-body">
                         <div class="form-group">
                              <label for="userid">取现用户</label>
                              <input type="text" placeholder="没有数据" name="userid" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="username">申请人姓名</label>
                              <input type="text" placeholder="没有数据" name="username" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="hospital">申请人医院</label>
                              <input type="text" placeholder="没有数据" name="hospital" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="department">申请人科室</label>
                              <input type="text" placeholder="没有数据" name="department" class="form-control" value="2" autocomplete="off" readonly >
                         </div> 
                         <div class="form-group">
                              <label for="type">取现用户类型</label>
                              <input type="text" placeholder="没有数据" name="type" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                            <label for="payAccountId">取现用户支付宝账号</label>
                            <input type="text" placeholder="没有数据" name="payAccountId" class="form-control" value="2" autocomplete="off" readonly >
                        </div>
                         <div class="form-group">
                              <label for="payAccountName">取现用户支付宝用户名</label>
                              <input type="text" placeholder="没有数据" name="payAccountName" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                          <div class="form-group">
	                           <label for="account_type">账户类型</label>
	                           <input type="text" placeholder="没有数据 "  name="account_type" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="open_bank">开户行</label>
                              <input type="text" placeholder="没有数据" name="open_bank" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         
                         <div class="form-group">
                              <label for="amount">申请取现金额</label>
                              <input type="text" placeholder="没有数据" name="amount" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="scoreBalance">扣除金币数</label>
                              <input type="text" placeholder="没有数据" name="scoreBalance" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="request_time">申请提现时间</label>
                              <input type="text" placeholder="没有数据" name="request_time" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="draw_time">提现成功时间</label>
                              <input type="text" placeholder="没有数据" name="draw_time" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="remark">备注</label>
                              <input type="text" placeholder="无" name="remark" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="request_status">申请状态</label>
                              <input type="text" placeholder="没有数据" name="request_status" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                         <div class="form-group">
                              <label for="person">录入人</label>
                              <input type="text" placeholder="录入人" name="person" class="form-control" value="2" autocomplete="off" readonly >
                         </div>
                    </div>
                    <div class="modal-footer">
                         <input type="hidden" name="token" value="${token}">
                         <input type="hidden" name="actionType" value=""> 
                         <input type="hidden" name="dataId" value="">
                         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                         <input id="qrtx" type="button" class="btn btn-primary" value="已提现">
                    </div>
               </div>
          </div>
       </div>    
    <!-- 模态框 -->
        <div class="modal fade" id="rejectModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="rejectModalLabel">驳回提现申请</h4>
                 </div>
                 <div class="modal-body">
                    <div style="padding-bottom:15px;">支付宝账号：<span class="payAccountId"></span>，用户名：<span class="payAccountName"></span>，取现金额：<span class="amount"></span></div>
                    <textarea class="form-control notebook" rows="4" name="rejectReason" placeholder="请输入驳回原因"></textarea>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="recordId" value="">
                    <input type="hidden" name="opname" value="${currentUserName}">
                    <span class="pull-left" name="opname">操作人:${currentUserName}</span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
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
	<script src="assets/script/productAdmin/withdraw.js"></script>
	<script>
	
	$(function(){
		//进行批量勾选
		var status=$('input[name="status"]').val();
		if(status==0){
			$('.mulity_submit a').click(function(){
				var token = $('input[name="token"]').val();
				
				var str_checked="";
				if(!token){
				    alert('页面非法提交！');
					return false;
				}  
				var questURL = runParams.mainUrl+'mulity_draw.do';
				
				$('input[name="search_checked"]:checked').each(function(){
					var key = $(this).next('input[name="recordsId"]').val();
					str_checked+=key+",";
				});
				key_checked=str_checked.substring(0,str_checked.length-1);
				var questArr={
					token:token,
					key_checked:key_checked
				}
				$.post(questURL,questArr,function(result){
					if(1==result){
						alert("设置成功！");
						location.href= runParams.mainUrl+"withdraw.html?status="+status;
					}else{
						alert('修改失败！');
					}
				});
				
			});
		}
		
	});
	//=======================================================
	
	
	
	$('.urlConvert').click(function(){
		status = encodeURIComponent($(this).attr('data-val'));
		location.href=runParams.mainUrl+"withdraw.html?status="+status;
	});
	$('.input-group-addon').click(function(){
	    $('#searchForm').submit();
	});
	/*
	//时间弹出
	$('input[name="search_date"]').datetimepicker({
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
	*/
	//时间弹出
	$('input[name="start_date"],input[name="end_date"]').datetimepicker({
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
	$(function(){
		function initModal(){
			$('#myModal input[name="userid"]').val('');
			$('#myModal input[name="username"]').val('');
			$('#myModal input[name="type"]').val('');
			$('#myModal input[name="payAccountId"]').val('');
			$('#myModal input[name="payAccountName"]').val('');
			$('#myModal input[name="amount"]').val('');
			$('#myModal input[name="scoreBalance"]').val('');
			$('#myModal input[name="request_time"]').val('');
			$('#myModal input[name="draw_time"]').val('');
			$('#myModal input[name="remark"]').val('');
			$('#myModal input[name="request_status"]').val('');
			$('#myModal input[name="person"]').val('');
			$('#myModal input[name="hospital"]').val('');
			$('#myModal input[name="department"]').val('');
			$('#myModal input[name="account_type"]').val('');
			$('#myModal input[name="open_bank"]').val('');
			$('#myModal input[name="dataId"]').val('');
		}
		$('.Withdraw').click(function(){
			initModal();
			var dataId=$(this).attr("data-id");
	        if(!dataId){
	        	alert("未找到该申请id。");
	        	return false;
	        }
			var questURL = runParams.mainUrl+'findWithDrawCashById.do';
			var questArr = {
				id:dataId
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					  $('#myModal input[name="userid"]').val(result.data.userid);
					  $('#myModal input[name="username"]').val(result.data.username);
					  $('#myModal input[name="type"]').val(result.data.type);
					  $('#myModal input[name="payAccountId"]').val(result.data.payAccountId);
					  $('#myModal input[name="payAccountName"]').val(result.data.payAccountName);
					  $('#myModal input[name="amount"]').val(result.data.amount);
					  $('#myModal input[name="scoreBalance"]').val(result.data.scoreBalance);
					  $('#myModal input[name="request_time"]').val(result.data.request_time_str);
					  $('#myModal input[name="draw_time"]').val(result.data.draw_time_str);
					  $('#myModal input[name="remark"]').val(result.data.remark);
					  $('#myModal input[name="request_status"]').val(result.data.request_status);
					  $('#myModal input[name="person"]').val(result.data.person);
					  $('#myModal input[name="hospital"]').val(result.data.hospital);
					  $('#myModal input[name="department"]').val(result.data.department);
					  $('#myModal input[name="account_type"]').val(result.data.account_type);
					  $('#myModal input[name="open_bank"]').val(result.data.open_bank);
					  $('#myModal input[name="dataId"]').val(result.data.id);
					  $('#myModal').modal();
				}else{     
				    alert('该订单不存在！');
				}  
			});
		});
		$('#qrtx').click(function(){
			var id = $('#myModal input[name="dataId"]').val();
			var token=$('input[name="token"]').val();
	        if(!token){
	        	alert("页面token已经过期。");
	        	return false;
	        }
			if(!id){
				alert("未找到该申请记录。");
				return false;
			}
			var questURL = runParams.mainUrl+'updateWithDrawStatus.do';
			var questArr = {
				id:id,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(1==result){
					alert("操作成功！");
					location.href=runParams.mainUrl+"withdraw.html?status=1";
				}else{
					alert("操作失败！");
					location.reload();
				}
			})
		});
		$('.checkTx').click(function(){
			var dataId=$(this).attr("data-id");
	        if(!dataId){
	        	alert("未找到该申请记录。");
	        	return false;
	        }
			var token=$('input[name="token"]').val();
	        if(!token){
	        	alert("页面token已经过期。");
	        	return false;
	        }
			var questURL = runParams.mainUrl+'updateWithDrawStatus.do';
			var questArr = {
				id:dataId,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(1==result){
					location.href=runParams.mainUrl+"withdraw.html?status=1";
				}else{
					alert("操作失败！");
				}
				location.reload();
			})
		});
		$('.rejectTx').click(function(){
			var dataId=$(this).attr("data-id");
			var amount=$(this).attr("data-amount");
			var payAccountId=$(this).attr("data-payAccountId");
			var payAccountName=$(this).attr("data-payAccountName");
	        if(!dataId){
	        	alert("未找到该申请记录。");
	        	return false;
	        }
	        $('#rejectModal input[name="recordId"]').val(dataId);
	        $('#rejectModal .payAccountId').html(payAccountId);
	        $('#rejectModal .payAccountName').html(payAccountName);
	        $('#rejectModal .amount').html(amount);
	        $('#rejectModal textarea[name="rejectReason"]').val('');
			$('#rejectModal').modal();
		});
		$('#doSubmit').click(function(){
			var dataId=$('#rejectModal input[name="recordId"]').val();
			var rejectReason = $('#rejectModal textarea[name="rejectReason"]').val();
			var token=$('input[name="token"]').val();
	        if(!token){
	        	alert("页面token已经过期。");
	        	return false;
	        }
	        if(!dataId){
	        	alert("未找到该申请记录。");
	        	return false;
	        }
	        if(!rejectReason){
	        	alert("请输入驳回理由。");
	        	return false;
	        }
			var questURL = runParams.mainUrl+'rejectWithDraw.do';
			var questArr = {
				id:dataId,
				rejectReason:rejectReason,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(1==result){
					alert("该申请已驳回，请等待OP处理。");
					location.href=runParams.mainUrl+"withdraw.html?status=0";
				}else{
					alert("操作失败！");
				}
				location.reload();
			})
		});
	});
	
	</script>
</body>
</html>