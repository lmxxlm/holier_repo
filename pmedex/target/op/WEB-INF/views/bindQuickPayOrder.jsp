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
<link href="assets/css/productAdmin/quickPayList.css" rel="stylesheet">
<link href="assets/css/productAdmin/bindOrder.css" rel="stylesheet">

<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
.searchBar{ margin-top:0;}
#productStatus{ margin:12px; margin-bottom:0;}
.nav-tabs > li > a{background:#dedede;}
.searchBar{ margin-top:12px;}

.pagination > li:first-child > a, .pagination > li:first-child > span {
    border-radius: 15px;  
    padding: 5px 14px;   
    margin-top:-15px; 
    margin-right:7px;                      
   
}
.pagination > li:last-child > a, .pagination > li:last-child > span {
    border-radius: 15px; 
    padding: 5px 14px;
     margin-top:-15px;
}
/*
.pagination > li:last-child > a, .pagination > li:last-child > span {
    border-bottom-right-radius: 15px;
    border-top-right-radius: 15px;
     border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
    margin-left: 0;
}
.pagination li > a, .pagination li > span {

    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 15px;
    display: inline-block;
    padding: 5px 14px;
}
*/
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
				<li><a href="#">Home</a></li>
				<li class="active">设定责任人</li>
			</ol>
			<ul id="myTab" class="nav nav-tabs">
                <li><a href="bindOrder.html"  onFocus="this.blur()">普通订单</a></li>
                <li class="active"><a href="javascript:void(0)" onFocus="this.blur()">快捷订单</a></li>
            </ul>
		    <form method="post" id="searchForm" action="${mainUrl}search_quickPayOrderForBind.do">
		    <input type="hidden" name="ps" value="${searchParam.ps}">
		    <input type="hidden" name="cp" value="${searchParam.cp}">
			<div class="searchBar row" style="margin-top:0;">
			    <div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<select class="form-control" name="search_status">
					    <option value="" <c:if test="${status ==''}">selected</c:if>>所有</option>
					    <option value="已支付" <c:if test="${status == '已支付'}">selected</c:if>>已支付</option>
					    <option value="未支付" <c:if test="${status == '未支付'}">selected</c:if>>未支付</option>
					</select>
				</div>
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="search_orderId"
							placeholder="请输入订单号" autocomplete="off" value="${search_orderId}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<div class="input-group">
						<input type="text" class="form-control" name="search_name"
							placeholder="请输入患者或专家姓名" autocomplete="off" value="${search_name}">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
				</div>
				<div class="addPat col-md-3 col-xs-3"></div>
				
				
			</div>
			<div class="searchBar row" style="margin-top:-10px;">
				<div class="smartSearch col-md-3 col-xs-3">
					<div class="input-group">
						<input type="text" class="form-control" name="maName"
							placeholder="输入ma姓名" autocomplete="off" value="${maName}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i> </span>
					</div>
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="addPat col-md-3 col-xs-3">
				    <div class="input-group">
						<input type="text" class="form-control" name="caName"
							placeholder="输入ca姓名" value="${caName}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search" style="color:black;"></i> </span>
					</div>
				</div>
				 <div class="col-md-3 col-xs-3" style="padding-left:0px;">
					<select class="form-control" name="responsible">
					    <option value="-1"<c:if test="${responsible ==-1}">selected</c:if>>不限定责任人</option>
					    <option value="1" <c:if test="${responsible == 1}">selected</c:if>>已设定责任人</option>
					    <option value="2"<c:if test="${responsible == 2}">selected</c:if>>未设定责任人</option>
					</select>
				</div>
			</div>
			</form>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
                         <th>订单编号</th>
                         <th>支付人ID</th>
                         <th>支付人姓名</th>
                         <th>支付类型</th>
                         <th>患者</th>
                         <th>专家</th>
                         <th>责任MA</th>
                         <th>责任CA</th>
                         <th>订单状态</th>
                         <th>操作</th>
                      </tr>
					</thead>
					<tbody>
						<c:if test="${noRecord == true}">
							<tr>
								<td colspan="10">请添加产品。</td>
							</tr>
						</c:if>
						<c:forEach items="${qpro.records}" var="records">
							<tr>
								<td>${records.orderId}</td>
								<td>${records.userid}</td>
								<td>${records.userName}</td>
								<td>${records.type}</td>
								<td>${records.patientName}</td>
								<td>${records.expertName}</td>
								<td>${records.maName}</td>
								<td>${records.caName}</td>
								<td>${records.status}</td>
								<td>
                                   <a href="javascript:void(0)" data-id="${records.orderId}" class="set"><span class="glyphicon glyphicon-plus"></span>设置</a>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
						<a href="javascript:void(0);" class="pre">上一页</a>
						<!-- <a href="${mainUril}bindQuickPayOrder.html?status=${status}&&cp=${qpro.pageView.back}&&ps=${searchParam.ps}&&responsible=${responsible}">上一页</a> -->
						</li>
						<li     
							<c:if test="${qpro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
							<!--  <a href="${mainUril}bindQuickPayOrder.html?status=${status}&&cp=${qpro.pageView.next}&&ps=${searchParam.ps}&&responsible=${responsible}">下一页</a>-->
							<a href="javascript:void(0);" class="next">下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
					<!-- 后加的 -->
					<input type="hidden" name="pagePre" value="${qpro.pageView.back}">
					<input type="hidden" name="pageNext" value="${qpro.pageView.next}">
					
				</div>
				<!--如果找到用户 end-->
			</div>
		</div>
	</div>
	
	<!-- 模态框 -->
	<div class="modal fade" id="adminModal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="adminModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="adminModalLabel">订单号--<span class="orderId_str"></span></h4>
				</div>
				<div class="modal-body" style="padding-top:15px;">
				   <div class="form-group smartSearch">
                        <div>
                        <label for="maName">责任MA</label>
                        <input type="text" class="form-control" name="maName" placeholder="请输入MA负责人" autocomplete="off">
                        </div>
                        <ul class="maListConnect">
                            <li><a href="javascript:void(0)"></a></li>
                        </ul>
                    </div>
					<div class="form-group">
						<label for="maPhone">MA电话</label> 
						<input type="text" class="form-control maPhone" name="maPhone"
							placeholder="请输入CA电话" style="background-image: none; cursor: not-allowed !important;" readOnly>
					</div>
					<div class="form-group smartSearch">
                        <div>
                        <label for="caName">责任CA</label>
                        <input type="text" class="form-control" name="caName" placeholder="请输入CA负责人" autocomplete="off">
                        </div>
                        <ul class="caListConnect">
                            <li><a href="javascript:void(0)"></a></li>
                        </ul>
                    </div>
                    <div class="form-group">
						<label for="caPhone">CA电话</label>
						 <input type="text" class="form-control caPhone" name="caPhone"
							placeholder="请输入CA电话"  style="background-image: none; cursor: not-allowed !important;" readOnly>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token}"> 
                    <input type="hidden" name="orderId" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="doSubmit" class="btn btn-primary" type="button">确认</button>
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
	<script src="assets/script/productAdmin/bindOrder.js"></script>
	<script>
	    $('.pagination .pre').click(function(){
	    	var pagePre=$('input[name="pagePre"]').val();
	    	$('#searchForm input[name="cp"]').val(pagePre);
	    	$('#searchForm').submit();
	    });
	    $('.pagination .next').click(function(){
	    	var pageNext=$('input[name="pageNext"]').val();
	    	$('#searchForm input[name="cp"]').val(pageNext);
	    	$('#searchForm').submit();
	    });
		$(function(){
			function initModal(){
			    $('#adminModal input[name="orderId"]').val('');
			    $('#adminModal input[name="maName"]').val('');
			    $('#adminModal input[name="caName"]').val('');
			    $('#adminModal input[name="maPhone"]').val('');
			    $('#adminModal input[name="caPhone"]').val('');	   
			}
		   $('.set').click(function(){
				initModal();
				var id = $(this).attr('data-id');
				if(!id){
					alert("未找到该订单！");
					return false;
				}
				var questURL = runParams.mainUrl+'getQuickPayOrderById';
				var questArr = {
					id:id
				};
				$.post(questURL,questArr,function(result){
					if(1==result.status){
						$('.orderId_str').html(result.data.orderId);
						$('#adminModal input[name="maName"]').val(result.data.maName);
						$('#adminModal input[name="maPhone"]').val(result.data.maId);
						$('#adminModal input[name="caName"]').val(result.data.caName);
						$('#adminModal input[name="caPhone"]').val(result.data.caId);
						$('#adminModal input[name="orderId"]').val(result.data.orderId);
						$('#adminModal').modal();
					}
				});
		   });
		   
		 //ma联想功能
			$('.maListConnect').parent().find('.form-control').keyup(function(){
				var obj = $(this);
			    var searchVar = $(this).val();
				var questURL= runParams.mainUrl+'maListConnect.do';
				var questArr = {
					searchVar:searchVar
				};
				$.post(questURL,questArr,function(result){
					if(1==result.status){
						var con = result.data;
						var htmlstr = '';
						for(var i=0;i<con.length;i++){
							 htmlstr += '<li><a href="javascript:void(0)" data-maid="'+con[i].ma_id+'"><span>'+con[i].ma_name+'</span>&nbsp;—&nbsp;'+con[i].ma_id+'</i></a></li>';
						}
						obj.parent().siblings('.maListConnect').html(htmlstr).show();
					}else{
						obj.parent().siblings('.maListConnect').hide();
					}
				});
				
			});
			$(".maListConnect li a").live('click',function(){
				var p_obj = $(this).parents('.maListConnect');
				p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
				$(".maPhone").val($(this).attr("data-maid"));
				p_obj.hide();
				
			});
			//ca联想功能
			$('.caListConnect').parent().find('.form-control').keyup(function(){
				var obj = $(this);
			    var searchVar = $(this).val();
				var questURL= runParams.mainUrl+'caListConnect.do';
				var questArr = {
					searchVar:searchVar
				};
				$.post(questURL,questArr,function(result){
					if(1==result.status){
						var con = result.data;
						var htmlstr = '';
						for(var i=0;i<con.length;i++){
							 htmlstr += '<li><a href="javascript:void(0)" data-caid="'+con[i].caId+'"><span>'+con[i].caName+'</span>&nbsp;—&nbsp;'+con[i].caId+'</i></a></li>';
						}
						obj.parent().siblings('.caListConnect').html(htmlstr).show();
					}else{
						obj.parent().siblings('.caListConnect').hide();
					}
				});
				
			});
			$(".caListConnect li a").live('click',function(){
				var p_obj = $(this).parents('.caListConnect');
				p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
				$(".caPhone").val($(this).attr("data-caid"));
				p_obj.hide();
				
			});
		   $("#doSubmit").click(function(){
			   var maName=$('#adminModal input[name="maName"]').val();
			    var caName=$('#adminModal input[name="caName"]').val();
			    var maId=$('#adminModal input[name="maPhone"]').val();
			    var caId=$('#adminModal input[name="caPhone"]').val();
			    var orderId = $('#adminModal input[name="orderId"]').val();
				var token = $('input[name="token"]').val();
				if(!token){
				    alert('非法提交！');
					return false;
				}
				var questURL = runParams.mainUrl+'addQuickPayRes.do';
				var questArr = {
						orderId:orderId,
						maName:maName, 
						maId:maId,
						caName:caName, 
						caId:caId, 
						token:token
					}
				$.post(questURL,questArr,function(result){
					if(1==result){
						alert('绑定成功！');
					}else{
						alert('绑定失败！');
					}
					location.reload();
				});
		   });
		   
			//时间弹出
			//$('.pager a').click(function(){
				//var status = $(this).attr('data-status');
				//location.href=$(this).attr('data-link')+"&status="+status;
			//});   
			//时间弹出
			$('input[name="date"]').datetimepicker({
		        language:  'zh-CN',
				format: 'yyyy-mm-dd',
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				forceParse: 0,
				startView: 2,
				minView: 2
		    });
			$('.input-group-addon').click(function(){
				$('#searchForm input[name="cp"]').val(1);
			    $('#searchForm').submit();
			});
			$('select[name="category"]').change(function(){
				$('#searchForm input[name="cp"]').val(1);
				$('#searchForm').submit();
			});
			$('select[name="responsible"]').change(function(){
				$('#searchForm input[name="cp"]').val(1);
				$('#searchForm').submit();
			});
			$('select[name="search_status"]').change(function(){
				$('#searchForm input[name="cp"]').val(1);
				$('#searchForm').submit();
			});
		   
		});
	</script>
</body>
</html>