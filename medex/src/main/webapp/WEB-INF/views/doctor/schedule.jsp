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
<link href="../assets/css/medex/doc_schedule.css" rel="stylesheet">
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
		<%@ include file="../commons/leftMenu_doc.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="../commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li class="active">医生的日程管理</li>
			</ol>
			<div class="mainBody row">
				<div class="col-md-9 col-lg-9">
					<div class="calendartitle">
						<div class="pull-left">
							<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;添加日程
						</div>
						<div class="pull-right hidden-xs">
							<a
								href="${mainUrl}doctor/schedule.html?day=${prevDay}&doctorId=${doctorId}"
								class="glyphicon glyphicon-arrow-left"></a>&nbsp;&nbsp;${displayDay}，${weekDay}&nbsp;&nbsp;<a
								href="${mainUrl}doctor/schedule.html?day=${nextDay}&doctorId=${doctorId}"
								class="glyphicon glyphicon-arrow-right"></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="calendarList">
						<ul>
							<c:forEach items="${sro.scheduleItems}" var="obj"
								varStatus="status">
								<li class="notebook">
									<div class="time">
										${obj.key} <span class="text-primary">am</span>
									</div> <i class="glyphicon glyphicon-record dot"></i>
									<ul class="appointments">
										<c:forEach items="${obj.value}" var="item" varStatus="status">
											<li>
												<div class="btn-group btn-group-xs">
													<c:if test="${item.isComming == 1}">
													<c:if test="${item.type ne '门诊排班'}">
														<a href="#this" class="btn btn-default editNormal"
															title="修改这条日程"><i class="glyphicon glyphicon-edit"></i>
														</a>
														</c:if>
														<a href="#this" class="btn btn-default 
														<c:choose>
									<c:when test="${item.type eq '门诊排班'}">   
   deleteOpst  
   </c:when>
									<c:otherwise>  
     deleteNormal
   </c:otherwise>
								</c:choose>
														"
															title="删除这条日程"><i class="glyphicon glyphicon-remove"></i>
														</a>
													</c:if>
													<input type="hidden" name="e-startTime"
														value="${item.startTime_str}"> <input
														type="hidden" name="e-endTime" value="${item.endTime_str}">
													<input type="hidden" name="e-scheduleId"
														value="${item.scheduleId }"> 
														<input type="hidden" name="e-shiftId"
														value="${item.shiftId }">
														<input type="hidden"
														name="e-scheduleType" value="${item.type}"> <input
														type="hidden" name="e-schedulePat"
														value="${item.patientName}"> <input type="hidden"
														name="e-schedulePatId" value="${item.patientId}">
													<input type="hidden" name="e-scheduleContent"
														value="${item.content }"> <input type="hidden"
														name="e-repeat" value="${item.repeat}"> <input
														type="hidden" name="e-endDate" value="${item.endDate}">
												</div> <c:if test="${item.type eq '手术'}">
													<a href="#" class="strong" onFocus="this.blur();"><span
														class="glyphicons 
													<c:choose>
									<c:when test="${item.patientSex eq '男'}">
   user  
   </c:when>
									<c:otherwise>
     girl
   </c:otherwise>
								</c:choose>
													
													"><i></i>
													</span>${item.patientName}</a>&nbsp;&nbsp;
													</c:if> <span
												class="glyphicons 
												<c:choose>
									<c:when test="${item.type eq '门诊排班'}">
   retweet  
   </c:when>
									<c:when test="${item.type eq '值班'}">
   history
   </c:when>
									<c:when test="${item.type eq '手术'}">
  scissors
   </c:when>
									<c:when test="${item.type eq '个人'}">
   paperclip
   </c:when>
									<c:otherwise>
     more
   </c:otherwise>
								</c:choose>
												 ccc"><i></i>
											</span>${item.type}&nbsp;&nbsp; <span class="glyphicons clock ccc"><i></i>
											</span>${item.startTime_str}&nbsp;-&nbsp;${item.endTime_str}&nbsp;&nbsp;
											<c:if test="${item.type eq '门诊排班'}">
											<span class="glyphicons bookmark ccc"><i></i></span><span class="e-additionalRegistration">${item.additionalRegistration}</span>张号子&nbsp;&nbsp;
											<a href="javascript:void(0)" class="editAG">
											<c:if test="${item.isComming == 1}">
											[&nbsp;修改号数&nbsp;]
											</c:if>
											</a>
												</c:if>
												<c:if test="${item.upComming == 1}">
													<span class="glyphicons tag ccc"><i></i> </span>
													<span class="label label-default">Upcoming</span>
												</c:if> <c:if test="${not empty item.content}">
													<p>${item.content }</p>
												</c:if>
												
												<c:if test="${item.type eq '门诊排班'}">
												<ul class="ul_ops">
												<c:forEach items="${item.subItems}" var="subItem"
								varStatus="status">
                                                <li>
                                                    <img src="../assets/image/medex/right-arrow.png" class="right-arrow">
                                                    <div class="btn-group btn-group-xs">
                                                    <c:if test="${item.isComming == 1}">
                                                        <a href="#this" class="btn btn-default editOps" title="修改这条日程"><i class="glyphicon glyphicon-edit"></i></a>
                                                        <a href="#this" class="btn btn-default deleteOps" title="删除这条日程"><i class="glyphicon glyphicon-remove"></i></a>
                                                       </c:if>  
                                                       <input type="hidden" name="e-startTime"
														value="${subItem.startTime_str}"> <input
														type="hidden" name="e-endTime" value="${subItem.endTime_str}">
													<input type="hidden" name="e-scheduleId"
														value="${subItem.scheduleId }">
														<input type="hidden" name="e-shiftId"
														value="${item.shiftId }">
														 <input type="hidden"
														name="e-scheduleType" value="${subItem.type}"> <input
														type="hidden" name="e-schedulePat"
														value="${subItem.patientName}"> <input type="hidden"
														name="e-schedulePatId" value="${subItem.patientId}">
													<input type="hidden" name="e-scheduleContent"
														value="${subItem.content }"> <input type="hidden"
														name="e-repeat" value="${subItem.repeat}"> <input
														type="hidden" name="e-endDate" value="${subItem.endDate_str}">
                                                    </div>
                                                    <a href="#" class="strong" onFocus="this.blur();"><span class="glyphicons 
                                                    	<c:choose>
									<c:when test="${subItem.patientSex eq '男'}">
   user  
   </c:when>
									<c:otherwise>
     girl
   </c:otherwise>
								</c:choose>
                                                    "><i></i></span>${subItem.patientName}</a>&nbsp;&nbsp;
                                                    <span class="glyphicons earphone ccc"><i></i></span>门诊预约&nbsp;&nbsp;
                                                    <span class="glyphicons clock ccc"><i></i></span>${subItem.startTime_str}&nbsp;-&nbsp;${subItem.endTime_str}&nbsp;&nbsp;
                                                    <p>${subItem.content}</p>
                                                </li>
                                                </c:forEach>
                                            </ul>
												</c:if>
											</li>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-lg-3">
					<div class="panel panel-default calendarBox">
						<!--<div class="panel-heading">
                              <h3 class="panel-title"><span class="glyphicon glyphicon-calendar"></span>&nbsp;选择日期</h3>
                           </div>-->
						<div class="panel-body">
							<div id="datetimepicker"></div>
						</div>
					</div>
					<div class="btn-group ops">
						<button type="button" class="btn btn-primary btn-lg addOps1">
							<span class="glyphicon glyphicon-retweet"></span> 门诊排班
						</button>
						<button type="button" class="btn btn-primary btn-lg addOps2">
							<span class="glyphicon glyphicon-earphone"></span> 门诊预约
						</button>
					</div>
					<button type="button"
						class="btn btn-primary btn-lg btn-block addSchedule"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-calendar"></span> 添加日程
					</button>
					<c:if test="${sro.upComming_distance_time>0}">
						<div class="panel panel-default timeAlert">
							<div class="panel-body">
								<div class="line1">距下一个日程任务</div>
								<div class="line2">${sro.upComming_hour}h&nbsp;${sro.upComming_minte}min</div>
							</div>
							<div class="panel-title">
								<i class="glyphicon glyphicon-time"></i>
								${sro.upComming.startTime_str} - ${sro.upComming.endTime_str}
								&nbsp;${sro.upComming.patientName}&nbsp;${sro.upComming.type}
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- 设定日程的模态框 -->
	<div class="modal fade" id="addPatScheduleModal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="addPatScheduleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="docScheduleModalLabel">
						<span class="small-modal-title">添加日程</span>
					</h4>
				</div>
				<div class="addScheduleStep1">
					<div class="form-group">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="timeSolution">
							<tr>
								<td colspan="3"><label for="scheduleType">开始时间</label></td>
							</tr>
							<tr>
								<td width="25%" class="td1"><select class="form-control"
									name="timeBlock">
										<option value="lc">凌晨</option>
										<option value="sw" selected>上午</option>
										<option value="xw">下午</option>
										<option value="ws">晚上</option>
								</select>
								</td>
								<td width="35%" style="padding-left: 5px;" class="td2"><select
									class="form-control" name="lc">
										<option value="00">凌晨0点</option>
										<option value="01">凌晨1点</option>
										<option value="02">凌晨2点</option>
										<option value="03">凌晨3点</option>
										<option value="04">凌晨4点</option>
										<option value="05">凌晨5点</option>
								</select> <select class="form-control" name="sw" style="display: block;">
										<option value="06">上午6点</option>
										<option value="07" selected>上午7点</option>
										<option value="08">上午8点</option>
										<option value="09">上午9点</option>
										<option value="10">上午10点</option>
										<option value="11">上午11点</option>
										<option value="12">上午12点</option>
								</select> <select class="form-control" name="xw">
										<option value="13">下午13点</option>
										<option value="14">下午14点</option>
										<option value="15">下午15点</option>
										<option value="16">下午16点</option>
										<option value="17">下午17点</option>
										<option value="18">下午18点</option>
								</select> <select class="form-control" name="ws">
										<option value="19">晚上19点</option>
										<option value="20">晚上20点</option>
										<option value="21">晚上21点</option>
										<option value="22">晚上22点</option>
										<option value="23">晚上23点</option>
								</select>
								</td>
								<td style="padding-left: 5px;" class="td3"><select
									class="form-control d-default" name="startTime">
										<option value="07:00">07:00</option>
										<option value="07:15">07:15</option>
										<option value="07:30">07:30</option>
										<option value="07:45">07:45</option>
								</select>
								</td>
							</tr>
							<tr>
								<td colspan="3"><label for="scheduleType">结束时间</label></td>
							</tr>
							<tr>
								<td width="25%" class="td1"><select class="form-control"
									name="timeBlock">
										<option value="lc">凌晨</option>
										<option value="sw" selected>上午</option>
										<option value="xw">下午</option>
										<option value="ws">晚上</option>
								</select>
								</td>
								<td width="35%" style="padding-left: 5px;" class="td2"><select
									class="form-control" name="lc">
										<option value="00">凌晨0点</option>
										<option value="01">凌晨1点</option>
										<option value="02">凌晨2点</option>
										<option value="03">凌晨3点</option>
										<option value="04">凌晨4点</option>
										<option value="05">凌晨5点</option>
								</select> <select class="form-control" name="sw" style="display: block;">
										<option value="06">上午6点</option>
										<option value="07" selected>上午7点</option>
										<option value="08">上午8点</option>
										<option value="09">上午9点</option>
										<option value="10">上午10点</option>
										<option value="11">上午11点</option>
										<option value="12">中午12点</option>
								</select> <select class="form-control" name="xw">
										<option value="13">下午13点</option>
										<option value="14">下午14点</option>
										<option value="15">下午15点</option>
										<option value="16">下午16点</option>
										<option value="17">下午17点</option>
										<option value="18">下午18点</option>
								</select> <select class="form-control" name="ws">
										<option value="19">晚上19点</option>
										<option value="20">晚上20点</option>
										<option value="21">晚上21点</option>
										<option value="22">晚上22点</option>
										<option value="23">晚上23点</option>
								</select>
								</td>
								<td style="padding-left: 5px;" class="td3"><select
									class="form-control d-default" name="endTime">
										<option value="07:00">07:00</option>
										<option value="07:15">07:15</option>
										<option value="07:30">07:30</option>
										<option value="07:45">07:45</option>
								</select>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="addScheduleCon">
					<div class="form-group">
						<label for="scheduleType">类型</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="scheduleType" value="手术" checked="checked">手术</label> <label
								class="radio-inline"> <input type="radio"
								name="scheduleType" value="值班">值班</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType" value="个人">个人</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType" value="其它">其它</label>
						</div>
					</div>
					<div class="form-group smartSearch">
						<label for="schedulePat">患者</label> <input type="text"
							placeholder="请输入患者姓名" name="schedulePat" class="form-control"
							value=""> <input type="hidden" name="schedulePatId"
							value="">
						<ul class="searchResult"></ul>
					</div>
					<div class="form-group form-repeat">
						<label for="repeat">设定重复</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="repeat" value="0" checked>不重复</label> <label
								class="radio-inline"><input type="radio" name="repeat"
								value="1">每天</label> <label class="radio-inline"><input
								type="radio" name="repeat" value="2">每周</label> <label
								class="radio-inline"><input type="radio" name="repeat"
								value="3">每两周</label> <label class="radio-inline"><input
								type="radio" name="repeat" value="4">每月</label> <label
								class="radio-inline"><input type="radio" name="repeat"
								value="5">每年</label>
						</div>
					</div>
					<div class="form-group form-endDate">
						<label for="endDate">重复结束时间</label> <input type="text"
							class="form-control" name="endDate" placeholder="选择时间"
							autocomplete="off" readonly>
					</div>
					<div class="form-group">
						<label for="scheduleContent">内容</label>
						<textarea class="form-control notebook" rows="4"
							name="scheduleContent" placeholder="请输入日程内容">特需门诊</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token}"> <input
						type="hidden" name="currentDate" value="${day}"> <input
						type="hidden" name="scheduleId" value=""> <input
						type="hidden" name="actionType" value=""> <input
						type="hidden" name="doctorId" value="${doctorId}">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" name="addSchedule">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 门诊排班的模态框 -->
	<div class="modal fade" id="ops1Modal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="ops1ModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ops1ModalLabel">
						<span class="small-modal-title">创建门诊排班表</span>
					</h4>
				</div>
				<div class="addScheduleStep1">
					<div class="form-group">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="timeSolutionOps1">
							<tr>
								<td colspan="3"><label for="scheduleType">开始时间</label>
								</td>
							</tr>
							<tr>
								<td width="25%" class="td1"><select class="form-control"
									name="timeBlock">
										<option value="lc">凌晨</option>
										<option value="sw" selected>上午</option>
										<option value="xw">下午</option>
										<option value="ws">晚上</option>
								</select></td>
								<td width="35%" style="padding-left: 5px;" class="td2"><select
									class="form-control" name="lc">
										<option value="00">凌晨0点</option>
										<option value="01">凌晨1点</option>
										<option value="02">凌晨2点</option>
										<option value="03">凌晨3点</option>
										<option value="04">凌晨4点</option>
										<option value="05">凌晨5点</option>
								</select> <select class="form-control" name="sw" style="display: block;">
										<option value="06">上午6点</option>
										<option value="07" selected>上午7点</option>
										<option value="08">上午8点</option>
										<option value="09">上午9点</option>
										<option value="10">上午10点</option>
										<option value="11">上午11点</option>
										<option value="12">上午12点</option>
								</select> <select class="form-control" name="xw">
										<option value="13">下午13点</option>
										<option value="14">下午14点</option>
										<option value="15">下午15点</option>
										<option value="16">下午16点</option>
										<option value="17">下午17点</option>
										<option value="18">下午18点</option>
								</select> <select class="form-control" name="ws">
										<option value="19">晚上19点</option>
										<option value="20">晚上20点</option>
										<option value="21">晚上21点</option>
										<option value="22">晚上22点</option>
										<option value="23">晚上23点</option>
								</select></td>
								<td style="padding-left: 5px;" class="td3"><select
									class="form-control d-default" name="startTime">
										<option value="07:00">07:00</option>
										<option value="07:15">07:15</option>
										<option value="07:30">07:30</option>
										<option value="07:45">07:45</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="3"><label for="scheduleType">结束时间</label>
								</td>
							</tr>
							<tr>
								<td width="25%" class="td1"><select class="form-control"
									name="timeBlock">
										<option value="lc">凌晨</option>
										<option value="sw" selected>上午</option>
										<option value="xw">下午</option>
										<option value="ws">晚上</option>
								</select></td>
								<td width="35%" style="padding-left: 5px;" class="td2"><select
									class="form-control" name="lc">
										<option value="00">凌晨0点</option>
										<option value="01">凌晨1点</option>
										<option value="02">凌晨2点</option>
										<option value="03">凌晨3点</option>
										<option value="04">凌晨4点</option>
										<option value="05">凌晨5点</option>
								</select> <select class="form-control" name="sw" style="display: block;">
										<option value="06">上午6点</option>
										<option value="07" selected>上午7点</option>
										<option value="08">上午8点</option>
										<option value="09">上午9点</option>
										<option value="10">上午10点</option>
										<option value="11">上午11点</option>
										<option value="12">中午12点</option>
								</select> <select class="form-control" name="xw">
										<option value="13">下午13点</option>
										<option value="14">下午14点</option>
										<option value="15">下午15点</option>
										<option value="16">下午16点</option>
										<option value="17">下午17点</option>
										<option value="18">下午18点</option>
								</select> <select class="form-control" name="ws">
										<option value="19">晚上19点</option>
										<option value="20">晚上20点</option>
										<option value="21">晚上21点</option>
										<option value="22">晚上22点</option>
										<option value="23">晚上23点</option>
								</select></td>
								<td style="padding-left: 5px;" class="td3"><select
									class="form-control d-default" name="endTime">
										<option value="07:00">07:00</option>
										<option value="07:15">07:15</option>
										<option value="07:30">07:30</option>
										<option value="07:45">07:45</option>
								</select></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="addScheduleCon">
					<div class="form-group form-repeat">
						<label for="repeat">设定重复</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="repeat" value="0" checked>不重复</label> <label
								class="radio-inline"><input type="radio" name="repeat"
								value="1">每天</label> <label class="radio-inline"><input
								type="radio" name="repeat" value="2">每周</label> <label
								class="radio-inline"><input type="radio" name="repeat"
								value="3">每两周</label> <label class="radio-inline"><input
								type="radio" name="repeat" value="4">每月</label> <label
								class="radio-inline"><input type="radio" name="repeat"
								value="5">每年</label>
						</div>
					</div>
					<div class="form-group form-endDate">
						<label for="endDate">重复结束时间</label> <input type="text"
							class="form-control" name="endDate" placeholder="选择时间"
							autocomplete="off" readonly>
					</div>
					<div class="form-group">
						<label for="endDate">加号数量预设</label><br> <input type="number"
							class="form-control" name="additionalRegistration"
							placeholder="输入可加号的数量" value="5"
							style="width: 50%; display: inline-block;">&nbsp;&nbsp;张
					</div>
					<div class="form-group">
						<label for="scheduleContent">内容</label>
						<textarea class="form-control notebook" rows="4"
							name="scheduleContent" placeholder="请输入日程内容">门诊排班时间</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="scheduleId" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						name="addOutPatientSchedule">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 门诊预约的模态框 -->
	<div class="modal fade" id="ops2Modal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="ops2ModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ops2ModalLabel">
						<span class="small-modal-title">门诊预约</span>
					</h4>
				</div>
				<div class="addScheduleCon" style="padding-top: 30px;">
					<div class="form-group">
						<label for="scheduleType">选择一个今天的门诊排班</label>
						<div>
							<select class="form-control" name="shiftId">
								<option value="0"></option>
							</select>
						</div>
					</div>
					<div class="form-group smartSearch">
						<label for="scheduleType">患者</label> <input type="text"
							placeholder="请输入患者姓名" name="schedulePat" class="form-control"
							value=""> <input type="hidden" name="schedulePatId"
							value="">
						<ul class="searchResult"></ul>
					</div>
					<div class="form-group">
						<label for="scheduleContent">内容</label>
						<textarea class="form-control notebook" rows="4"
							name="scheduleContent" placeholder="请输入日程内容">预约特需门诊</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="scheduleId" value=""> <input
						type="hidden" name="actionType" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						name="addOutPatientAppoint">确认</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="deleteConfirm" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					这组排班是截止至<span class="d-endDate"></span>的重复日程，您可以选择删除整组日程或只删除这条日程。
				</div>
				<div class="modal-footer">
					<input type="hidden" name="d-scheduleId" value=""> <input
						type="hidden" name="d-groupId" value=""> <input
						type="hidden" name="d-startTime" value=""> <input
						type="hidden" name="d-endTime" value="">
					<button type="button" class="btn btn-primary" id="doDeleteGroup">删除整组日程</button>
					<button type="button" class="btn btn-primary" id="doDeleteSingle">仅删除这条日程</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="deleteConfirmOpst" data-backdrop="false"
		tabindex="-1" role="dialog"
		aria-labelledby="deleteConfirmOpstModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					这条日程是截止至<span class="d-endDate"></span>的重复排班，您可以选择删除整组日程或只删除这条日程。
				</div>
				<div class="modal-footer">
					<input type="hidden" name="d-shiftId" value=""> <input
						type="hidden" name="d-shiftGroupId" value=""> <input
						type="hidden" name="d-startTime" value=""> <input
						type="hidden" name="d-endTime" value="">
					<button type="button" class="btn btn-primary"
						id="doDeleteGroupOpst">删除整组日程</button>
					<button type="button" class="btn btn-primary"
						id="doDeleteSingleOpst">仅删除这条日程</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="editAGModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="editAGModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="editAGModalLabel">修改<span class="st"></span>&nbsp;-&nbsp;<span class="et"></span><span class="small-modal-title">的门诊加号数量</span></h4>
                 </div>
                 <div class="modal-body">
                    <input type="number" placeholder="请输入号数" name="c-additionalRegistration" class="form-control">
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="c-shiftId" value="">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" name="doAGEdit">确认修改</button>
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
	<script src="../assets/script/medex/doc_schedule.js"></script>
</body>
</html>