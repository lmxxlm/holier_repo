<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="menu" class="hidden-xs">
	<h1 class="logo">
		<a href="../access.html">medex</a>
	</h1>
	<aside class="menutool">
		<button type="button" class="btn btn-default btn-sm"
			onFocus="this.blur();">
			<span class="glyphicon glyphicon-home"></span>
		</button>
		<button type="button" class="btn btn-default btn-sm"
			onFocus="this.blur();">
			<span class="glyphicon glyphicon-envelope"></span><span class="badge">1</span>
		</button>
		<div class="dropdown">
			<button type="button"
				class="btn btn-default btn-block dropdown-toggle" id="dropdownMenu1"
				data-toggle="dropdown" onFocus="this.blur();">
				手机：${currentUserId}<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">肺肿瘤</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">神经内科</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">神经外科</a></li>
				<li role="presentation" class="divider"></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">前列腺</a></li>
			</ul>
		</div>
	</aside>
	<input type="hidden" name="menuIndex" value="${menuIndex}" />
	<input type="hidden" name="accountType" value="patient" />
	<aside class="menulist">
		<a href="../patient/pat_info.html?patientId=${patientId}"
			class="glyphicons notes_2" onFocus="this.blur();"><i></i>基本信息<span
			class="badge">新</span> </a> <a
			href="../patient/schedule.html?patientId=${patientId}"
			class="glyphicons calendar" onFocus="this.blur();"><i></i>日程管理</a> <a
			href="#" class="glyphicons list collapse-r" data-event="collapse"
		 onFocus="this.blur();"><i></i>电子病历</a>
		<div class="hidden-menu" id="dzbl">
<!-- 			<a href="#" class="glyphicons chevron-right sub_zdzz" onFocus="this.blur();"><i></i>诊断症状</a> -->
			<a href="../patient/medicalRecord.html?patientId=${patientId}"
				class="glyphicons chevron-right sub_bljl" onFocus="this.blur();"><i></i>病历记录<span
				class="badge">11</span> </a> <a
				href="../patient/checkRecord.html?patientId=${patientId}&&category=超声波"
				class="glyphicons chevron-right sub_jcjl" onFocus="this.blur();"><i></i>检查记录</a>
			<a href="../patient/checkReport.html?patientId=${patientId}"
				class="glyphicons chevron-right sub_jyjl" onFocus="this.blur();"><i></i>检验记录</a>
				
			<a href="../patient/otherRecord.html?patientId=${patientId}"
				class="glyphicons chevron-right sub_qtjl" onFocus="this.blur();"><i></i>其它记录</a>
			<%-- <a href="../patient/medicineRecord.html?patientId=${patientId}"
				class="glyphicons chevron-right sub_yyjl" onFocus="this.blur();"><i></i>用药记录</a>
			<a href="#" class="glyphicons chevron-right sub_sfjl" onFocus="this.blur();"><i></i>随访记录</a>
			<a href="#" class="glyphicons chevron-right sub_lyjl" onFocus="this.blur();"><i></i>留言记录</a>
			<a href="#" class="glyphicons chevron-right sub_fjjl" onFocus="this.blur();"><i></i>附件记录</a> --%>
		</div>
		<a href="#" class="glyphicons log_book" onFocus="this.blur();"><i></i>健康档案</a>
		<!--新增人文关怀-->
		<a href="#" class="glyphicons chat collapse-r" data-event="collapse"
		 onFocus="this.blur();"><i></i>人文关怀</a>
		<div class="hidden-menu" id="rwgh">
			<a href="../patient/qotd.html?patientId=${patientId}" class="glyphicons comments" onFocus="this.blur();"><i></i>每日一言</a>
			<a href="#" class="glyphicons picture" onFocus="this.blur();"><i></i>每日一图</a>
		</div>
	</aside>
</div>
