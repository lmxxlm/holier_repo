<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="../commons/runParams.html"%>
<title>账号详情</title>
<link type="text/css" rel="stylesheet"
	href="../resources/tab/css/list.css" />
<link type="text/css" rel="stylesheet"
	href="../resources/tab/css/edit.css" />
<script type="text/javascript"
	src="../resources/scripts/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../resources/scripts/tools/WdatePicker/WdatePicker.js"></script>
<style>
.td2 {
	vertical-align: top !important;
}

.td2 span {
	margin-left: 10px;
	color: #09C;
}
</style>
</head>

<body>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="15" height="30"><img
							src="../resources/tab/images/tab_03.gif" width="15" height="30" />
						</td>
						<td width="1101" background="../resources/tab/images/tab_05.gif"><img
							src="../resources/tab/images/311.gif" width="16" height="16" />
							<span class="STYLE4">账户详情</span>
						</td>
						<td width="281" background="../resources/tab/images/tab_05.gif"><table
								border="0" align="right" cellpadding="0" cellspacing="0">
								<tr>
									<td width="52"><table width="88%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center">
														<img src="../resources/tab/images/002.gif" width="14"
															height="14" />
													</div>
												</td>
												<td class="STYLE1"><div align="center">
														<a href="javascript:history.go(-1)">返回</a>
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td width="14"><img src="../resources/tab/images/tab_07.gif"
							width="14" height="30" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="9" background="../resources/tab/images/tab_12.gif">&nbsp;</td>
						<td bgcolor="#f3ffe3"><table width="99%" border="0"
								align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98">
								<tr class="listTr">
									<td class="td2">
										<h2>人口学</h2>
										<p>
											账号id：<span>${account.accountId}</span>
										</p>
										<p>
											姓名：<span>${account.name}</span>
										</p>
										<p>
											性别：<span>${patient.gender}</span>
										</p>
										<p>
											出生日期：<span>${patient.birthday}</span>
										</p>
										<p>
											出生地：<span>${patient.birthAddr}</span>
										</p>
										<p>
											国籍：<span>${patient.country}</span>
										</p>
										<p>
											民族：<span>${patient.nationality}</span>
										</p>
										<p>
											身份证件：<span>${patient.identityId}</span>
										</p>
										<p>
											户籍地址：<span>${patient.residenceAddress}</span>
										</p>
										<p>
											文化程度：<span>${patient.education}</span>
										</p>
										<p>
											婚姻状况：<span>${patient.maritalStatus}</span>
										</p></td>
									<td class="td2">
										<h2>社会经济学</h2>
										<p>
											户籍性质：<span>${patient.kindOfCensus}</span>
										</p>
										<p>
											联系地址：<span>${patient.address}</span>
										</p>
										<p>
											邮政编码：<span>${patient.zipCode}</span>
										</p>
										<p>
											移动电话：<span>${patient.mobilePhone}</span>
										</p>
										<p>
											电子邮件：<span>${patient.email}</span>
										</p>
										<p>
											职业类别：<span>${patient.typeOfJob}</span>
										</p>
										<p>
											工作单位：<span>${patient.workUnit}</span>
										</p> <br />
										<h2>后台信息</h2>
										<p>
											账号id：<span>${account.accountId}</span>
										</p>
										<p>
											备注：<span>${account.remark}</span>
										</p>
										<p>
											上次访问时间：<span>${account.lastlogintime_str}</span>
										</p>
										<p>
											是否启用：<span>${account.status}</span>
										</p></td>
									<td class="td2" colspan="2">
										<h2>系统信息</h2>
										<p>
											微信号：<span>${patient.weixinNum}</span>
										</p>
										<p>
											QQ：<span>${patient.qqNum}</span>
										</p>
										<p>
											所患疾病：<span>${patient.disease}</span>
										</p>
										<p>
											首诊建档时间：<span>${patient.timeOfFFD}</span>
										</p>
										<p>
											建档人：<span>${patient.filingPerson}</span>
										</p>
										<p>
											建档医院：<span>${patient.filingHospital}</span>
										</p>
										<p>
											当前医院：<span>${patient.currentHospital}</span>
										</p>
										<p>
											责任专家：<span>${patient.responsibilityExpert}</span>
										</p>
										<p>
											责任专家id：<span>${patient.responsibilityExpertId}</span>
										</p>
										<p>
											健康管家：<span>${patient.healthSeneschal}</span>
										</p>
										<p>
											健康管家id：<span>${patient.healthSeneschalId}</span>
										</p>
										<p>
											责任医生：<span>${patient.responsibilityDoctor}</span>
										</p>
										<p>
											责任医生id：<span>${patient.responsibilityDoctorId}</span>
										</p>    
										<p>
											当前客户状态：<span>${patient.currentStatus}</span>
										</p>
										<p>
											患者标签：<span> <c:forEach
													items="${patient.patientLabels_array}" var="s"
													varStatus="status">
									${s}
									</c:forEach> </span>
										</p></td>
									<td class="td2" colspan="2">
										<h2>亲属信息</h2>
										<p>
											子女数：<span>${patient.countOfChildren}</span>
										</p>
										<p>
											父亲姓名：<span>${patient.father}</span>
										</p>
										<p>
											母亲姓名：<span>${patient.mother}</span>
										</p>
										<p>
											亲属联系人姓名：<span>${patient.contactName}</span>
										</p>
										<p>
											亲属联系电话：<span>${patient.contactTel}</span>
										</p> <br />
										<h2>社会保障信息</h2>
										<p>
											医疗保险类别：<span>${patient.categoryOfMI}</span>
										</p>
										<p>
											医疗保险号码：<span>${patient.numberOfMI}</span>
										</p>
										<p>
											残疾证号码：<span>${patient.numberOfDC}</span>
										</p></td>
									<td class="td2" colspan="2">
										<h2>基本健康信息</h2>
										<p>
											血型：<span>${patient.bloodType}</span>
										</p>
										<p>
											过敏史：<span><c:forEach
													items="${patient.allergies_array}" var="s"
													varStatus="status">
									${s}
									</c:forEach></span>
										</p>
										<p>
											警示风险因素：<span><c:forEach
													items="${patient.warningRiskFactors_array}" var="s"
													varStatus="status">
									${s}
									</c:forEach></span>
										</p>
										<p>
											预防接种史：<span><c:forEach
													items="${patient.vaccinationHistory_array}" var="s"
													varStatus="status">
									${s}
									</c:forEach></span>
										</p>
										<p>
											既往疾病史：<span><c:forEach
													items="${patient.diseaseHistory_array}" var="s"
													varStatus="status">
									${s}
									</c:forEach></span>
										</p>
										<p>
											家族遗传病史：<span><c:forEach
													items="${patient.geneticDiseaseHistory_array}" var="s"
													varStatus="status">
									${s}
									</c:forEach></span>
										</p>
										<p>
											健康危险因素：<span><c:forEach
													items="${patient.healthRiskFactors_array}" var="s"
													varStatus="status">
									${s}
									</c:forEach></span>
										</p>
										<p>
											残疾情况：<span>${patient.disability}</span>
										</p>
										<p>
											亲属健康情况：<span>${patient.relativesHealthConditions}</span>
										</p></td>
								</tr>
							</table>
						</td>
						<td width="9" background="../resources/tab/images/tab_16.gif">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="29"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="15" height="29"><img
							src="../resources/tab/images/tab_20.gif" width="15" height="29" />
						</td>
						<td background="../resources/tab/images/tab_21.gif"></td>
						<td width="14"><img src="../resources/tab/images/tab_22.gif"
							width="14" height="29" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
