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
<link href="../assets/css/medex/pat_schedule.css" rel="stylesheet">
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
				<li><a href="#">Home</a></li>
				<li class="active">患者的日程管理${noRecord}</li>
			</ol>
			<div class="mainBody row">
				<div class="col-md-9 col-lg-9">
					<div class="calendartitle">
						<span class="timeHeadline">${displayDay}</span><span
							class="glyphicon glyphicon-time"></span>
					</div>
					<div class="calendarList">
					    <c:if test="${noRecord==true}">
					    <div style="line-height:50px; height:50px;">该病人这天没有日程安排。</div>
					    </c:if>
						<ul class="timeline-activity list-unstyled">
							<c:forEach items="${sro.scheduleItems}" var="item"
								varStatus="status">
								<li><i
									class="list-icon <c:if test="${item.category eq 'daily'}">icon-pill</c:if> <c:if test="${item.category eq 'event'}">icon-first-aid</c:if>"></i>
									<div class="block">
										<div class="caret"></div>
										<div
											class="box-generic <c:if test="${item.upComming == 1}">comming</c:if> <c:if test="${item.status eq '已完成'}">done</c:if>">
											<div class="timeline-top-info">${item.content}</div>
											<div class="timeline-bottom-info">
												<i class="glyphicon glyphicon-time"></i>
												${item.startTime_str} - ${item.endTime_str} &nbsp;&nbsp; <i
													class="glyphicon glyphicon-paperclip"></i> ${item.type}
												&nbsp;&nbsp;
												<c:if test="${item.category eq 'event'}">
													<i class="glyphicon glyphicon-user"></i> 医生&nbsp;-&nbsp;${item.doctorName } &nbsp;&nbsp;
                                                &nbsp;
												</c:if>
												<c:if test="${item.isComming == 0}">
													<c:if test="${item.status  ne '已完成'}">
														<a href="javascript:void(0)"><i
															class="glyphicon glyphicon-hand-right"></i> 标记完成</a> &nbsp;&nbsp;
                                                <input type="hidden"
															name="e-scheduleId" value="${item.scheduleId}">
														<input type="hidden" name="e-startTime"
															value="${item.startTime_str}">
														<input type="hidden" name="e-endTime"
															value="${item.endTime_str}">
													</c:if>
												</c:if>
												<c:if test="${item.isComming == 1}"> [&nbsp;
												<a href="javascript:void(0)"><i
														class="glyphicon glyphicon-edit"></i> 修改</a> &nbsp;&nbsp;
                                                <a
														href="javascript:void(0)"><i
														class="glyphicon glyphicon-remove"></i> 删除</a>&nbsp;] &nbsp;&nbsp;
                                               <c:if
														test="${item.category eq 'event'}">
														<input type="hidden" name="e-scheduleId"
															value="${item.scheduleId }">
														<input type="hidden" name="e-startTime"
															value="${item.startTime_str}">
														<input type="hidden" name="e-endTime"
															value="${item.endTime_str}">
														<input type="hidden" name="e-type"
															value="${item.category }">
														<input type="hidden" name="e-scheduleType2"
															value="${item.type }">
														<input type="hidden" name="e-scheduleContent2"
															value="${item.content }">
														<input type="hidden" name="e-scheduleDoctor"
															value="${item.doctorName }">
													</c:if>
													<c:if test="${item.category eq 'daily'}">
														<input type="hidden" name="e-scheduleId"
															value="${item.scheduleId }">
														<input type="hidden" name="e-startTime"
															value="${item.startTime_str}">
														<input type="hidden" name="e-endTime"
															value="${item.endTime_str}">
														<input type="hidden" name="e-type"
															value="${item.category }">
														<input type="hidden" name="e-scheduleType"
															value="${item.type }">
														<input type="hidden" name="e-scheduleContent"
															value="${item.content }">
													</c:if>
												</c:if>
											</div>
										</div>
										<div class="separator bottom"></div>
									</div>
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
								&nbsp;${sro.upComming.content}
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
				<ul class="tabMenu">
					<li class="active" data-tab="daily"><a
						href="javascript:void(0)" onFocus="this.blur()"><i
							class="icon-pill"></i>&nbsp;&nbsp;日程事项</a></li>
					<li data-tab="event"><a href="javascript:void(0)"
						onFocus="this.blur()"><i class="icon-first-aid"></i>&nbsp;&nbsp;治疗相关事项</a>
					</li>
					<div class="clearfix"></div>
				</ul>
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
				<div id="daily" class="addScheduleCon">
					<div class="form-group">
						<label for="scheduleType">类型</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="scheduleType" value="服药" checked>服药</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType" value="自我检查">自我检查</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType" value="自评">自评</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType" value="其它">其它</label>
						</div>
					</div>
					<div class="form-group">
						<label for="scheduleType">设定重复</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="isRepeat" value="0" checked>否</label> <label
								class="radio-inline"><input type="radio" name="isRepeat"
								value="1">是</label>
						</div>
					</div>
					<div class="form-group form-repeat">
						<label for="scheduleRepeat">重复次数（从当天开始计算）</label>
						<table width="200" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="20%"><input type="number" placeholder="数字"
									value="2" class="form-control" name="scheduleRepeatVal">
								</td>
								<td width="12%" style="padding-left: 5px;"><select
									class="form-control" name="scheduleRepeatUnit">
										<option value="天" selected>天</option>
										<option value="周">周</option>
										<option value="月">月</option>
								</select>
								</td>
							</tr>
						</table>
					</div>
					<div class="form-group">
						<label for="scheduleContent">日程事项</label>
						<textarea class="form-control notebook" rows="4"
							name="scheduleContent" placeholder="请输入日程事项"></textarea>
					</div>
				</div>
				<div id="event" class="addScheduleCon">
					<div class="form-group">
						<label for="scheduleType2">类型</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="scheduleType2" value="门诊" checked>门诊</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType2" value="住院">住院</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType2" value="检查">检查</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType2" value="治疗">治疗</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType2" value="随访">随访</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType2" value="手术">手术</label> <label
								class="radio-inline"><input type="radio"
								name="scheduleType2" value="其它">其它</label>
						</div>
					</div>
					<div class="form-group smartSearch">
						<label for="scheduleType">相关医生</label> <input type="text"
							placeholder="请输入医生姓名" name="scheduleDoctor" class="form-control"
							value="默认责任医生姓名">
						<ul class="searchResult"></ul>
					</div>
					<div class="form-group">
						<label for="scheduleContent2">日程事项</label>
						<textarea class="form-control notebook" rows="4"
							name="scheduleContent2" placeholder="请输入日程事项"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="validDoctor" value=""> <input
						type="hidden" name="token" value="${token}"> <input
						type="hidden" name="currentDate" value="${day}"> <input
						type="hidden" name="patId" value="${patientId}"> <input
						type="hidden" name="scheduleId" value=""> <input
						type="hidden" name="actionType" value=""> <input
						type="hidden" name="tabPage" value="daily"> <input
						type="hidden" name="doctorId" value="${doctorId}"> <input
						type="hidden" name="responsibilityDoctor"
						value="${responsibilityDoctor}">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" name="addSchedule">确认添加</button>
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
	<script src="../assets/script/medex/pat_schedule.js"></script>
</body>
</html>