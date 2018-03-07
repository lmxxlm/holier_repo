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
<%@ include file="../commons/runParams.html"%>
<title>MA后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="../assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="../assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="../assets/css/medex/frame.css" rel="stylesheet">
<link href="../assets/css/medex/datetimepickerReview.css"
	rel="stylesheet">
<link href="../assets/css/medex/checkout.css" rel="stylesheet">
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
				<li><a href="#">电子病历</a>
				</li>
				<li class="active">检验记录</li>
			</ol>
			<div class="mainBody">
				<div class="rightMenu">
					<a href="javascript:void(0)" onFocus="this.blur()"><i
						class="icon-stethoscope"></i>诊断症状</a> <a
						href="medicalRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-clipboard"></i>病历记录</a> <a
						href="checkRecord.html?patientId=${patientId}&&category=超声波"
						onFocus="this.blur()"><i class="icon-heart-beat"></i>检查记录</a> <a
						href="checkReport.html?patientId=${patientId}"
						onFocus="this.blur()" class="active"><i
						class="icon-blood-sample"></i>检验记录</a> <a
						href="medicineRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-pill"></i>用药记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-retweet"></i>随访记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-comment"></i>留言记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-paperclip"></i>附件记录</a>
				</div>
				<div class="leftMenu" id="leftMenu">
					<button type="button" class="btn btn-primary btn-block addCheckout"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span>添加检验单
					</button>
					<c:forEach items="${cateTreeDeep2}" var="firstName"
						varStatus="status">
						<a href="javascript:void(0)" onFocus="this.blur()"><i
							class="glyphicon glyphicon-chevron-right"></i><span>${firstName.key}</span><i
							class="icon-add-symbol"></i>
						</a>
						<div class="subtitle">
							<c:forEach items="${firstName.value}" var="secondName"
								varStatus="status">
								<a
									href="checkReport.html?patientId=${patientId}&category=${secondName}"
									onFocus="this.blur()">${secondName}</a>
							</c:forEach>
						</div>
					</c:forEach>
					<div class="btn-group checkpage">
						<button type="button" class="btn btn-default active">检验记录</button>
						<button type="button" class="btn btn-default" onclick="location.href='checkReportImage.html?patientId=${patientId}'">检验图片</button>
					</div>
				</div>
				<div class="record">
				    <c:if test="${noRecord==true}">
				    <div style="background:#DEDEDE; height:30px; margin-right:12px;"></div>
				    <div style="background:#fff; height:30px; line-height:30px; padding-left:12px; margin-right:12px;">暂无检验记录。</div>
					</c:if>
					<!--内容循环开始-->
					<c:forEach items="${wcrro.reports}" var="report" varStatus="status" begin="0" step="1">
						<div class="recordWrap">
							<ul class="recordUnit index">
								<li class="title">${report.thirdName}</li>
								<c:forEach items="${report.fourthNames}" var="fourthName"
									varStatus="status">
									<li <c:if test="${status.count%2==0 }">class="odd"</c:if> >${fourthName}</li>
								</c:forEach> 
							</ul>
							<ul class="recordUnit standard">
								<li class="title">正常值</li>
								<c:forEach items="${report.rvs}" var="rv"
									varStatus="status">
								<li <c:if test="${status.count%2==0 }">class="odd"</c:if> >${rv}</li>
								</c:forEach> 
							</ul>
							<div class="recordArea">
								<div class="recordUnitWrap">
								<c:forEach items="${report.valueMap}" var="valuemap"
									varStatus="status">
									<ul class="recordUnit">
										<li class="title"><span>${valuemap.key}</span> <a
											href="javascript:void(0)"
											class="edit glyphicon glyphicon-edit" title="修改"></a> <a
											href="javascript:void(0)"
											class="delete glyphicon glyphicon-remove" title="删除"></a></li>
										<c:forEach items="${valuemap.value}" var="value"
									varStatus="status">
										<li <c:if test="${status.count%2==0 }">class="odd"</c:if>><a href="javascript:void(0)" 
										<c:if test="${value.rv_type==1 && value.status==1}"> 
										 class="up"
										</c:if>
										<c:if test="${value.rv_type==1 && value.status==-1}"> 
										 class="down"
										</c:if>
										<c:if test="${value.rv_type==2 && value.status==false}"> 
										 class="up"
										</c:if>
										>
										${value.value}
										<c:if test="${value.rv_type==1 && value.status==1}">
										&nbsp;<span class="glyphicon glyphicon-arrow-up"></span>
										</c:if>
										<c:if test="${value.rv_type==1 && value.status==-1}">
										&nbsp;<span class="glyphicon glyphicon-arrow-down"></span>
										</c:if>
										</a>
										</li>
										</c:forEach>
									</ul>
									</c:forEach>
									<c:if test="${report.hasmore }">
									<a href="javascript:void(0)" class="getMore"
										onFocus="this.blur()" title="更早的记录"><span
										class="glyphicon glyphicon-chevron-right"></span>
									</a>
									</c:if>
									<div class="clearfix"></div>
									<input type="hidden" value="${report.thirdName}"  name="testName"> <input
										type="hidden" value="${report.lastTime}"  name="lastTime">
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</c:forEach>
					<!--内容循环结束-->
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框 -->
	<div class="modal fade" id="addPatientModal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="patModalLabel">
						修改&nbsp;<span id="currentTime"></span>&nbsp;<span id="currentTest"></span>&nbsp;的数据
					</h4>
				</div>
				<div class="modal-body">
					<div class="loading">
						<img src="../assets/image/medex/loading-mini.gif">&nbsp;&nbsp;正在载入数据...
					</div>
					<div class="sheet">
						<ul class="recordUnit index">
							<li class="title">尿常规</li>
							<li>碱剩余</li>
							<li class="odd">血氧饱和度</li>
							<li>co2分压</li>
							<li class="odd">pH值，硼氢化钠</li>
							<li>氧气</li>
							<li class="odd">标准碳酸氢盐</li>
							<li>碱剩余</li>
							<li class="odd">血氧饱和度</li>
							<li>co2分压</li>
							<li class="odd">pH值，硼氢化钠</li>
							<li>氧气</li>
							<li class="odd">标准碳酸氢盐</li>
						</ul>
						<ul class="recordUnit unit">
							<li class="title">单位</li>
							<li>mmol/l</li>
							<li class="odd">-</li>
							<li>kPa</li>
							<li class="odd">-</li>
							<li>kPa</li>
							<li class="odd">mmol/l</li>
							<li>mmol/l</li>
							<li class="odd">-</li>
							<li>kPa</li>
							<li class="odd">-</li>
							<li>kPa</li>
							<li class="odd">mmol/l</li>
						</ul>
						<ul class="recordUnit standard">
							<li class="title">正常值</li>
							<li>-2.5/+2.5</li>
							<li class="odd">93/99%</li>
							<li>4.7/5.7</li>
							<li class="odd">7.36/7.44</li>
							<li>9/13</li>
							<li class="odd">20/28</li>
							<li>-2.5/+2.5</li>
							<li class="odd">93/99%</li>
							<li>4.7/5.7</li>
							<li class="odd">7.36/7.44</li>
							<li>9/13</li>
							<li class="odd">20/28</li>
						</ul>
						<ul class="recordUnit formArea">
							<li class="title">用户检验数据</li>
							<li><input type="text" name="" class="form-control"><span></span>
							</li>
							<li class="odd"><input type="text" name=""
								class="form-control"><span></span>
							</li>
							<li><input type="text" name="" class="form-control"><span></span>
							</li>
							<li class="odd"><input type="text" name=""
								class="form-control"><span></span>
							</li>
							<li><input type="text" name="" class="form-control"><span></span>
							</li>
							<li class="odd"><input type="text" name=""
								class="form-control"><span></span>
							</li>
							<li><input type="text" name="" class="form-control"><span></span>
							</li>
							<li class="odd"><input type="text" name=""
								class="form-control"><span></span>
							</li>
							<li><select class="form-control"><option>阳性</option>
									<option>阴性</option>
							</select><span></span>
							</li>
							<li class="odd"><input type="text" name=""
								class="form-control"><span></span>
							</li>
							<li><input type="text" name="" class="form-control"><span></span>
							</li>
							<li class="odd"><input type="text" name=""
								class="form-control"><span></span>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token}"> <input
						type="hidden" name="patientId" value="${patientId}"> <input
						type="hidden" name="currentSheet" value=""> <input
						type="hidden" name="currentTime" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="doSubmit">确认</button>
				</div>
			</div>
		</div>
	</div>
	<script src="../assets/library/jquery/jquery.min.js"></script>
	<script src="../assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="../assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/plugins/nprogress/nprogress.js"></script>
	<script
		src="../assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script
		src="../assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="../assets/script/medex/frame.js"></script>
	<script src="../assets/script/medex/checkout.js"></script>
</body>
</html>