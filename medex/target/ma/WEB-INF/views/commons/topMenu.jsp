<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<input type="hidden" name="currentUserId" value="${currentUserId}">
<input type="hidden" name="currentUserType" value="${currentUserType}">
<nav class="nav-r">
	<a class="hideBtn pull-left" href="javascript:void(0)"
		onFocus="this.blur();"> <span class="icon-bar"></span> <span
		class="icon-bar"></span> <span class="icon-bar"></span> </a>
	<div class="col-md-3 col-lg-3 visible-md visible-lg">
		<div class="input-group nav-search">
			<input type="text" class="form-control" placeholder="搜索病人或医生">
			<span class="input-group-btn"><button class="btn btn-default"
					type="button" onFocus="this.blur();">
					<span class="glyphicon glyphicon-search"></span>
				</button> </span>
		</div>
	</div>
	<button type="button"   
		class="btn btn-default pull-right btn-sm otherUser  selectAccount"
		onFocus="this.blur();">
		<span class="glyphicon glyphicon-arrow-right"> 其他账户</span>  
	</button>
	<div class="media pull-right user-action dropdown">
		<a class="pull-left" href="#"> <img
			class="media-object img-circle"  
			src="../assets/image/medex/doc-default.png" alt="医生头像"> </a>
		<div class="media-body">
			<a href="javascript:void(0)" onFocus="this.blur();">${loginer}&nbsp;&nbsp;<span
				class="caret"></span> </a>
		</div>
		<ul class="dropdown-menu">
			<li><a href="#">jmeter</a>
			</li>
			<li><a href="#">EJB</a>
			</li>
			<li><a href="#">Jasper Report</a>
			</li>
			<li class="divider"></li>
			<li><a href="#" class="logout"><i
					class="glyphicon glyphicon-log-out"></i>&nbsp;&nbsp;退 出</a></li>
		</ul>
	</div>
	<div class="messageTagWrap pull-right dropdown hidden-xs">
		<a class="glyphicons conversation messageTag"
			href="javascript:void(0)" onFocus="this.blur();"> <i></i><span
			class="badge">7</span> </a>
		<div class="dropdown-menu-media">
			<ul class="media-list">
				<li class="media"><a class="pull-left" href="#"> <img
						class="media-object" src="../assets/image/medex/doc-default.png"
						alt="通用的占位符图像"> </a>
					<div class="media-body">
						<span class="badge">5min</span> <a href="javascript:void(0)"><h4
								class="media-heading">媒体标题</h4> </a> 这是一些示例文本。这是一些示例文本。
					</div></li>
				<li class="media"><a class="pull-left" href="#"> <img
						class="media-object" src="../assets/image/medex/doc-default.png"
						alt="通用的占位符图像"> </a>
					<div class="media-body">
						<span class="badge">2days</span> <a href="javascript:void(0)"><h4
								class="media-heading">媒体标题</h4> </a> 这是一些示例文本。这是一些示例文本。
					</div></li>
				<li class="media"><a class="pull-left" href="#"> <img
						class="media-object" src="../assets/image/medex/doc-default.png"
						alt="通用的占位符图像"> </a>
					<div class="media-body">
						<span class="badge">2days</span> <a href="javascript:void(0)"><h4
								class="media-heading">媒体标题</h4> </a> 这是一些示例文本。这是一些示例文本。
					</div></li>
			</ul>
			<a href="javascript:void(0)" class="btnLink"><span
				class="glyphicon glyphicon-th-list"></span>&nbsp;&nbsp;查看所有消息</a>
		</div>
	</div>
	<div class="clearfix"></div>
</nav>