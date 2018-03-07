<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="../commons/runParams.html"%>      
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="../resources/tab/css/list.css"/>
</head>
             
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../resources/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../resources/tab/images/tab_05.gif"><img src="../resources/tab/images/311.gif" width="16" height="16" /> <span class="STYLE4">服务器进程配置列表</span></td>
        <td width="281" background="../resources/tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                        <input type="checkbox" name="checkbox62" value="checkbox" />
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="../resources/tab/images/001.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">新增</div></td>
                  </tr>
              </table></td>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="../resources/tab/images/114.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">修改</div></td>
                  </tr>
              </table></td>
              <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="../resources/tab/images/083.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">删除</div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
        <td width="14"><img src="../resources/tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="../resources/tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98">
          <tr>
            <td width="6%" height="26" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">选择</div></td>
            <td width="8%" height="18" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
            <td width="24%" height="18" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">运行机器ip地址</div></td>
            <td width="10%" height="18" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">机器名</div></td>
            <td width="14%" height="18" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">节点类型</div></td>
            <td width="24%" height="18" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">服务器进程配置</div></td>
            <td width="7%" height="18" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">编辑</div></td>
            <td width="7%" height="18" background="../resources/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" ><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><img src="../resources/tab/images/037.gif" width="9" height="9" /><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox2" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox3" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox4" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox5" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox6" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox7" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox8" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox9" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox10" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox11" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox12" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox13" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          <tr class="listTr">
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <input name="checkbox14" type="checkbox" class="STYLE2" value="checkbox" />
            </div></td>
            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1">A0012</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">192.168.0.124</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">wtz_fh</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">DBserver</div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><a href="#">服务器进程配置</a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/037.gif" width="9" height="9" /></span><span class="STYLE1"> [</span><a href="#">编辑</a><span class="STYLE1">]</span></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../resources/tab/images/010.gif" width="9" height="9" /></span><span class="STYLE2"> </span><span class="STYLE1">[</span><a href="#">删除</a><span class="STYLE1">]</span></div></td>
          </tr>
        </table></td>
        <td width="9" background="../resources/tab/images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="../resources/tab/images/tab_20.gif" width="15" height="29" /></td>
        <td background="../resources/tab/images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共120条纪录，当前第1/10页，每页10条纪录</span></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
              <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                <tr class="pageline">
                  <td width="62" height="22" valign="middle"><div align="right"><img src="../resources/tab/images/first.gif" width="37" height="15" /></div></td>
                  <td width="50" height="22" valign="middle"><div align="right"><img src="../resources/tab/images/back.gif" width="43" height="15" /></div></td>
                  <td width="54" height="22" valign="middle"><div align="right"><img src="../resources/tab/images/next.gif" width="43" height="15" /></div></td>
                  <td width="49" height="22" valign="middle"><div align="right"><img src="../resources/tab/images/last.gif" width="37" height="15" /></div></td>
                  <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                  <td width="25" height="22" valign="middle"><span class="STYLE7">
                    <input name="textfield" type="text" class="STYLE1" style="height:10px; width:25px;" size="5" />
                  </span></td>
                  <td width="23" height="22" valign="middle">页</td>
                  <td width="30" height="22" valign="middle"><img src="../resources/tab/images/go.gif" width="37" height="15" /></td>
                </tr>
              </table>
            </div></td>
          </tr>
        </table></td>
        <td width="14"><img src="../resources/tab/images/tab_22.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
