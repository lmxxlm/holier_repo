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
	href="../assets/plugins/glDatePicker/styles/glDatePicker.flatwhite.css"
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
<link href="../assets/css/medex/pat_info.css" rel="stylesheet">
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
				<li><a href="pat_list.html?doctorId=${doctorId}">${doctorName}的患者管理</a></li>
				<li class="active">${patient.name}的基本信息</li>
			</ol>
			<div class="mainBody">
				<div class="patinfo">
					<span class="label"><i class="glyphicon glyphicon-edit"></i>&nbsp;&nbsp;${patient.name}&nbsp;/&nbsp;${patient.age}岁&nbsp;/&nbsp;${patient.gender}
						&nbsp;/&nbsp;${patient.currentStatus}&nbsp;/&nbsp;${patient.mobilePhone
						}&nbsp;/&nbsp;${patient.responsibilityDoctor}</span>
					<div class="widget row">
						<!-- Tabs Heading --> 
						<div class="widget-head col-md-3">
							<ul>
								<li class="active"><a href="#tab1-1"
									class="glyphicons user" data-toggle="tab" onFocus="this.blur()"><i></i>人口学</a>
								</li>
								<li><a href="#tab2-1" class="glyphicons calculator"
									data-toggle="tab" onFocus="this.blur()"><i></i>社会经济学</a></li>
								<li><a href="#tab3-1" class="glyphicons credit_card"
									data-toggle="tab" onFocus="this.blur()"><i></i>系统信息</a></li>
								<li><a href="#tab4-1" class="glyphicons circle_ok"
									data-toggle="tab" onFocus="this.blur()"><i></i>亲属信息</a></li>
								<li><a href="#tab5-1" class="glyphicons user"
									data-toggle="tab" onFocus="this.blur()"><i></i>基本健康信息</a></li>
								<li><a href="#tab6-1" class="glyphicons calculator"
									data-toggle="tab" onFocus="this.blur()"><i></i>社会保障信息</a></li>
							</ul>
							<div>
								<ul class="pager">
									<li><a href="${mainUrl}patient/schedule.html?patientId=${patient.accountId}"><i
											class="glyphicon glyphicon-list-alt"></i>&nbsp;查看日程</a></li>
									<li><a href="#" class="deletePat" data-id="${patient.accountId}"
										data-name="${patient.name}"><i class="glyphicon glyphicon-remove"></i>&nbsp;移除患者</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- // Tabs Heading END -->
						<div class="widget-body col-md-9">
							<div class="tab-content">
								<!-- Tab content -->
								<div class="tab-pane active" id="tab1-1">
									<div class="form-group">
										<input type="hidden" name="docId" value="${doctorId}">
										<input type="hidden" name="token" value="${token}"> <label
											for="patientName">姓名</label>
										<div class="inputDiv">${patient.name}</div>
									</div>
									<div class="form-group dropdown selectSimulate">
										<label for="patientSex">性别</label>
										<div class="inputDiv">
											<c:choose>
												<c:when test="${patient.gender eq '男'}">
  男
   </c:when>
												<c:when test="${patient.gender eq '女'}">
  女
   </c:when>
												<c:otherwise>
   暂无
   </c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="form-group">
										<label for="birthday">出生日期</label>
										<div class="inputDiv">${patient.birthday}</div>
									</div>

									<div class="form-group">
										<label for="birthAddr">出生地</label>
										<div class="inputDiv">${patient.birthAddr}</div>
									</div>
									<div class="form-group">
										<label for="country">国籍</label>
										<div class="inputDiv">${patient.country}</div>
									</div>
									<div class="form-group">
										<label for="nationality">民族</label>
										<div class="inputDiv">${patient.nationality}</div>
									</div>
									<div class="form-group">
										<label for="IdentityId">身份证件</label>
										<div class="inputDiv">${patient.identityId}</div>
									</div>
									<div class="form-group">
										<label for="residenceAddress">户籍地址</label>
										<div class="inputDiv">${patient.residenceAddress}</div>
									</div>
									<div class="form-group">
										<label for="education">文化程度</label>
										<div class="inputDiv">${patient.education}</div>
									</div>
									<div class="form-group dropdown selectSimulate">
										<label for="maritalStatus">婚姻状况</label>
										<div class="inputDiv">
											<c:choose>
												<c:when test="${patient.maritalStatus eq '已婚'}">
  已婚
   </c:when>
												<c:when test="${patient.maritalStatus eq '未婚'}">
 未婚
   </c:when>
												<c:otherwise>
   暂无
   </c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab2-1">
									<div class="form-group">
										<label for="kindOfCensus">户籍性质</label>
										<div class="inputDiv">${patient.kindOfCensus}</div>
									</div>
									<div class="form-group">
										<label for="address">联系地址</label>
										<div class="inputDiv">${patient.address}</div>
									</div>
									<div class="form-group">
										<label for="zipCode">邮政编码</label>
										<div class="inputDiv">${patient.zipCode}</div>
									</div>
									<div class="form-group">
										<label for="mobilePhone">移动电话</label>
										<div class="inputDiv">${patient.mobilePhone}</div>
									</div>
									<div class="form-group">
										<label for="email">电子邮件</label>
										<div class="inputDiv">${patient.email}</div>
									</div>
									<div class="form-group">
										<label for="typeOfJob">职业类别</label>
										<div class="inputDiv">${patient.typeOfJob}</div>
									</div>
									<div class="form-group">
										<label for="workUnit">工作单位</label>
										<div class="inputDiv">${patient.workUnit}</div>
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab3-1">
									<div class="form-group">
										<label for="weixinNum">微信号</label>
										<div class="inputDiv">${patient.weixinNum}</div>
									</div>
									<div class="form-group">
										<label for="qqNum">QQ</label>
										<div class="inputDiv">${patient.qqNum}</div>
									</div>
									<div class="form-group">
										<label for="disease">所患疾病</label>
										<div class="inputDiv">${patient.disease}</div>
									</div>
									<div class="form-group">
										<label for="timeOfFFD">首诊建档时间</label>
										<div class="inputDiv">${patient.timeOfFFD}</div>
									</div>
									<div class="form-group">
										<label for="filingPerson">建档人</label>
										<div class="inputDiv">${patient.filingPerson}</div>
									</div>
									<div class="form-group">
										<label for="filingHospital">建档医院</label>
										<div class="inputDiv">${patient.filingHospital}</div>
									</div>
									<div class="form-group">
										<label for="currentHospital">当前医院</label>
										<div class="inputDiv">${patient.currentHospital}</div>
									</div>
									<div class="form-group">
										<label for="responsibilityExpert">责任专家</label>
										<div class="inputDiv">${patient.responsibilityExpert}</div>
									</div>
									<div class="form-group">
										<label for="responsibilityExpertId">责任专家id</label>
										<div class="inputDiv">${patient.responsibilityExpertId}</div>
									</div>
									<div class="form-group">
										<label for="healthSeneschal">健康管家</label>
										<div class="inputDiv">${patient.healthSeneschal}</div>
									</div>
									<div class="form-group">
										<label for="healthSeneschalId">健康管家id</label>
										<div class="inputDiv">${patient.healthSeneschalId}</div>
									</div>
									<div class="form-group">
										<label for="responsibilityDoctor">责任医生</label>
										<div class="inputDiv">${patient.responsibilityDoctor}</div>
									</div>
									<div class="form-group">
										<label for="responsibilityDoctorId">责任医生id</label>
										<div class="inputDiv">${patient.responsibilityDoctorId}</div>
									</div>
									<div class="form-group">
										<label for="currentStatus">当前客户状态</label>
										<div class="inputDiv">${patient.currentStatus}</div>
									</div>
									<div class="form-group">
										<label for="patientLabels">患者标签</label>
										<div class="inputDiv">${patient.patientLabels}</div>
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab4-1">
									<div class="form-group">
										<label for="countOfChildren">子女数</label>
										<div class="inputDiv">${patient.countOfChildren}</div>
									</div>
									<div class="form-group">
										<label for="father">父亲姓名</label>
										<div class="inputDiv">${patient.father}</div>
									</div>
									<div class="form-group">
										<label for="mother">母亲姓名</label>
										<div class="inputDiv">${patient.mother}</div>
									</div>
									<div class="form-group">
										<label for="contactName">亲属联系人姓名</label>
										<div class="inputDiv">${patient.contactName}</div>
									</div>
									<div class="form-group">
										<label for="contactTel">亲属联系电话</label>
										<div class="inputDiv">${patient.contactTel}</div>
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab5-1">
									<div class="form-group dropdown selectSimulate">
										<label for="bloodType">血型</label>
										<div class="inputDiv">
											<c:choose>
												<c:when test="${patient.bloodType eq 'O型'}">
   O型
   </c:when>
												<c:when test="${patient.bloodType eq 'AB型'}">
   AB型
   </c:when>
												<c:when test="${patient.bloodType eq 'A型'}">
  A型
   </c:when>
												<c:when test="${patient.bloodType eq 'B型'}">
   B型
   </c:when>
												<c:otherwise>
   暂无
   </c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="form-group">
										<label for="allergies">过敏史</label>
										<div class="inputDiv">${patient.allergies}</div>
									</div>
									<div class="form-group">
										<label for="warningRiskFactors">警示风险因（素如有多个请用逗号隔开）</label>
										<div class="inputDiv">${patient.warningRiskFactors}</div>
									</div>
									<div class="form-group">
										<label for="vaccinationHistory">预防接种史</label>
										<div class="inputDiv">${patient.vaccinationHistory}</div>
									</div>
									<div class="form-group">
										<label for="diseaseHistory">既往疾病史</label>
										<div class="inputDiv">${patient.diseaseHistory}</div>
									</div>
									<div class="form-group">
										<label for="GeneticDiseaseHistory">家族遗传病史</label>
										<div class="inputDiv">${patient.geneticDiseaseHistory}</div>
									</div>
									<div class="form-group">
										<label for="healthRiskFactors">健康危险因素</label>
										<div class="inputDiv">${patient.healthRiskFactors}</div>
									</div>
									<div class="form-group">
										<label for="disability">残疾情况</label>
										<div class="inputDiv">${patient.disability}</div>
									</div>
									<div class="form-group">
										<label for="relativesHealthConditions">亲属健康情况</label>
										<div class="inputDiv">${patient.relativesHealthConditions}</div>
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab6-1">
									<div class="form-group">
										<label for="categoryOfMI">医疗保险类别</label>
										<div class="inputDiv">${patient.categoryOfMI}</div>
									</div>
									<div class="form-group">
										<label for="numberOfMI">医疗保险号码</label>
										<div class="inputDiv">${patient.numberOfMI}</div>
									</div>
									<div class="form-group">
										<label for="numberOfDC">残疾证号码</label>
										<div class="inputDiv">${patient.numberOfDC}</div>
									</div>
								</div>
								<!-- // Tab content END -->
							</div>
						</div>
					</div>
					<div class="row submit">
						<div class="col-md-3"></div>
						<div class="col-md-9"></div>
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
	<script src="../assets/plugins/glDatePicker/glDatePicker.js"></script>
	<script src="../assets/script/medex/frame.js"></script>
	<script src="../assets/script/medex/pat_detail.js"></script>
</body>
</html>