<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="menu" class="hidden-xs">
                <h1 class="logo"><a href="../access.html">medex</a></h1>
                <aside class="menutool">
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-home"></span></button>
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-envelope"></span><span class="badge">1</span></button>
                  <div class="dropdown">
                      <button type="button" class="btn btn-default btn-block dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" onFocus="this.blur();">手机：${currentUserId}<span class="caret"></span></button>
                      <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">肺肿瘤</a></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">神经内科</a></li> 
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">神经外科</a></li>
                          <li role="presentation" class="divider"></li>
                          <li role="presentation"><a role="menuitem" tabindex="-1" href="#">前列腺</a></li>
                       </ul>
                   </div>
                </aside>
                <input type="hidden" name="menuIndex" value="${menuIndex}" />
	            <input type="hidden" name="accountType" value="doctor" />
	            <input type="hidden" name="doctorId" value="${doctorId}">
                <aside class="menulist">
                  <a href="#" class="glyphicons notes_2 collapse-r" data-event="collapse" onFocus="this.blur();"><i></i>医生信息</a>
				  <div class="hidden-menu" id="ysxx">
					<a href="../doctor/doc_info.html?doctorId=${doctorId}" class="glyphicons notes_2" onFocus="this.blur();"><i></i>基本信息</a>
					<a href="../doctor/doctorPicManage.html?doctorId=${doctorId}" class="glyphicons vcard" onFocus="this.blur();"><i></i>管理证照和头像</a>
				    <a href="../doctor/validDetail.html?doctorId=${doctorId}" class="glyphicons keys" onFocus="this.blur();"><i></i>查看认证信息</a>
				  </div>
                  <a href="../doctor/pat_list?doctorId=${doctorId}"  class="glyphicons group" onFocus="this.blur();"><i></i>病人管理</a>
                  <a href="../doctor/schedule.html?doctorId=${doctorId}" class="glyphicons calendar" onFocus="this.blur();"><i></i>日程管理<span class="badge">13</span></a>              
                </aside>
            </div>