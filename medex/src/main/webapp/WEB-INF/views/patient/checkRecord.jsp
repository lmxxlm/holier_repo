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
<link href="../assets/css/medex/checkUp.css" rel="stylesheet">
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
				<li class="active">检查记录</li>
			</ol>
			<div class="mainBody"> 
				<div class="rightMenu">
					<a href="javascript:void(0)" onFocus="this.blur()"><i
						class="icon-stethoscope"></i>诊断症状</a> <a href="medicalRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-clipboard"></i>病历记录</a> <a
						href="checkRecord.html?patientId=${patientId}&&category=超声波" onFocus="this.blur()" class="active"><i
						class="icon-heart-beat"></i>检查记录</a> <a href="checkReport.html?patientId=${patientId}"
						onFocus="this.blur()" ><i
						class="icon-blood-sample"></i>检验记录</a> <a href="medicineRecord.html?patientId=${patientId}"
						onFocus="this.blur()"><i class="icon-pill"></i>用药记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-retweet"></i>随访记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-comment"></i>留言记录</a> <a
						href="javascript:void(0)" onFocus="this.blur()"><i
						class="glyphicon glyphicon-paperclip"></i>附件记录</a>
				</div>
				<div class="leftMenu">
				    <button type="button" class="btn btn-primary btn-block addCheckUp"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span> 添加检查单
					</button>
					<a href="checkRecord.html?patientId=${patientId}&category=超声波"
						onFocus="this.blur()" 
							<c:if test="${defaultCategory eq '超声波'}"> 
							class="active"
							</c:if>
						><i class="glyphicon glyphicon-th-large"></i>超声波<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a> <a href="checkRecord.html?patientId=${patientId}&category=核医学"
						onFocus="this.blur()" 
						<c:if test="${defaultCategory eq '核医学'}"> 
							class="active"
							</c:if>><i 
						class="glyphicon glyphicon-th-large"></i>核医学<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a> <a href="checkRecord.html?patientId=${patientId}&category=放射"
						onFocus="this.blur()"
						<c:if test="${defaultCategory eq '放射'}"> 
							class="active"
							</c:if>><i class="glyphicon glyphicon-th-large"></i>放射<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a> <a href="checkRecord.html?patientId=${patientId}&category=内窥镜"
						onFocus="this.blur()"
						<c:if test="${defaultCategory eq '内窥镜'}"> 
							class="active"
							</c:if>><i class="glyphicon glyphicon-th-large"></i>内窥镜<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a> <a href="checkRecord.html?patientId=${patientId}&category=病理"
						onFocus="this.blur()"
						<c:if test="${defaultCategory eq '病理'}"> 
							class="active"
							</c:if>><i class="glyphicon glyphicon-th-large"></i>病理<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a> <a href="checkRecord.html?patientId=${patientId}&category=心电图"
						onFocus="this.blur()"
						<c:if test="${defaultCategory eq '心电图'}"> 
							class="active"
							</c:if>><i class="glyphicon glyphicon-th-large"></i>心电图<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a> <a href="checkRecord.html?patientId=${patientId}&category=脑电图"
						onFocus="this.blur()"
						<c:if test="${defaultCategory eq '脑电图'}"> 
							class="active"
							</c:if>><i class="glyphicon glyphicon-th-large"></i>脑电图<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a> <a href="checkRecord.html?patientId=${patientId}&category=其它"
						onFocus="this.blur()"
						<c:if test="${defaultCategory eq '其它'}"> 
							class="active"
							</c:if>><i class="glyphicon glyphicon-th-large"></i>其它<span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>  
				</div>
				<div class="record">
				    <c:if test="${noRecord==true}">
				    <div class="recordUnit"><div class="notebook" style="height:329px;">该分类下暂无影像单记录。</div></div>
				    </c:if>
					<!--内容循环开始-->
					 <c:forEach items="${crro.records}" var="record"
								varStatus="status">
					<div class="recordUnit">
						<div class="notebook">
							<div class="btn-group btn-group-xs leftGroup">
								<a href="javascript:void(0)" class="btn btn-default active"
									title="查看文字报告" onFocus="this.blur()">文字报告</a> <a
									href="javascript:void(0)" class="btn btn-default" title="查看图库"
									onFocus="this.blur()">检查影像</a>
							</div>
							<div class="btn-group btn-group-xs rightGroup">
								<a href="javascript:void(0)" class="btn btn-default"
									title="修改这条记录"><span class="glyphicon glyphicon-edit"></span>
								</a> <a href="javascript:void(0)" class="btn btn-default"  
									title="删除这条记录"><span class="glyphicon glyphicon-remove"></span>
								</a> <input type="hidden" name="checkUpId" value="${record.check_recordId}">
							</div>
							<p>&nbsp;</p>
							<p class="title">
								<strong>${record.title}</strong>
							</p>
							<div class="page_text">
							<p>
								<strong>检查时间：&nbsp;&nbsp;</strong>${record.time_str}
							</p>
							<p>
								<strong>检查部位：&nbsp;&nbsp;</strong>${record.check_part}
							</p>
							<p>
								<strong>检查医院：&nbsp;&nbsp;</strong>${record.check_hospital}
							</p>
							<p>
								<strong>检查人：&nbsp;&nbsp;</strong>${record.check_person}
							</p>
							<p>
								<strong>检查报告：&nbsp;&nbsp;</strong>
							</p>
							<p id="h-content">
								${record.html_check_report}
							</p>
							</div>
							<div class="page_img">
                                <a class="virtual_img" href="javascript:void(0)" title="新增影像"><span class="glyphicon glyphicon-plus-sign"></span></a>
                                <div class="clearfix"></div>
                            </div>
						</div>
					</div>
					</c:forEach>
					<!--内容循环结束-->
					<c:if test="${hasMore == true}"> 
					<a href="javascript:void(0)" class="getMore"><i
						class="glyphicon glyphicon-chevron-down"></i>&nbsp;&nbsp;更多检查单<input
						type="hidden" name="lastTime" value="${lastTime}">
					</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框 -->
	<div class="modal fade" id="addPatientModal" data-backdrop="false"
		tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="patModalLabel">为该患者添加一个检查记录</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="category">检查单类型</label> <select class="form-control"
							name="category">
							<option value="超声波" selected>超声波</option>
							<option value="核医学">核医学</option>
							<option value="放射">放射</option>
							<option value="内窥镜">内窥镜</option>
							<option value="病理">病理</option>
							<option value="心电图">心电图</option>
							<option value="脑电图">脑电图</option>
							<option value="其它">其它</option>
						</select>
					</div>
					<div class="form-group">
						<label for="time">检查时间</label> <input type="text"
							placeholder="点击选择时间" name="time" class="form-control" value=""
							readonly>
					</div>
					<div class="form-group">
						<label for="title">标题</label> <input type="text"
							placeholder="请输入检查单标题" name="title" class="form-control" value="">
					</div>
					<div class="form-group">
						<label for="check_part">检查部位</label> <input type="text"
							placeholder="请输入检查部位" name="check_part" class="form-control"
							value="">
					</div>
					<div class="form-group smartSearch">
						<label for="check_hospital">检查医院</label> <input type="text"
							placeholder="请输入医院名称" name="check_hospital" class="form-control"
							value="">
							<ul class="searchResult"></ul>
					</div>
					<div class="form-group">
						<label for="check_person">检查人</label> <input type="text"
							placeholder="请输入检查人姓名" name="check_person" class="form-control"
							value="">
					</div>
					<div class="form-group">
						<label for="check_report">检查报告</label>
						<textarea class="form-control notebook" rows="4"
							name="check_report" placeholder="请输入检查报告"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token}"> <input
						type="hidden" name="actionType" value="add"> <input
						type="hidden" name="defaultCategory" value="${defaultCategory}">
					<input type="hidden" name="currentHospital"
						value="${currentHospital}"> <input type="hidden"
						name="patientId" value="${patientId}"> <input
						type="hidden" name="t_checkUpId" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="doSubmit">确认</button>
				</div>  
			</div>
		</div>   
	</div>
    <div class="modal fade" id="addImageModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addImageModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="addImageModalLabel">上传影像图片</h4>
                 </div>
                 <div class="modal-body">
                    <div class="form-group">
                        <div class="upd_image_init"><input type="file" name="upd_image_init" id="upd_image_init" multiple/></div>
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
                    <input type="hidden" name="e_checkUpId" value="">
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
	<script src="../assets/script/medex/checkUp.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.recordUnit .leftGroup a').click(function(){
		    $(this).parent().children('a').removeClass('active');
			$(this).addClass('active');
			if($(this).html()=='文字报告'){
			    $(this).parent().siblings('.page_img').hide();
				$(this).parent().siblings('.page_text').show();
			}
			if($(this).html()=='检查影像'){       
				$(this).parent().siblings('.page_text').hide();
				$(this).parent().siblings('.page_img').show();
				var targetObj = $(this).parent().siblings('.page_img');
				var id = $(this).parent().siblings('.rightGroup').children('input[name="checkUpId"]').val();
				var questURL = runParams.mainUrl+'patient/getImageListById.do';
				var questArr = {
					check_recordId:id
				};
				targetObj.html('<a class="virtual_img" href="javascript:void(0)" title="新增影像"><span class="glyphicon glyphicon-plus-sign"></span></a><div class="clearfix"></div>');
				$.post(questURL,questArr,function(result){
					result = eval("("+result+")");
					if(1==result.status){
						for(var i=0;i<result.data.length;i++){
					        targetObj.children('.virtual_img').before('<div class="imgUnit"><a href="'+result.data[i].fileName+'" target="_blank"><img src="'+result.data[i].large+'"></a><a href="javascript:void(0)" class="delete" data-path="'+result.data[i].fileName+'">删除</a></div>');
						} 
					}
				});  
			    
			}
		});
		$('.imgUnit').live('mouseover',function(){
			$(this).children('.delete').show();
		});
        $('.imgUnit').live('mouseout',function(){
        	$(this).children('.delete').hide();
		});
		if(typeof FileReader == "undified"||!window.FormData) {
			alert("您老的浏览器不行了！");
		}
		var imgUploadList = [];
		var imgPathJsonData = [];
		var currentImgPage = '';
		$('.virtual_img').live('click',function(){
			var checkUpId = $(this).parents('.recordUnit').find('input[name="checkUpId"]').val();
			$('#addImageModal input[name="e_checkUpId"]').val(checkUpId);
			$('.imgList tbody').html('');
			currentImgPage = $(this);
			$('input[name="upd_image_init"]').click();
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
		$('.imgUnit .delete').live('click',function(){
			if(confirm('确定要删除这张图片吗？')){
				var imagepath = $(this).attr('data-path');
				var id = $(this).parent().parent().siblings('.rightGroup').children('input[name="checkUpId"]').val();
				var targetObj = $(this).parent('.imgUnit');
				var questURL = runParams.mainUrl+'patient/deleteCheckUpImage.do';
				var questArr = {
					check_recordId:id,
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
									currentImgPage.before('<div class="imgUnit"><a href="'+result.data.fileName+'" target="_blank"><img src="'+result.data.middle+'"></a><a href="javascript:void(0)" class="delete" data-path="'+result.data.fileName+'">删除</a></div>');
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
								//全部上传完毕
								if(imgUploadList.length==0){
									var imagepath = JSON.stringify(imgPathJsonData);
									var id = $('#addImageModal input[name="e_checkUpId"]').val();
									var questURL = runParams.mainUrl+'patient/addCheckUpImages.do';
									var questArr = {
											check_recordId:id,
											imagepath:imagepath
									};
									$('.dofileUpload').html("全部图片已上传完毕，正在提交数据...");
									$.post(questURL,questArr,function(result){
										if(1==result){
											$('.dofileUpload').html("上传成功！");
											$('#addImageModal').modal('hide');
										}else{
											$('.dofileUpload').html("上传失败！");
										}
										$('#addImageModal .close').show();
									});  
								}
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
	});
	</script>
</body>
</html>