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
        <link href="assets/css/productAdmin/orderConfirmDetail.css" rel="stylesheet">
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
                  <li><a href="#">订单操作</a></li>
                  <li><a href="order_qrdd.html">待确认订单列表</a></li>
                  <li><a href="orderDetail.html?postType=qrdd&id=${order.orderId}">订单详情</a></li>
                  <li class="active">订单确认</li>
                </ol>
                <div class="mainBody row">
                    <div>
                        <div class="calendartitle"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;确认订单信息</div>
                        <div class="calendarList">
                            <input type="hidden" name="orderId" value="${order.orderId}">
                            <table border="1" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                              <tr>
                                <td class="td1">订单号：</td>
                                <td class="td2">${order.orderId}</td>
                                <td class="td1">患者：</td>
                                <td class="td2">${order.patient.name}</td>
                                <td class="td1">联系方式：</td>
                                <td class="td2">${order.patient.mobilePhone}</td>
                              </tr>
                              <tr>
                                <td class="td1">转诊专家：</td>
                                <td class="td2">${order.owner.name}</td>
                                <td class="td1">申请医生</td>
                                <td class="td2">${order.requesterName}</td>
                                <td class="td1">类型：</td>
                                <td class="td2">${order.pcname}</td>
                              </tr>   
                              <tr>
                                <td class="td1">定价确认：</td>
                                <td colspan="5" class="td3">
                                    <div class="float-form">
						<div class="form-group">
							<label for="score_cost">产品积分/金额</label> <input type="text"
								placeholder="请输入产品积分/金额" readonly name="score_total_mark"
								class="form-control readonlyInput" value="${order.product.score_total_mark}"
								style="cursor: not-allowed !important">
						</div>
						<div class="form-group">
							<label for="score_cost">返还给转诊医生</label> <input type="text"
								placeholder="请输入返还给转诊医生的积分" name="score_returned_requester"
								class="form-control" value="${order.product.score_returned_requester}"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="form-group">
							<label for="score_cost">返还给被转诊专家</label> <input type="text"
								placeholder="请输入返还给被转诊专家的积分" name="score_returned_transfer"
								class="form-control" value="${order.product.score_returned_transfer}"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="form-group">
							<label for="score_cost">自留积分</label> <input type="text"
								placeholder="请输入自留的积分" name="score_self" class="form-control"
								value="${order.product.score_self}" onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="float-form">
						<div class="form-group">
							<label for="score_cost">总补贴积分</label> <input type="text"
								placeholder="请输入总补贴积分" readonly name="score_total_subsidy"
								class="form-control readonlyInput" value="${order.product.score_total_subsidy}"
								style="cursor: not-allowed !important">
						</div>
						<div class="form-group">
							<label for="score_cost">补贴给转诊医生</label> <input type="text"
								placeholder="请输入补贴给转诊医生的积分" name="score_subsidy_requester"
								class="form-control" value="${order.product.score_subsidy_requester}"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="form-group">
							<label for="score_cost">补贴给被转诊专家</label> <input type="text"
								placeholder="请输入补贴给被转诊专家的积分" name="score_subsidy_transfer"
								class="form-control" value="${order.product.score_subsidy_transfer}"
								onkeyup="value=value.replace(/[^\d]/g,'')"
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
						</div>
						<div class="clearfix"></div>
					</div>
                                </td>
                              </tr>  
                              <tr>
                                <td class="td1">服务时间：</td>
                                <td colspan="5" class="td3">
                                    <input type="text" readonly value="" name="serviceTime" class="form-control" placeholder="请选择服务时间">
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">服务地点：</td>
                                <td colspan="5" class="td3">
                                    <textarea class="form-control notebook" name="serviceAddr" placeholder="请输入服务地点"></textarea>
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">备注：</td>
                                <td colspan="5" class="td3">
                                    <textarea class="form-control notebook" name="serviceRemark" placeholder="请输入备注"></textarea>
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">填写人：</td>
                                <td colspan="5" class="td3">
                                    <input type="text" value="${currentUserName}" name="writePerson" class="form-control" placeholder="请输入填写人">
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">&nbsp;</td>
                                <td colspan="5" class="td2">
                                    <input type="hidden" name="token" value="${token}">
                                    <button type="button" class="btn btn-primary submit" onFocus="this.blur()"><span class="glyphicon glyphicon-ok"></span>确认</button>&nbsp;&nbsp;
                                    <button type="button" class="btn reset" onFocus="this.blur()"><span class="glyphicon glyphicon-refresh"></span>重置</button>
                                </td>
                              </tr>
                            </table>
                        </div>
                    </div>
                    <!-- <div class="col-md-3 col-lg-3">
                        <div class="calendartitle"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;驳回订单</div>
                        <div class="calendarList">
                            <textarea class="form-control notebook" name="rejectReason" placeholder="请输入驳回理由" style="height:120px !important;"></textarea>
                            <div class="rejectBtn"><button type="button" class="btn btn-primary" onFocus="this.blur()">驳回</button></div>
                        </div>
                    </div> -->
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
    </body>
</html>