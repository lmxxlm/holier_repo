<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="./commons/runParams.html"%>
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
-->
</style></head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td background="resources/images/main_40.gif" style="width:3px;">&nbsp;</td>
    <td width="177"  style="border-right:solid 1px #9ad452;"><iframe name="I2" height="100%" width="177" border="0" frameborder="0" src="${mainUrl}left.html">
		浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    <td style="vertical-align:top; height:100%;"><iframe name="I1" src="${mainUrl}tab/tab.htm" height="100%" width="100%" border="0" frameborder="0" style="margin-top:0;">
		浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    <td background="resources/images/main_42.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
</body>
</html>
