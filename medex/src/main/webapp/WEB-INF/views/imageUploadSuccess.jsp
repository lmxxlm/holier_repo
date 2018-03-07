<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<body>
<input type="hidden" value="${fileName}"  name="filePath">
</body>
<script src="../assets/library/jquery/jquery.min.js"></script>
<script>
    var fileName = $('input[name="filePath"]').val();
    if(fileName != ""){
        $('input[name="imagepath"]',window.parent.document).val($('input[name="imagepath"]',window.parent.document).val()+fileName+',');
	    $('.imgList',window.parent.document).html($('.imgList',window.parent.document).html()+'<a href="'+fileName+'" target="_blank"><img src="'+fileName+'"></a>');
	}else{
		var index = $('input[name="uploaded"][value="1"]',window.parent.document).length+1;
    	$('.upd_info',window.parent.document).html('第'+index+'张图片已略过');
	}
    var pre_obj = $('input[name="currentFile"][value="1"]',window.parent.document);
    pre_obj.val(0);
    pre_obj.next('input[name="uploaded"]').val(1);
    var next_obj = pre_obj.parent('form').next('form');
    if(next_obj.children('input[name="currentFile"]').val()==0){
    	//还有未上传的图片
    	next_obj.children('input[name="currentFile"]').val(1);
    	var index = $('input[name="uploaded"][value="1"]',window.parent.document).length+1;
    	$('.upd_info',window.parent.document).html('正在上传第'+index+'张图片...');
    	next_obj.submit();
    }else{
        //传完了
    	$('.upd_info',window.parent.document).html('所有图片都已传完。');
    }
</script>
</head>
</html>