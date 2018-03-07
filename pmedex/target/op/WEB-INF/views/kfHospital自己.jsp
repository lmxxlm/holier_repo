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
<meta http-equiv="Access-Control-Allow-Origin" content="*">
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
<style>
.imgUnit{display:inline-block;width:50px;height:50px;border:1px solid black;text-align:center;position:relative;}
.imgUnit img{width:45px;height:45px;}
   .addImg{display:inline-block;
   width:50px;height:50px;border:1px dashed black;text-align:center;
   }
   .addImg span{}
   
   .picture .imgUnit{width:80px;height:100px;position:relative;}
   .picture .imgUnit img{width:80px;height:100px;}
   .picture .addImg{width:80px;height:100px;line-height:100px;}
    .picture .addImg span{font-size:50px;top:20px;}
    
    .delete{ 
    background: rgba(0, 0, 0, 0.4) none repeat scroll 0 0;
    bottom: 0;
    color: #fff;
    /*display: none;*/
    height: 30px;
    left: 0;
    line-height: 30px;
    position: absolute;
    text-align: center;
    width: 80px;}
    
    #adminModal input[readonly]{background-image:none;}
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
				<li class="active">医院信息</li>
			</ol>
			<div class="searchBar row">
				<input type="hidden" name="imagepath" value="">
				<div class="addPat col-md-12 col-xs-12">
					<button type="button" class="btn btn-primary pull-right"
						onFocus="this.blur()">
						<span class="glyphicon glyphicon-plus-sign"></span>添加信息
					</button>
				</div>
			</div>
			<div class="mainBody">
				<!--如果找到用户 srart-->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>医院名称</th>
							<th>是否提供免费转运车接送</th>
							<th>床位数</th>
							<th>照片</th>
							<th>运营对接人</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${noRecord == true}">
							<tr>
								<td colspan="9">请添加产品。</td>
							</tr>
						</c:if>
						<c:forEach items="${data}" var="record">
							<tr>
								<td>${record.name}</td>
								<td>${record.pss}</td>
								<td>${record.bednumber}</td>
								<td >
                                       <div class="imgUnit"><a href="${record.image.fileName}" target="_blank"><img src="${record.image.large}"></a></div>
                                </td>
                                <td>${record.operate}</td>
								<td class="td1">
								 <a href="javascript:void(0)" data-id="${record.record_id}"
									class="detailHosInfo"><span class="glyphicon glyphicon-zoom-in"></span>详情</a>&nbsp;&nbsp;&nbsp;&nbsp; 
								 <a href="javascript:void(0)" data-id="${record.record_id}"
									class="editHosInfo"><span class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;&nbsp;&nbsp; 
								
									<a
									href="javascript:void(0)" data-id="${record.record_id}"
									class="deleteHosInfo"><span
										class="glyphicon glyphicon-remove"></span>删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div align="center">
					<ul class="pager">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>>
					    	<a href="${mainUril}kfHospital.html?cp=${record.pageView.back}&&ps=${searchParam.ps}"  >上一页</a>
						</li>
						<li     
							<c:if test="${oro.pageView.last == searchParam.cp}"> class="disabled"</c:if>>
							<a href="${mainUril}kfHospital.html?cp=${record.pageView.next}&&ps=${searchParam.ps}" >下一页</a> 
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
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
					<h4 class="modal-title" id="adminModalLabel">医院信息</h4>
				</div>
				<div class="modal-body">
				   <div class="form-group" >
						<label for="hos_name">医院名称</label>
						<input class="form-control" name="hos_name"
							placeholder="（请填写医院的官方名称全称）"></input>
					</div>
					<div class="form-group" >
						<label for="detail_address">详细地址</label>
						<input class="form-control" name="detail_address"
							placeholder="请输入详细地址"></input>
					</div>
					<div class="form-group">
						<label for="pss">是否提供免费转运车接送</label>
						<div>
							<label class="radio-inline"><input type="radio"
								name="pss" value="true" checked>接送</label> <label
								class="radio-inline"><input type="radio" name="pss"
								value="false">不接送</label>
						</div>
					</div>
					<div class="form-group" >
						<label for="hos_specialist">医院专科</label>
						<input class="form-control" name="hos_specialist"
							placeholder="请输入医院专科（多个英文逗号隔开）"></input>
					</div>
				
					<div class="form-group">
						<label for="hos_info">医院简介</label>
						<textarea class="form-control notebook" rows="4"
							name="hos_info" placeholder="请输入医院简介"></textarea>
					</div>
					<div class="form-group" >
						<label for="bed_num">床位数</label>
						<input class="form-control" name="bed_num"
							placeholder="请输入床位数"></input>
					</div>
					
					<div class="form-group" >
						<label for="reward">奖励</label>
						<input class="form-control" name="reward"
							placeholder="请添加奖励（数字）元"></input>
					</div>
					
					<div class="form-group" >
						<label for="weight">权重（请输入0-1之间的值）</label>
						<input class="form-control" name="weight"
							placeholder="请输入权重"></input>
					</div>
					
					<div class="form-group" style="width:30%;display:inline-block;">
						<label for="financial">财务对接人</label>
						<input class="form-control" name="financial"
							placeholder="请输入财务对接人"></input>
					</div>
					<div class="form-group" style="width:30%;display:inline-block;margin-left:3%;">
						<label for="maintain_info">信息维护对接人</label>
						<input class="form-control" name="maintain_info"
							placeholder="请输入信息维护对接人"></input>
					</div>
					<div class="form-group" style="width:30%;display:inline-block;margin-left:3%;">
						<label for="operate">运营对接人</label>
						<input class="form-control" name="operate"
							placeholder="请输入运营对接人"></input>
					</div>
					
					<div class="form-group picture " >
						<label for="picture">上传头像<br>(宽高5:4)</label><br>
						<div class="pictureImg upHead"  data-type="upHead">
                                 <a  class="addImg" data-type="upHead" data-id="${record.id}"><span class="glyphicon glyphicon-plus-sign"></span></a>
                       </div>
					</div>
					<div class="form-group picture " >
						<label for="picture ">上传图集<br>(宽高3:1)</label><br>
						<div class="pictureImg upPhotos" data-type="upPhotos">
                           <a  class="addImg" data-type="upPhotos" data-id="${record.id}"><span class="glyphicon glyphicon-plus-sign"></span></a>
                       </div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="token" value="${token }"> 
					<input type="hidden" name="actionType" value="">
					<input type="hidden" name="hosInfo_id" value="">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="doSubmit">确认</button>
				</div>
			</div>
		</div>
		
		
	</div>
	<style>
	   input[type="file"]{opacity: 0; filter: "alpha(opacity=0)";filter: alpha(opacity=0);-moz-opacity: 0;}
	</style>
	
	<!-- 上传图片的模态框 -->
	<div class="modal fade" id="addImageModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addImageModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="addImageModalLabel">上传影像图片</h4>
                 </div>
                 <div class="modal-body">
                    <div class="form-group">
                        <div class="upd_image_init"><input type="file"  name="upd_image_init" id="upd_image_init" multiple/></div>
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
                    <input type="hidden" name="e_checkUpId" value="" autocomplete="off">
                    <button type="button" class="btn btn-primary btn-block dofileUpload">上传图片</button>
                 </div>
              </div>
           </div>
        </div>
	
	<!-- 上传图片的模态框结束 -->
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
	<script>
	
	$(function(){
		//上传头像只能有一个图片
		$('.upHead ').each(function(){
			var imgLen=$(this).find('.imgUnit').length;
			if(imgLen>=1){
				$(this).find('.addImg').hide();
			}
		});
		//上传图片集只能有五张
		/*
		$('.upPhotos ').each(function(){
			var imgLen=$(this).find('.imgUnit').length;
			if(imgLen>=5){
				$(this).find('.addImg').hide();
			}
		});
		*/
		//初始化
    	function initModal(){
    	    $('#adminModal input[name="hosInfo_id"]').val('');
    	    $('#adminModal input[name="hos_name"]').val('');
    	    $('#adminModal input[name="detail_address"]').val('');
    		$('#adminModal input[name="pss"][value="true"]').attr('checked',true);
    		$('#adminModal input[name="hos_specialist"]').val('');
    		$('#adminModal textarea[name="hos_info"]').val('');
     	    $('#adminModal input[name="bed_num"]').val('');
     	    $('#adminModal input[name="weight"]').val('');
     	   $('#adminModal input[name="reward"]').val('200');
     	   
     	   //初始化维护人员
     	    $('#adminModal input[name="financial"]').val('');
     	    $('#adminModal input[name="maintain_info"]').val('');
     	    $('#adminModal input[name="operate"]').val('');
     	   
     	 //去掉详情默认样式
    		$('#adminModal input,#adminModal textarea').removeAttr("readonly");
    		$('#adminModal #doSubmit').show();
    		$('#adminModal input,#adminModal textarea').removeAttr("style","cursor:not-allowed !important;");
    		$("input[type='checkbox'],input[type='radio']").removeAttr('disabled',true);
    		
    	//图片的初始化
    	   $('.pictureImg').empty();
    	   $('.upHead').html('<a  class="addImg" data-type="upHead" data-id=""><span class="glyphicon glyphicon-plus-sign"></span></a>');
    	   $('.upPhotos').html('<a  class="addImg" data-type="upPhotos" data-id=""><span class="glyphicon glyphicon-plus-sign"></span></a>');
    	}
    	//点击添加按钮
    	$('.addPat button').click(function(){
    		initModal();
    		$('#adminModal input[name="actionType"]').val('add');
    	    $('#adminModal').modal();
    	});
    	
    	//点击提交
    	$('#doSubmit').on('click',function(){
    	    var actionType = $('#adminModal input[name="actionType"]').val();
    	    doAdd(actionType);
    	});
    	
    	//添加逻辑、修改点击确定添加
    	function doAdd(actionType){
    		//hosInfo_id  后台进行判断
    		var hosInfo_id=$('#adminModal input[name="hosInfo_id"]').val();
     	    var hos_name= $('#adminModal input[name="hos_name"]').val();
     	    var detail_address=$('#adminModal input[name="detail_address"]').val();
     	    var pss = $('#adminModal input[name="pss"]:checked').val();
     		var hos_specialist=$('#adminModal input[name="hos_specialist"]').val();
     		var hos_info=$('#adminModal textarea[name="hos_info"]').val();
      	    var bed_num=$('#adminModal input[name="bed_num"]').val();
      	    var weight=$('#adminModal input[name="weight"]').val();
      	    var reward=$('#adminModal input[name="reward"]').val();
      	    var token = $('input[name="token"]').val();
      	    
      	    //三个维护人
      	    var financial=$('#adminModal input[name="financial"]').val();
      	    var maintain_info=$('#adminModal input[name="maintain_info"]').val();
      	    var operate=$('#adminModal input[name="operate"]').val();
      	    
      	    //(1)获得头像的路径
      	    //（2）获得图集的路径reward
      	   
      	    var imgUpList=[];
      	    var imgUpHead='';
      	    
      	    
      	   //传正常的四个字段
      		 var oUpHead=$('#adminModal .upHead'); 
       	     var oUpHeadInput=oUpHead.find('input[name="savePath"]');
       	     var large= oUpHeadInput.attr('data-large');
       	     var small=oUpHeadInput.data('small');
	    	 var middle=oUpHeadInput.data('middle');
	    	 var fileName=oUpHeadInput.attr('data-fileName');
	    	 imgUpHead = {
	      	    		"large" : large ,
	      	    		"small" : small ,
	      	    		"middle": middle,
	      	    		"fileName" : fileName
	      	    	};
	    	var imageHeadPath= JSON.stringify(imgUpHead);
      	   
      	     $('#adminModal .upPhotos .imgUnit').each(function(){
      	    	var targetPath= $(this).find('input');
	      	   	var large=targetPath.data('large');
	  	    	var small=targetPath.data('small');
	  	    	var middle=targetPath.data('middle');
	  	    	var fileName=targetPath.attr('data-fileName');
	  	    	
	  	    	var obj = {
	      	    		"large" : large ,
	      	    		"small" : small ,
	      	    		"middle": middle,
	      	    		"fileName":fileName
	      	    	};
	  	      imgUpList.push(obj);
      	     });
	    	 var imageListpath = JSON.stringify(imgUpList);
	    	 console.log(imageHeadPath);
	    	 console.log(imageListpath);
	    	 
    		if(!hos_name){
    		    alert("请输入医院名称！");
    			return false;
    		}
    		if(!detail_address){
    		    alert("请输入详细地址！");
    			return false;
    		}
    		if(!hos_specialist){
    		    alert("请输入医院专科！");
    			return false;
    		}
    		if(!hos_info){
    		    alert("请输入医院信息！");
    			return false;
    		}
    		
    		if(!$.isNumeric(reward)){
    			alert('您没有输入奖励，或输入的格式不正确');
    			return false;
    		}
    		
    		
    		if(!/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(bed_num)||!bed_num){
    		    alert("请输入床位数！");
    			return false;
    		}
    		
    		if(!token){
    		    alert("非法提交！");
    			return false;
    		}
    		
    		if(actionType == 'add'){
    			hosInfo_id='';
    		}
    		
    		//判断权重，在0---1之间
    		var reg =/^(0(.\d+)?|1(\.0+)?)$/;
    		if(!reg.test(weight)){
    			alert("权重只允许0~1之间的数");
    			return false;
    		}
    		
    		//判断一下图片个数
    		var headLen=$('.upHead').find('.imgUnit').length;
    		if(headLen<1){
    			alert('您没有上传头像，请上传！');
    			return false;
    		}
    		var listLen=$('.upPhotos').find('.imgUnit').length;
    		if(listLen<1){
    			alert('您没有上传图片集，请上传！');
    			return false;
    		}
    		
    		if(actionType=='add'){
    			var questURL = runParams.mainUrl+'addKfHospital.do';
    		}else if(actionType=='edit'){
    			var questURL = runParams.mainUrl+'editKfHospital.do';
    		};
    		
    		
    		
    		
    		var questArr = {
    			name:hos_name,
    			address:detail_address,
    			departments:hos_specialist,
    	    	pss:pss,
    	    	intro:hos_info,
    	    	bednumber:bed_num,
    	    	image:imageHeadPath,//头像都路径
    	    	pictures:imageListpath,//图片集路径
    	    	weight:weight,
    	    	reward:reward,
    			token:token,
    			
    			operate:operate,
    			financial:financial,
    			maintain_info:maintain_info
    		};
    		$.post(questURL,questArr,function(result){
    			if(result==1){
    				alert("添加成功");
    				location.reload();
    			}else if(result == 2){
    				alert('请填写详细地址！');
    				return false; 
    			}
    			else{
    				alert('添加失败！');
    				return false; 
    			}
    		});
    	}
    	
    	//点击修改链接
    	$('.editHosInfo').click(function(){
    		initModal();
    	    var id = $(this).attr('data-id');
    	    $('#adminModal input[name="actionType"]').val('edit');
    	    commen(id,'edit');
    	});
    	
    	//查看详情
    	$('.detailHosInfo').on('click',function(){
    		initModal();
    		//隐藏确认按钮
			$('#adminModal #doSubmit').hide();
			//让所有输入框变成只读的
			$('#adminModal input,#adminModal textarea').attr("style","cursor:not-allowed !important;");
			$('#adminModal input,#adminModal textarea').attr({
				"readonly":"readonly"
			})
			//让checkbox和radio变成不可选
			$("input[type='checkbox'],input[type='radio']").attr('disabled',true);
			
    		var id=$(this).attr('data-id');
    		commen(id,'detail');
		});
    	
    	//展示详情或点击编辑时所显示的
    	function commen(id,x){
    		if(!id){
    		    alert("未找到该数据！");
    			return false;
    		}
    		
    		var token=$('input[name="token"]').val();
    		//根据id获取这条数据
    		var questURL = runParams.mainUrl+'getHosInfoById.do';
    		var questArr = {
    			hosInfo_id:id,
    			token:token
    		};
    		
    		
    		$.post(questURL,questArr,function(result){
    			//eval
    			if(result.status){
    				
    				$('#adminModal input[name="hosInfo_id"]').val(result.data.hosInfo_id);
    	     	    $('#adminModal input[name="hos_name"]').val(result.data.hos_name);
    	     	    $('#adminModal input[name="detail_address"]').val(result.data.detail_address);
    	     	    $('#adminModal input[name="pss"][value="'+result.data.pss+'"]').attr('checked',true);
    	     		$('#adminModal input[name="hos_specialist"]').val(result.data.hos_specialist);
    	     		$('#adminModal textarea[name="hos_info"]').val(result.data.hos_info);
    	      	    $('#adminModal input[name="bed_num"]').val(result.data.bed_num);
    	      	    $('#adminModal input[name="weight"]').val(result.data.weight);
    	      	    $('#adminModal input[name="reward"]').val(result.data.reward);
    	      	    
    	      	//三个维护人
    	      	    $('#adminModal input[name="financial"]').val(result.data.financial);
    	      	    $('#adminModal input[name="maintain_info"]').val(result.data.maintain_info);
    	      	    $('#adminModal input[name="operate"]').val(result.data.operate);
    	      	     var imgType=$('#adminModal .pictureImg ').attr('data-type');
    	      	     var img=result.data.image;
    	      	     var pictures=result.data.pictures;
    	      	  
    	      		
    	     		//var img={"large":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknKmAfL2ZAACEvuHp70s246.png","small":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknKqAE0CUAAB7CsfHFtE273.png","middle":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknKmAUIbKAACEvuHp70s745.png","fileName":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknKqASuMJAACLaL90sl4680.png"};
    	       	   // var pictures=[{"large":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAA_TsAAAHovs1tHw870.png","small":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAM0N_AAAHovs1tHw506.png","middle":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAcZbrAAAHovs1tHw675.png","fileName":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAR34nAAAM3zZuuQc079.png"},{"large":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSADxBUAAARQuzv2YA056.png","small":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAEdE2AAARQuzv2YA257.png","middle":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAFSsdAAARQuzv2YA898.png","fileName":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSARXqgAAAhOyYylsI505.png"},{"large":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAR_mpAAB6z808Khg876.png","small":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFWAFNr3AAB6z808Khg415.png","middle":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAX0CEAAB6z808Khg011.png","fileName":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFWANIQ8AAB2cxQCp1A508.png"},{"large":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAPCiCAABBbQwEBww373.png","small":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAUXT2AABBbQwEBww112.png","middle":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAZMx_AABBbQwEBww562.png","fileName":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFWAftpmAABIYQqdRgc070.png"},{"large":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFSAA2AmAABvlJWrUmc732.png","small":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFWAbll3AABvlJWrUmc744.png","middle":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFWADynlAABvlJWrUmc157.png","fileName":"http://test.holier.cn:8087/group1/M00/01/24/cte-ilfknFWAZKDQAABpVdvDXKM481.png"}];
    	       	   
    	       	    var path;
    	       	    if(img != ''){
    	 	      	    path=img;
    	 	      	    var addImg=$('#adminModal .upHead').find('.addImg');
    	 	      	    var flag='upHead';
    	 	      	    if(x=='detail'){//如果是详情
    	 	      	    	addImg.hide();
    	 	      	    };
    	       	    	showImg(path,addImg,flag);
    	       	    	if($('#adminModal .upHead .imgUnit').length>=1){
    	      	    		addImg.hide();
    	    	      	};
    	       	    };
    	       	    
    	 	      	  if(pictures != ''){
    	 		      	    path=pictures;
    	 		      	    var addImg=$('#adminModal .upPhotos').find('.addImg');
    	 		      	    if(x=='detail'){//如果是详情
    	 		      	    	addImg.hide();
    	 		      	    };
    	 		      	    var flag='upPhotos';
    	 	    	    	showImg(path,addImg,flag);
    	 	    	  };
    	 	      	  
    	 	      	  function showImg(path,addImg,flag){
    	 	      		    //path=eval("("+path+")");
    	 	    	    	if(flag=="upHead"){
    	 	    	    		if(x=='edit'){
    	 		      	    		addImg.before('<div class="imgUnit"><input type="hidden" name="savePath" data-fileName="'+path.fileName+'" data-large="'+path.large+'" data-middle="'+path.middle+'"  data-small="'+path.small+'"><a href="'+path.fileName+'" target="_blank"><img src="'+path.middle+'"></a><a href="javascript:void(0)" class="delete" data-path="'+path.fileName+'">删除</a></div>');
    	 		    	      	}else{
    	 		    	      	    addImg.before('<div class="imgUnit"><input type="hidden" name="savePath" data-fileName="'+path.fileName+'" data-large="'+path.large+'" data-middle="'+path.middle+'"  data-small="'+path.small+'"><a href="'+path.fileName+'" target="_blank"><img src="'+path.middle+'"></a></div>');
    	 		    	      	 }
    	 	    	    	}else{
    	 	    	    		for(var i=0;i<path.length;i++){
    	 	    	    			if(x=='edit'){
    	 	  	      	    		addImg.before('<div class="imgUnit"><input type="hidden" name="savePath" data-fileName="'+path[i].fileName+'" data-large="'+path[i].large+'" data-middle="'+path[i].middle+'"  data-small="'+path[i].small+'"><a href="'+path[i].fileName+'" target="_blank"><img src="'+path[i].middle+'"></a><a href="javascript:void(0)" class="delete" data-path="'+path[i].fileName+'">删除</a></div>');
    	 		      	      	    }else{
    	 		      	      	    	addImg.before('<div class="imgUnit"><input type="hidden" name="savePath" data-fileName="'+path[i].fileName+'" data-large="'+path[i].large+'" data-middle="'+path[i].middle+'"  data-small="'+path[i].small+'"><a href="'+path[i].fileName+'" target="_blank"><img src="'+path[i].middle+'"></a></div>');
    	 		      	      	    };
    	 	    	    			
    	 	  	      	        };
    	 	    	    	};
    	 	    	    	 
    	 	    	    };
    	      	   
            		$('#adminModal').modal();
    			}else{
    				alert("未找到该元素！");
    			    return false;
    			}
    		});
    		
    		
    	}
	});
	/*图片------------------------------------------------------------------*/
	//初始化
	$(function(){
		
		
		
		if(typeof FileReader == "undified"||!window.FormData) {
			alert("您老的浏览器不行了！");
		}
		var imgUploadList = [];
		var imgPathJsonData = [];
		var currentImgPage = '';
		var type='';
		$('.addImg').live('click',function(){
			//获取到目标id
			var checkUpId = $(this).attr('data-id');
			$('#addImageModal input[name="e_checkUpId"]').val(checkUpId);
			$('.imgList tbody').html('');
			currentImgPage = $(this);
			//查看是一个图片  还是多个图片
			type=$(this).attr('data-type');
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
		//把图片放在模态框上
		$('input[name="upd_image_init"]').live('change',function(){
			imgUploadList = [];
			imgPathJsonData = [];
			$('.dofileUpload').attr('disabled',false).html("上传图片");
			$('input[name="imagepath"]').val("");
			$('#addImageModal .close').show();
			$('#addImageModal').modal();
			var len = this.files.length;
			$('body').css('overflow','hidden');
	       	$('#adminModal').css('overflow','scroll');
			if(type=="upHead"){
				if(len>1){
					alert("你此时要上传的是头像,只能上传一张，请重新上传！");
					$('#addImageModal').modal('hide');
					return false;
				}
				
			}
			
			/*else if(type=="upPhotos"){
				//获取一下当前图片的长度
				var ylen=$('.upPhotos .imgUnit').length;
				if((ylen+len)>5){
					alert("上传的总图片数超过了五个");
					$('#addImageModal').modal('hide');
					return false;
				}
			}
			
			*/
			
			
			/*判断img*/
			
			for(var i=0;i<len;i++){
				imgUploadList.push(i);
				var resultFile = this.files[i];
				
				pdSize(resultFile,type,i)
				
				
				/*
				
				if (resultFile) {
					var size = parseInt(resultFile.size/1024,10)+'&nbsp;KB';
					$('.imgList tbody').html($('.imgList tbody').html()+'<tr><td class="td1">'+resultFile.name+'</td><td>'+size+'</td><td>'+resultFile.type+'</td><td><a href="javascript:void(0)" data-id="'+i+'" class="glyphicon glyphicon-picture"></a></td><td><a href="javascript:void(0)" data-listid="'+i+'" class="deleteFile"><span class="glyphicon glyphicon-remove"></span>&nbsp;移除</a></td></tr>');
				}
				*/
			}
			
		});
		
		function pdSize(resultFile,type,i){
			/*判断图片的尺寸*/
			var reader = new FileReader();
			//alert(resultFile.name);
				reader.readAsDataURL(resultFile);
				reader.onload = function(e) {
					
					var img = new Image();
					img.src = this.result;
					img.onload = function() {
						
						if(type=="upHead"){
							
							if((img.width/img.height == 5/4) && resultFile){
								$('#addImageModal').show();
								var size = parseInt(resultFile.size/1024,10)+'&nbsp;KB';
								
								$('.imgList tbody').html($('.imgList tbody').html()+'<tr><td class="td1">'+resultFile.name+'</td><td>'+size+'</td><td>'+resultFile.type+'</td><td><a href="javascript:void(0)" data-id="'+i+'" class="glyphicon glyphicon-picture"></a></td><td><a href="javascript:void(0)" data-listid="'+i+'" class="deleteFile"><span class="glyphicon glyphicon-remove"></span>&nbsp;移除</a></td></tr>');
								
							}else{
								alert('您此时上传的是康复医院的头像，头像宽高比例为5：4，请重新选择图片！');
								$('#addImageModal').hide();
								return false;
							}
							
							
						}else if(type=="upPhotos"){
							
							if((img.width/img.height == 3/1) && resultFile){
								$('#addImageModal').show();
								var size = parseInt(resultFile.size/1024,10)+'&nbsp;KB';
								
								$('.imgList tbody').html($('.imgList tbody').html()+'<tr><td class="td1">'+resultFile.name+'</td><td>'+size+'</td><td>'+resultFile.type+'</td><td><a href="javascript:void(0)" data-id="'+i+'" class="glyphicon glyphicon-picture"></a></td><td><a href="javascript:void(0)" data-listid="'+i+'" class="deleteFile"><span class="glyphicon glyphicon-remove"></span>&nbsp;移除</a></td></tr>');
							}else {
								alert('您此时上传的是康复医院的图集，头像宽高比例为3：1，请重新选择图片！');
								$('#addImageModal').hide();
								return false;
							}
							
						}
						
						
					}
				};
			
		}
		
		//点击上传图片
		$('.dofileUpload').click(function(){
			if(imgUploadList.length==0){
				alert('请选择图片！');
				return false;
			}
			$('.dofileUpload').attr('disabled',true);
			$('#addImageModal .close').hide();
			var len = document.getElementById("upd_image_init").files.length; //代表一开始上传的
			//imgUploadList.length:最终文件的长度
			
			
			for(var i=0;i<len;i++){
				if($.inArray(i,imgUploadList)>=0){//确定元素在数组中的位置，如果没找到返回-1；
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
									currentImgPage.before('<div class="imgUnit"><input type="hidden" name="savePath" data-fileName="'+result.data.fileName+'" data-large="'+result.data.large+'" data-middle="'+result.data.middle+'"  data-small="'+result.data.small+'"><a href="'+result.data.fileName+'" target="_blank"><img src="'+result.data.middle+'"></a><a href="javascript:void(0)" class="delete" data-path="'+result.data.fileName+'">删除</a></div>');
									var imgPathArr = {
										"fileName":result.data.fileName,
										"large":result.data.large,
										"middle":result.data.middle,
										"small":result.data.small
									}
									imgPathJsonData.push(imgPathArr);
									
									
									$('#addImageModal').modal('hide');
								}else{
									$('a[data-listid="'+result.data.listId+'"]').parent('td').html('上传失败');	
								}
								imgUploadList.splice($.inArray(result.data.listId,imgUploadList),1);//删除从index开始的1个元素
								//把文件从imgUploadList全部删除完毕
								//全部上传完毕
								if(imgUploadList.length==0){
									
									$('.dofileUpload').html("全部图片已上传完毕，正在提交数据...");
									$('#addImageModal .close').show();
									$('.dofileUpload').html("上传成功！");
									$('#addImageModal').modal('hide');
									$('body').css('overflow','hidden');
							       	$('#adminModal').css('overflow','scroll');
							       	
							       	var len1=$('.upHead .imgUnit').length;
									if(len1>=1){
										$('.upHead').find('.addImg').hide();
									}
									
									var len2=$('.upPhotos .imgUnit').length;
									/*
									if(len2>=5){
										$('.upPhotos').find('.addImg').hide();
									}
							        */
								}
								
							}
						});
					}
				}
			}
			
			
			
		});
		
		//把上传的图片放大
		$('.imgList .glyphicon-picture').live('click',function(){
		    var id = parseInt($(this).attr('data-id'),10);//按10进制进行解析字符串
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
		//删除某张图片
		$('.imgUnit .delete').live('click',function(){
			if(confirm('确定要删除这张图片吗？')){
				var imagepath = $(this).attr('data-path');
				var targetObj = $(this).parent('.imgUnit');
				targetObj.remove();
				var ListLen=$('.upPhotos').find('.imgUnit').length;
				if(ListLen<5){
					$('.upPhotos').find('.addImg').show();
				}
				var headLen=$('.upHead').find('.imgUnit').length;
				if(headLen<1){
					$('.upHead').find('.addImg').show();
				}
			}
		});
		
		
		$('#addImageModal').on('hide.bs.modal', function () {
			$('.upd_image_init').empty();
			$('.upd_image_init').html('<input type="file" name="upd_image_init" id="upd_image_init" multiple/>');
		})
		
    	//删除
    	$(".deleteHosInfo").click(function(){
    		var id = $(this).attr('data-id');
    		var token=$('input[name="token"]').val();
    		var name = $(this).parent().parent('tr').children('td:eq(0)').html();
    	    if(confirm('确定要把产品“'+name+'"从列表中删除吗？')){
    	    	//****删除后这个产品后面具体哪周定义的次数都要删除
				var questURL = runParams.mainUrl+'deleteKfHospital.do';
				var questArr = {hospital_id:id,token:token};
				$.get(questURL,questArr,function(result){
					if(result==1){
						alert('删除成功！');
						location.reload();
					}else{
						alert('删除失败！');
						return false;
					}
				});
    		}
    	});
		
		
		
		
    });
	
	
	
	
	</script>
</body>
</html>