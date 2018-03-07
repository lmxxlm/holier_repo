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
<link href="../assets/css/medex/qotd.css" rel="stylesheet">
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
				<li><a href="#">人文关怀</a>
				</li>
				<li class="active">每日一言</li>
			</ol>
			<div class="mainBody">
				<ul class="tabMenu">
					<li><a href="JavaScript:void(0)" onFocus="this.blur()"
						class="active"><i class="glyphicon glyphicon-comment"></i>每日一言</a>
					</li>
					<li><a href="JavaScript:void(0)" onFocus="this.blur()"><i
							class="glyphicon glyphicon-picture"></i>每日一图</a>
					</li>
					<div class="clearfix"></div>
				</ul>
				<div class="textarea">
					<textarea class="form-control notebook" id="txt"
						placeholder="请输入每日一言"></textarea>
					<div class="row">
						<div class="len col-md-4 col-xs-4">
							剩余 <span>36</span> 字
						</div>
						<div class="addQotd col-md-8 col-xs-8">
							<button type="button" class="btn btn-primary pull-right"
								id="addQotdBtn" onFocus="this.blur()">
								<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;添加
							</button>
							<input type="hidden" name="patientId" value="${patientId}">
							<input type="hidden" name="token" value="${token}">
						</div>
					</div>
				</div>
				<!--未找到记录-->
				<c:if test="${norecord == true}">
				<div class="qotdUnit">
					<div class="notebook">
						<p>
							<i class="glyphicon glyphicon-question-sign"></i>&nbsp;&nbsp;暂无记录
						</p>
					</div>
				</div>
					</c:if>
				<!--内容开始-->
					<c:forEach items="${sro.sweets}" var="sweet" varStatus="status" begin="0" step="1">
				<div class="qotdUnit">
					<div class="notebook">
						<p>
						<div class="btn-group btn-group-xs">
							<a href="#this" class="btn btn-default" title="删除这条记录"><span
								class="glyphicon glyphicon-remove"></span>
							</a> <input type="hidden" name="qotdId" value="${sweet.sweetId}">
						</div>
						<i class="glyphicon glyphicon-time"></i>&nbsp;&nbsp;${sweet.time_str}&nbsp;&nbsp;<a
							href="javascript:void(0)" class="noLink"><c:if test="${sweet.status eq '1'}"> [&nbsp;当前发布&nbsp;] </c:if></a>
						</p>
						<p>
							<i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;${sweet.content}
						</p>
					</div>
				</div>
				</c:forEach>
				<!--内容结束-->
				<c:if test="${hasMore == true}">
				<a href="javascript:void(0)" class="getMore"><i
					class="glyphicon glyphicon-chevron-down"></i>&nbsp;&nbsp;更早的记录<input
					type="hidden" name="lastTime" value="${lastTime}">
				</a>
				</c:if>
			</div>
		</div>
	</div>
	<!--确认模态框-->
	<div class="modal fade" id="detailDocScheduleModal"
		data-backdrop="false" tabindex="-1" role="dialog"
		aria-labelledby="detailDocScheduleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="detailScheduleModalLabel">是否发布给这个患者？</h4>
				</div>
				<div class="modal-body">生活是一串串的快乐时光,我们不仅仅是为了生存而生存。</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回修改</button>
					<button type="button" class="btn btn-primary" id="doSubmit">发布</button>
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
	<script src="../assets/script/medex/qotd.js"></script>
</body>
</html>