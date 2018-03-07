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
<title>修改医院</title>
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
		var _id = $('input[name="_id"]').val();
		var pname = $('input[name="pname"]').val();
		var cname = $('input[name="cname"]').val();
		var hospitalName = $('input[name="hospitalName"]').val();
		var py = $('input[name="py"]').val();
		if (!_id) { 
			alert("未找到这个医院！");
			return false;
		}   
		if (!pname || !cname || !hospitalName || !py) { 
			alert("信息不能为空！");
			return false;
		}   
		py.toUpperCase();  
		var questURL = runParams.mainUrl + 'tab/hospitalEditForm.do';
			var questArr = {
					pname : pname,
					cname : cname,
				    name : hospitalName,
				    py : py,
				    _id:_id;
			};
		

		$.post(questURL, questArr, function(result) {
			if (result == 1) {
				alert('操作成功！');
				location.href = 'hospital.html';
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
							<span class="STYLE4">修改医院</span></td>
						<td width="281" background="../resources/tab/images/tab_05.gif"><table
								border="0" align="right" cellpadding="0" cellspacing="0">
								<tr>
									<td width="52"><table width="88%" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td class="STYLE1"><div align="center">
														<img src="../resources/tab/images/002.gif" width="14"
															height="14" />
													</div></td>
												<td class="STYLE1"><div align="center">
														<a href="javascript:history.go(-1)">返回</a>
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
								<tr class="listTr">
									<td class="td1">省份</td>
									<td class="td2"><input name="pname" type="text"
										class="input" value="${hospital.pname}" /></td>
								</tr>
								<tr class="listTr">
									<td class="td1">城市</td>
									<td class="td2"><input name="cname" type="text"
										class="input" value="${hospital.cname}" /></td>
								</tr>
								<tr class="listTr">
									<td class="td1">医院名称</td>
									<td class="td2"><input name="hospitalName" type="text"
										class="input" value="${hospital.name}" /></td>
								</tr>
								<tr class="listTr">
									<td class="td1">医院首拼</td>
									<td class="td2"><input name="py" type="text"
										class="input" value="${hospital.py}" /></td>
								</tr>
								<tr class="listTr">
									<td class="td1">&nbsp;<input type="hidden"
										name="_id" value="${hospital._id}" /></td>
									<td class="td2"><input type="button" class="confirmBtn"
										value="确定" onclick="submitForm()" /></td>
								</tr>
							</table></td>
						<td width="9" background="../resources/tab/images/tab_16.gif">&nbsp;</td>
					</tr>
				</table></td>
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
							width="14" height="29" /></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>
