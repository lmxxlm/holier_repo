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
<title>账号</title>
<link type="text/css" rel="stylesheet"
	href="../resources/tab/css/list.css" />
<script type="text/javascript"
	src="../resources/scripts/lib/jquery.min.js"></script>
<script type="text/javascript" src="../resources/tab/scripts/common.js"></script>
<script type="text/javascript" src="../resources/tab/scripts/power.js"></script>
<script language="javascript">
$(function(){
	function goPage() {
		var page = $("input[name='textfield']").val();
		location.href = "${mainUril}power.html?cp=" + page
				+ "&ps=${searchParam.ps}";
	}
});	
</script>
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
							<span class="STYLE4">权限管理</span>
							<!--  &nbsp;&nbsp;<span class="STYLE7"><form action="${mainUril}searchAccount.do" method="post" style="float:right;"><input name="accountName" type="text" class="STYLE1" style="height: 16px; width: 100px;" size="5" /></span><input type="submit" value="搜索账号" name="searchAccount"/></form></td>-->
						<td width="281" background="../resources/tab/images/tab_05.gif"><table
								border="0" align="right" cellpadding="0" cellspacing="0">
								<tr>
									<td width="60"><table width="87%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center">
														<input type="checkbox" name="selectAll" value="checkbox" />
													</div></td>
												<td class="STYLE1"><div align="center">全选</div></td>
											</tr>
										</table></td>
									<td width="60"><table width="90%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center">
														<img src="../resources/tab/images/001.gif" width="14"
															height="14" />
													</div></td>
												<td class="STYLE1"><div align="center">
														<a href="powerAdd.html">新增</a>
													</div></td>
											</tr>
										</table></td>
									<td width="52"><table width="88%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center">
														<img src="../resources/tab/images/083.gif" width="14"
															height="14" />
													</div></td>
												<td class="STYLE1"><div align="center">
														<a href="#" onclick="deleteAll()">删除</a>
													</div></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
						<td width="14"><img src="../resources/tab/images/tab_07.gif"
							width="14" height="30" /></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="9" background="../resources/tab/images/tab_12.gif">&nbsp;</td>
						<td bgcolor="#f3ffe3"><table width="99%" border="0"
								align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98">
								<tr>
									<td width="6%" height="26"
										background="../resources/tab/images/tab_14.gif" class="STYLE1"><div
											align="center" class="STYLE2 STYLE1">选择</div></td>
									<td width="10%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2 STYLE1">用户组</div>
									</td>
									<td width="10%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2 STYLE1">权限名称</div>
									</td>
									<td width="18%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2 STYLE1">详细</div>
									</td>
									<td width="9%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2">编辑</div>
									</td>
									<td width="9%" background="../resources/tab/images/tab_14.gif"
										class="STYLE1"><div align="center" class="STYLE2">删除</div>
									</td>
								</tr>
								<c:forEach items="${pl}" var="p"
									varStatus="status">
									<tr class="listTr">
										<td><input name="accountId" type="checkbox"
										value="${p.power_id}" class="selectall_unit" /></td><!-- 权限Id 用户类型 -->
										<td>${p.group_name}</td><!-- 用户类型 -->
										<td>${p.power_name}</td> <!-- 权限名称 --> 
										<td><img src="../resources/tab/images/a1.gif" width="9"
											height="9" />&nbsp;&nbsp;[<a href="powerDetail.html?power_id=${p.power_id}" > 详细</a>]</td>
										<td><img src="../resources/tab/images/037.gif" width="9"
											height="9" />&nbsp;&nbsp;[<a
										  	href="powerEdit.html?power_id=${p.power_id}">编辑</a>]</td>
										<td><img src="../resources/tab/images/010.gif" width="9"
											height="9" />&nbsp;&nbsp;[<a href="#"
											onclick="deleteSingle('${p.power_id}','${p.power_name}')">删除</a>]</td>
									</tr>
								</c:forEach>
							</table></td>
						<td width="9" background="../resources/tab/images/tab_16.gif">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>
