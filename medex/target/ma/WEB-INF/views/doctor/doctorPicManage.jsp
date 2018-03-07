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
	href="../assets/library/icons/pictoicons/css/picto-foundry-medical-science.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/pictoicons/css/picto-foundry-general.css"
	rel="stylesheet">
<link
	href="../assets/library/icons/glyphicons/assets/css/glyphicons_regular.css"
	rel="stylesheet">
<link href="../assets/css/medex/frame.css" rel="stylesheet">
<link href="../assets/css/medex/validDetail.css" rel="stylesheet">
<!--[if lt IE 9]>
            <script src="../assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="../assets/library/modernizr/modernizr.js"></script>
<style>
.picTitle{ height:30px; line-height:30px; text-align:center; background:#dedede; margin-bottom:12px;}
.picLayout{ table-layout:fixed; border:none;}
.picLayout .td2{ width:2%;}
.picLayout .td1{ background:#dedede; width:32%; text-align:center;}
.picLayout img{ width:96%;}
.picLayout .td1,.picLayout .td3{ border:1px solid #dedede;}
.picLayout .td3{ padding:10px;}
.picLayout .td3 p{ font-weight:bold; font-size:16px;}
.picLayout button{ background:#BA96C2; border-color:#AF86B9;}
.picLayout button:hover{ background:#AF86B9;}
.toux{ width:140px !important; height:180px !important;}
</style>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<!-- leftmenu -->
		<%@ include file="../commons/leftMenu_doc.jsp"%>
		<div id="content">
			<!-- topmenu -->
			<%@ include file="../commons/topMenu.jsp"%>
			<ol class="breadcrumb webmap">
				<li><a href="#">Home</a></li>
				<li class="active">管理证照和头像</li>
			</ol>
			<div class="mainBody">
				<div class="calendartitle"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;管理证照和头像</div>
                <div class="calendarList">
                   <div class="picTitle">证照一览</div>
                   <table border="0" cellspacing="0" cellpadding="0" width="100%" class="picLayout">
                       <tr>
                            <td class="td1">
                                    <c:choose><c:when test="${empty doctor.license_pic.large}"><img src="../assets/image/medex/temp_zhiyezhen.gif" id="Gongzuo"></c:when>
                                    <c:otherwise><a href="${doctor.license_pic.fileName}" target="_blank"><img src="${doctor.license_pic.large}" id="Gongzuo"></a></c:otherwise>
                                    </c:choose>
                            </td>
                            <td class="td2">&nbsp;</td>
                            <td class="td1">
                                    <c:choose><c:when test="${empty doctor.employee_pic.large}"><img src="../assets/image/medex/temp_gongzuozhen.gif" id="Zhiye"></c:when>
                                    <c:otherwise><a href="${doctor.employee_pic.fileName}" target="_blank"><img src="${doctor.employee_pic.large}"  id="Zhiye"></a></c:otherwise>
                                    </c:choose>
                            </td>
                            <td class="td2">&nbsp;</td>
                            <td class="td1">
                                    <c:choose><c:when test="${empty doctor.qualification_pic.large}"><img src="../assets/image/medex/temp_zigezhen.gif" id="Zige"></c:when>
                                    <c:otherwise><a href="${doctor.qualification_pic.fileName}" target="_blank"><img src="${doctor.qualification_pic.large}" id="Zige"></a></c:otherwise>
                                    </c:choose>
                            </td>
                       </tr>
                       <tr>
                           <td class="td3">
                               <p>工作证或执业证书</p>
                               <button type="button" class="btn btn-primary changeZhiye" onFocus="this.blur()">上传工作证或执业证书</button>
                           </td>
                           <td>&nbsp;</td>
                           <td class="td3">
                               <p>职称证书</p>
                               <button type="button" class="btn btn-primary changeGongzuo" onFocus="this.blur()">上传职称证书</button>
                           </td>
                           <td>&nbsp;</td>
                           <td class="td3">
                               <p>资格证书</p>
                               <button type="button" class="btn btn-primary changeZige" onFocus="this.blur()">上传资格证书</button>
                           </td>
                       </tr>
                   </table>   
                   <div class="picTitle" style="margin-top:30px;">头像一览</div>
                   <table border="0" cellspacing="0" cellpadding="0" width="100%" class="picLayout">
                       <tr>
                            <td class="td1">
                                    <c:choose><c:when test="${empty doctor.headPic.large}"><img src="../assets/image/medex/140-180.gif" id="Toux" style="width:140px;"></c:when>
                                    <c:otherwise><a href="${doctor.headPic.fileName}" target="_blank"><img src="${doctor.headPic.large}" id="Toux" style="width:140px;"></a></c:otherwise>
                                    </c:choose>
                            </td>
                            <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td class="td3">
                               <p>医生头像</p>
                               <button type="button" class="btn btn-primary changeToux" onFocus="this.blur()">上传头像</button>       
                           </td>
                           <td>&nbsp;</td>
                       </tr>
                   </table>   
                </div>
			</div>
		</div>
	</div>
	<div class="upd_image_init" style="display: none;">
		<input type="file" name="upd_image_init" id="upd_image_init">
	</div>
	<input type="hidden" name="token" value="${token}">
	<script src="../assets/library/jquery/jquery.min.js"></script>
	<script src="../assets/library/jquery/jquery-migrate.min.js"></script>
	<script src="../assets/library/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/plugins/nprogress/nprogress.js"></script>
	<script src="../assets/script/medex/frame.js"></script>
	<script>
	$(function() {
		if (typeof FileReader == "undified" || !window.FormData) {
			alert("您的浏览器该换了！");
		}
		var imgPathJsonData = [];
		var imageType = '';
		function showFile(){
			imgPathJsonData = [];
			imageType = '';
			$('.upd_image_init').empty();
			$('.upd_image_init').html('<input type="file" name="upd_image_init" id="upd_image_init"/>');
			$('input[name="upd_image_init"]').click();
		}
		$('.changeToux').click(function() {
			showFile();
			imageType = '头像';
	    });
		$('.changeGongzuo').click(function() {
			showFile();
			imageType = '职称证书';
	    });
		$('.changeZige').click(function() {
			showFile();
			imageType = '资格证书';
	    });
		$('.changeZhiye').click(function() {
			showFile();
			imageType = '工作证或执业证书';
	    });
		function beforeUpload(){
			var resultFile = document.getElementById("upd_image_init").files[0];
			var size = parseInt(resultFile.size / 1024 / 1024, 10);
			var type = resultFile.type.split('/')[1];
			var formatLimit = [ 'jpg', 'jpeg', 'png','bmp', 'gif' ];
			if (!resultFile) {
				alert('请上传图片！');
				return false;
			}
			if ($.inArray(type, formatLimit) < 0) {
				alert('只能上传‘jpg，jpeg，png，bmp，gif’后缀的图片文件！');
				return false;
			}
			if (size >= 1 && imageType == '头像') {
				alert('图片大小应控制在1M以内！');
				return false;
			}
			if (size >= 5 && imageType != '头像') {
				alert('图片大小应控制在5M以内！');
				return false;
			}
			return true;
		}
		function dataUpload(){
			var resultFile = document.getElementById("upd_image_init").files[0];
			//上传图片
			var fd = new FormData();
			fd.append('upd_image', resultFile);
			fd.append('listId', 0);
			$.ajax({
				url : "${mainUrl}__URL__/imageCut.do",
				type : "POST",
				processData : false,// 告诉jQuery不要去处理发送的数据
				contentType : false,// 告诉jQuery不要去设置Content-Type请求头
				data : fd,
				beforeSend : function() {
					switch(imageType){
					  case '头像':$('.changeToux').attr('disabled',true).html('上传中..');break;
					  case '职称证书':$('.changeGongzuo').attr('disabled',true).html('上传中..');break;
					  case '资格证书':$('.changeZige').attr('disabled',true).html('上传中..');break;
					  case '工作证或执业证书':$('.changeZhiye').attr('disabled',true).html('上传中..');break;
					}
				},
				success : function(result) {
					result = eval("("+result+")");
					if (result.status == 1) {
						var truePath = result.data.large;
						var imgPathArr = {
							"fileName" : result.data.fileName,
							"large" : result.data.large,
							"middle" : result.data.middle,
							"small" : result.data.small
						}
						imgPathJsonData.push(imgPathArr);
					} else {
						switch(imageType){
						  case '头像':$('.changeToux').attr('disabled',false).html('上传头像');break;
						  case '职称证书':$('.changeGongzuo').attr('disabled',false).html('上传职称证书');break;
						  case '资格证书':$('.changeZige').attr('disabled',false).html('上传资格证书');break;
						  case '工作证或执业证书':$('.changeZhiye').attr('disabled',false).html('上传工作证或执业证书');break;
						}
						alert('上传图像失败！');
						return false;
					}
					//上传完毕，提交数据
					var imagepath = JSON.stringify(imgPathJsonData);
					var doctorId = $('input[name="doctorId"]').val();
					var token = $('input[name="token"]').val();
					if(imageType=="头像"){
						var questURL = runParams.mainUrl+ 'doctor/updateDoctorFace.do';
						var questArr = {
							doctorId : doctorId,
							headPic : imagepath,
							token : token
						};
					}else{
						var questURL = runParams.mainUrl+ 'doctor/updateDoctorAuthPhoto.do';
						var questArr = {
							doctorId : doctorId,
							authPic : imagepath,
							picType: imageType,
							token : token
						};
					}
					$.post(questURL,questArr,function(result) {
						if (1 == result) {
							$('#Toux').attr('src',truePath);
							switch(imageType){
							  case '头像':$('#Toux').attr('src',truePath);break;
							  case '职称证书':$('#Gongzuo').attr('src',truePath);break;
							  case '资格证书':$('#Zige').attr('src',truePath);break;
							  case '工作证或执业证书':$('#Zhiye').attr('src',truePath);break;
							}
						} else {
							alert('上传数据失败！');
						}
						location.reload();
						switch(imageType){
						  case '头像':$('.changeToux').attr('disabled',false).html('上传头像');break;
						  case '职称证书':$('.changeGongzuo').attr('disabled',false).html('上传职称证书');break;
						  case '资格证书':$('.changeZige').attr('disabled',false).html('上传资格证书');break;
						  case '工作证或执业证书':$('.changeZhiye').attr('disabled',false).html('上传工作证或执业证书');break;
						}
					});
				}
			});
		}
        $('input[name="upd_image_init"]').live('change',function() {
        	var resultFile = document.getElementById("upd_image_init").files[0];
			if(beforeUpload()){
				if(imageType=="头像"){
					var reader = new FileReader();
					reader.readAsDataURL(resultFile);
					reader.onload = function(e) {
						var img = new Image();
						img.src = this.result;
						img.onload = function() {
							if (img.width/img.height == 7/9) {
								dataUpload();
							} else {
								alert('头像宽高比例为7：9，请重新选择图片！');
							}
						}
					};
				}else{
					dataUpload();
				}
			}
		});
		
	});
	</script>
</body>
</html>