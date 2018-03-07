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
        <link href="assets/css/productAdmin/simpleOrder.css" rel="stylesheet">
        <!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
        <script src="assets/library/modernizr/modernizr.js"></script>
        <style>
        .infoTable{ background:#ccc; margin-top:12px;}
        .infoTable td{ padding:10px; background:#fff; border:1px solid #999; color:#000;}
        .leadtd{ background:#dedede !important; font-weight:bold; padding:17px 10px !important;}
        .infoTable .td1{ text-align:left; width:18%;}
        .infoTable .td2{ text-align:left; width:32%;}
        .infoTable .td2 .form-control{ border:none; font-weight:bold;}
        .infoTable .td3,.infoTable .td4{ border:none;}
        .infoTable .td5 .btn-primary{ margin-right:20px;}
        .titleTable td{ font-size:12px;}
        .titleTable .td1{ width:70%;}
        .titleTable .td2{ width:30%;}
        .titleTable .td2 p b{ margin-left:10px; font-weight:bold; font-size:14px;}
        .titleTable ul{ padding-left:15px;}
        .titleTable ul li{ margin-bottom:10px;}
        .glyphicon-ok{ color:green;}
        #adminModal input[readonly]{background-image:none; cursor:not-allowed !important;}
        #adminModal textarea[readonly]{background:#eee;}
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
                  <li><a href="simpleOrder.html">加急订单</a></li>
                  <li class="active">添加订单</li>
                </ol>
                <div class="mainBody row">
                    <div class="">
                        <div class="calendartitle"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;加急订单</div>
                        <div class="calendarList">
                            <input type="hidden" name="token" value="${token}">
                            <table border="0" cellspacing="0" cellpadding="0" class="titleTable" width="100%">
                                <tr>
                                    <td colspan="2" class="td1">
                                        <ul>
                                            <li>加急订单有三种状态：已下单，已支付，完成</li>
                                            <li>每个订单状态下，op都可自由给订单参与者发送自定义短信</li>
                                            <li>订单完成后将对各医生派发对应金币</li>
                                            <li>订单完成后该订单将不可修改</li>
                                        </ul>
                                    </td>
                                    <td colspan="2" class="td2">
                                      <p>订单号：<b>${order.orderId}</b><input type="hidden" value="${order.orderId}" name="orderId"></p>
                                      <p>订单状态：<b><c:if test="${order.status == 0}">已下单</c:if><c:if test="${order.status == 1}">已支付</c:if><c:if test="${order.status == 2}">已完成</c:if><c:if test="${order.status == -1}">未下单</c:if></b><input type="hidden" value="${order.status}" name="status"></p>
                                      <p>录入时间：<b class="recordDate"></b><input type="hidden" value="${order.recordDate}" name="recordDate"></p>
                                      <p>录入人：<b>${order.recordUser}</b><input type="hidden" value="${order.recordUser}" name="recordUser"></p>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                                <tr>
                                    <td colspan="4" class="leadtd">订单产品信息和服务详情</td>
                                </tr>
                                <tr>
                                    <td class="td1">患者姓名</td>
                                    <td class="td2">
		                                <div class="smartSearch">
											<input type="hidden" name="patient_id" value="${order.patient_id}" />
		                                    <input type="text" name="patient_name" class="form-control" autocomplete="off" value="${order.patient_name}" />
											<ul class="searchResultForPatient">
												<li><a href="javascript:void(0)"></a></li>
											</ul>
										</div>
                                    </td>
                                    <td class="td1">联系电话</td>
                                    <td class="td2"><input type="text" class="form-control" name="patient_phone" value="${order.patient_phone}"/></td>
                                </tr>
                                <tr>
                                    <td class="td1">患者联系人</td>
                                    <td class="td2"><input type="text" class="form-control" name="patient_contacts" value="${order.patient_contacts}"/></td>
                                    <td class="td1">患者联系人电话</td>
                                    <td class="td2"><input type="text" class="form-control" name="patient_contacts_phone" value="${order.patient_contacts_phone}"/></td>
                                </tr>
                                <tr>
                                    <td class="td1">申请医生姓名</td>
                                    <td class="td2">
		                                <div class="smartSearch">
											<input type="hidden" name="lowerLevel_doctor_id" value="${order.lowerLevel_doctor_id}" />
		                                    <input type="text" name="lowerLevel_doctor_name" class="form-control" autocomplete="off" value="${order.lowerLevel_doctor_name}"/>
											<ul class="searchResultForDoctor">
												<li><a href="javascript:void(0)"></a></li>
											</ul>
										</div>
                                    </td>
                                    <td class="td1">申请医生医院全称</td>
                                    <td class="td2"><input type="text" class="form-control" name="lowerLevel_doctor_hospital" value="${order.lowerLevel_doctor_hospital}"/></td>
                                </tr>
                                <tr>
                                    <td class="td1">申请医生科室</td>
                                    <td class="td2"><input type="text" class="form-control" name="lowerLevel_doctor_department" value="${order.lowerLevel_doctor_department}"/></td>
                                    <td class="td1">申请医生联系电话</td>
                                    <td class="td2"><input type="text" class="form-control" name="lowerLevel_doctor_phone" value="${order.lowerLevel_doctor_phone}"/></td>
                                </tr>
                                <tr>
                                    <td class="td1">转诊医生姓名</td>
                                    <td class="td2">
		                                <div class="smartSearch">
											<input type="hidden" name="higherLevel_doctor_id" value="${order.higherLevel_doctor_id}" />
		                                    <input type="text" name="higherLevel_doctor_name" class="form-control" autocomplete="off" value="${order.higherLevel_doctor_name}" />
											<ul class="searchResultForDoctor">
												<li><a href="javascript:void(0)"></a></li>
											</ul>
										</div>
                                    </td>
                                    <td class="td1">转诊医生医院全称</td>
                                    <td class="td2"><input type="text" class="form-control" name="higherLevel_doctor_hospital" value="${order.higherLevel_doctor_hospital}"/></td>
                                </tr>
                                <tr>
                                    <td class="td1">转诊医生科室</td>
                                    <td class="td2"><input type="text" class="form-control" name="higherLevel_doctor_department" value="${order.higherLevel_doctor_department}"/></td>
                                    <td class="td1">转诊医生联系电话</td>
                                    <td class="td2"><input type="text" class="form-control" name="higherLevel_doctor_phone" value="${order.higherLevel_doctor_phone}"/></td>
                                </tr>
                                <tr>
                                    <td class="td1">服务产品</td>
                                    <td class="td2">
										<select class="form-control" name="product_category">
										    <option value="">全部分类</option>
											<c:forEach items="${categorys}" var="category">
												<option value="${category.id}" <c:if test="${order.product_category == category.id}">selected</c:if>>${category.name}</option>
											</c:forEach>
										</select>
                                    </td>
                                    <td class="td1">产品报价</td>
                                    <td class="td2"><input type="text" class="form-control" name="product_price" value="${order.product_price}"/></td>
                                </tr>
                                <tr>
                                    <td class="td1">服务时间</td>
                                    <td class="td2"><input type="text" class="form-control" name="service_display_time" placeholder="请选择服务时间" readonly value=""><input type="hidden" name="service_time" value="${order.service_time}"></td>
                                    <td class="td1">&nbsp;</td>
                                    <td class="td2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="td1">服务地点</td>
                                    <td colspan="3" class="td2"><input type="text" class="form-control" name="service_District" value="${order.service_District}"></td>
                                </tr>
                                <tr>
                                    <td class="td1">服务备注</td>
                                    <td colspan="3" class="td2"><textarea class="form-control" name="service_remark">${order.service_remark}</textarea></td>
                                </tr>
                                <tr>
                                    <td class="td1">操作</td>
                                    <td colspan="3" class="td5">
                                        <c:if test="${order.status ne 2}"><button type="button" class="btn btn-primary saveToStatus_0"><span class="glyphicon glyphicon-floppy-saved"></span>&nbsp;&nbsp;保存为已下单</button></c:if>
                                        <c:if test="${order.sendForStatus_0_patient == false}"><button type="button" class="btn btn-default sendForStatus_0_patient"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给患者发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_0_patient == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给患者发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_0_lowerLevel == false}"><button type="button" class="btn btn-default sendForStatus_0_lowerLevel"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给申请医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_0_lowerLevel == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给申请医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_0_higherLevel == false}"><button type="button" class="btn btn-default sendForStatus_0_higherLevel"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给转诊医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_0_higherLevel == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给转诊医生发送短信</button></c:if>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                                <tr>
                                    <td colspan="4" class="leadtd">订单支付信息</td>
                                </tr>
                                <tr>
                                    <td class="td1">支付方式</td>
                                    <td class="td2">
		                                <select class="form-control" name="pay_card_type">
		                                    <option value="">请选择银行卡</option>
										    <option value="ct_003" <c:if test="${order.pay_card_type == 'ct_003'}">selected</c:if>>支付宝</option>
										    <option value="ct_001" <c:if test="${order.pay_card_type == 'ct_001'}">selected</c:if>>银行卡</option>
										    <option value="ct_002" <c:if test="${order.pay_card_type == 'ct_002'}">selected</c:if>>网银</option>
										</select>
                                    </td>
                                    <td class="td1">支付单号</td>
                                    <td class="td2"><input type="text" class="form-control" name="pay_trade_no" value="${order.pay_trade_no}"/></td>
                                </tr>
								<tr>
                                    <td class="td1">付款人</td>
                                    <td class="td2"><input type="text" class="form-control" name="pay_person" autocomplete="off" value="${order.pay_person}"></td>
                                    <td class="td1">付款时间</td>
                                    <td class="td2"><input type="text" class="form-control" name="pay_display_time" placeholder="请选择付款时间" readonly value=""><input type="hidden" name="pay_time" value="${order.pay_time}"></td>
                                </tr>
                                <tr>
                                    <td class="td1">付款金额</td>
                                    <td class="td2"><input type="text" class="form-control" name="pay_amount" value="${order.pay_amount}"></td>
                                    <td class="td1">&nbsp;</td>
                                    <td class="td2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="td1">支付备注</td>
                                    <td colspan="3" class="td2"><textarea class="form-control" name="pay_remark">${order.pay_remark}</textarea></td>
                                </tr>
                                <tr>
                                    <td class="td1">操作</td>
                                    <td colspan="3" class="td5">
                                        <c:if test="${order.status ne 2}"><button type="button" class="btn btn-primary saveToStatus_1"><span class="glyphicon glyphicon-floppy-saved"></span>&nbsp;&nbsp;保存为已支付</button></c:if>
                                        <c:if test="${order.sendForStatus_1_patient == false}"><button type="button" class="btn btn-default sendForStatus_1_patient"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给患者发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_1_patient == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给患者发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_1_lowerLevel == false}"><button type="button" class="btn btn-default sendForStatus_1_lowerLevel"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给申请医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_1_lowerLevel == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给申请医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_1_higherLevel == false}"><button type="button" class="btn btn-default sendForStatus_1_higherLevel"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给转诊医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_1_higherLevel == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给转诊医生发送短信</button></c:if>
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                                <tr>
                                    <td colspan="4" class="leadtd">订单完成--金币返还</td>
                                </tr>                      
                                <tr>
                                    <td class="td1">返还给申请医生</td>
                                    <td class="td2"><input type="text" placeholder="请输入返还给申请医生" name="returnGold_lowerLevel" class="form-control" value="${order.returnGold_lowerLevel}" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"></td>
                                    <td class="td1">返还给转诊医生</td>
                                    <td class="td2"><input type="text" placeholder="请输入返还给转诊医生" name="returnGold_higherLevel" class="form-control" value="${order.returnGold_higherLevel}" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"></td>
                                </tr>
                                <tr>
                                    <td class="td1">平台自留</td>
                                    <td class="td2"><input type="text" placeholder="请输入平台自留的金币" name="returnGold_hly" class="form-control" value="${order.returnGold_hly}" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"></td>
                                    <td class="td1">&nbsp;</td>
                                    <td class="td2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="td1">补贴给申请医生</td>
                                    <td class="td2"><input type="text" placeholder="请输入返还给申请医生" name="subsidyGold_lowerLevel" class="form-control" value="${order.subsidyGold_lowerLevel}" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"></td>
                                    <td class="td1">补贴给转诊医生</td>
                                    <td class="td2"><input type="text" placeholder="请输入返还给转诊医生" name="subsidyGold_higherLevel" class="form-control" value="${order.subsidyGold_higherLevel}" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"></td>
                                </tr>
                                <tr>
                                    <td class="td1">操作</td>
                                    <td colspan="3" class="td5">
                                        <c:if test="${order.status ne 2}"><button type="button" class="btn btn-primary saveToStatus_2"><span class="glyphicon glyphicon-floppy-saved"></span>&nbsp;&nbsp;完成订单</button></c:if>
                                        <c:if test="${order.sendForStatus_2_patient == false}"><button type="button" class="btn btn-default sendForStatus_2_patient"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给患者发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_2_patient == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给患者发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_2_lowerLevel == false}"><button type="button" class="btn btn-default sendForStatus_2_lowerLevel"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给申请医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_2_lowerLevel == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给申请医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_2_higherLevel == false}"><button type="button" class="btn btn-default sendForStatus_2_higherLevel"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;给转诊医生发送短信</button></c:if>
                                        <c:if test="${order.sendForStatus_2_higherLevel == true}"><button type="button" class="btn btn-default" disabled><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;给转诊医生发送短信</button></c:if>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="adminModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="adminModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="adminModalLabel">发送短信</h4>
                 </div>
                 <div class="modal-body">
                    <div class="form-group">
                        <label for="SMS_user">发送给：</label>
                        <input type="text" class="form-control" name="SMS_user" readonly>
                    </div>
                    <div class="form-group">
                        <label for="SMS_phone">发送号码：</label>
                        <input type="text" name="SMS_phone" class="form-control" readonly>
                    </div>               
                    <div class="form-group">
                        <label for="SMS_content">发送内容：</label>
                        <textarea class="form-control notebook" rows="4" name="SMS_content" readonly placeholder="请输入发送内容"></textarea>
                    </div>
                    <div class="form-group">
                        <a href="javascript:void(0)" class="editSMS"><span class="glyphicon glyphicon-edit"></span>&nbsp;编辑短信内容</a>
                    </div>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="SMS_userid" value="">
                    <input type="hidden" name="SMS_usertype" value="">
                    <input type="hidden" name="SMS_field" value="">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="do_SMS_submit">确认发送</button>
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
        <script src="assets/script/productAdmin/simpleOrder.js"></script>
        <script src="assets/script/productAdmin/SMS_templet.js"></script>
        <script>
        $(function(){   
        	//时间弹出
        	$('input[name="service_display_time"],input[name="pay_display_time"]').datetimepicker({
        		language:  'zh-CN',
        		format: 'yyyy-mm-dd hh:ii',
        		weekStart: 1,
        		todayBtn:  1,
        		autoclose: 1,
        		todayHighlight: 1,
        		forceParse: 0,
        		startView: 2,
        		minView: 0
            });
        	$('.recordDate').html(getLocalDate($('input[name="recordDate"]').val(),3));
        	$('input[name="service_display_time"]').val(getLocalDate($('input[name="service_time"]').val(),2));
        	$('input[name="pay_display_time"]').val(getLocalDate($('input[name="pay_time"]').val(),2));
        	function getLocalDate(t,type){
        		if(t==0){
        			return '';
        		}
        		t = t/1000;
    			var unixTime = new Date(t*1000);
    			var year = unixTime.getFullYear();
    			var month = unixTime.getMonth()+1;
    			var day = unixTime.getDate();
    			var hh = unixTime.getHours();
    			var mm = unixTime.getMinutes();
    			var ss = unixTime.getSeconds();
    			var returnDate;
    			switch(type){
    				case 2:returnDate = year+'-'+month+'-'+day;break;
    				case 3:returnDate = year+'年'+month+'月'+day+'日';break;
    				default:returnDate = year+'/'+month+'/'+day;
    			}
    			returnDate += " "+hh+":"+mm;
    			return returnDate;
    		}
        	function dateToUnix(timeStr){
    			var time_arr = timeStr.replace(/:/g,'-').replace(/ /g,'-').split("-");
    			var datum = new Date(Date.UTC(time_arr[0],time_arr[1]-1,time_arr[2],time_arr[3]-8,time_arr[4],time_arr[5]));
    			return datum.getTime();
    		}
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
        				obj.parent().find('.searchResultForDoctor').html(htmlstr).show();
        			}else{
        				obj.parent().find('.searchResultForDoctor').hide();
        			}
        		});
        	});
        	$(".searchResultForDoctor li a").live('click',function(){
        		var p_obj = $(this).parents('.searchResultForDoctor');
        		p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
        		p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-docid"));
        		p_obj.hide();
        	});
        	//患者智能搜索
        	$('.searchResultForPatient').parent().find('.form-control').keyup(function(){
        		var obj = $(this);
        		var searchVar = $(this).val();
        		var questURL = runParams.mainUrl+'searchPatientByNameLimit10.do';
        		var questArr = {
        			searchVar:searchVar
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result.status){   
        				var con = result.data;
        				var htmlstr = '';
        				for(var i=0;i<con.length;i++){
        					htmlstr += '<li><a href="javascript:void(0)" data-patid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].gender+'&nbsp;—&nbsp;'+con[i].birthday+'&nbsp;—&nbsp;'+con[i].disease+'</i></a></li>';
        				}
        				obj.parent().find('.searchResultForPatient').html(htmlstr).show();
        			}else{
        				obj.parent().find('.searchResultForPatient').hide();
        			}
        		});
        	});
        	$(".searchResultForPatient li a").live('click',function(){
        		var p_obj = $(this).parents('.searchResultForPatient');
        		p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
        		p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-patid"));
        		p_obj.hide();
        	});
        	/*字符串去空格*/
        	String.prototype.Trim = function(){    
        	    return this.replace(/(^\s*)|(\s*$)/g, "");    
        	}
        	$('.saveToStatus_0').click(function(){
        		saveOrder(0);
        	});
        	$('.saveToStatus_1').click(function(){
        		saveOrder(1);
        	});
        	$('.saveToStatus_2').click(function(){
        		if(confirm('订单完成后 积分将派发给对应医生，并且该订单将不可修改。确定要继续吗？')){
        			saveOrder(2);
        		}
        	});
        	function saveOrder(status){
        		/*订单全局属性*/
        		var token = $('input[name="token"]').val();
        		var orderId = $('input[name="orderId"]').val();
        		var recordDate = $('input[name="recordDate"]').val();
        		var recordUser = $('input[name="recordUser"]').val();
        		var validStatusArr = [0,1,2];
        		
        		if(!token){
        			alert("页面已过期，请刷新。");
        			return false;
        		}
        		if(!orderId){
        			alert("无法生成这个订单，请刷新。");
        			return false;
        		}
        		if($.inArray(status,validStatusArr)<0){
        			alert("无效的状态标识。");
        			return false;
        		}

        		/*患者属性*/
        		var patient_id = $('input[name="patient_id"]').val();
        		var patient_name = $('input[name="patient_name"]').val();
        		var patient_phone = $('input[name="patient_phone"]').val().Trim();
        		var patient_contacts = $('input[name="patient_contacts"]').val().Trim();
        		var patient_contacts_phone = $('input[name="patient_contacts_phone"]').val().Trim();

        		/*申请医生属性*/
        		var lowerLevel_doctor_id = $('input[name="lowerLevel_doctor_id"]').val();
        		var lowerLevel_doctor_name = $('input[name="lowerLevel_doctor_name"]').val();
        		var lowerLevel_doctor_hospital = $('input[name="lowerLevel_doctor_hospital"]').val().Trim();
        		var lowerLevel_doctor_department = $('input[name="lowerLevel_doctor_department"]').val().Trim();
        		var lowerLevel_doctor_phone = $('input[name="lowerLevel_doctor_phone"]').val().Trim();

        		/*转诊医生属性*/
        		var higherLevel_doctor_id = $('input[name="higherLevel_doctor_id"]').val();
        		var higherLevel_doctor_name = $('input[name="higherLevel_doctor_name"]').val();
        		var higherLevel_doctor_hospital = $('input[name="higherLevel_doctor_hospital"]').val().Trim();
        		var higherLevel_doctor_department = $('input[name="higherLevel_doctor_department"]').val().Trim();
        		var higherLevel_doctor_phone = $('input[name="higherLevel_doctor_phone"]').val().Trim();
        		
        		/*产品*/
        		var product_category = $('select[name="product_category"]').val();
        		var product_price = $('input[name="product_price"]').val()*1;

        		/*服务*/
        		if($('input[name="service_display_time"]').val()==''){
        			var service_time = 0;
        		}else{
        			var service_time = dateToUnix($('input[name="service_display_time"]').val()+':00')*1;
        		}
        		var service_District = $('input[name="service_District"]').val().Trim();
        		var service_remark = $('textarea[name="service_remark"]').val().Trim();
        		
        		/*支付*/
        		var pay_card_type = $('select[name="pay_card_type"]').val();
        		var pay_trade_no = $('input[name="pay_trade_no"]').val().Trim();
        		var pay_person = $('input[name="pay_person"]').val().Trim();
        		if($('input[name="pay_display_time"]').val()==''){
        			var pay_time = 0;
        		}else{
        			var pay_time = dateToUnix($('input[name="pay_display_time"]').val()+':00')*1;
        		}
        		var pay_amount = $('input[name="pay_amount"]').val()*1;
        		var pay_remark = $('textarea[name="pay_remark"]').val().Trim();
        		
        		/*金币返还*/
        		var returnGold_lowerLevel = $('input[name="returnGold_lowerLevel"]').val()*1;
        		var returnGold_higherLevel = $('input[name="returnGold_higherLevel"]').val()*1;
        		var returnGold_hly = $('input[name="returnGold_hly"]').val()*1;
        		var returnGold_total = returnGold_lowerLevel+returnGold_higherLevel+returnGold_hly;
        		var subsidyGold_lowerLevel = $('input[name="subsidyGold_lowerLevel"]').val()*1;
        		var subsidyGold_higherLevel = $('input[name="subsidyGold_higherLevel"]').val()*1;
        		var subsidyGold_total = subsidyGold_lowerLevel+subsidyGold_higherLevel;
        		
        		var questURL = runParams.mainUrl+'saveOrder.do';
    			var questArr = {
   					token : token,
   	        		orderId : orderId,
   	        		status : status,
   	        		recordDate : recordDate,
   	        		recordUser : recordUser,
   	        		patient_id : patient_id,
   	        		patient_name : patient_name,
   	        		patient_phone : patient_phone,
   	        		patient_contacts : patient_contacts,
   	        		patient_contacts_phone : patient_contacts_phone,
   	        		lowerLevel_doctor_id : lowerLevel_doctor_id,
   	        		lowerLevel_doctor_name : lowerLevel_doctor_name,
   	        		lowerLevel_doctor_hospital : lowerLevel_doctor_hospital,
   	        		lowerLevel_doctor_department : lowerLevel_doctor_department,
   	        		lowerLevel_doctor_phone : lowerLevel_doctor_phone,
   	        		higherLevel_doctor_id : higherLevel_doctor_id,
   	        		higherLevel_doctor_name : higherLevel_doctor_name,
   	        		higherLevel_doctor_hospital : higherLevel_doctor_hospital,
   	        		higherLevel_doctor_department : higherLevel_doctor_department,
   	        		higherLevel_doctor_phone : higherLevel_doctor_phone,
   	        		product_category : product_category,
   	        		product_price : product_price,
   	        		service_time : service_time,
   	        		service_District : service_District,
   	        		service_remark : service_remark,
   	        		pay_card_type : pay_card_type,
   	        		pay_trade_no : pay_trade_no,
   	        		pay_person : pay_person,
   	        		pay_time : pay_time,
   	        		pay_amount : pay_amount,
   	        		pay_remark : pay_remark,
   	        		returnGold_lowerLevel : returnGold_lowerLevel,
   	        		returnGold_higherLevel : returnGold_higherLevel,
   	        		returnGold_hly : returnGold_hly,
   	        		returnGold_total : returnGold_total,
   	        		subsidyGold_lowerLevel : subsidyGold_lowerLevel,
   	        		subsidyGold_higherLevel : subsidyGold_higherLevel,
   	        		subsidyGold_total : subsidyGold_total
    			};
    			$.post(questURL,questArr,function(result){
    				if(1==result){
    					if(status==2){
    						orderComplete();
    					}else{
    						alert('订单已经保存。');
        					location.href=runParams.mainUrl+'simpleOrderAdd.html?orderId='+orderId;
    					}
    				}else{
    					alert('订单创建失败！');
    					location.reload();
    				}
    			},'json')
        	}
            function orderComplete(){
            	var orderId = $('input[name="orderId"]').val();
            	var lowerLevel_doctor_id = $('input[name="lowerLevel_doctor_id"]').val();
            	var higherLevel_doctor_id = $('input[name="higherLevel_doctor_id"]').val();
            	var returnGold_lowerLevel = $('input[name="returnGold_lowerLevel"]').val()*1;
        		var returnGold_higherLevel = $('input[name="returnGold_higherLevel"]').val()*1;
        		var returnGold_hly = $('input[name="returnGold_hly"]').val()*1;
        		var subsidyGold_lowerLevel = $('input[name="subsidyGold_lowerLevel"]').val()*1;
        		var subsidyGold_higherLevel = $('input[name="subsidyGold_higherLevel"]').val()*1;
        		var questArr = {
       				orderId:orderId,
       				lowerLevel_doctor_id:lowerLevel_doctor_id,
       				higherLevel_doctor_id:higherLevel_doctor_id,
       				returnGold_lowerLevel:returnGold_lowerLevel,
       				returnGold_higherLevel:returnGold_higherLevel,
       				returnGold_hly:returnGold_hly,
       				subsidyGold_lowerLevel:subsidyGold_lowerLevel,
       				subsidyGold_higherLevel:subsidyGold_higherLevel
        		}
            	var questURL = runParams.mainUrl+'orderCompleteForSO.do';
            	$.post(questURL,questArr,function(result){
    				if(1==result){
    					alert('订单已保存，积分已经派发给对应医生。');
    					location.href=runParams.mainUrl+'simpleOrderAdd.html?orderId='+orderId;
    				}else{
    					alert('订单已保存，积分派发失败！');
    					location.reload();
    				}
    			},'json')
            }
            $('.editSMS').click(function(){
            	$('#adminModal textarea[name="SMS_content"]').attr('readonly',false);
            });
            function adminModal_init(){
            	$('#adminModal input[name="SMS_userid"]').val('');
        		$('#adminModal input[name="SMS_user"]').val('');
        		$('#adminModal input[name="SMS_phone"]').val('');
        		$('#adminModal input[name="SMS_usertype"]').val('');
        		$('#adminModal input[name="SMS_field"]').val('');
        		$('#adminModal textarea[name="SMS_content"]').attr('readonly',true).val('');
            }
            function SMS_adapter(catgory){
            	var SMS_userid,SMS_user,SMS_phone;
            	if(catgory=="patient"){
            		SMS_userid = $('input[name="patient_id"]').val();
            		SMS_user = $('input[name="patient_name"]').val();
            		SMS_phone = $('input[name="patient_phone"]').val().Trim();
            		SMS_usertype = "patient";
            	}
                if(catgory=="lowerLevel_doctor"){
                	SMS_userid = $('input[name="lowerLevel_doctor_id"]').val();
            		SMS_user = $('input[name="lowerLevel_doctor_name"]').val();
            		SMS_phone = $('input[name="lowerLevel_doctor_phone"]').val().Trim();
            		SMS_usertype = "doctor";
            	}
                if(catgory=="higherLevel_doctor"){
                	SMS_userid = $('input[name="higherLevel_doctor_id"]').val();
            		SMS_user = $('input[name="higherLevel_doctor_name"]').val();
            		SMS_phone = $('input[name="higherLevel_doctor_phone"]').val().Trim();
            		SMS_usertype = "doctor";
            	}
                if(!SMS_userid){
                	alert("未找到这个用户！");
                	return false;
                }
                if(!SMS_user){
                	alert("请未填写要发送的用户！");
                	return false;
                }
                if(!SMS_phone){
                	alert("未填写要发送的号码！");
                	return false;
                }
                $('#adminModal input[name="SMS_userid"]').val(SMS_userid);
        		$('#adminModal input[name="SMS_user"]').val(SMS_user);
        		$('#adminModal input[name="SMS_phone"]').val(SMS_phone);
        		$('#adminModal input[name="SMS_usertype"]').val(SMS_usertype);
            }
            $('.sendForStatus_0_patient').click(function(){
            	adminModal_init();
            	SMS_adapter("patient");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_0_patient);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_0_patient');
            	$('#adminModal').modal();
            });
			$('.sendForStatus_0_lowerLevel').click(function(){
				adminModal_init();
            	SMS_adapter("lowerLevel_doctor");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_0_lowerLevel);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_0_lowerLevel');
            	$('#adminModal').modal();
			});
			$('.sendForStatus_0_higherLevel').click(function(){
				adminModal_init();
            	SMS_adapter("higherLevel_doctor");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_0_higherLevel);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_0_higherLevel');
            	$('#adminModal').modal();
			});
            $('.sendForStatus_1_patient').click(function(){
            	adminModal_init();
            	SMS_adapter("patient");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_1_patient);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_1_patient');
            	$('#adminModal').modal();
            });
			$('.sendForStatus_1_lowerLevel').click(function(){
				adminModal_init();
            	SMS_adapter("lowerLevel_doctor");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_1_lowerLevel);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_1_lowerLevel');
            	$('#adminModal').modal();
			});
			$('.sendForStatus_1_higherLevel').click(function(){
				adminModal_init();
            	SMS_adapter("higherLevel_doctor");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_1_higherLevel);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_1_higherLevel');
            	$('#adminModal').modal();
			});
            $('.sendForStatus_2_patient').click(function(){
            	adminModal_init();
            	SMS_adapter("patient");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_2_patient);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_2_patient');
            	$('#adminModal').modal();
            });
			$('.sendForStatus_2_lowerLevel').click(function(){
				adminModal_init();
            	SMS_adapter("lowerLevel_doctor");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_2_lowerLevel);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_2_lowerLevel');
            	$('#adminModal').modal();
			});
			$('.sendForStatus_2_higherLevel').click(function(){
				adminModal_init();
            	SMS_adapter("higherLevel_doctor");
        		$('#adminModal textarea[name="SMS_content"]').val(SMS_templet.sendForStatus_2_higherLevel);
        		$('#adminModal input[name="SMS_field"]').val('sendForStatus_2_higherLevel');
            	$('#adminModal').modal();
			});
            $('#do_SMS_submit').click(function(){
            	var token = $('input[name="token"]').val();
        		var orderId = $('input[name="orderId"]').val();
        		var SMS_userid = $('#adminModal input[name="SMS_userid"]').val();
        		var SMS_user = $('#adminModal input[name="SMS_user"]').val().trim();
        		var SMS_phone = $('#adminModal input[name="SMS_phone"]').val().trim();
        		var SMS_content = $('#adminModal textarea[name="SMS_content"]').val().trim();
        		var SMS_usertype = $('#adminModal input[name="SMS_usertype"]').val();
        		var SMS_field = $('#adminModal input[name="SMS_field"]').val();
        		if(!token){
        			alert('token已过期，请刷新页面。');
        			return false;
        		}
        		if(!orderId||!SMS_userid||!SMS_user||!SMS_phone||!SMS_content){
        			alert('数据不完整！');
        			return false;
        		}
        		var questArr = {
       				orderId:orderId,
       				token:token,
       				userId:SMS_userid,
       				name:SMS_user,
       				phone:SMS_phone,
       				userType:SMS_usertype,
       				dataField:SMS_field,
       				content:SMS_content
           		}
               	var questURL = runParams.mainUrl+'sendMessageForSO.do';
               	$.post(questURL,questArr,function(result){
       				if(1==result){
       					alert('已发送短信。');
       					location.href=runParams.mainUrl+'simpleOrderAdd.html?orderId='+orderId;
       				}else{
       					alert('发送失败！');
       					location.reload();
       				}
       			},'json')
            }); 
        });
        </script>
    </body>
</html>