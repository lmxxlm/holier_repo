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
<link href="../assets/css/medex/checkoutAdd.css" rel="stylesheet">
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
				<li><a href="checkReport.html?patientId=${patientId}">检验记录</a></li>
				<li class="active">添加检验单</li>
			</ol>
			<div class="mainBody">
				<div class="rightMenu">
					<a href="javascript:void(0)" onFocus="this.blur()"><i
						class="icon-stethoscope"></i>诊断症状</a> <a href="medicalRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-clipboard"></i>病历记录</a> <a
						href="checkRecord.html?patientId=${patientId}&&category=超声波" onFocus="this.blur()"><i
						class="icon-heart-beat"></i>检查记录</a> <a href="checkReport.html?patientId=${patientId}"
						onFocus="this.blur()" class="active"><i
						class="icon-blood-sample"></i>检验记录</a> <a href="medicineRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-pill"></i>用药记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-retweet"></i>随访记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-comment"></i>留言记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-paperclip"></i>附件记录</a>
				</div>
				<div class="record">
					<div class="step">
						<h3>
							<span class="glyphicon glyphicon-hand-right"></span>选择检查单
						</h3>
						<table border="0" cellspacing="0" cellpadding="0"
							class="categoryTable">
							<tr>
								<td class="td1">第一大类：</td>
								<td class="td2 level1"><a href="Javascript:void(0)"
									class="active">不限</a> 
									 <c:forEach items="${firstNames}" var="firstName"
								varStatus="status">
									<a href="Javascript:void(0)">${firstName}</a> 
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td class="td1">第二大类：</td>
								<td class="td2 level2">   
								 <c:forEach items="${secondNames}" var="secondName"
								varStatus="status">
								<a href="Javascript:void(0)">${secondName}</a>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td class="td1">检验单：</td>
								<td class="td2 level3">请先选择第二大类 
								</td>
							</tr>
						</table>
					</div>
					<div class="step">
						<h3>
							<span class="glyphicon glyphicon-hand-right"></span>填写检查单
						</h3>
						<div class="laboratorySheet">
							<div class="title">
								当前选择的检验单：<a href="javascript:void(0)" id="currentSheet">尚未选择检验单</a>
							</div>
							<div class="loading">
								<img src="../assets/image/medex/loading-mini.gif">&nbsp;&nbsp;正在生成检验单...
							</div>
							<div id="sheetBody">
								<div class="editTime">
									检验时间：<input type="text" class="form-control" readonly
										name="checkoutTime" placeholder="请选择检验时间"><input
										type="hidden" name="patientId" value="${patientId}"><input
										type="hidden" name="token" value="${token}">
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
											class="form-control"><span></span></li>
										<li><input type="text" name="" class="form-control"><span></span>
										</li>
										<li class="odd"><input type="text" name=""
											class="form-control"><span></span></li>
										<li><input type="text" name="" class="form-control"><span></span>
										</li>
										<li class="odd"><input type="text" name=""
											class="form-control"><span></span></li>
										<li><input type="text" name="" class="form-control"><span></span>
										</li>
										<li class="odd"><input type="text" name=""
											class="form-control"><span></span></li>
										<li><select class="form-control"><option>阳性</option>
												<option>阴性</option>
										</select><span></span></li>
										<li class="odd"><input type="text" name=""
											class="form-control"><span></span></li>
										<li><input type="text" name="" class="form-control"><span></span>
										</li>
										<li class="odd"><input type="text" name=""
											class="form-control"><span></span></li>
									</ul>
									<div class="clearfix"></div>
									<button type="button"
										class="btn btn-primary btn-block addCheckout"
										onFocus="this.blur()">
										<span class="glyphicon glyphicon-ok"></span>确认添加
									</button>
								</div>
							</div>
						</div>
					</div>
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
	<script src="../assets/script/medex/checkoutAdd.js"></script>
</body>
</html>