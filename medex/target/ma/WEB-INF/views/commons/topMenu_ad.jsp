<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<input type="hidden" name="currentUserName" value="${currentUserName}">
<nav class="nav-r">
                    <a class="hideBtn pull-left" href="javascript:void(0)" onFocus="this.blur();">
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                    </a>
                    <div class="col-md-3 col-lg-3 visible-md visible-lg">
                        <div class="input-group nav-search">
                           <input type="text" class="form-control" placeholder="搜索病人或医生" >
                           <span class="input-group-btn"><button class="btn btn-default" type="button" onFocus="this.blur();" onclick="alert('功能暂未开通！')"><span class="glyphicon glyphicon-search"></span></button></span>
                        </div>
                    </div>
                    <button type="button" class="btn btn-default pull-right btn-sm otherUser logout" onFocus="this.blur();"><span class="glyphicon glyphicon-log-out"> 退出登录</span></button>
                    <div class="media pull-right user-action dropdown">
                       <a class="pull-left" href="#">
                          <img class="media-object img-circle" src="assets/image/medex/doc-default.png"  alt="医生头像">
                       </a>
                       <div class="media-body">
                          <a href="javascript:void(0)" onFocus="this.blur();">${loginer}</a>
                       </div>
                    </div>
                    <div class="messageTagWrap pull-right dropdown hidden-xs">
                        
                    </div>
                    <div class="clearfix"></div>
                </nav>