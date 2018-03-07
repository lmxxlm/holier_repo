<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="./commons/runParams.html"%>
<title>管理平台</title>
<script type="text/javascript" src="resources/scripts/lib/jquery.min.js"></script>
<script type="text/javascript" src="resources/scripts/tools/md5.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow: hidden;
}

td {
	vertical-align: top;
}

.content td {
	vertical-align: middle;
}

.STYLE3 {
	color: #528311;
	font-size: 12px;
}

.STYLE4 {
	color: #42870a;
	font-size: 12px;
	vertical-align: bottom;
}
-->
</style>
<script language="javascript">
	function doSubmit() {
		var accountId = $('input[name="accountId"]').val();
		var passwd = $('input[name="passwd"]').val();
		passwd = hex_md5(accountId+passwd);
		var questURL = runParams.mainUrl + 'checkLogin.do';
		var questArr = {
				accountId : accountId,
				passwd : passwd   
		};   
		$.post(questURL, questArr, function(result) {
			if (1 == result) {
				alert('登录成功！');
				window.location.href = runParams.mainUrl;
			} else {
				alert('用户名或密码错误！');
				return false;
			}
		});
	}
	
	var keyLogin = function(event){
	    if(event.keyCode == 13 ){
	    		//doLogin();
	    		doSubmit();
	    }
	}
</script>
</head>

<body onkeydown="keyLogin(event);">
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td bgcolor="#e5f6cf">&nbsp;</td>
		</tr>
		<tr>
			<td height="608" background="resources/images/login/login_03.gif"><table
					width="862" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="266" background="resources/images/login/login_04.gif">&nbsp;</td>
					</tr>
					<tr>
						<td height="95"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="424" height="95"
										background="resources/images/login/login_06.gif">&nbsp;</td>
									<td width="183"
										background="resources/images/login/login_07.gif"><table
											width="100%" border="0" cellspacing="0" cellpadding="0"
											class="content">
											<tr>
												<td width="21%" height="30"><div align="center">
														<span class="STYLE3">用户</span>
													</div>
												</td>
												<td width="79%" height="30"><input type="text"
													name="accountId"
													style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;">
												</td>
											</tr>
											<tr>
												<td height="30"><div align="center">
														<span class="STYLE3">密码</span>
													</div>
												</td>
												<td height="30"><input type="password" name="passwd"
													style="height: 18px; width: 130px; border: solid 1px #cadcb2; font-size: 12px; color: #81b432;">
												</td>
											</tr>
											<tr>
												<td height="30">&nbsp;</td>
												<td height="30"><img
													src="resources/images/login/dl.gif" width="81" height="22"
													border="0" usemap="#Map">
												</td>
											</tr>
										</table>
									</td>
									<td width="255"
										background="resources/images/login/login_08.gif">&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="247" valign="top"
							background="resources/images/login/login_09.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="22%" height="30">&nbsp;</td>
									<td width="56%">&nbsp;</td>
									<td width="22%">&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td height="30"><table width="100%" border="0"
											cellspacing="0" cellpadding="0">
											<tr>
												<td width="44%" height="20">&nbsp;</td>
												<td width="56%" class="STYLE4">版本 2014V1.0</td>
											</tr>
										</table>
									</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="#a2d962">&nbsp;</td>
		</tr>
	</table>

	<map name="Map">
		<area shape="rect" coords="3,3,36,19" href="#" onClick="doSubmit()">
		<area shape="rect" coords="40,3,78,18" href="#">
	</map>
</body>
</html>
