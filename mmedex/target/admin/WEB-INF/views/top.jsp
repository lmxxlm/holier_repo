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
<title>无标题文档</title>
<script type="text/javascript"
	src="./resources/scripts/lib/jquery.min.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #43860c;
	font-size: 12px;
}
-->
</style>
<script>
	function CurentTime() {
		var now = new Date();

		var year = now.getFullYear(); //年
		var month = now.getMonth() + 1; //月
		var day = now.getDate(); //日

		var hh = now.getHours(); //时
		var mm = now.getMinutes(); //分

		var clock = year + "-";

		if (month < 10)
			clock += "0";

		clock += month + "-";

		if (day < 10)
			clock += "0";

		clock += day + " ";

		if (hh < 10)
			clock += "0";

		clock += hh + ":";
		if (mm < 10)
			clock += '0';
		clock += mm;
		return (clock);
	}
	setInterval(function() {
		document.getElementById('currentTime').innerHTML = CurentTime();
	}, 1000);
	function doLogout() {
		if (confirm('确定要退出登录吗？')) {
			//清空session
			var questURL = runParams.mainUrl + 'doLogoutAction.do';
			$.post(questURL, {}, function(result) {
				if (1 == result) {
					alert('已退出登录！');
					//location.reload();
					parent.location.href = "login.html";
				} else {
					alert('退出失败！');
					return false;
				}
			});
		}
	}

	function linkToIndex() {
		parent.location.href = "${mainUrl}";
	}
	function backpage() {
		history.go(-1);
	}
	function gopage() {
		history.go(1);
	}
	function pageReflash() {
		location.reload();
	}
</script>
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="table-layout: fixed;">
		<tr>
			<td height="9"
				style="line-height: 9px; background-image: url(resources/images/main_04.gif)"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="97" height="9"
							background="resources/images/main_01.gif">&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="47" background="resources/images/main_09.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="38" height="47"
							background="resources/images/main_06.gif">&nbsp;</td>
						<td width="59"><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td height="29" background="resources/images/main_07.gif">&nbsp;</td>
								</tr>
								<tr>
									<td height="18" background="resources/images/main_14.gif"><table
											width="100%" border="0" cellspacing="0" cellpadding="0"
											style="table-layout: fixed;">
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td width="155" background="resources/images/main_08.gif">&nbsp;</td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td height="23" valign="bottom"><img
										src="resources/images/main_12.gif" width="367" height="23"
										border="0" usemap="#Map" />
									</td>
								</tr>
							</table>
						</td>
						<td width="200" background="resources/images/main_11.gif"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="11%" height="23">&nbsp;</td>
									<td width="89%" valign="bottom"><span class="STYLE1">日期：<span
											id="currentTime"></span> </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="5"
				style="line-height: 5px; background-image: url(resources/images/main_18.gif)"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="180" background="resources/images/main_16.gif"
							style="line-height: 5px;">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<map name="Map" id="Map">
		<area shape="rect" coords="3,1,49,22" href="javascript:void(0)"
			onclick="linkToIndex()" />
		<area shape="rect" coords="52,2,95,21" href="javascript:void(0)"
			onclick="backpage()" />
		<area shape="rect" coords="102,2,144,21" href="javascript:void(0)"
			onclick="gopage()" />
		<area shape="rect" coords="150,1,197,22" href="javascript:void(0)"
			onclick="pageReflash()" />
		<area shape="rect" coords="210,2,304,20" href="#" />
		<area shape="rect" coords="314,1,361,23" href="javascript:void(0)"
			onclick="doLogout()">
	</map>
</body>
</html>
