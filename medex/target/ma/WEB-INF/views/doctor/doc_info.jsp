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
<link href="../assets/css/medex/doc_info.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="../assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="../assets/library/modernizr/modernizr.js"></script>
<style>
.touxWrapper{ background:#dedede; text-align:center;}
.touxWrapper img{width:140px;}
.docInfoUl li{ padding-left:20px;}
</style>
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
				<li><a href="#">Home</a>
				</li>
				<li class="active">医生基本信息</li>
			</ol>
			<div class="mainBody">
				<div class="docinfo row">
					<div class="col-md-3 hidden-xs row-left">
						<div class="touxWrapper">
							<input type="hidden" name="doctorId" value="${doctorId}">
							<img id="Toux" <c:choose><c:when test="${empty doctor.headPic}">src="../assets/image/medex/140-180.gif" </c:when>  <c:otherwise>src="${doctor.headPic.fileName}" </c:otherwise></c:choose> alt="医生头像">
						</div>
						<ul class="docInfoUl">	
							<li><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<strong>${doctor.name}</strong>&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${doctor.auth == true}">已认证</c:if><c:if test="${doctor.auth == false}"><font color="red">未认证</font></c:if></li>
						    <li><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;${doctor.doctorTitle}</li>
						    <c:choose><c:when test="${empty doctor.referDepartments}"></c:when><c:otherwise><li><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;${doctor.referDepartments}</li></c:otherwise></c:choose>
						</ul>
					</div>
					<div class="col-md-9 row-right">
						<div class="form-group">
							<label for="doctorName">医生姓名</label> <input type="text"
								class="form-control" name="doctorName" placeholder="医生姓名"
								value="${doctor.name}">
						</div>
						<div class="form-group dropdown selectSimulate">
							<label for="type">类型</label> <input type="hidden" name="type"
								<c:choose>
   <c:when test="${doctor.type == '医生'}">
   value="医生"  
   </c:when>  
    <c:when test="${doctor.type == '护士'}">
   value="护士" 
   </c:when>
   <c:otherwise>
    value="医生"    
   </c:otherwise>
</c:choose>
								class="selectData">
							<button type="button" class="btn dropdown-toggle"
								data-toggle="dropdown" onFocus="this.blur()">
								<c:choose>
									<c:when test="${doctor.type == '医生'}">
   医生
   </c:when>
									<c:when test="${doctor.type == '护士'}">
   护士
   </c:when>
									<c:otherwise>
    医生    
   </c:otherwise>
								</c:choose>
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#" onFocus="this.blur()"
									data-val="医生">医生</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="#" onFocus="this.blur()"
									data-val="护士">护士</a>
								</li>
							</ul>
						</div>
						<div class="form-group dropdown selectSimulate">
							<label for="doctorSex">医生性别</label> <input type="hidden"
								name="doctorSex"
								<c:choose>
												<c:when test="${empty doctor.gender}">
  value="暂无"
   </c:when>
												<c:otherwise>
   value="${doctor.gender}"
   </c:otherwise>
											</c:choose>
								class="selectData">
							<button type="button" class="btn dropdown-toggle"
								data-toggle="dropdown" onFocus="this.blur()">

								<c:choose>
									<c:when test="${empty doctor.gender}">
  "暂无"
   </c:when>
									<c:otherwise>
   ${doctor.gender}
   </c:otherwise>
								</c:choose>

								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#" onFocus="this.blur()"
									data-val="男">男</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="#" onFocus="this.blur()"
									data-val="女">女</a>
								</li>
							</ul>
						</div>
						<div class="form-group smartSearch">
							<label for="referHospital">所属医院（如有多个请用“，”隔开）</label> <input
								type="text" class="form-control" name="referHospital"
								placeholder="请输入所属医院" value="${doctor.referHospital}">
							<ul class="searchResultForHospital"></ul>
						</div>
						<div class="form-group">
							<label for="referDepartments">所属主科室（如有多个请用“，”隔开）</label> <input
								type="text" class="form-control" name="referDepartments"
								placeholder="请输入所属主科室" value="${doctor.temp_departments}">
						</div>
						<div class="form-group">
							<label for="subreferDepartments">所属二级科室（如有多个请用“，”隔开）</label> <input
								type="text" class="form-control" name="subreferDepartments"
								placeholder="请输入所属二级科室" value="${doctor.sub_refer_departments}">
						</div>
						<div class="form-group">
							<label for="school">最高学历毕业学校</label> <input type="text"
								class="form-control" name="school" placeholder="请输入最高学历毕业学校"
								value="${doctor.school}">
						</div>
						<div class="form-group">
							<label for="education">最高学历</label> <input type="text"
								class="form-control" name="education" placeholder="请输入最高学历"
								value="${doctor.education }">
						</div>
						<div class="form-group">
							<label for="doctorPosition">医生职务</label> <input type="text"
								class="form-control" name="doctorPosition" placeholder="请输入医生职务"
								value="${doctor.doctorPosition}">
						</div>
						
						<div class="form-group">
						<label for="doctorTitle">医生职称</label>
						 <select class="form-control"
							name="doctorTitle" data-val="${doctor.doctorTitle}">
							<option value="请选择主治医师" >请选择主治医师</option>
							<option value="住院医师">住院医师</option>
							<option value="主治医师">主治医师</option>
							<option value="副主任医师">副主任医师</option>
							<option value="主任医师">主任医师</option>
							</select>
						</div>
						<div class="form-group">
							<label for="academicPositions">学术职位（如有多个请用“，”隔开）</label> <input
								type="text" class="form-control" name="academicPositions"
								placeholder="请输入学术职位" value="${doctor.academicPositions}">
						</div>
						<div class="form-group">
							<label for="specialties">专长（如有多个请用“，”隔开）</label> <input
								type="text" class="form-control" name="specialties"
								placeholder="请输入专长" value="${doctor.specialties}">
						</div>
						<div class="form-group">
							<label for="identityID">身份证号码</label> <input type="text"
								class="form-control" name="identityID" placeholder="请输入身份证号码"
								value="${doctor.identityID}">
						</div>
						<div class="form-group">
							<label for="departPhone">科室电话</label> <input type="text"
								class="form-control" name="departPhone" placeholder="请输入科室电话"
								value="${doctor.departPhone}">
						</div>
						<div class="form-group">
							<label for="telePhone">移动电话</label> <input type="tel"
								class="form-control" name="telePhone" placeholder="请输入移动电话"
								value="${doctor.telePhone}">
						</div>
						<div class="form-group">
							<label for="email">电子邮件</label> <input type="email"
								class="form-control" name="email" placeholder="请输入电子邮件"
								value="${doctor.email}">
						</div>
						<div class="form-group">
							<label for="weixinNum">微信号</label> <input type="text"
								class="form-control" name="weixinNum" placeholder="请输入微信号"
								value="${doctor.weixinNum}">
						</div>
						<div class="form-group">
							<label for="qqNum">QQ</label> <input type="text"
								class="form-control" name="qqNum" placeholder="请输入QQ"
								value="${doctor.qqNum}">
						</div>
						<div class="form-group">
							<label for="remark">简介</label>
							<textarea placeholder="请输入备注" name="remark" class="form-control"
								rows="3">${doctor.remark}</textarea>
						</div>
						<div class="row submit">
							<input type="hidden" name="token" value="${token}">
							<button type="button" class="btn btn-primary" id="save">保存修改</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-default" id="return">重置修改</button>
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
	<script src="../assets/script/medex/frame.js"></script>
	<script src="../assets/script/medex/doc_info.js"></script>
	<script>
	    $(function(){
	    	var doctorTitle=$('select[name="doctorTitle"]').attr('data-val');
	    	if(doctorTitle != ''){
	    		$('select[name="doctorTitle"]').find('option').each(function(){
		    		if($(this).val()==doctorTitle){
		    			$(this).attr('selected',true);
		    			$(this).siblings().attr('selected',false);
		    		}
		    	});
	    		
	    	}else{
	    		$('option[value="请选择主治医师"]').attr('selected',true);
	    	}
	    	
	    });
	</script>
</body>
</html>