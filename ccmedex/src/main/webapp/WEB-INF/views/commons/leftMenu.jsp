<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="menu" class="hidden-xs">
                <h1 class="logo"><a href="ccindex.html">CallCenter</a></h1>
                <aside class="menutool">
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-home"></span></button>
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-envelope"></span><span class="badge">1</span></button>
                  <div class="dropdown">
                      <button type="button" class="btn btn-default btn-block dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" onFocus="this.blur();"><span class="pull-left">您好！管理员</span><span class="pull-right"><span class="glyphicon glyphicon-lock"></span></span></button>
                   </div>
                </aside>
                <input type="hidden" name="menuIndex" value="${menuIndex}" />
                <aside class="menulist">
                  <a href="ccindex.html" class="glyphicons log_book sub_cpyd" onFocus="this.blur();"><i></i>产品预订</a>
                  <a href="allOrder.html" class="glyphicons log_book sub_ptdd" onFocus="this.blur();"><i></i>普通订单</a>
                  <a href="quickPayOrder.html" class="glyphicons picture sub_kjdd" onFocus="this.blur();"><i></i>快捷订单</a>
                </aside>
            </div>