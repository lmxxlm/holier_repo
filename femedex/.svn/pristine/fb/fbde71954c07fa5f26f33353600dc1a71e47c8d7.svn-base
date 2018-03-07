<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div id="menu" class="hidden-xs">
                <h1 class="logo"><a href="feindex.html">productAdmin</a></h1>
                <aside class="menutool">
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-home"></span></button>
                  <button type="button" class="btn btn-default btn-sm" onFocus="this.blur();"><span class="glyphicon glyphicon-envelope"></span><span class="badge">1</span></button>
                  <div class="dropdown">
                      <button type="button" class="btn btn-default btn-block dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" onFocus="this.blur();"><span class="pull-left">您好！管理员</span><span class="pull-right"><span class="glyphicon glyphicon-lock"></span></span></button>
                   </div>
                </aside>
                <input type="hidden" name="menuIndex" value="${menuIndex}" />
                <aside class="menulist">
                  <a href="feindex.html" class="glyphicons log_book sub_ptdd" onFocus="this.blur();"><i></i>普通订单</a>
                  <a href="quickPayOrder.html" class="glyphicons picture sub_kjdd" onFocus="this.blur();"><i></i>快捷订单</a>
                  <a href="withdraw.html?status=0" class="glyphicons picture sub_txgl" onFocus="this.blur();"><i></i>提现管理<c:if test="${rc.wd ne 0}"><span class="badge">${rc.wd}</span></c:if></a>
                  <a href="#" class="glyphicons chat collapse-r" data-event="collapse"  onFocus="this.blur();"><i></i>订单操作</a>
                  <div class="hidden-menu" id="ddcz">
                      <a href="order_qrdj.html" class="glyphicons comments sub_qrdj" onFocus="this.blur();"><i></i>确认定金<c:if test="${rc.cb ne 0}"><span class="badge">${rc.cb}</span></c:if></a>
                      <a href="order_qryk.html" class="glyphicons picture sub_qryk" onFocus="this.blur();"><i></i>确认余款<c:if test="${rc.cl ne 0}"><span class="badge">${rc.cl}</span></c:if></a>
                      <a href="order_pfjf.html" class="glyphicons picture sub_pfjf" onFocus="this.blur();"><i></i>派发积分<c:if test="${rc.jb ne 0}"><span class="badge">${rc.jb}</span></c:if></a>
                  </div>
                  <a href="count_doctorCoins.html" class="glyphicons log_book sub_tjdd" onFocus="this.blur();"><i></i>统计订单</a>
                </aside>
            </div>