<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
			<ul id="productStatus" class="nav nav-tabs">
			    <li <c:if test="${status == '0'}">class="active"</c:if>><a href="javascript:void(0)" data-link="count_doctorCoins.html" class="urlConvert"  data-toggle="tab" onfocus="this.blur()">医生金币统计</a></li>
			    <li <c:if test="${status == '1'}">class="active"</c:if>><a href="javascript:void(0)" data-link="count_commenOrder.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">普通订单</a></li>
			    <li <c:if test="${status == '2'}">class="active"</c:if>><a href="javascript:void(0)" data-link="count_orderIncome.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">快捷订单</a></li>
                <li <c:if test="${status == '3'}">class="active"</c:if>><a href="javascript:void(0)" data-link="count_sendCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">手动派发</a></li>
                <li <c:if test="${status == '4'}">class="active"</c:if>><a href="javascript:void(0)" data-link="count_returnCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">自动派发</a></li>
                <li <c:if test="${status == '5'}">class="active"</c:if>><a href="javascript:void(0)" data-link="count_withdraw.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">提现统计</a></li>
		    </ul>