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
<%@ include file="commons/runParams.html"%>
<title>MA后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="assets/css/medex/frame_ad.css" rel="stylesheet">
<link href="assets/css/medex/chooseAccount.css" rel="stylesheet">
<link href="assets/css/medex/pat_list.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
<input type="hidden" name="currentUserId" value="${currentUserId}">
<input type="hidden" name="currentUserType" value="${currentUserType}">
	<div class="container-fluid">
		<!-- leftmenu -->
		<%@ include file="commons/leftMenu_ad.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="commons/topMenu_ad.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li><a href="#">视频服务</a></li>
				<li class="active">设备绑定</li>
			</ol>
			<div class="searchBar row">
                <div class="smartSearch col-md-4 col-xs-4">
                    <form action="searchDocResult.do" method="post" name="searchDocForm" id="searchDocForm">
                    <div class="input-group">
                       <input type="hidden" name="docId" value="">
                       <input type="text" class="form-control" name="searchPat" placeholder="搜索患者" autocomplete="off">
                       <input type="hidden" name="token" value="${token}">
                       <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>  
                    </div>
                    <ul class="searchResult"></ul>
                    </form>
                </div>
                <div class="addPat col-md-8 col-xs-8">
                    <button type="button" class="btn btn-primary pull-right" onFocus="this.blur()"><span class="glyphicon glyphicon-plus-sign"></span>添加绑定</button>
                </div>
            </div>
			<div class="mainBody">
				<!--如果找到用户 srart-->
                  <table class="table table-striped table-hover">
                   <thead>
                      <tr>
                         <th>设备ID</th>
                         <th>患者名字</th>
                         <th>患者ID</th>
                         <th>绑定时间</th>
                         <th>操作</th>
                      </tr>
                   </thead>
                   <tbody>
                      <c:if test="${noRecord == true}">
                      <tr>
                         <td colspan="6">暂无绑定记录。</td>
                      </tr>
                      </c:if>
                      <c:forEach items="${dumo.maps}" var="map">
                      <tr>
                         <td>${map.deviceId}</td>
                         <td>${map.name}</td>
                         <td>${map.accountId}</td>
                         <td>${map.time}</td>
                         <td class="td1"><a href="javascript:void(0)" data-id="${map.deviceId}" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;<a href="javascript:void(0)" data-id="${map.deviceId}" class="delete"><span class="glyphicon glyphicon-remove"></span>删除</a></td>
                      </tr>
                      </c:forEach>
                   </tbody>
                  </table>
                  <div align="center">
					<ul class="pager">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="javascript:void(0)" data-link="${mainUril}DevUserMap.html?cp=${dumo.pageView.back}&&ps=${searchParam.ps}" data-status="${status}">上一页</a>
						</li>
						<li     
							<c:if test="${dumo.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="javascript:void(0)" data-link="${mainUril}DevUserMap.html?cp=${dumo.pageView.next}&&ps=${searchParam.ps}" data-status="${status}">下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
				  </div>
                  <!--如果找到用户 end-->
			</div>
		</div>
	</div>
    <!-- 模态框 -->
        <div class="modal fade" id="adminModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="adminModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="adminModalLabel">添加绑定</h4>
                 </div>
                 <div class="modal-body">
                    <div class="form-group">
                        <div>
                        <label for="deviceId">设备ID</label>
                        <input type="text" class="form-control" name="deviceId" placeholder="设备ID" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group smartSearch">
                        <label for="accountId">用户ID</label>
                        <input type="hidden" name="accountId" value="">
                        <input type="text" class="form-control" name="name" placeholder="用户姓名" autocomplete="off">
                        <ul class="searchResultForPatient">
                            <li><a href="javascript:void(0)"></a></li>
                        </ul>
                    </div>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="token" value="">
                    <input type="hidden" name="actionType" value="">
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
	<script src="assets/script/medex/frame.js"></script>
	<script src="assets/plugins/MD5/md5.js"></script>
	<script src="assets/script/medex/devUserMap.js"></script>
	<script type="text/javascript">
	$(function(){
		function initModal(){
		    $('#adminModal input[name="deviceId"]').val('');
		    $('#adminModal input[name="name"]').val('');
			$('#adminModal input[name="accountId"]').val('');
			$('#adminModal input[name="actionType"]').val('');
			$('#adminModal input[name="deviceId"]').attr("readonly",false);
		}
		//点击添加按钮
		$('.addPat button').click(function(){
			initModal();
			$('#adminModal input[name="actionType"]').val('add');
		    $('#adminModal').modal();
		});
		//点击删除
		$('.delete').click(function(){
			var deviceId = $(this).attr('data-id');
			var token = $('input[name="token"]').val();
			if(!deviceId){
			    alert("未找到该绑定项！");
				return false;
			}
			//根据id获取这条数据
			var questURL = runParams.mainUrl+'/deleteMap.do';
			var questArr = {
				id:deviceId,
				token:token
			};
			$.post(questURL,questArr,function(result){
				//result = eval('('+result+')');
				if(result){
					alert("删除成功！");
					location.reload();
				}else{
					alert("未找到该绑定项！");
					location.reload();
				}
			});
		});
		//点击修改
		$('.edit').click(function(){
			initModal();
			$('#adminModal input[name="actionType"]').val('edit');
			var deviceId = $(this).attr('data-id');
			if(!deviceId){
			    alert("未找到该绑定项！");
				return false;
			}
			//根据id获取这条数据
			var questURL = runParams.mainUrl+'/findMapById.do';
			var questArr = {
				id:deviceId
			};
			$.post(questURL,questArr,function(result){
				//result = eval('('+result+')');
				if(1==result.status){
					$('#adminModal input[name="deviceId"]').val(result.data.deviceId);
					$('#adminModal input[name="accountId"]').val(result.data.accountId);
					$('#adminModal input[name="name"]').val(result.data.name);
					$('#adminModal input[name="deviceId"]').attr("readonly",true);
					$('#adminModal').modal();
				}else{
					alert("未找到该绑定项！");
				    return false;
				}
			});
		});
		//点击提交
		$('#doSubmit').click(function(){
			var actionType = $('#adminModal input[name="actionType"]').val();
		    if(actionType=="add"){
		    	doAdd();
		    }
		    if(actionType=="edit"){
		    	doEdit();
		    }
		});
		//添加逻辑
		function doAdd(){
			var accountId = $('#adminModal input[name="accountId"]').val();
			var deviceId = $('#adminModal input[name="deviceId"]').val();
			var name = $('#adminModal input[name="name"]').val();
			var token = $('input[name="token"]').val();
			if(!accountId){
				alert("没有找到该患者！");
				return false;
			}
			if(!deviceId){
				alert("请填写设备Id！");
				return false;
			}
			if(!name){
				alert("请填写患者！");
				return false;
			}
			if(!token){
				alert("非法提交！");
				return false;
			}
			var questURL = runParams.mainUrl+'addDevUserMap.do';
			var questArr = {
				accountId:accountId,
				deviceId:deviceId,
				name,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(1==result){
					alert("添加成功！");
					location.reload();
				}else if(2==result){
					alert('操作失败：该设备已经绑定了一位用户！');
					location.reload();
				}else{
					alert('添加失败！');
					location.reload();
				}
			});
		}
		//修改逻辑
		function doEdit(){
			var accountId = $('#adminModal input[name="accountId"]').val();
			var deviceId = $('#adminModal input[name="deviceId"]').val();
			var name = $('#adminModal input[name="name"]').val();
			var token = $('input[name="token"]').val();
			if(!accountId){
				alert("没有找到该患者！");
				return false;
			}
			if(!deviceId){
				alert("请填写设备Id！");
				return false;
			}
			if(!name){
				alert("请填写患者！");
				return false;
			}
			if(!token){
				alert("非法提交！");
				return false;
			}
			var questURL = runParams.mainUrl+'updateDevUserMap.do';
			var questArr = {
				accountId:accountId,
				deviceId:deviceId,
				name:name,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(result){
					alert("修改成功！");
					location.reload();
				}else{
					alert('修改失败！');
					location.reload();
				}
			});
		}
		//患者智能搜索
		$('.searchResultForPatient').parent().find('.form-control').bind('keyup',function(){
			$('#adminModal input[name="accountId"]').val('');
			var obj = $(this);
		    var searchVar = $(this).val();
			var questURL = runParams.mainUrl+'searchPatientByNameLimit10.do';
			var questArr = {
				searchVar:searchVar
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var con = result.data;
					var htmlstr = '';
					for(var i=0;i<con.length;i++){
					  htmlstr += '<li><a href="javascript:void(0)" data-patid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].disease+'&nbsp;—&nbsp;'+con[i].currentStatus+'</a></li>';
					}
					obj.siblings('.searchResultForPatient').html(htmlstr).show();
				}else{
					obj.siblings('.searchResultForPatient').hide();
				}
			});
		});
		$(".searchResultForPatient li a").live('click',function(){
			var p_obj = $(this).parents('.searchResultForPatient');
			p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
			p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-patid"));
			p_obj.hide();
		});
		
	});
	</script>
</body>
</html>