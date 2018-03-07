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
<link href="../assets/css/medex/datetimepickerReview.css" rel="stylesheet">
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
		<%@ include file="../commons/leftMenu_pat.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="../commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a>
				</li>
				<li class="active">患者基本信息</li>
			</ol>
			<div class="mainBody">
				<input type="hidden" name="patientId" value="${patientId}">
				<div class="patinfo">
					<span class="label"><i class="glyphicon glyphicon-edit"></i>&nbsp;&nbsp;${patient.name}&nbsp;/&nbsp;${patient.age}岁&nbsp;/&nbsp;<c:if
							test="${patient.gender eq '男'}">男</c:if> <c:if
							test="${patient.gender eq '女'}">女</c:if>&nbsp;/&nbsp;${patient.currentStatus}&nbsp;/&nbsp;${patient.mobilePhone
						}&nbsp;/&nbsp;${patient.responsibilityDoctor}</span>
					<div class="widget row">
						<!-- Tabs Heading -->
						<div class="widget-head col-md-3">
							<ul>
								<li class="active"><a href="#tab1-1"
									class="glyphicons user" data-toggle="tab" onFocus="this.blur()"><i></i>人口学</a>
								</li>
								<li><a href="#tab2-1" class="glyphicons calculator"
									data-toggle="tab" onFocus="this.blur()"><i></i>社会经济学</a>
								</li>
								<li><a href="#tab3-1" class="glyphicons credit_card"
									data-toggle="tab" onFocus="this.blur()"><i></i>系统信息</a>
								</li>
								<li><a href="#tab4-1" class="glyphicons circle_ok"
									data-toggle="tab" onFocus="this.blur()"><i></i>亲属信息</a>
								</li>
								<li><a href="#tab5-1" class="glyphicons user"
									data-toggle="tab" onFocus="this.blur()"><i></i>基本健康信息</a>
								</li>
								<li><a href="#tab6-1" class="glyphicons calculator"
									data-toggle="tab" onFocus="this.blur()"><i></i>社会保障信息</a>
								</li>
								<li><a href="#tab7-1" class="glyphicons calendar"
									data-toggle="tab" onFocus="this.blur()"><i></i>病例时间</a>
								</li>
							</ul>
						</div>
						<!-- // Tabs Heading END -->
						<div class="widget-body col-md-9">
							<div class="tab-content">
								<!-- Tab content -->
								<div class="tab-pane active" id="tab1-1">
									<div class="form-group">
										<label for="patientName">姓名</label> <input type="text"
											class="form-control" name="patientName"
											value="${patient.name}" placeholder="请输入姓名">
									</div>
									<div class="form-group dropdown selectSimulate">
										<label for="patientSex">性别</label> <input type="hidden"
											name="patientSex"
											<c:choose>
												<c:when test="${empty patient.gender}">
  value="暂无"
   </c:when>
												<c:otherwise>
   value="${patient.gender}"
   </c:otherwise>
											</c:choose>
											class="selectData">
										<button type="button" class="btn dropdown-toggle"
											data-toggle="dropdown" onFocus="this.blur()">
											<c:choose>
												<c:when test="${empty patient.gender}">
  暂无
   </c:when>
												<c:otherwise>
   ${patient.gender}
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
									<div class="form-group">
										<label for="birthday">出生日期</label> <input type="text"
											class="form-control" name="birthday"
											value="${patient.birthday}" placeholder="请输入出生日期" readonly>
									</div>
									<div class="form-group">
										<label for="birthAddr">出生地</label> <input type="text"
											class="form-control" name="birthAddr"
											value="${patient.birthAddr}" placeholder="请输入出生地">
									</div>
									<div class="form-group">
										<label for="country">国籍</label> <input type="text"
											class="form-control" name="country"
											value="${patient.country}" placeholder="请输入国籍">
									</div>
									<div class="form-group">
										<label for="nationality">民族</label> <input type="text"
											class="form-control" name="nationality"
											value="${patient.nationality}" placeholder="请输入民族">
									</div>
									<div class="form-group">
										<label for="IdentityId">身份证件</label> <input type="text"
											class="form-control" name="IdentityId"
											value="${patient.identityId}" placeholder="请输入身份证件">
									</div>
									<div class="form-group">
										<label for="residenceAddress">户籍地址</label> <input type="text"
											class="form-control" name="residenceAddress"
											value="${patient.residenceAddress}" placeholder="请输入户籍地址">
									</div>
									<div class="form-group">
										<label for="education">文化程度</label> <input type="text"
											class="form-control" name="education"
											value="${patient.education}" placeholder="请输入文化程度">
									</div>
									<div class="form-group dropdown selectSimulate">
										<label for="maritalStatus">婚姻状况</label> <input type="hidden"
											name="maritalStatus"
											<c:choose>
   <c:when test="${empty patient.maritalStatus}">
   value=" 暂无" 
   </c:when>
   <c:otherwise>
     value="${patient.maritalStatus}" 
   </c:otherwise>
</c:choose>
											class="selectData">
										<button type="button" class="btn dropdown-toggle"
											data-toggle="dropdown" onFocus="this.blur()">
											<c:choose>
												<c:when test="${empty patient.maritalStatus}">
   暂无
   </c:when>
												<c:otherwise>
   ${patient.maritalStatus}
   </c:otherwise>
											</c:choose>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a tabindex="-1" href="#" onFocus="this.blur()"
												data-val="已婚">已婚</a>
											</li>
											<li class="divider"></li>
											<li><a tabindex="-1" href="#" onFocus="this.blur()"
												data-val="未婚">未婚</a>
											</li>
										</ul>
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab2-1">
									<div class="form-group">
										<label for="kindOfCensus">户籍性质</label> <input type="text"
											class="form-control" name="kindOfCensus"
											value="${patient.kindOfCensus}" placeholder="请输入户籍性质">
									</div>
									<div class="form-group">
										<label for="address">联系地址</label> <input type="text"
											class="form-control" name="address"
											value="${patient.address}" placeholder="请输入联系地址">
									</div>
									<div class="form-group">
										<label for="zipCode">邮政编码</label> <input type="text"
											class="form-control" name="zipCode"
											value="${patient.zipCode}" placeholder="请输入邮政编码">
									</div>
									<div class="form-group">
										<label for="mobilePhone">移动电话</label> <input type="tel"
											class="form-control" name="mobilePhone"
											value="${patient.mobilePhone}" placeholder="请输入移动电话">
									</div>
									<div class="form-group">
										<label for="email">电子邮件</label> <input type="email"
											class="form-control" name="email" value="${patient.email}"
											placeholder="请输入电子邮件">
									</div>
									<div class="form-group">
										<label for="typeOfJob">职业类别</label> <input type="text"
											class="form-control" name="typeOfJob"
											value="${patient.typeOfJob}" placeholder="请输入职业类别">
									</div>
									<div class="form-group">
										<label for="workUnit">工作单位</label> <input type="text"
											class="form-control" name="workUnit"
											value="${patient.workUnit}" placeholder="请输入工作单位">
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab3-1">
									<div class="form-group">
										<label for="weixinNum">微信号</label> <input type="text"
											class="form-control" name="weixinNum"
											value="${patient.weixinNum}" placeholder="请输入微信号">
									</div>
									<div class="form-group">
										<label for="qqNum">QQ</label> <input type="text"
											class="form-control" name="qqNum" value="${patient.qqNum}"
											placeholder="请输入QQ">
									</div>
									<div class="form-group">
										<label for="disease">所患疾病</label> <input type="text"
											class="form-control" name="disease"
											value="${patient.disease}" placeholder="请输入所患疾病">
									</div>
									<div class="form-group">
										<label for="timeOfFFD">首诊建档时间</label> <input type="text"
											class="form-control" name="timeOfFFD"
											value="${patient.timeOfFFD}" placeholder="请输入首诊建档时间" readonly>
									</div>
									<div class="form-group">
										<label for="filingPerson">建档人</label> <input type="text"
											class="form-control" name="filingPerson"
											value="${patient.filingPerson}" placeholder="请输入建档人">
									</div>
									<div class="form-group smartSearch">
										<label for="filingHospital">建档医院</label> <input type="text"
											class="form-control" name="filingHospital"
											value="${patient.filingHospital}" placeholder="请输入建档医院">
											<ul  class="searchResultForHospital"></ul>
									</div>
									<div class="form-group smartSearch">
										<label for="currentHospital">当前医院</label> <input type="text"
											class="form-control" name="currentHospital"
											value="${patient.currentHospital}" placeholder="请输入当前医院">
											<ul  class="searchResultForHospital"></ul>
									</div>
									<div class="form-group">
										<label for="responsibilityExpert">责任专家</label> <input
											type="text" class="form-control" name="responsibilityExpert"
											value="${patient.responsibilityExpert}" placeholder="请输入责任专家"  disabled="disabled">
									</div>
									<div class="form-group">
										<label for="responsibilityExpertId">责任专家id</label> <input
											type="text" class="form-control"
											name="responsibilityExpertId"
											value="${patient.responsibilityExpertId}"
											placeholder="请输入责任专家id"  disabled="disabled">
									</div>
									<div class="form-group">
										<label for="healthSeneschal">健康管家</label> <input type="text"
											class="form-control" name="healthSeneschal"
											value="${patient.healthSeneschal}" placeholder="请输入健康管家">
									</div>
									<div class="form-group">
										<label for="healthSeneschalId">健康管家id</label> <input
											type="text" class="form-control" name="healthSeneschalId"
											value="${patient.healthSeneschalId}" placeholder="请输入健康管家id">
									</div>
									<div class="form-group">
										<label for="responsibilityDoctor">责任医生</label> <input
											type="text" class="form-control" name="responsibilityDoctor"
											value="${patient.responsibilityDoctor}"  disabled="disabled">
									</div>
									<div class="form-group">      
										<label for="responsibilityDoctorId">责任医生id</label> <input
											type="text" class="form-control"
											name="responsibilityDoctorId"
											value="${patient.responsibilityDoctorId}"  disabled="disabled">
									</div>
									<div class="form-group">
										<label for="currentStatus">当前客户状态</label> <input type="text"
											class="form-control" name="currentStatus"
											value="${patient.currentStatus}" placeholder="请输入当前客户状态">
									</div>
									<div class="form-group">
										<label for="patientLabels">患者标签（如有多个请用逗号隔开）</label> <input
											type="text" class="form-control" name="patientLabels"
											value="${patient.patientLabels}" placeholder="请输入患者标签">
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab4-1">
									<div class="form-group">
										<label for="countOfChildren">子女数</label> <input type="number"
											class="form-control" name="countOfChildren"
											value="${patient.countOfChildren}" placeholder="请输入子女数">
									</div>
									<div class="form-group">
										<label for="father">父亲姓名</label> <input type="text"
											class="form-control" name="father" value="${patient.father}"
											placeholder="请输入父亲姓名">
									</div>
									<div class="form-group">
										<label for="mother">母亲姓名</label> <input type="text"
											class="form-control" name="mother" value="${patient.mother}"
											placeholder="请输入母亲姓名">
									</div>
									<div class="form-group">
										<label for="contactName">亲属联系人姓名</label> <input type="text"
											class="form-control" name="contactName"
											value="${patient.contactName}" placeholder="请输入亲属联系人姓名">
									</div>
									<div class="form-group">
										<label for="contactTel">亲属联系电话</label> <input type="tel"
											class="form-control" name="contactTel"
											value="${patient.contactTel}" placeholder="请输入亲属联系电话">
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab5-1">
									<div class="form-group dropdown selectSimulate">
										<label for="bloodType">血型</label> <input type="hidden"
											name="bloodType"
											<c:choose>
   <c:when test="${empty patient.bloodType}">
   value="暂无" 
   </c:when>
   <c:otherwise>
     value="${patient.bloodType}"   
   </c:otherwise>
</c:choose>
											class="selectData">
										<button type="button" class="btn dropdown-toggle"
											data-toggle="dropdown" onFocus="this.blur()">
																						<c:choose>
   <c:when test="${empty patient.bloodType}">
   暂无
   </c:when>
   <c:otherwise>
     ${patient.bloodType}  
   </c:otherwise>
</c:choose>
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a tabindex="-1" href="#" onFocus="this.blur()"
												data-val="O型">O型</a>
											</li>
											<li class="divider"></li>
											<li><a tabindex="-1" href="#" onFocus="this.blur()"
												data-val="AB型">AB型</a>
											</li>
											<li class="divider"></li>
											<li><a tabindex="-1" href="#" onFocus="this.blur()"
												data-val="A型">A型</a>
											</li>
											<li class="divider"></li>
											<li><a tabindex="-1" href="#" onFocus="this.blur()"
												data-val="B型">B型</a>
											</li>   
										</ul>
									</div>
									<div class="form-group">
										<label for="allergies">过敏史（如有多个请用逗号隔开）</label> <input
											type="text" class="form-control" name="allergies"
											value="${patient.allergies}" placeholder="请输入过敏史">
									</div>
									<div class="form-group">
										<label for="warningRiskFactors">警示风险因素(如有多个请用逗号隔开）</label> <input
											type="text" class="form-control" name="warningRiskFactors"
											value="${patient.warningRiskFactors}" placeholder="请输入警示风险因素">
									</div>
									<div class="form-group">
										<label for="vaccinationHistory">预防接种史（如有多个请用逗号隔开）</label> <input
											type="text" class="form-control" name="vaccinationHistory"
											value="${patient.vaccinationHistory}" placeholder="请输入预防接种史">
									</div>
									<div class="form-group">
										<label for="diseaseHistory">既往疾病史（如有多个请用逗号隔开）</label> <input
											type="text" class="form-control" name="diseaseHistory"
											value="${patient.diseaseHistory}" placeholder="请输入既往疾病史">
									</div>
									<div class="form-group">
										<label for="GeneticDiseaseHistory">家族遗传病史（如有多个请用逗号隔开）</label>
										<input type="text" class="form-control"
											name="GeneticDiseaseHistory"
											value="${patient.geneticDiseaseHistory}"
											placeholder="请输入家族遗传病史">
									</div>
									<div class="form-group">
										<label for="healthRiskFactors">健康危险因素（如有多个请用逗号隔开）</label> <input
											type="text" class="form-control" name="healthRiskFactors"
											value="${patient.healthRiskFactors}" placeholder="请输入健康危险因素">
									</div>
									<div class="form-group">
										<label for="disability">残疾情况</label> <input type="text"
											class="form-control" name="disability"
											value="${patient.disability}" placeholder="请输入残疾情况">
									</div>
									<div class="form-group">
										<label for="relativesHealthConditions">亲属健康情况</label> <input
											type="text" class="form-control"
											name="relativesHealthConditions"
											value="${patient.relativesHealthConditions}"
											placehold="请输入亲属健康情况">
									</div>
								</div>
								<!-- // Tab content END -->
								<!-- Tab content -->
								<div class="tab-pane" id="tab6-1">
									<div class="form-group">
										<label for="categoryOfMI">医疗保险类别</label> <input type="text"
											class="form-control" name="categoryOfMI"
											value="${patient.categoryOfMI}" placeholder="请输入医疗保险类别">
									</div>
									<div class="form-group">
										<label for="numberOfMI">医疗保险号码</label> <input type="text"
											class="form-control" name="numberOfMI"
											value="${patient.numberOfMI}" placeholder="请输入医疗保险号码">
									</div>
									<div class="form-group">
										<label for="numberOfDC">残疾证号码</label> <input type="text"
											class="form-control" name="numberOfDC"
											value="${patient.numberOfDC}" placeholder="请输入残疾证号码">
									</div>
								</div>
								<!-- // Tab content END -->
								
								<!-- Tab content -->
								<div class="tab-pane" id="tab7-1">
									<div class="form-group">
										<label for="date_of_record">病历录入日期</label> <input type="text"
											class="form-control" name="date_of_record"
											value="${patient.date_of_record}" placeholder="请输入病历录入日期" readonly>
									</div>
									<div class="form-group">
										<label for="operation_date">手术时间</label> <input type="text"
											class="form-control" name="operation_date"
											value="${patient.operation_date}" placeholder="请输入手术时间" readonly>
									</div>
									<div class="form-group">
										<label for="consultation_date">会诊时间</label> <input type="text"
											class="form-control" name="consultation_date"
											value="${patient.consultation_date}" placeholder="请输入会诊时间" readonly>
									</div>
								</div>
								<!-- // Tab content END -->
								
								
							</div>
						</div>
					</div>
					<div class="row submit">
						<div class="col-md-3"></div>
						<div class="col-md-9">
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
	<script
		src="../assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script
		src="../assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="../assets/script/medex/frame.js"></script>
	<script src="../assets/script/medex/pat_info.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.smartSearch .form-control').blur(function(e){
			console.log(e);
			$(this).siblings('ul').hide();
		});
	});
	
	$('input[name="date_of_record"],input[name="operation_date"],input[name="consultation_date"]').datetimepicker({
        language:  'zh-CN',
		format: 'yyyy-mm-dd',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    }); 
	
	</script>
</body>
</html>