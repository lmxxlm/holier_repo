<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多个图片上传</title>
    <!--引用jquery-->
    <script src="assets/library/jquery/jquery.min.js"></script>
    <style>  
	body{ padding:0; margin:0;}
	.imgList img{ width:100px; height:100px; margin-right:10px;}
    </style>
</head>
<body>
    <input type="file" name="upd_image_init" id="upd_image_init" multiple="multiple"/>
    <input type="button" value="上传" name="submit"/>
    <div class="upd_info"></div>
    <div class="imgList"></div>
    <input type="text" value="" name="imagepath" />
    <script language="javascript">
    if(typeof FileReader == "undified"||!window.FormData) {
        alert("您老的浏览器不行了！");
    }
    $('input[name="upd_image_init"]').change(function(){
    	var len = document.getElementById("upd_image_init").files.length;
    	for(var i=0;i<len;i++){
    		var resultFile = document.getElementById("upd_image_init").files[i];
            if (resultFile) {    
                var reader = new FileReader();
                reader.readAsDataURL(resultFile);
                reader.onload = function(e) {
                    var urlData = this.result;
                    $('.imgList').html($('.imgList').html()+"<div><img src='" + urlData + "' alt='" + resultFile.name + "' data-/><span></span></div>");
                };
            }
    	}
	});
    $('input[name="submit"]').click(function(){
    	var len = document.getElementById("upd_image_init").files.length;  
    	for(var i=0;i<len;i++){
    		var resultFile = document.getElementById("upd_image_init").files[i];
            if (resultFile) {
            	var fd = new FormData();
            	fd.append('upd_image', resultFile);
            	$.ajax({
            	    url:"__URL__/imageCut.do",
            	    type:"POST",
            	    processData: false,// 告诉jQuery不要去处理发送的数据
                    contentType: false,// 告诉jQuery不要去设置Content-Type请求头
            	    data:fd,
            	    success:function(result){
            	    	result = eval("("+result+")");
            	    	alert(result.status);
            	    	$('input[name="imagepath"]').val($('input[name="imagepath"]').val()+result.data+',');
            		    $('.imgList').html($('.imgList').html()+'<a href="'+result.data+'" target="_blank"><img src="'+result.data+'"></a>');
            	    }
            	});
            }
        }
    });
    </script>
</body>
</html>
