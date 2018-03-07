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
<%@ include file="commons/runParams.html"%>
<title>MA后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/medex/frame_ad.css" rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
<link href="assets/css/medex/pat_list.css" rel="stylesheet">
<link href="assets/css/medex/expersRecommend.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
   .wid{
     background-image: none;
	 cursor:not-allowed !important;
	 readonly:true;
   }
</style>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
<input type="hidden" name="currentUserId" value="${currentUserId}">
<input type="hidden" name="currentUserType" value="${currentUserType}">
	<div class="container-fluid">
		<!-- leftmenu -->
		<%@ include file="commons/leftMenu_ad.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="commons/topMenu_ad.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li class="active">医生账户</li>
			</ol>
			<div class="searchBar row" style="padding-bottom:0px;">
				<div class="row-fluid">
					 <div class="span12 sdys " >
				        <span class="span">已设定医生 :</span>
				        <ul id="checkUL">
				        </ul>
				        <button type="button" class="btn btn-primary btn-sm" id="submitSet">提交设定</button>
					</div>
				</div>
				<!-- <form class="navbar-form navbar-left searchForm" role="search" action="${mainUrl}fuzzyQueryByDocName.do" method="post" style="width:100%; "> -->
				<form class="navbar-form navbar-left searchForm" role="search" action="" method="post" style="width:100%; ">
				    <input type="hidden" name="token" value="${token}">
					<input type="text" class="form-control" name="searchText" value="${searchText}" placeholder="请输入用户姓名">
					<input type="hidden" name="doctorId" value="${accountId}">
					<button type="button" class="btn btn-default" id="searchDocName">查找</button>
					
					<div class="btn-group addPat" role="add" style="float:right;">
					   <button type="button" class="addPat btn btn-primary pull-right" data-toggle="modal"  ><span class="glyphicon glyphicon-plus" style="margin-right:2px;"></span>新增</button>
				    </div>
				</form>
			</div>
			<div class="mainBody">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>姓名</th>
							<th>图片</th>
							<th>操作</th>
							<th>设置</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dro.records}" var="doctor" varStatus="status">
							<tr>
								<td>${doctor.name}</td>
								<td><c:choose><c:when test="${empty doctor.web_small}"><img src="assets/image/medex/imgUpload.gif"  style="width:140px;"></c:when>
                    <c:otherwise><a href="${doctor.web_ori}"  target="_blank"><img src="${doctor.web_small}" id="Toux" style="width:140px;"></a></c:otherwise>
                    </c:choose></td>
								<td class="td1" ><a href="javascript:void(0)" data-id="${doctor.accountId}" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;<a href="javascript:void(0)" data-id="${doctor.accountId}" class="delete"><span class="glyphicon glyphicon-remove"></span>删除</a></td>
								<td class="td2" style="text-align:left;">
							        <input type="checkbox" name="HLYService"   value="1"  data-recommed="${doctor.recommed}" <c:if test="${doctor.recommed==1}">checked="checked"</c:if>  data-name="${doctor.name}" data-id="${doctor.accountId}" >
							        <input type="hidden" name="doctorId" value="${doctor.accountId}">
								</td>
							</tr>
						</c:forEach>
				   </tbody>
				</table>
				<!-- 分页开始 -->
				<ul class="pager">
				<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
				<!-- <a  href="${mainUril}expertsRecommend.html?cp=${dro.pageView.back}&&ps=${searchParam.ps}">上一页</a> -->
				     <a class="pre"  data-cp="${dro.pageView.back}"  data-ps="${searchParam.ps}" >上一页</a> 
				</li>
				<li
					<c:if test="${dro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
				<!-- <a  href="${mainUril}expertsRecommend.html?cp=${dro.pageView.next}&&ps=${searchParam.ps}">下一页</a> -->	
				     <a class="next" data-cp="${dro.pageView.next}" data-ps="${searchParam.ps}" >下一页</a>
				</li>
			</ul>
				<!-- 分页结束 -->
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
    <!-- 医生的模态框 -->
	<div class="modal fade" id="docModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="docModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="docModalLabel">新增名医信息</h4>
				</div>
				<div class=" modal-body  smartSearch" style="margin:10px 13px">
					<div class="form-group">
						<label for="name">医生姓名</label> 
						 <input type="hidden" name="accountId" value="${accountId}">
						<input type="text" class="form-control" name="name" placeholder="请输入医生姓名" value="${name}" >
					</div>
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="form-group" style="padding-left:15px; text-align:center;">
				     <div class="azPic fileUploadUnit" style="float:left; width:40%;" >
				         <p>安卓版图片上传</p>
				         <a href=""  target="_blank" ><img src=""  class="androidImg" style="width:200px;height:100px;"></a>
	                     <span style="display:block;  margin:10px 0px;"><button type="button" class="btn btn-primary " onFocus="this.blur()" data-type="android">点击上传</button></span>
	                     <div class="upd_image_init" style="display: none;">
			                  <input type="file" name="upd_image_init" id="andrfile">
				         </div>
				         <input type="hidden" name="urlImage" value="" data-fileName=""/>
				     </div>
				    
				     <div class="IosPic fileUploadUnit" style="float:right; margin-right:15px; width:40%;">
				          <p>Ios版图片上传</p>
				          <a href=""  target="_blank"><img src="" class="iosImg" style="width:200px;height:100px;"></a>
	                     <span style="display:block; margin:10px 0px;"><button type="button" class="btn btn-primary " onFocus="this.blur()" data-type="ios">点击上传</button></span>
	                     <div class="upd_image_init" style="display: none;">
			                  <input type="file" name="upd_image_init" id="iosfile">
				         </div>
				         <input type="hidden" name="urlImageIos" value="" />
				     </div>
				     
				     <div style="clear:both;"></div>
					<div class="modal-footer">
					    
					    <input type="hidden" name="actionType" value="">
					    <input type="hidden" name="token" value="${token}"> 
					    <input type="hidden" name="recommed" value="0"> 
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="addDoc">确认</button>
					</div>
				</div>
		</div>
	</div>

	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
	<script src="assets/script/medex/expertsRecommend.js"></script>
	<!--  <script src="assets/script/medex/chooseAccount.js"></script>-->
	<script>
	
	
	</script>
</body>
</html>