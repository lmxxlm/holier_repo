<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=”zh”> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=”zh”> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=”zh”> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=”zh”>
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ include file="./commons/runParams.html"%>
<title>OP后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/productAdmin/frame.css" rel="stylesheet">
<link href="assets/css/productAdmin/datetimepickerReview.css"
	rel="stylesheet">
<link href="assets/css/productAdmin/Statistics.css" rel="stylesheet">
<link href="assets/css/productAdmin/tableToExcel.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
.searchBar{ margin-top:0;}
#productStatus{ margin:12px; margin-bottom:0;}
.nav-tabs > li > a{background:#dedede;}
</style>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<%@ include file="./commons/leftMenu.jsp"%>
		<div id="content">
			<%@ include file="./commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a>
				</li>
				<li class="active">提现统计</li>
			</ol>
			<!-- 
			<%@ include file="./commons/countTopMenu.jsp"%>
			 -->
			<ul id="productStatus" class="nav nav-tabs">
			   <li ><a href="javascript:void(0)" data-link="count_doctorCoins.html" class="urlConvert"  data-toggle="tab" onfocus="this.blur()">医生金币统计</a></li>
			   <!--  <li ><a href="javascript:void(0)" data-link="count_commenOrder.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">普通订单</a></li>-->
			   <li ><a href="javascript:void(0)" data-link="count_orderIncome.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">订单统计</a></li>
               <li ><a href="javascript:void(0)" data-link="count_sendCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">手动派发金币统计</a></li>
               <li ><a href="javascript:void(0)" data-link="count_returnCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">自动派发金币统计</a></li>
               <li class="active"><a href="javascript:void(0)" data-link="count_withdraw.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">提现统计</a></li>
		    </ul>
		    <form method="post" id="searchForm" action="${mainUrl}optj_search_Countwithdraw.do">
		    <input type="hidden" name="token" value="${token}">
		    <input type="hidden" name="cp" value="1">
		    <input type="hidden" name="ps" value="${searchParam.ps}">
			<div class="searchBar row">
				<div class="addPat col-md-2 col-xs-2" style="padding-right:2px; padding-left:0px;">
				    <div class="input-group " >
						<input type="text" class="form-control " name="startTime" readonly
							placeholder="开始时间"  value="${startTime}" >
					</div>
				</div>
              
				<div class="addPat col-md-2 col-xs-2" style="padding-left:2px;">
				    <div class="input-group " >
                        <input type="text" class="form-control " name="endTime" readonly
                        placeholder="结束时间"  value="${endTime}" >  
					</div>
				</div>
                 <div class="addPat col-md-1 col-xs-1" style="padding-left:2px; margin-right:-15px;">
				    <div class="input-group " style="margin-right:2px;">
                       <button class="btn btn-primary timeSearch" type="button" id="searchTime">搜索</button> 
					</div>
				</div>
				<div class="col-md-2 col-xs-2" style="padding-left:0px;">
					<select class="form-control" name="status" >
					    <option value="-1" <c:if test="${status == null}">selected</c:if>>所有状态</option>
					    <option value="1" <c:if test="${status == '已提现'}">selected</c:if>>已提现</option>
					    <option value="2" <c:if test="${status == '未提现'}">selected</c:if>>未提现</option>
					</select>
				</div>
				<div class="addPat col-md-5 col-xs-5" style="padding-right:0; ">
				   <span class=" pull-right" style="margin-top:8px">
						当前页总额：<b style="color:red; font-size:18px;" id="exportCount">${udro.count}</b>
					</span>
				</div>
			</div>
			</form>
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token }">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover" id="tableExcel">
					<thead>
						<tr>
						  <th>支付宝账号</th>
                          <th>支付宝用户名</th>
                          <th>取现金额</th>
                          <th>申请人</th>
                          <th>用户ID</th>
                          <th>状态</th>
                          <th>审核时间</th>
                          <th>申请时间</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${noorder == true}">
							<tr>
								<td colspan="8">暂无订单</td>
							</tr>
						</c:if>
						<c:forEach items="${udro.records}" var="records">
							<tr>
								<td>${records.payAccountId}</td>
								<td>${records.payAccountName}</td>
								<td>${records.amount}</td>
								<td>${records.username}</td>
								<td>${records.userid}</td>
								<td>${records.request_status}</td>
								<td>${records.draw_time_str}</td>				
								<td>${records.request_time_str}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="addPat col-md-2 col-xs-2 pull-right" >
                  <a id="test" class="btn btn-primary exportHG  pull-right"   onClick="exportTable(this)"  href="#">导出搜索结果</a>
				</div>
				<div align="center">
					<ul class="pager">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
						    <a href="javascript:void(0);" class="pre">上一页</a>
						</li>
						<li     
							<c:if test="${udro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
							<a href="javascript:void(0);" class="next">下一页</a>
						</li>
					</ul>
					<!--  <input type="hidden" name="page" value="${searchParam.cp}">-->
					<input type="hidden" name="pagePre" value="${udro.pageView.back}">
					<input type="hidden" name="pageNext" value="${udro.pageView.next}">
				</div>
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
</div>

	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/script/productAdmin/frame.js"></script>
	<!--  <script src="assets/script/productAdmin/count.js"></script>-->
	<script src="assets/script/productAdmin/FileSaver.min.js"></script>
	<script>
	$(function(){ 
		initTime();
	    function initTime(){
	    	var startTime = $('.input-group input[name="startTime"]').val();
	    	var endTime=$('.input-group input[name="endTime"]').val();
	    	if(!startTime){
	    		$('.input-group input[name="startTime"]').val('2015-01-01');
	    	}
	    	if(!endTime){
	    		var d = new Date();
				var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
				$('.input-group input[name="endTime"]').val(str);
	    	}
		}
		$('#searchTime').click(function(){
			initTime();
			var startTime = $('.input-group input[name="startTime"]').val();
			var endTime = $('.input-group input[name="endTime"]').val();
		    //验证时间先后
			var datepickArr1 = startTime.split("-");
			var datepickArr2 = endTime.split("-");
			var new_datepick1 = new Date(datepickArr1[0],datepickArr1[1],datepickArr1[2]);
			var new_datepick2 = new Date(datepickArr2[0],datepickArr2[1],datepickArr2[2]);
			if(!new_datepick1 || ! new_datepick2){
				alert("请输入正确的时间格式");
				return false;
			}
			var date_result = (new_datepick2-new_datepick1)/(24*60*60*1000);
			if(date_result<0){
				alert("结束时间不能在开始时间前面，请重新选择");
				return false;
			}
			$('#searchForm input[name="cp"]').val(1);
			$('#searchForm').submit();
		});
		 $('input[name="startTime"],input[name="endTime"]').datetimepicker({
			  language:'zh-CN',
			  format: 'yyyy-mm-dd',
			  weekStart: 1,
			  todayBtn:  1,
			  autoclose: 1,
			  todayHighlight: 1,
			  forceParse: 0,
			  startView: 2,
			  minView: 2
			  /*pickerPosition:'top-left'  改变弹出框的方向的*/
		  });
		//tab页面跳转页面
		$('.urlConvert').click(function(){
			var link = $(this).attr('data-link');
			location.href=runParams.mainUrl+link;
			$(this).attr('data-link').val('');
		});
		$('select[name="status"]').change(function(){
			$('#searchForm input[name="cp"]').val(1);
			$('#searchForm').submit();
		});
		
		$('.pager .pre').click(function(){
			var cp=$('input[name="pagePre"]').val();
			$('#searchForm input[name="cp"]').val(cp);
			$('#searchForm').submit();
		});
		
		$('.pager .next').click(function(){
			var cp=$('input[name="pageNext"]').val();
			$('#searchForm input[name="cp"]').val(cp);
			$('#searchForm').submit();
		});	
	});
	
	

	function exportTable(testLink){
		var startTime = $('.input-group input[name="startTime"]').val();
		var endTime = $('.input-group input[name="endTime"]').val();
		var status=$('select[name="status"]').val();
		var token = $('input[name="token"]').val();
		var questURL = runParams.mainUrl+'withdrawExport.do';
		var questArr = {
			startTime:startTime,
			endTime:endTime,
			status:status
			//token:token
		};
		if(!startTime){
			alert("没有开始时间");
			return false;
		}
        if(!endTime){
        	alert("没有结束时间");
        	return false;
		}
		$.post(questURL,questArr,function(result){
			console.log(result);
			data=result.records;
			if(data!=null){
				var str="支付宝账号,支付宝用户名,取现金额,申请人,用户ID,状态,审核时间,申请时间\n";
				var x="";
				var dataLenth=data.length;
				for(var j=0;j<dataLenth;j++){
					var test2='"'+data[j].payAccountId+'","'+data[j].payAccountName+'","'+data[j].amount+'","'+data[j].username+'","'+data[j].userid+'","'+data[j].request_status+'","'+data[j].draw_time_str+'","'+data[j].request_time_str+'"\n';
				    //var test2=data[j].payAccountId+","+data[j].payAccountName+","+data[j].amount+","+data[j].username+","+data[j].userid+","+data[j].request_status+","+data[j].draw_time_str+","+data[j].request_time_str+"\n";
					x+=test2;
				}
				   var exportCount=$("#exportCount").html();
				   var test=str+x+"\n当前页总额:"+exportCount;
				   var blob = new Blob([test], {type: "text/plain;charset=utf-8"});
                   saveAs(blob,startTime+" 至  "+endTime+"-提现统计.csv");
			}else{
				alert("没有数据");
			}	
		});
	 }
	</script>
	
</body>
</html>