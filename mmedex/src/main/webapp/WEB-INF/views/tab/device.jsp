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
<title>设备</title>
<link type="text/css" rel="stylesheet"
	href="../resources/tab/css/list.css" />
<script type="text/javascript"
	src="../resources/scripts/lib/jquery.min.js"></script>
<script type="text/javascript" src="../resources/tab/scripts/common.js"></script>
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
							<span class="STYLE4">设备管理</span>
						</td>
						<td width="281" background="../resources/tab/images/tab_05.gif"><table
								border="0" align="right" cellpadding="0" cellspacing="0">
								<tr>
									<td width="60"><table width="87%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center">
													</div>
												</td>
												<td class="STYLE1"><div align="center"></div>
												</td>
											</tr>
										</table>
									</td>
									<td width="60"><table width="90%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center"></div>
												</td>
												<td class="STYLE1"><div align="center"></div>
												</td>
											</tr>
										</table>
									</td>
									<td width="52"><table width="88%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center"></div>
												</td>
												<td class="STYLE1"><div align="center"></div>
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
								<tr>
									<td width="10%" height="26"
										background="../resources/tab/images/tab_14.gif" class="STYLE1"><div
											align="center" class="STYLE2 STYLE1">选择</div>
									</td>
									<td width="20%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2 STYLE1">设备UUID</div>
									</td>
									<td width="10%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2 STYLE1">设备类型</div>
									</td>
									<td width="20%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2 STYLE1">上次访问</div>
									</td>
									<td width="10%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2 STYLE1">访问状态</div>
									</td>
									<td width="10%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2">详细</div>
									</td>
									<td width="10%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2">编辑</div>
									</td>
								</tr>
									<c:forEach items="${dro.devices}" var="device"
									varStatus="status">
								<tr class="listTr">
									<td><input name="device_id" type="checkbox"
										value="device_id" class="selectall_unit" />
									</td>
									<td>${device.deviceId}</td>
									<td>${device.type}</td>
									<td>${device.lastlogintime_str}</td>
									<td>${device.status}</td>  
									<td><img src="../resources/tab/images/a1.gif" width="9"
										height="9" />&nbsp;&nbsp;[<a href="deviceDetail.html?deviceId=${device.deviceId4Url}">详细</a>]</td>
									<td><img src="../resources/tab/images/037.gif" width="9"
										height="9" />&nbsp;&nbsp;[<a href="deviceEdit.html?deviceId=${device.deviceId4Url}">编辑</a>]</td>
								</tr>
								</c:forEach> 
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
						<td background="../resources/tab/images/tab_21.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="25%" height="29" nowrap="nowrap"><span
										class="STYLE1">共${dro.acount}条纪录，当前第${searchParam.cp}/${dro.pcount}页，每页${searchParam.ps}条纪录</span>
									</td>
									<td width="75%" valign="top" class="STYLE1"><div
											align="right">
											<table width="352" height="20" border="0" cellpadding="0"
												cellspacing="0">
												<tr class="pageline">
													<td width="62" height="22" valign="middle"><div
															align="right">
															<a
																href="${mainUril}device.html?cp=${dro.pageView.first}&&ps=${searchParam.ps}"><img
																src="../resources/tab/images/first.gif" width="37"
																height="15" /> </a>
														</div>
													</td>
													<td width="50" height="22" valign="middle"><div
															align="right">
															<a
																href="${mainUril}device.html?cp=${dro.pageView.back}&&ps=${searchParam.ps}"><img
																src="../resources/tab/images/back.gif" width="43"
																height="15" /> </a>
														</div>
													</td>
													<td width="54" height="22" valign="middle"><div
															align="right">
															<a
																href="${mainUril}device.html?cp=${dro.pageView.next}&&ps=${searchParam.ps}">
																<img src="../resources/tab/images/next.gif" width="43"
																height="15" /> </a>
														</div>
													</td>
													<td width="49" height="22" valign="middle"><div
															align="right">
															<a
																href="${mainUril}device.html?cp=${dro.pageView.last}&&ps=${searchParam.ps}"><img
																src="../resources/tab/images/last.gif" width="37"
																height="15" /> </a>
														</div>
													</td>
													<td width="59" height="22" valign="middle"><div
															align="right">转到第</div>
													</td>
													<td width="25" height="22" valign="middle"><span
														class="STYLE7"> <input name="textfield" type="text"
															class="STYLE1" style="height: 10px; width: 25px;"
															size="5" /> </span>
													</td>
													<td width="23" height="22" valign="middle">页</td>
													<td width="30" height="22" valign="middle"><img
														src="../resources/tab/images/go.gif" width="37"
														height="15" />
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
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
