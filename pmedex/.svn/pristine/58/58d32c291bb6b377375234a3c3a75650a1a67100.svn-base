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
<link href="assets/css/productAdmin/product.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
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
				<li class="active">套餐管理</li>
			</ol>
			<style>
			
			  input[readonly]{
			      background-image:none;
			  }
			</style>
            
			<div class="searchBar row">
				<div class="smartSearch col-md-3 col-xs-3">
					<!-- <div class="input-group">
						<input type="hidden" name="pack_id" value="${pack_id}"> <input
							type="text" class="form-control" name="pack_name"
							placeholder=请输入套餐名称" autocomplete="off" value="${pack_name}">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-search"></i> </span>
					</div> -->
					<ul class="searchResultForDoctor"></ul>
				</div>
				<div class="col-md-3 col-xs-3">
					<!-- <select class="form-control" name="productCategory">
						<option value="">全部服务列表</option>
						<c:forEach items="${categorys}" var="category">
							<option value="${category.id}" <c:if test="${category.id == type}">selected</c:if>>${category.name}</option>
						</c:forEach>
					</select> -->
				</div>
				<div class="addPat col-md-6 col-xs-6">
					<button type="button" class="btn btn-primary pull-right"
						onFocus="this.blur()" >
						<span class="glyphicon glyphicon-plus-sign"></span>添加套餐
					</button>
				</div>
			</div> 
 			
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>套餐名称</th>
							<th>套餐价格</th>
							<th>是否需要下级医生确认</th>
							<th>添加时间</th>
							<th>是否开放销售</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							
						<c:if test="${nopackage == true}">
							<tr>
								<td colspan="9">请添加套餐。</td>
							</tr>
						</c:if>
						<c:forEach items="${service_package_list}" var="pack">
							<tr>
								<td>${pack.pack_name}</td>
								<td>${pack.pack_price}</td>
								<td>${pack.need_confirm}</td>
								<td>${pack.add_time}</td>
								<td>${pack.is_valid}</td>
								<td class="td1"><a
									href="javascript:void(0)"
									data-id="${pack.pack_id}" class="showPackage" ><span
										class="glyphicon glyphicon-zoom-in"></span>详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="javascript:void(0)" data-id="${pack.pack_id}"
									class="editPackage"><span class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="javascript:void(0)" data-id="${pack.pack_id}" class="deletePackage"><span
										class="glyphicon glyphicon-remove"></span>删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
					<h4 class="modal-title" id="adminModalLabel">套餐管理</h4>
				</div>
				<div class="modal-body">
				   <div class="form-group">
						<label for="pack_name">套餐名称</label>
						<input class="form-control" name="pack_name"
							placeholder="请输入套餐名称"></input>
					</div>
					<div class="form-group">
						<label for="pack_price">套餐价格</label>
						<input class="form-control" name="pack_price"
							placeholder="套餐价格"></input>
					</div>
					<div class="form-group">
						<label for="need_confirm">是否需要下级医确认</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="need_confirm" value="true" checked>是</label> <label
								class="radio-inline"><input type="radio" name="need_confirm"
								value="false">否</label>
						</div>
					</div>
					<div class="form-group">
						<label for="service_list">包含的服务列表</label>
						<style>
						    .notebook{background:none;}
						</style>
						<div class="form-control notebook" style="width: 100%; height: 120px; overflow: auto;" name="service_list">
						    <c:if test="${noService==true}">
						        	十分抱歉，暂时不提供服务
						    </c:if>
						    <c:forEach items="${service_list }" var="service">
						         <p><input type="checkbox"  name="service"  data-id="${service.service_id}" value="1">${service.service_content}</p>
						    </c:forEach>
						</div>
					</div>
					<!--  
					<div class="form-group ">
						<label for="add_time">添加时间</label>
						<div class="clearfix"></div>
						<input type="text" class="form-control inputDT" name="add_time"
							placeholder="请选择开添加时间" readonly>
						<div class="clearfix"></div>
					</div>
					-->
					<div class="form-group" >
						<label for="reward">奖励</label>
						<input class="form-control" name="reward"
							placeholder="请添加奖励（数字）元"></input>
					</div>
					
					<div class="form-group">
						<label for="is_valid">是否开放销售</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="is_valid" value="true" checked>是</label> <label
								class="radio-inline"><input type="radio" name="is_valid"
								value="false">否</label>
						</div>
					</div>
					
					
					
					<div class="form-group">
						<label for="remark">备注</label>
						<textarea class="form-control notebook" rows="4" name="remark"
							placeholder="请输入备注"></textarea>
					</div>
					
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token }"> <input
						type="hidden" name="actionType" value=""> 
						<input type="hidden" name="pack_id" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="doSubmit">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="assets/library/jquery/jquery.min.js"></script>
	<script src="assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="assets/plugins/nprogress/nprogress.js"></script>
	<script
		src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script
		src="assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/script/productAdmin/frame.js"></script>
	<style>
	     .addCursor{cursor:not-allowed !important;}
	</style>
	<script>
	//初始化
	$(function(){
    	function initModal(){
    	    $('#adminModal input[name="pack_id"]').val('');
    	    $('#adminModal input[name="pack_name"]').val('');
    	    $('#adminModal input[name="pack_price"]').val('');
    		$('#adminModal input[name="need_confirm"][value="1"]').attr('checked',true);
    		/*$('#adminModal input[name="service_list"]').val('');*/
    		/*初始化服务套餐列表*/
    		$('#adminModal input[type="checkbox"]').attr('checked',false);
    		
    		$('#adminModal input[name="add_time"]').val('');
    		$('#adminModal input[name="is_valid"][value="1"]').attr('checked',true);
    		$('#adminModal textarea[name="remark"]').val('');
    		$('#adminModal input[name="actionType"]').val('');
    		
    		//奖励
    		 $('#adminModal input[name="reward"]').val('200');
    		
    		//去掉详情默认样式
    		$('#adminModal input,#adminModal textarea').removeAttr("readonly");
    		$('#adminModal #doSubmit').show();
    		$('#adminModal input,#adminModal textarea').removeAttr("style","cursor:not-allowed !important;");
    		$("input[type='checkbox'],input[type='radio']").removeAttr('disabled',true);
    		
    		//让所有的套餐进行显示
    	    $('div[name="service_list"] p').each(function(i,o){
    	    	  $(o).show();
    	    	  $(o).find('input').show();
    	    	  $(o).find('input').attr('checked',false);
    	    });
    	}
    	
    	
    	//点击详情按钮
    	$('.showPackage').click(function(){
    		initModal();
    		var buttonName=$(this).attr('class');/*变量名不能叫关键字*/
    		if(buttonName=='showPackage'){
    			//隐藏确认按钮
    			$('#adminModal #doSubmit').hide();
    			//让所有输入框变成只读的
    			$('#adminModal input,#adminModal textarea').attr("style","cursor:not-allowed !important;");
    			$('#adminModal input,#adminModal textarea').attr({
    				"readonly":"readonly"
    			})
    			//让checkbox和radio变成不可选
    			$("input[type='checkbox'],input[type='radio']").attr('disabled',true);
    		}
    		var id = $(this).attr('data-id');
    		if(!id){
    		    alert("未找到该服务！");
    			return false;
    		}
    		//根据id获取这条数据
    		var questURL = runParams.mainUrl+'getPackageById.do';
    		var questArr = {
    			pack_id:id
    		};
    		$.post(questURL,questArr,function(result){
    			if(result.status){
    				/*给服务号进行赋值*/
    				 var service_ids=result.data.service_ids;
    				//先全部进行隐藏
    				 $('#adminModal input[type="checkbox"]').parent('p').hide();
    				 for(var i=0;i<service_ids.length;i++){
	    				 $('#adminModal input[type="checkbox"]').each(function(j,o){
	    						 if($(o).attr('data-id')==service_ids[i]){
	    							 //被选中的显示
	    	 							$(o).attr('checked',true);
	    	 							$(o).show();
	    	 							$(o).parent('p').show();
	    	 						}
	    					 
		 				});
    				 }
    				/*----*/
   		    	    $('#adminModal input[name="pack_id"]').val(result.data.pack_id);
   		    	    $('#adminModal input[name="pack_name"]').val(result.data.pack_name);
   		    	    $('#adminModal input[name="pack_price"]').val(result.data.pack_price);
    				$('#adminModal input[name="need_confirm"][value="'+result.data.need_confirm+'"]').attr('checked',true);
   		    		$('#adminModal input[name="is_valid"][value="'+result.data.is_valid+'"]').attr('checked',true);
   		    		$('#adminModal textarea[name="remark"]').val(result.data.remark);
   		    		$('#adminModal input[name="reward"]').val(result.data.reward);
            		$('#adminModal').modal();
    			}else{
    				alert("未找到该产品！");
    			    return false;
    			}
    		});
    		
    	});
    	
    	//点击添加按钮
    	$('.addPat button').on('click',function(){
    		initModal();
    		$('#adminModal input[name="actionType"]').val('add');
    	    $('#adminModal').modal();
    	});
    	
    	
    	
    	//点击修改链接
    	$('.editPackage').on('click',function(){
    		//调用一下初始化
    		initModal();
    		$('#adminModal input[name="actionType"]').val('edit');
    	    var id = $(this).attr('data-id');
    		if(!id){
    		    alert("未找到该服务！");
    			return false;
    		}
    		//根据id获取这条数据
    		var questURL = runParams.mainUrl+'getPackageById.do';
    		var questArr = {
    			pack_id:id
    		};
    		$.post(questURL,questArr,function(result){
    			if(result.status){
    				/*给服务号进行赋值*/
    				 var service_ids=result.data.service_ids;
    				for(var i=0;i<service_ids.length;i++){
    					$('#adminModal input[type="checkbox"]').each(function(){
    						if($(this).attr('data-id')==service_ids[i]){
    							$(this).attr('checked',true);
    						}
    					});
    				}
   		    	    $('#adminModal input[name="pack_id"]').val(result.data.pack_id);
   		    	    $('#adminModal input[name="pack_name"]').val(result.data.pack_name);
   		    	    $('#adminModal input[name="pack_price"]').val(result.data.pack_price);
    				$('#adminModal input[name="need_confirm"][value="'+result.data.need_confirm+'"]').attr('checked',true);
   		    		$('#adminModal input[name="add_time"]').val(result.data.add_time);
   		    		$('#adminModal input[name="is_valid"][value="'+result.data.is_valid+'"]').attr('checked',true);
   		    		$('#adminModal textarea[name="remark"]').val(result.data.remark);
   		    		$('#adminModal input[name="reward"]').val(result.data.reward);
            		$('#adminModal').modal();
    			}else{
    				alert("未找到该产品！");
    			    return false;
    			}
    		});
    	});
    	//点击提交
    	$('#doSubmit').on('click',function(){
    	    var actionType = $('#adminModal input[name="actionType"]').val();
    		if(actionType == 'add'){ doAdd(); }
    		if(actionType == 'edit'){ doEdit(); }
    	});
    	//添加逻辑
    	function doAdd(){
    		/*var service_list=$('#adminModal input[name="service_list"]').val();*/
    		/*取到勾选的服务号的值*/
    		var service_ids='';
    		$('#adminModal input[type="checkbox"]').each(function(i,o){
    			if($(this).is(':checked')){
    				service_ids+=$(this).attr('data-id')+',';
    				
    			}
    		});
    		service_ids=service_ids.substring(0,service_ids.length-1);/*去掉字符串的最后一个逗号*/
    	    var pack_name=$('#adminModal input[name="pack_name"]').val();
    	    var pack_price=$('#adminModal input[name="pack_price"]').val();
    	    var need_confirm = $('#adminModal input[name="need_confirm"]:checked').val();
    		
    		var add_time=$('#adminModal input[name="add_time"]').val();
    		var is_valid = $('#adminModal input[name="is_valid"]:checked').val();
    		var remark=$('#adminModal textarea[name="remark"]').val();
    		var reward=$('#adminModal input[name="reward"]').val();
    		var token = $('input[name="token"]').val();
    		if(!token){
    		    alert("非法提交！");
    			return false;
    		}
    		
    		if(!pack_name){
    			alert("没填写套餐名称");
    			return false;
    		}
    		
    		if (!/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(pack_price)||!pack_price) {
    			alert("您没有填写套餐价格，请重新输入！");
    		    return false;
    		}
    		
    		if(service_ids.length<1){
    			alert("您没有钩选套餐");
    			return false;
    		}
    		
    		if(!$.isNumeric(reward)){
    			alert('您没有输入奖励，或输入的格式不正确');
    			return false;
    		}
    		
    		if(!token){
    		    alert("非法提交！");
    			return false;
    		}
    		var questURL = runParams.mainUrl+'addPackage.do';
    		var questArr = {
    			service_ids:service_ids,/*选好的服务套餐的值*/	
				pack_name:pack_name,
				pack_price:pack_price,
				need_confirm:need_confirm,
				add_time:add_time,
				is_valid:is_valid,
				remark:remark,
				reward:reward,
    			token:token
    		};
    		
    		$.post(questURL,questArr,function(result){
    			if(result){
    				alert("添加成功！");
    				location.reload();
    			}else{
    				alert('添加失败！');
    				return false;
    			}
    		});
    	}
    	//修改逻辑
    	function doEdit(){
    		/*var service_list=$('#adminModal input[name="service_list"]').val();*/
    		/*取到勾选的服务号的值*/
    		var service_ids='';
    		$('#adminModal input[type="checkbox"]').each(function(i,o){
    			if($(this).is(':checked')){
    				service_ids+=$(this).attr('data-id')+',';
    				
    			}
    		});
    		service_ids=service_ids.substring(0,service_ids.length-1);/*去掉字符串的最后一个逗号*/
    		var token = $('input[name="token"]').val();
    		var pack_id=$('#adminModal input[name="pack_id"]').val();
     	    var pack_name=$('#adminModal input[name="pack_name"]').val();
     	    var pack_price=$('#adminModal input[name="pack_price"]').val();
     	    var need_confirm = $('#adminModal input[name="need_confirm"]:checked').val();
     		var service_list=$('#adminModal input[name="service_list"]').val();
     		var add_time=$('#adminModal input[name="add_time"]').val();
     		var is_valid = $('#adminModal input[name="is_valid"]:checked').val();
     		$('#adminModal textarea[name="remark"]').val();
     		var remark=$('#adminModal textarea[name="remark"]').val();
     		var reward=$('#adminModal input[name="reward"]').val();
    		if(!pack_id){  
    		    alert("未找到该产品！");
    			return false;
    		}  
    		
    		if(!token){
    		    alert("非法提交！");
    			return false;
    		}
    		if(!pack_name){
    			alert("没填写套餐名称");
    			return false;
    		}
    		
    		if (!/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(pack_price)||!pack_price) {
    			alert("您没有填写套餐价格，请重新输入！");
    		    return false;
    		}
    		
    		if(!service_ids){
    			alert("您没有钩选套餐");
    			return false;
    		}
    		
    		if(!service_ids){
    			alert("您没有钩选套餐");
    			return false;
    		}
    		
    		if(!$.isNumeric(reward)){
    			alert('您没有输入奖励，或输入的格式不正确');
    			return false;
    		}
    		
    		var questURL = runParams.mainUrl+'editPackage.do';
    		var questArr = {
    			service_ids:service_ids,/*选好的服务套餐的值*/	
   				pack_id:pack_id,
   				pack_name:pack_name,
   				pack_price:pack_price,
   				need_confirm:need_confirm,
   				is_valid:is_valid,
   				remark:remark,
   				reward:reward,
       			token:token
    		};
    		$.post(questURL,questArr,function(result){
    			if(result){
    				alert("修改成功");
    				location.reload();
    			}else{
    				alert('修改失败！');
    				return false;
    			}
    		});
    	}
    	//删除
    	$(".deletePackage").click(function(){
    		var token=$('input[name="token"]').val();
    		var id = $(this).attr('data-id');
    		var name = $(this).parent().parent('tr').children('td:eq(0)').html();
    	    if(confirm('确定要把产品“'+name+'"从列表中删除吗？')){
    	    	//****删除后这个产品后面具体哪周定义的次数都要删除
				var questURL = runParams.mainUrl+'deletePackage.do';
				var questArr = {pack_id:id,token:token};
				$.get(questURL,questArr,function(result){
					if(result){
						alert('删除成功！');
						location.reload();
					}else{
						alert('删除失败！');
						return false;
					}
				});
    		}
    	});
        //时间弹出
    	$('input[name="add_time"]').datetimepicker({
            language:  'zh-CN',
    		format: 'yyyy-mm-dd',
    		weekStart: 1,
    		todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		forceParse: 0,
    		startView: 2,
    		minView: 2,
    		pickerPosition:'top-left'
        });
    });
	
	</script>
</body>
</html>