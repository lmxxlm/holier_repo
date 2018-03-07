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
<title>添加账号</title>
<link type="text/css" rel="stylesheet"
	href="../resources/tab/css/list.css" />
<link type="text/css" rel="stylesheet"
	href="../resources/tab/css/edit.css" />
<script type="text/javascript"
	src="../resources/scripts/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../resources/scripts/tools/WdatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../resources/scripts/tools/md5.js"></script>
<script language="javascript">
	function submitForm() {
		var type = $('select[name="type"]').val();
		var powerName= $('input[name="powerName"]').val();
		var powerDescription = $('textarea[name="powerDescription"]').val();
        if(!type){
        	alert("没有选择用户类型");
        	return false;
        }
		if(!powerName){
			alert("没有权限名称");
			return false;
		}
		if(!powerDescription){
			alert("没有填写权限说明！");
			return false;
		}
		var questURL = runParams.mainUrl + 'tab/powerAddForm.do';
		var questArr = {
			group_name : type,
			power_name:powerName,
			power_intro:powerDescription
		};
		$.post(questURL, questArr, function(result) {
			if (result==true) {
				alert('操作成功！');
				location.href = 'power.html';
			} else {
				alert("操作失败");
				return false;
			}
		}, 'json');
	}
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
							<span class="STYLE4">添加权限账号</span>
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
									<td class="td1">用户组</td>
									<td class="td2"><select name="type"><option
												value="医生">医生</option>
											<option value="患者">患者</option>
											<option value="护士">护士</option>
											<option value="医助">医助</option>
											<option value="管理员">管理员</option>
											<option value="产品管理员">产品管理员</option>
											<option value="CA">CA</option>
											<option value="CC">CC</option>
											<option value="财务">财务</option>
									</select>
									</td>
								</tr>
								<tr class="listTr">
									<td class="td1">权限名称</td>
									<td class="td2"><input name="powerName" type="text"
										class="input" value="" />
									</td>
								</tr>
								<tr class="listTr">
									<td class="td1">权限说明</td>
									<td class="td2"><textarea class="textarea" name="powerDescription"></textarea>
									</td>
								</tr>
								<tr class="listTr">
									<td class="td1">&nbsp;</td>
									<td class="td2"><input type="button" class="confirmBtn"
										value="确定" onclick="submitForm()" />
									</td>
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
