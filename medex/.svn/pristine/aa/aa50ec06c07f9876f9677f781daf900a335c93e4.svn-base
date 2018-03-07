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
         <%@ include file="../commons/runParams.html"%>
        <title>MA后台</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <link href="../assets/library/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/plugins/nprogress/nprogress.css" rel="stylesheet">
        <link href="../assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <link href="../assets/library/icons/pictoicons/css/picto-foundry-medical-science.css" rel="stylesheet">
        <link href="../assets/library/icons/pictoicons/css/picto-foundry-general.css" rel="stylesheet">
        <link href="../assets/library/icons/glyphicons/assets/css/glyphicons_regular.css" rel="stylesheet">
        <link href="../assets/css/medex/frame.css" rel="stylesheet">
        <link href="../assets/css/medex/datetimepickerReview.css" rel="stylesheet">
        <link href="../assets/css/medex/medicineRecord.css" rel="stylesheet">
        <!--[if lt IE 9]>
            <script src="../assets/library/respond/respond.js"></script>
        <![endif]-->
        <script src="../assets/library/modernizr/modernizr.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        
        <div class="container-fluid">
             <!-- leftmenu -->
		<%@ include file="../commons/leftMenu_pat.jsp"%>
            <div id="content">
                <!-- topmenu -->
			<%@ include file="../commons/topMenu.jsp"%>
                <ol class="breadcrumb webmap">
                  <li><a href="#">电子病历</a></li>
                  <li class="active">用药记录</li>
                </ol>
                <div class="mainBody">
                    <div class="rightMenu">
					<a href="javascript:void(0)" onFocus="this.blur()"><i
						class="icon-stethoscope"></i>诊断症状</a> <a href="medicalRecord.html?patientId=${patientId}"
						onFocus="this.blur()" ><i class="icon-clipboard"></i>病历记录</a> <a
						href="checkRecord.html?patientId=${patientId}&&category=超声波" onFocus="this.blur()"><i
						class="icon-heart-beat"></i>检查记录</a> <a href="checkReport.html?patientId=${patientId}"
						onFocus="this.blur()" ><i
						class="icon-blood-sample"></i>检验记录</a> <a href="medicineRecord.html?patientId=${patientId}"
						onFocus="this.blur()" class="active"><i class="icon-pill"></i>用药记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-retweet"></i>随访记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-comment"></i>留言记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-paperclip"></i>附件记录</a>
				</div>
                    <div class="record">
                        <div class="leftLine pull-left">
                            <a href="#this" class="addRecord" onFocus="this.blur()"><span class="glyphicon glyphicon-plus-sign"></span>增加用药记录</a>
                            <div class="timeLine" id="timeLine">
                              <ul>
                                <c:forEach items="${psro.prescriptions}" var="prescription"
								varStatus="status">
                                <li><a href="javascript:void(0)" onFocus="this.blur()" data-id="${prescription.prescriptionId}"  <c:if test="${prescription.active == true}">class="active" </c:if>>${prescription.time_str_ch}</a></li>
                                </c:forEach>
                                <c:if test="${hasMore == true}">
                                <li><a href="javascript:void(0)" class="getMore" onFocus="this.blur()"><i class="glyphicon glyphicon-chevron-down"></i>&nbsp;&nbsp;更早的病历记录</a><input type="hidden" name="lastTime" value="${lastTime}"></li>
                                </c:if>
                              </ul>
                            </div>
                        </div>
                        <div class="recordArea pull-left">
                        <div class="notebook">
                            <!--<div class="btn-group btn-group-xs">
                                <a href="javascript:void(0)" class="btn btn-default" title="修改这条记录"><span class="glyphicon glyphicon-edit"></span></a>
                                <a href="javascript:void(0)" class="btn btn-default" title="删除这条记录"><span class="glyphicon glyphicon-remove"></span></a>
                                <input type="hidden" name="medicineRecordId" value="{$medicineRecordId}">
                            </div>-->
                            <p>&nbsp;</p>
                            <p><strong>处方时间：</strong>&nbsp;&nbsp;<span id="h-time">2015/12/20 12:00</span></p>
                            <p><strong>处方医生：&nbsp;&nbsp;</strong><span id="h-doctor">赵琼</span></p>
                            <p><strong>药品列表：&nbsp;&nbsp;</strong></p>
                            <ul id="medicine_item">
                               <li><a href="javascript:void(0)" class="active">阿莫西林</a></li>
                               <li><a href="javascript:void(0)">裸花紫珠胶囊</a></li>
                               <li><a href="javascript:void(0)">三拗片</a></li>
                               <li><a href="javascript:void(0)">克拉霉素缓释片</a></li>
                               <li><a href="javascript:void(0)">布地奈德气雾剂</a></li>
                               <li><a href="javascript:void(0)">阿莫西林</a></li>
                               <li><a href="javascript:void(0)">裸花紫珠胶囊</a></li>
                               <li><a href="javascript:void(0)">三拗片</a></li>
                               <li><a href="javascript:void(0)">克拉霉素缓释片</a></li>
                               <li><a href="javascript:void(0)">布地奈德气雾剂</a></li>
                               <li><a href="javascript:void(0)">阿莫西林</a></li>
                               <li><a href="javascript:void(0)">裸花紫珠胶囊</a></li>
                               <li><a href="javascript:void(0)">三拗片</a></li>
                               <li><a href="javascript:void(0)">克拉霉素缓释片</a></li>
                               <li><a href="javascript:void(0)">布地奈德气雾剂</a></li>
                            </ul>
                            <div class="clearfix"></div>
                            <p>&nbsp;</p>
                            <div class="pull-left medicineInfo">
                                <p class="title"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;<strong><span>阿莫西林</span>的用药计划</strong></p>
                                <p><strong>开始时间：</strong>&nbsp;&nbsp;<span id="h-medicine_startTime">2015/12/01</span></p>
                                <p><strong>停止时间：</strong>&nbsp;&nbsp;<span id="h-medicine_endTime">2015/12/12</span></p>
                                <p><strong>用药时间：&nbsp;&nbsp;</strong><span id="h-medicine_time">08:00 13:00 18:00</span></p>
                                <p><strong>用药剂量：&nbsp;&nbsp;</strong><span id="h-medicine_dose">每次3片 一日三次</span></p>
                                <p><strong>药名：&nbsp;&nbsp;</strong><span id="h-medicine_name">阿莫西林</span></p>
                                <p><strong>化学名：&nbsp;&nbsp;</strong><span id="h-medicine_mname">左甲状腺素钠片</span></p>
             
                                <p><strong>用药备注：&nbsp;&nbsp;</strong><span id="h-medicine_mark">需长期不间断服药</span></p>
                            </div>
                            <div class="pull-left timeList">
                                <p class="title"><i class="glyphicon glyphicon-pencil"></i>&nbsp;<strong><span>阿莫西林</span>的用药记录</strong></p>
                                <input type="hidden" name="patientId" value="${patientId}">
                                <input type="hidden" name="medicine_name" value="{$medicine_name}">
                                <input type="hidden" name="time" value="">
                                <div class="timeShow">
                                <p>
                                    2015/12/01
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/01">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>
                                </p>
                                <p>
                                    2015/12/02
                                    <span class="glyphicon glyphicon-remove"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/02">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>
                                </p>
                                <p>
                                    2015/12/03
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/03">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/04
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/04">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/05
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/05">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/06
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/06">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/07
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/07">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/08
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/08">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/09
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/09">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/10
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/10">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/11
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/11">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                <p>
                                    2015/12/12
                                    <span class="glyphicon glyphicon-ok"></span>
                                    <span class="radioGroup">
                                        <input type="radio" name="status" value="0" checked>&nbsp;完成&nbsp;&nbsp;
                                        <input type="radio" name="status" value="1">&nbsp;未完成&nbsp;&nbsp;
                                        <a href="javascript:void(0)">确定</a>
                                    </span>
                                    <input type="hidden" name="medicine_date" value="2015/12/12">
                                    <a href="javascript:void(0)" class="edit"><i class="glyphicon glyphicon-edit"></i>修改</a>

                                </p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <p>&nbsp;</p>
                        </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../assets/library/jquery/jquery.min.js"></script>
        <script src="../assets/library/jquery/jquery-migrate.min.js"></script>
        <script src="../assets/library/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="../assets/plugins/nprogress/nprogress.js"></script>
        <script src="../assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
        <script src="../assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
        <script src="../assets/script/medex/frame.js"></script>
        <script src="../assets/script/medex/medicineRecord.js"></script> 
    </body>
</html>