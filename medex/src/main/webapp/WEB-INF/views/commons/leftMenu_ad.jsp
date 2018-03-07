<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="menu" class="hidden-xs">
                <h1 class="logo">
                <c:if test="${loginer ne '丘志强'}">
                    <a href="chooseAccountDoc.html">medex</a>
                </c:if>
                <c:if test="${loginer eq '丘志强'}">
                    <a href="siteListView.html">medex</a>
                </c:if>
                </h1>
                <aside class="menutool">
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-home"></span></button>
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-envelope"></span><span class="badge">1</span></button>
                  <div class="dropdown">
                      <button type="button" class="btn btn-default btn-block dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" onFocus="this.blur();"><span class="pull-left">您好！医学助理</span><span class="pull-right"><span class="glyphicon glyphicon-lock"></span></span></button>
                   </div>
                </aside>
                <input type="hidden" name="menuIndex" value="${menuIndex}" />
	            <input type="hidden" name="accountType" value="assistantDoctor" />
                <aside class="menulist">
                <c:if test="${loginer ne '丘志强'}">
                  <a href="userLog.html"  class="glyphicons group userLog" onFocus="this.blur();"><i></i>用户动态</a>
                  <a href="chooseAccountDoc.html"  class="glyphicons group chooseAccountDoc" onFocus="this.blur();"><i></i>医生账号</a>
                  <!-- <a href="validRequest.html"  class="glyphicons group validRequest" onFocus="this.blur();"><i></i>医生认证申请</a> -->
                  <a href="chooseAccountPat.html" class="glyphicons group chooseAccountPat" onFocus="this.blur();"><i></i>患者账号</a>
                </c:if>
                  
                  <a href="caseCheck.html"  class="glyphicons comments caseCheck" onFocus="this.blur();"><i></i>病例审核</a>
                  
                  <!-- <a href="transferTreatmentList.html" class="glyphicons notes_2 transferTreatment" onFocus="this.blur();"><i></i>转诊专家管理</a> -->
                  <!-- ======================== -->
                  <a href="#" class="glyphicons chat collapse-r" data-event="collapse" onFocus="this.blur();"><i></i>医生推荐</a>
				  <div class="hidden-menu" id="ystj">
						<a href="expertsRecommend.html" class="glyphicons comments sub_mytj" onFocus="this.blur();"><i></i>名医推荐</a>
						<a href="weekHot.html" class="glyphicons picture sub_bzrm" onFocus="this.blur();"><i></i>本周热门</a>
				  </div>
				  <!-- ======================== -->
				  <a href="#" class="glyphicons chat collapse-r" data-event="collapse" onFocus="this.blur();"><i></i>视频服务</a>
				  <div class="hidden-menu" id="spfw">
						<a href="createConferenceView.html" class="glyphicons comments sub_sjxfw" onFocus="this.blur();"><i></i>创建新服务</a>
						<a href="siteListView.html" class="glyphicons picture sub_fwyylb" onFocus="this.blur();"><i></i>服务预约列表</a>
				        <a href="devUserMap.html" class="glyphicons picture sub_sbbd" onFocus="this.blur();"><i></i>设备绑定</a>
				  </div>
				</aside>
            </div>