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
<link href="assets/css/productAdmin/productOwner.css" rel="stylesheet">
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
				<li class="active">医生金币统计</li>
			</ol>
			<!-- 
			<%@ include file="./commons/countTopMenu.jsp"%>
			 -->
			<ul id="productStatus" class="nav nav-tabs">
			   <li class="active"><a href="javascript:void(0)" data-link="count_doctorCoins.html" class="urlConvert"  data-toggle="tab" onfocus="this.blur()">医生金币统计</a></li>
			    <!--  <li ><a href="javascript:void(0)" data-link="count_commenOrder.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">普通订单</a></li>-->
			   <li ><a href="javascript:void(0)" data-link="count_orderIncome.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">订单统计</a></li>
               <li ><a href="javascript:void(0)" data-link="count_sendCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">手动派发金币统计</a></li>
               <li ><a href="javascript:void(0)" data-link="count_returnCoins.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">自动派发金币统计</a></li>
               <li><a href="javascript:void(0)" data-link="count_withdraw.html" class="urlConvert" data-toggle="tab" onfocus="this.blur()">提现统计</a></li>
		    </ul>
		    <!-- <form method="post" id="searchForm" target="_blank" action="${mainUrl}optj_search_count.do">统计订单的do -->
		    <form method="post" id="searchForm" action="${mainUrl}optj_search_count.do">
		    <input type="hidden" name="token" value="${token}">
			<div class="searchBar row">
			    <div class="addPat col-md-3 col-xs-3" style="padding-left:0px;">
				    <div class="input-group" >
						<input type="text" class="form-control" name="date"
							placeholder="请选择时间"  value="${date}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search" style="color:black;"></i> </span>
					</div>
				</div>
                <div class="smartSearch addPat col-md-3 col-xs-3" style="padding-left:0px;">
				    <div class="input-group" >
				        <input type="hidden" name="doctorId" value="${doctorId}">
						<input type="text" class="form-control" name="doctorName"
							placeholder="请输入医生姓名"  value="${doctorName}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search" style="color:black;"></i> </span>
					</div>
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="addPat col-md-6 col-xs-6" style="padding-right:0;">
				   <span class=" pull-right" style="margin-top:8px">
						当前页总额：<b style="color:red; font-size:18px;" id="exportCount">${dcr.count}</b>
					</span>
				</div>
			</div>
			</form>
			<div class="mainBody">
			    <input type="hidden" name="token" value="${token}">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover MYtable" id="tableExcel">
					<thead>
						<tr>
							<th>医生id</th>
							<th>医生姓名</th>
							<th>医院</th>
							<th>科室</th>
							<th>职称</th>
							<th>金币余额</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${noorder == true}">
							<tr>
								<td colspan="8">暂无记录</td>
							</tr>
						</c:if>
						<c:forEach items="${dcr.records}" var="record">
							<tr>
							    <td id="accountId">${record.accountId}</td>
								<td id="name">${record.name}</td>
								<td id="referHospital">${record.referHospital}</td>
								<td id="referDepartments">${record.referDepartments}</td>
								<td id="doctorTitle">${record.doctorTitle}</td>
								<td id="scoreBalance">${record.scoreBalance}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="addPat col-md-2 col-xs-2 pull-right" >
                  <a id="test" class="btn btn-primary exportHG  pull-right"   onClick="exportTable(this)"   href="#">导出搜索结果</a>
				</div> 
				<div align="center">
					<ul class="pager">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="${mainUril}count_doctorCoins.html?cp=${dcr.pageView.back}&&ps=${searchParam.ps}&&date=${date}" >上一页</a>
						</li>
						<li     
							<c:if test="${ dcr.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="${mainUril}count_doctorCoins.html?cp=${dcr.pageView.next}&&ps=${searchParam.ps}&&date=${date}" >下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
				</div>
				<!--如果找到用户 end-->
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
    <script src="assets/script/productAdmin/count_doctorCoins.js"></script>
    <script src="assets/script/productAdmin/FileSaver.min.js"></script>
    <script>
	//---火狐和谷歌
		function exportTable(testLink){
			var date=$('input[name="date"]').val();
			var questURL = runParams.mainUrl+'doctorCoinsExport.do';
			var questArr = {
				date:date
			};
				$.post(questURL,questArr,function(result){
				data=result.records;
				console.log(data);
				if(data!=null){
					var str="医生id,医生姓名,医院,科室,职称,金币余额\n";
					var x="";
					var dataLenth=data.length;
					for(var j=0;j<dataLenth;j++){
						var exportCount=$("#exportCount").html();
						var test2='"'+data[j].accountId+'","'+data[j].name+'","'+data[j].referHospital+'","'+data[j].referDepartments+'","'+data[j].doctorTitle+'","'+data[j].scoreBalance+'"\n';
						x+=test2;
					}
					var test=str+x+"\n当前页总额:"+exportCount;
					   var blob = new Blob([test], {type: "text/plain;charset=utf-8"});
                       saveAs(blob, date+"-医生金币统计.csv");
				}else{
					alert("没有数据");
				}	
			});
		 }
	
		//医生智能搜索
		$('.searchResultForDoctor').parent().find('.form-control').keyup(function(){
			var obj = $(this);
		    var searchVar = $(this).val();
			var questURL = runParams.mainUrl+'searchDoctorByNameLimit10.do';
			var questArr = {
				searchVar:searchVar
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var con = result.data;
					var htmlstr = '';
					for(var i=0;i<con.length;i++){
					  htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span></a></li>';
					}
					obj.parent().siblings('.searchResultForDoctor').html(htmlstr).show();
				}else{
					obj.parent().siblings('.searchResultForDoctor').hide();
				}
			});
		});
		$(".searchResultForDoctor li a").live('click',function(){
			var p_obj = $(this).parents('.searchResultForDoctor');
			p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
			p_obj.parent().find('input[name="doctorId"]').val($(this).attr("data-docid"));
			//p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-docid"));
			p_obj.hide();
		});

    </script>
     
</body>
</html>