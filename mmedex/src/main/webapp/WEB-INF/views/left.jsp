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
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE2 {
	color: #43860c;
	font-size: 12px;
}

a:link {
	font-size: 12px;
	text-decoration: none;
	color: #43860c;
}

a:visited {
	font-size: 12px;
	text-decoration: none;
	color: #43860c;
}

a:hover {
	font-size: 12px;
	text-decoration: none;
	color: #FF0000;
}

#menuTree {
	padding-top: 10px;
	padding-left: 10px;
}

#menuTree A {
	COLOR: #566984;
	TEXT-DECORATION: none;
}

#menuTree A:hover {
	COLOR: red;
	TEXT-DECORATION: none;
}
-->
</STYLE>
<SCRIPT src="resources/scripts/tools/TreeNode.js" type=text/javascript></SCRIPT>
<SCRIPT src="resources/scripts/tools/Tree.js" type=text/javascript></SCRIPT>
<script type="text/JavaScript">
<!--
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}
//-->
</script>
</head>

<body
	onload="MM_preloadImages('resources/images/main_26_1.gif','resources/images/main_29_1.gif','resources/images/main_31_1.gif')">
	<table width="177" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td valign="top"><table width="100%" border="0" cellspacing="0"
					cellpadding="0" style="table-layout: fixed">
					<tr>         
						<td height="26" background="resources/images/main_21.gif">&nbsp;</td>
					</tr>   
					<tr>        
						<td height="80"
							style="background-image: url(resources/images/main_23.gif); background-repeat: repeat-x;"><table
								width="98%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="45"><div align="center">
											<a href="#"><img src="resources/images/main_26.gif"
												name="Image1" width="40" height="40" border="0" id="Image1"
												onmouseover="MM_swapImage('Image1','','resources/images/main_26_1.gif',1)"
												onmouseout="MM_swapImgRestore()" />
											</a>
										</div>                  
									</td>
									<td><div align="center">    
											<a href="#"><img src="resources/images/main_28.gif"
												name="Image2" width="40" height="40" border="0" id="Image2"
												onmouseover="MM_swapImage('Image2','','resources/images/main_29_1.gif',1)"
												onmouseout="MM_swapImgRestore()" />
											</a>
										</div>
									</td>
									<td><div align="center">
											<a href="#"><img src="resources/images/main_31.gif"
												name="Image3" width="40" height="40" border="0" id="Image3"
												onmouseover="MM_swapImage('Image3','','resources/images/main_31_1.gif',1)"
												onmouseout="MM_swapImgRestore()" />
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<td height="25"><div align="center" class="STYLE2">
											<a href="tab/system.html">系统管理</a>
										</div>
									</td>
									<td><div align="center" class="STYLE2">
											<a href="tab/device.html">设备管理</a>
										</div>
									</td>
									<td><div align="center" class="STYLE2">
											<a href="tab/data.html">数据管理</a>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td
							style="line-height: 4px; background: url(resources/images/main_38.gif)">&nbsp;</td>
					</tr>
					<tr>
						<td id="menuTree"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<SCRIPT type=text/javascript>
		var tree = null;
		var root = new TreeNode('系统菜单');
		var fun1 = new TreeNode('账号管理', 'tab/account.html', 'tree_node.gif', null, 'tree_node.gif', null);
		var fun2 = new TreeNode('设备管理', 'tab/device.html', 'tree_node.gif', null, 'tree_node.gif', null);
		var fun3 = new TreeNode('权限管理', 'tab/power.html', 'tree_node.gif', null, 'tree_node.gif', null);
		var fun4 = new TreeNode('数据管理');
		var fun4_1 = new TreeNode('医院管理', 'tab/hospital.html', 'tree_node.gif', null, 'tree_node.gif', null);
		fun4.add(fun4_1);
		var fun5 = new TreeNode('系统管理', 'tab/system.html', 'tree_node.gif', null, 'tree_node.gif', null);
		root.add(fun1);
		root.add(fun2);
		root.add(fun3);
		root.add(fun4);
		root.add(fun5);
		tree = new Tree(root);
		tree.show('menuTree');
	</SCRIPT>
</body>
</html>
