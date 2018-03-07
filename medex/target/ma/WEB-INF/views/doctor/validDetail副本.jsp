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
	href="../assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="../assets/css/medex/frame.css" rel="stylesheet">
<link href="../assets/css/medex/validDetail.css" rel="stylesheet">
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
				<li class="active">医生认证信息</li>
			</ol>
			<div class="mainBody">
				<div class="calendartitle"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;医生认证信息</div>
                        <div class="calendarList">
                            <table border="1" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                              <tr>
                                <td class="td1">姓名：</td>
                                <td class="td2">${doctor.name}</td>
                                <td class="td1">性别：</td>
                                <td class="td2"><c:choose><c:when test="${empty doctor.gender}">"暂无"</c:when><c:otherwise>${doctor.gender}</c:otherwise></c:choose></td>
                                <td class="td2" colspan="2" rowspan="5"><img class="media-object" id="Toux" <c:choose><c:when test="${empty doctor.headPic}">src="../assets/image/medex/140-180.gif" </c:when><c:otherwise>src="${doctor.headPic.large}" style="width:140px;" </c:otherwise></c:choose> alt="医生头像"></td>
                              </tr>
                              <tr>
                                <td class="td1">医院：</td>
                                <td class="td2">${doctor.referHospital}</td>
                                <td class="td1">科室：</td>
                                <td class="td2">${doctor.referDepartments}</td>
                              </tr>
                              <tr>
                                <td class="td1">职称：</td>
                                <td class="td2">${doctor.doctorTitle}</td>
                                <td class="td1">职务：</td>
                                <td class="td2">${doctor.doctorPosition}</td>
                              </tr>    
                              <tr>
                                <td class="td1">毕业学校：</td>
                                <td class="td2">${doctor.school}</td>
                                <td class="td1">学历：</td>
                                <td class="td2">${doctor.education}</td>
                              </tr>
                              <tr>
                                <td class="td1">身份证：</td>
                                <td class="td2">${doctor.identityID}</td>
                                <td class="td1">科室电话：</td>
                                <td class="td2">${doctor.departPhone}</td>
                              </tr>
                              <tr>
                                <td class="td1">简介：</td>
                                <td colspan="5" class="td3">
                                    ${doctor.remark}
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">资格证书：</td>
                                <td colspan="5" class="td3">
                                    <c:choose><c:when test="${empty doctor.qualification_pic}">未上传</c:when>
                                    <c:otherwise><a href="${doctor.qualification_pic.fileName}" target="_blank"><img src="${doctor.qualification_pic.large}" class="authPic"></a></c:otherwise>
                                    </c:choose>
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">工作证或执业证书：</td>
                                <td colspan="5" class="td3">
                                   <c:choose><c:when test="${empty doctor.license_pic}">未上传</c:when>
                                    <c:otherwise><a href="${doctor.license_pic.fileName}" target="_blank"><img src="${doctor.license_pic.large}" class="authPic"></a></c:otherwise>
                                    </c:choose>
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">职称证书：</td>
                                <td colspan="5" class="td3">
                                    <c:choose><c:when test="${empty doctor.employee_pic}">未上传</c:when>
                                    <c:otherwise><a href="${doctor.employee_pic.fileName}" target="_blank"><img src="${doctor.employee_pic.large}" class="authPic"></a></c:otherwise>
                                    </c:choose>
                                </td>
                              </tr>
                              <tr>
                                <td class="td1">&nbsp;</td>
                                <td colspan="5" class="td3">
                                    <input type="hidden" name="token" value="${token}">
                                    <c:if test="${doctor.auth == false}">
                                        <button type="button" class="btn btn-primary accessV" onFocus="this.blur()"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;通过认证</button>&nbsp;&nbsp;
                                        <button type="button" class="btn refuseV" onFocus="this.blur()"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;驳回申请</button>
                                    </c:if>
                                    <c:if test="${doctor.auth == true}">
                                        <button type="button" class="btn removeV" onFocus="this.blur()"><span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;取消认证</button>
                                    </c:if>
                                </td>
                              </tr>
                            </table>
                        </div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="refuseModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="refuseModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="refuseModalLabel">驳回理由</h4>
                 </div>
                 <div class="modal-body">
                    <textarea placeholder="请输入驳回理由" name="reason" class="form-control"></textarea>
                 </div>
                 <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary  dosubmit" name="dosubmit">确认驳回</button>
                 </div>
              </div>
           </div>
        </div>
	<script src="../assets/library/jquery/jquery.min.js"></script>
	<script src="../assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="../assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/plugins/nprogress/nprogress.js"></script>
	<script src="../assets/script/medex/frame.js"></script>
	<script src="../assets/script/medex/validDetail.js"></script>
</body>
</html>