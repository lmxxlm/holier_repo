<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=”zh”> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=”zh”> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=”zh”> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=”zh”> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <%@ include file="./commons/runParams.html"%>
        <title>CA管理后台</title>
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
        <link href="assets/css/productAdmin/orderConfirmDetail.css" rel="stylesheet">
        <!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
        <script src="assets/library/modernizr/modernizr.js"></script>
        <style>
        .infoTable{ table-layout:fixed;}
        .leadtd{ background:#dedede !important;}
        .td3{ padding-left:20px !important;}
        .td4{ padding-top:20px !important;padding-bottom:20px !important;}
        .td4 ul{ padding:0; padding-left:20px !important; margin:0;}
        .td4 li{ line-height:30px; list-style:none; margin-left:0;}
        .td4 li i{ margin-right:2px;}
        .td4 li span{ font-weight:bold; margin-left:10px;}
        .bookOrder{ padding:20px; border:1px dotted #000; margin:15px 15px 15px 0; display:none;}
        .bottomLine{ border-bottom:2px solid #666;}
        .orderHistory{ text-align:left !important; padding-left:20px !important;}
        .orderHistory .glyphicon-ok-sign{ color:green;}
        .orderHistory .glyphicon-remove-sign{ color:red;}
        .orderHistory .glyphicon-question-sign{ color:yellow;}
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
                  <li><a href="caindex.html?status=${order.status}">${order.status}订单</a></li>
                  <li class="active">订单详情</li>
                </ol>
                <div class="mainBody row">
                    <div class="">
                        <div class="calendartitle"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;订单详细信息</div>
                        <div class="calendarList">
                            <input type="hidden" name="orderId" value="${order.orderId}">
                            <table border="1" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                              <tr>
                                <td class="td1 leadtd bottomLine"  rowspan="2" width="10%">基本信息</td>
                                <td class="td1" width="15%">订单号：</td>
                                <td class="td2" width="15%">${order.orderId}</td>
                                <td class="td1" width="15%">产品预约：</td>
                                <td class="td2" width="45%" colspan="3">【${order.pcname}】&nbsp;&nbsp;${order.startDate} 至 ${order.endDate}</td>
                              </tr>
                              <tr>
                                <td class="td1 bottomLine" width="15%">患者姓名：</td>
                                <td class="td2 bottomLine" width="15%">${order.patient.name}</td>
                                <td class="td1 bottomLine" width="15%">下级医生：</td>
                                <td class="td2 bottomLine" width="15%"> <c:if test="${order.requester_type eq '医生'}">${order.requesterName}</c:if></td>
                                <td class="td1 bottomLine" width="15%">上级医生：</td>
                                <td class="td2 bottomLine" width="15%">${order.owner.name}</td>
                              </tr>     
                              <tr>
                                <td class="td1 leadtd bottomLine"  rowspan="3">定价和积分</td>
                                <td class="td1">产品定价：</td>
                                <td class="td2">${order.product.score_total_mark}</td>
                                <td class="td1">定金和余款：</td>
                                <td class="td2">${order.product.booking_price}&nbsp;/&nbsp;${order.product.score_total_mark-order.product.booking_price}</td>
                                <td class="td1">订单状态：</td>
                                <td class="td2"><font color="red"><strong>${order.status}</strong></font></td>
                              </tr>
                              <tr>
                                <td class="td1">积分返还：</td>
                                <td class="td3" colspan="5">下级医生：${order.product.score_returned_requester}  &nbsp;/&nbsp; 上级医生：${order.product.score_returned_transfer}  &nbsp;/&nbsp;  自留：${order.product.score_self}</td>
                              </tr>
                              <tr>
                                <td class="td1 bottomLine">积分补贴：</td>
                                <td class="td3 bottomLine" colspan="5">下级医生：${order.product.score_subsidy_requester}  &nbsp;/&nbsp; 上级医生：${order.product.score_subsidy_transfer}</td>
                              </tr>
                              <tr>
                                <td class="td1 leadtd bottomLine"  rowspan="3">订单确认</td>
                                <td class="td1">服务时间：</td>
                                <td class="td3" colspan="5">${order.confirmedTime}</td>
                              </tr>
                              <tr>
                                <td class="td1">服务地点：</td>
                                <td class="td3" colspan="5">${order.confirmedLocation}</td>
                              </tr>
                              <tr>
                                <td class="td1 bottomLine">服务备注：</td>
                                <td class="td3 bottomLine" colspan="5">${order.confirmedNote}</td>
                              </tr>
                              <tr>
                                <td class="td1 leadtd bottomLine"  rowspan="3">财务信息</td>
                                <td class="td1">定价收款：</td>
                                <td class="td2">${ptp.amount}</td>
                                <td class="td1">收款日期：</td>
                                <td class="td2">${ptp.remark}</td>
                                <td class="td1">支付类型：</td>
                                <td class="td2">${ptp.category}</td>
                              </tr>
                              <tr>
                                <td class="td1">余款收款：</td>
                                <td class="td2">${ptl.amount}</td>
                                <td class="td1">收款日期：</td>
                                <td class="td2">${ptl.remark}</td>
                                <td class="td1">支付类型：</td>
                                <td class="td2">${ptl.category}</td>
                              </tr>
                              <tr>
                                <td class="td1 bottomLine">总收款：</td>
                                <td class="td2 bottomLine">${ptp.amount+ptl.amount}</td>
                                <td class="td1 bottomLine">总派发：</td>
                                <td class="td2 bottomLine">${order.product.score_returned_requester+order.product.score_returned_transfer+order.product.score_subsidy_requester+order.product.score_subsidy_transfer}</td>
                                <td class="td1 bottomLine">利润：</td>
                                <td class="td2 bottomLine" style="font-weight:bold;color:green;">${ptp.amount+ptl.amount-(order.product.score_returned_requester+order.product.score_returned_transfer+order.product.score_subsidy_requester+order.product.score_subsidy_transfer)}</td>
                              </tr>
                              <tr>
                                <td class="td1 leadtd bottomLine">订单跟踪：</td>
                                <td class="td2 bottomLine orderHistory" colspan="6">${orderHistory}</td>
                              </tr>
                              <tr>
                                <td class="td1 leadtd bottomLine">订单责任人：</td>
                                <td class="td1 bottomLine">CA：</td>
                                <td class="td2 bottomLine" class="ptpAmount">${order.caName}</td>
                                <td class="td1 bottomLine">MA：</td>
                                <td class="td2 bottomLine">${order.maName}</td>
                                <td class="td1 bottomLine"></td>
                                <td class="td2 bottomLine"></td>
                              </tr>
                              <c:if test="${allowAction eq 'yes'}">
                              <c:if test="${order.pcname ne '特需门诊' and order.pcname ne '挂专家号' and order.status ne '已完成' and order.status ne '已作废'}">
                              <tr>
                                <td class="td1 leadtd">修改状态：</td>
                                <td class="td3" colspan="6">
                                    <c:if test="${order.status == '未支付'}"><button type="button" class="btn btn-primary" onclick="showPayInfo()"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;预付定金</button></c:if>
                                    <c:if test="${order.status == '已预订'}"><button type="button" class="btn btn-primary" onclick="location.href='orderConfirmDetail.html?orderId=${order.orderId}'"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;订单确认</button></c:if>
                                    <c:if test="${order.status == '已确认'}"><button type="button" class="btn btn-primary" onclick="showPayInfo()"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;支付余额</button></c:if>
                                    <c:if test="${order.status == '已支付'}"><button type="button" class="btn btn-primary" onclick="serviceComplete()"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;服务完成</button></c:if>
                                    &nbsp;&nbsp;
                                    <button type="button" class="btn btn-default" onclick="showCancelInfo()"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;订单作废</button>         
                                    <input type="hidden" name="token" value="${token}">
								    <input type="hidden" name="orderId" value="${order.orderId}">
                                    <div class="bookOrder payInfo">
								        <div class="form-group">
											<label for="card_type">支付方式</label>
											<select class="form-control" name="card_type">
											    <option value="ct_003" selected>支付宝</option>
											    <option value="ct_001">银行卡</option>
											    <option value="ct_002">网银</option>
											</select>
										</div>
										<div class="form-group">
											<label for="trade_no">支付单号</label>
                                            <input type="text" class="form-control" name="trade_no" placeholder="请输入支付单号" autocomplete="off">
										</div>
										<div class="form-group">
											<label for="pay_person">付款人</label>
                                            <input type="text" class="form-control" name="pay_person" placeholder="请输入付款人" autocomplete="off">
										</div>
										<div class="form-group">
											<label for="pay_time">付款时间</label>
                                            <input type="text" class="form-control" name="pay_time" placeholder="请选择付款时间" readonly>
										</div>
										<div class="form-group">
											<label for="pay_amount">付款金额</label>
                                            <input type="text" class="form-control" name="pay_amount" placeholder="请输入付款金额">
										</div>
										<div class="form-group">
											<label for="remark">备注</label>
                                            <textarea class="form-control" name="remark" placeholder="请输入备注" ></textarea>
										</div>
										<div class="form-group">
											<label for="OPName">录入人</label>
                                            <input type="text" class="form-control" name="OPName" value="${currentUserName}" placeholder="请输入操作人" autocomplete="off">
										</div>
										<button type="button" class="btn btn-primary btn-block submitOrder"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;提交支付信息</button>
								    </div>
								    <div class="bookOrder cancelInfo">
								        <div class="form-group">
											<label for="cancelReason">作废原因</label>
                                            <textarea class="form-control" name="cancelReason" placeholder="请输入作废原因" ></textarea>
										</div>
								        <div class="form-group">
											<label for="OPName2">记录人</label>
                                            <input type="text" class="form-control" name="OPName2" value="${currentUserName}" placeholder="请输入操作人" autocomplete="off">
										    <button type="button" class="btn btn-primary btn-block cancelOrder" style="margin-top:20px;"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;确定订单作废</button>
										</div>
								    </div>
                                </td>
                              </tr>
                              </c:if>
                              </c:if>
                            </table>
                        </div>
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
        <script src="assets/plugins/tools/weekTime.js"></script>
        <script src="assets/script/productAdmin/frame.js"></script>
        <script src="assets/script/productAdmin/orderConfirmDetail.js"></script>
        <script>
        function showPayInfo(){
    		$('.bookOrder').hide();
    		$('.payInfo').show('fast',function(){
    			$("#menu,#content").getNiceScroll().resize();
    		});
    	}
        function showCancelInfo(){
        	$('.bookOrder').hide();
    		$('.cancelInfo').show('fast',function(){
    			$("#menu,#content").getNiceScroll().resize();
    		});
    	}
        function serviceComplete(){
        	if(confirm('该服务所有流程已经完成了吗？')){
        		var orderId = $('input[name="orderId"]').val();
            	var token = $('input[name="token"]').val();
            	if(!orderId){
        			alert("未找到这个订单！");
        			return false;
        		}
            	if(!token){
        			alert("非法提交！");
        			return false;
        		}
            	var questURL = runParams.mainUrl+'orderComplete.do';
        		var questArr = {
        			orderId:orderId,
        			token:token
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result){
        				alert('操作成功！');
        				location.reload();
        			}else{
        				alert('操作失败！');
        				return false;
        			}
        		});
        	}
    	}
        $(function(){   
        	//时间弹出
        	$('input[name="pay_time"]').datetimepicker({
                language:  'zh-CN',
        		format: 'yyyy-mm-dd',
        		weekStart: 1,
        		todayBtn:  1,
        		autoclose: 1,
        		todayHighlight: 1,
        		forceParse: 0,
        		startView: 2,
        		minView: 2,
        		pickerPosition:'top-left'
            });
        	$('.cancelOrder').click(function(){
        		var orderId = $('input[name="orderId"]').val();
        		var OPName2 = $('input[name="OPName2"]').val();
        		var cancelReason = $('textarea[name="cancelReason"]').val();
        		var token = $('input[name="token"]').val();
        		if(!orderId){
        			alert("未找到这个订单！");
        			return false;
        		}
        		if(!OPName2){
        			alert("请输入录入人！");
        			return false;
        		}
        		if(!cancelReason){
        			alert("请输入作废原因！");
        			return false;
        		}
        		if(!token){
        			alert("非法提交！");
        			return false;
        		}
        		var questURL = runParams.mainUrl+'rejectOrder.do';
        		var questArr = {
        			orderId:orderId,
        			rejectReason:cancelReason,
        			opname:OPName2,
        			token:token
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result){
        				alert('订单已作废！');
        				location.reload();
        			}else{
        				alert('操作失败！');
        				return false;
        			}
        		});
        	});
        	$('.submitOrder').click(function(){
        		var orderId = $('input[name="orderId"]').val();
        		var card_type = $('select[name="card_type"]').val();
        		var trade_no = $('input[name="trade_no"]').val();
        		var pay_person = $('input[name="pay_person"]').val();
        		var pay_time = $('input[name="pay_time"]').val();
        		var pay_amount = $('input[name="pay_amount"]').val();
        		var OPName = $('input[name="OPName"]').val();
        		var remark = $('textarea[name="remark"]').val();
        		var token = $('input[name="token"]').val();
        		if(!orderId){
        			alert("未找到这个订单！");
        			return false;
        		}      
        		if(!trade_no){
        			alert("请输入支付单号！");
        			return false;
        		}
        		if(!pay_person){
        			alert("请输入付款人！");
        			return false;
        		}
        		if(!pay_time){
        			alert("请输入付款时间！");
        			return false;
        		}
        		if(!pay_amount){
        			alert("请输入付款金额！");
        			return false;
        		}
        		if(!OPName){
        			alert("请输入录入人！");
        			return false;
        		}
        		if(!token){
        			alert("非法提交！");
        			return false;
        		}
        		var questURL = runParams.mainUrl+'addPayInfo.do';
        		var questArr = {
        			orderId:orderId,
        			card_type:card_type,
        			trade_no:trade_no,
        			pay_person:pay_person,
        			pay_time_str:pay_time,
        			pay_amount:pay_amount,
        			opname:OPName,
        			remark:remark,
        			token:token
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result){
        				alert('操作成功！');
        				location.reload();
        			}else{
        				alert('操作失败！');
        				return false;
        			}
        		});
        	});
        });
        </script>
    </body>
</html>