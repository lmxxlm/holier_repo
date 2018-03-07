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
<%@ include file="../commons/runParams.html"%>
<title>MA后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link href="../assets/library/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/plugins/nprogress/nprogress.css" rel="stylesheet">
<link
	href="../assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="../assets/css/medex/frame.css" rel="stylesheet">
<link href="../assets/css/medex/datetimepickerReview.css"
	rel="stylesheet">
<link href="../assets/css/medex/checkout.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="../assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="../assets/library/modernizr/modernizr.js"></script>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<!-- leftmenu -->
		<%@ include file="../commons/leftMenu_pat.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="../commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">电子病历</a>
				</li>
				<li class="active">检验图片</li>
			</ol>
			<div class="mainBody">
				<div class="rightMenu">
					<a href="javascript:void(0)" onFocus="this.blur()"><i
						class="icon-stethoscope"></i>诊断症状</a> <a
						href="medicalRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-clipboard"></i>病历记录</a> <a
						href="checkRecord.html?patientId=${patientId}&&category=超声波"
						onFocus="this.blur()"><i class="icon-heart-beat"></i>检查记录</a> <a
						href="checkReport.html?patientId=${patientId}"
						onFocus="this.blur()" class="active"><i
						class="icon-blood-sample"></i>检验记录</a> <a
						href="medicineRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-pill"></i>用药记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-retweet"></i>随访记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-comment"></i>留言记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-paperclip"></i>附件记录</a>
				</div>
				<div class="leftMenu" id="leftMenu">
					<button type="button" class="btn btn-primary btn-block addCheckout"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span>上传检验单图片
					</button>
					<c:forEach items="${cateTreeDeep2}" var="firstName"
						varStatus="status">
						<a href="javascript:void(0)" onFocus="this.blur()"><i
							class="glyphicon glyphicon-chevron-right"></i><span>${firstName.key}</span><i
							class="icon-add-symbol"></i>
						</a>
						<div class="subtitle">
							<c:forEach items="${firstName.value}" var="secondName"
								varStatus="status">
								<a
									href="checkReportImage.html?patientId=${patientId}&category=${secondName}"
									onFocus="this.blur()">${secondName}</a>
							</c:forEach>
						</div>
					</c:forEach>
					<div class="btn-group checkpage">
						<button type="button" class="btn btn-default" onclick="location.href='checkReport.html?patientId=${patientId}'">检验记录</button>
						<button type="button" class="btn btn-default active">检验图片</button>
					</div>
				</div>
				<div class="record">
					<div class="searchCondition">
						<label class="checkbox-inline">
                            <input type="radio" name="isRead" value="-1" checked> 全部
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="isRead" value="0" <c:if test="${isRead == 0}">checked</c:if>> 未录入
                        </label>
						<label class="checkbox-inline">
                            <input type="radio" name="isRead" value="1" <c:if test="${isRead == 1}">checked</c:if>> 已录入
                        </label>
					</div>
					<c:forEach items="${wcriro_list}" var="wcriro" varStatus="status" begin="0" step="1">
					<div class="imageWrap">
						<h3 class="imageTitle">${wcriro.thirdName}</h3>
						<div class="imageList">
						<c:forEach items="${wcriro.images}" var="image" varStatus="status" begin="0" step="1">
							<div class="imgUnit">
								<a href="${image.image.fileName}" target="_blank"><img src="${image.image.large}" data-id="${image.image.fileName}"></a>
								<div class="imgTool">
								    <a href="javascript:void(0)" class="span undo">未录入&nbsp;<span class="glyphicon glyphicon-pencil"></span></a>
								    <a href="javascript:void(0)" class="delete" data-path="${image.image.fileName}">删除&nbsp;<span class="glyphicon glyphicon-remove"></span></a>
								    <div class="clearfix"></div>
								</div>		
							</div>
							</c:forEach>
							<a class="virtual_img" href="javascript:void(0)" title="上传该分类下的图片"><span class="glyphicon glyphicon-plus-sign"></span></a>
							<div class="clearfix"></div>
							<input type="hidden" name="level3_name" value="${wcriro.thirdName}">
							<div class="getMore1"><a href="javascript:void(0)">查看更多图片>></a></div>
						</div>
					</div>
</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框 -->
	<input type="hidden" name="patientId" value="${patientId}">
	<div class="modal fade" id="addImageModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addImageModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="addImageModalLabel">上传化验单图片</h4>
                 </div>
                 <div class="modal-body">
                    <div class="form-group">
                        <div class="upd_image_init"><input type="file" name="upd_image_init" id="upd_image_init" multiple/></div>
                        <h5>选择分类</h5>
                        <select class="form-control" name="select-level1"><option value="0">请选择第一大类</option>
                        <c:forEach items="${cateTreeDeep2}" var="firstName"
						varStatus="status">
						<option value="${firstName.key}">${firstName.key}</option>
					    </c:forEach>
                        </select>
                        <select class="form-control" name="select-level2"><option value="0">请先选择第一大类</option></select>
                        <select class="form-control" name="select-level3"><option value="0">请先选择第二大类</option></select>
                        <h5>图片列表</h5>
                        <table class="table table-striped imgList">
                           <thead>
                              <tr>
                                 <th class="td1">图片名</th>
                                 <th>大小</th>
                                 <th>格式</th>
                                 <th>预览</th>
                                 <th>状态/操作</th>
                              </tr>
                           </thead>
                           <tbody></tbody>
                        </table>
                        <input type="hidden" value="" name="imagepath" />      
                    </div>
                 </div>
                 <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-block dofileUpload">上传图片</button>
                 </div>
              </div>
           </div>
        </div>
	<script src="../assets/library/jquery/jquery.min.js"></script>
	<script src="../assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="../assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/plugins/nprogress/nprogress.js"></script>
	<script
		src="../assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script
		src="../assets/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="../assets/script/medex/frame.js"></script>
	<script src="../assets/script/medex/checkoutImage.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.imgUnit').live('mouseover',function(){
			$(this).find('.delete').show();
		});
        $('.imgUnit').live('mouseout',function(){
        	$(this).find('.delete').hide();
		});
		if(typeof FileReader == "undified"||!window.FormData) {
			alert("您老的浏览器不行了！");
		}
		var imgUploadList = [];
		var imgPathJsonData = [];
		var currentImgPage = '';
		var actionType = 0;
		$('.addCheckout').click(function(){
			$('.imgList tbody').html('');
			actionType = 0;
			$('input[name="upd_image_init"]').click();
		});
		//分类下的添加按钮，需要根据第三类获取对应的第一二类
		$('.virtual_img').live('click',function(){
			var level3 = $(this).siblings('input[name="level3_name"]').val();
			var questURL = runParams.mainUrl+'patient/getLevelLineFromLevel3.do';
			var questArr = {
				searchVar:level3
			};
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					$('select[name="select-level1"]').html('<option value="'+result.data.level1_name+'">'+result.data.level1_name+'</option>');
					$('select[name="select-level2"]').html('<option value="'+result.data.level2_name+'">'+result.data.level2_name+'</option>');
					$('select[name="select-level3"]').html('<option value="'+result.data.level3_name+'">'+result.data.level3_name+'</option>');
				}else{
					alert('未找到该分类！');
				}   
			});
			$('.imgList tbody').html('');
			actionType = 1;
			currentImgPage = $(this);
			$('input[name="upd_image_init"]').click();
		});
		//点击第一大类
		$('select[name="select-level1"]').change(function(){
			var level1 = $(this).val();
			var questURL = runParams.mainUrl+'patient/getLevel2TestnormFromLevel1.do';
			var questArr = {
				searchVar:level1
			};
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					var htmlstr = '';  
					for(var i=0;i<result.data.length;i++){
					  htmlstr += '<option value="'+result.data[i]+'">'+result.data[i]+'</option>';
					}
					$('select[name="select-level2"]').html(htmlstr);
					select2Change();
				}else{
					$('select[name="select-level2"]').html('<option value="0">这个第一大类下没有第二大类</option>');
					$('select[name="select-level3"]').html('<option value="0">这个第二大类下没有第三大类</option>');
				}
			});  
		});
		//点击第二大类
		function select2Change(){
			var level2 = $('select[name="select-level2"]').val();
			var questURL = runParams.mainUrl+'patient/getLevel3TestnormFromLevel2.do';
			var questArr = {
				searchVar:level2
			};
			$.post(questURL,questArr,function(result){
				result = eval("("+result+")");
				if(1==result.status){
					var htmlstr = '';  
					for(var i=0;i<result.data.length;i++){
					  htmlstr += '<option value="'+result.data[i]+'">'+result.data[i]+'</option>';
					}
					$('select[name="select-level3"]').html(htmlstr);
				}else{
					$('select[name="select-level3"]').html('<option value="0">这个第二大类下没有第三大类</option>');
				}
			});  
		}
		$('select[name="select-level2"]').change(function(){
			select2Change();
		});
		$('.deleteFile').live('click',function(){
			var id = parseInt($(this).attr('data-listid'),10);
			var fa = $(this).parent().parent(),
			name = fa.children('td:eq(0)').html();
			if(confirm("确定要移除"+name+"这张图片吗？")){
				imgUploadList.splice($.inArray(id,imgUploadList),1);
				fa.remove();
			}
		});
		$('.imgList .glyphicon-picture').live('click',function(){
		    var id = parseInt($(this).attr('data-id'),10);
			var resultFile = document.getElementById("upd_image_init").files[id];
			var targetObj = $(this);
			if (resultFile) {    
				var reader = new FileReader();
				reader.readAsDataURL(resultFile);
				reader.onload = function(e) {
					var urlData = this.result;
					targetObj.parent().html('<a href="'+urlData+'" target="_blank"><img src="'+urlData+'" height="50" width="50"></a>');
				};
			}
		});
		//删除单张图片
		$('.imgUnit .delete').live('click',function(){
			if(confirm('确定要删除这张图片吗？')){
				var imagepath = $(this).attr('data-path');
				var targetObj = $(this).parent().parent('.imgUnit');
				var questURL = runParams.mainUrl+'patient/deleteCheckReportImage.do';
				var questArr = {
					imagepath:imagepath
				};
				$.post(questURL,questArr,function(result){
					if(1==result){
						alert('图片删除成功！');
						targetObj.remove();
					}else{
						alert('图片删除失败！');
					}
				});  
			}
		});
		$('input[name="upd_image_init"]').live('change',function(){
			imgUploadList = [];
			imgPathJsonData = [];
			$('.dofileUpload').attr('disabled',false).html("上传图片");
			$('input[name="imagepath"]').val("");
			$('#addImageModal .close').show();
			$('#addImageModal').modal();
			var len = this.files.length;
			for(var i=0;i<len;i++){
				imgUploadList.push(i);
				var resultFile = this.files[i];
				if (resultFile) {
					var size = parseInt(resultFile.size/1024,10)+'&nbsp;KB';
					$('.imgList tbody').html($('.imgList tbody').html()+'<tr><td class="td1">'+resultFile.name+'</td><td>'+size+'</td><td>'+resultFile.type+'</td><td><a href="javascript:void(0)" data-id="'+i+'" class="glyphicon glyphicon-picture"></a></td><td><a href="javascript:void(0)" data-listid="'+i+'" class="deleteFile"><span class="glyphicon glyphicon-remove"></span>&nbsp;移除</a></td></tr>');
				}
			}
			
		});
		$('.dofileUpload').click(function(){
			if(imgUploadList.length==0){
				alert('请选择图片！');
				return false;
			}
			$('.dofileUpload').attr('disabled',true);
			$('#addImageModal .close').hide();
			var len = document.getElementById("upd_image_init").files.length;  
			for(var i=0;i<len;i++){
				if($.inArray(i,imgUploadList)>=0){
					var resultFile = document.getElementById("upd_image_init").files[i];
					if (resultFile) {
						var fd = new FormData();
						fd.append('upd_image', resultFile);
						fd.append('listId', i);
						$.ajax({
							url:"${mainUrl}__URL__/imageCut.do",
							type:"POST",
							processData: false,// 告诉jQuery不要去处理发送的数据
							contentType: false,// 告诉jQuery不要去设置Content-Type请求头
							data:fd,
							beforeSend:function(){
								$('a[data-listid="'+i+'"]').removeClass('.deleteFile').html('上传中..');	   
							},
							success:function(result){
								result = eval("("+result+")");
								if(result.status==1){
									$('a[data-listid="'+result.data.listId+'"]').parent('td').html('上传成功');	
									if(actionType==1){
										currentImgPage.before('<div class="imgUnit"><a href="'+result.data.fileName+'" target="_blank"><img src="'+result.data.large+'"></a><a href="javascript:void(0)" class="delete" data-path="'+result.data.fileName+'">删除</a></div>');
									}				
									var imgPathArr = {
										"fileName":result.data.fileName,
										"large":result.data.large,
										"middle":result.data.middle,
										"small":result.data.small
									}
								    imgPathJsonData.push(imgPathArr);
								}else{
									$('a[data-listid="'+result.data.listId+'"]').parent('td').html('上传失败');	
								}
								imgUploadList.splice($.inArray(result.data.listId,imgUploadList),1);
								//全部上传完毕，上传表单
								if(imgUploadList.length==0){
									var imagepath = JSON.stringify(imgPathJsonData);
									var level3 = $('select[name="select-level3"]').val();
									var patientId = $('input[name="patientId"]').val();
									var questURL = runParams.mainUrl+'patient/addCheckReportImages.do';
									if(level3==0){
										alert("请选择第三分类");
										return false;  
									}
									var questArr = {
											thirdName:level3,
											patientId:patientId,
											imagepath:imagepath
									};
									$('.dofileUpload').html("全部图片已上传完毕，正在提交数据...");
									$.post(questURL,questArr,function(result){
										if(1==result){
											if(actionType==0){
												$('.dofileUpload').html("上传成功！");
												location.reload();
											}
                                            if(actionType==1){
                                            	$('.dofileUpload').html("上传成功！");
    											$('#addImageModal').modal('hide');
											}
										}else{
											$('.dofileUpload').html("上传失败！");
										}
										$('#addImageModal .close').show();
									});  
								}
								$('#addImageModal .close').show();
							}
						});
					}
				}
			}
		});
		$('#addImageModal').on('hide.bs.modal', function () {
			$('.upd_image_init').empty();
			$('.upd_image_init').html('<input type="file" name="upd_image_init" id="upd_image_init" multiple/>');
		})
		//修改为已录入
		$('.undo').live('click',function(){
			var isread = 1;
			var imagepath = $(this).siblings('.delete').attr('data-path');
			var questURL = runParams.mainUrl+'patient/editCheckReportImageReadStatus.do';
			var questArr = {
				isread:isread,
				imagepath:imagepath
			};
			$.post(questURL,questArr,function(result){
				if(1==result){
					$(this).removeClass('undo').addClass('do').html('已录入');
				}else{
					alert('修改状态失败！');
				}
			});  
		});
		//修改为未录入
		$('.do').live('click',function(){
			var isread = 0;
			var imagepath = $(this).siblings('.delete').attr('data-path');
			var questURL = runParams.mainUrl+'patient/editCheckReportImageReadStatus.do';
			var questArr = {
				isread:isread,
				imagepath:imagepath
			};
			$.post(questURL,questArr,function(result){
				if(1==result){
					$(this).removeClass('do').addClass('undo').html('未录入&nbsp;<span class="glyphicon glyphicon-pencil"></span>');
				}else{
					alert('修改状态失败！');
				}
			});  
		});
		//点击顶部未录入和已录入
		$('input[name="isRead"]').click(function(){
			var isRead = $(this).val();
			var patientId = $('input[name="patientId"]').val();
			location.href = runParams.mainUrl+'patient/checkReportImage.html?patientId='+patientId+'&checkIn='+isRead;
		});
	});
	</script>
</body>
</html>