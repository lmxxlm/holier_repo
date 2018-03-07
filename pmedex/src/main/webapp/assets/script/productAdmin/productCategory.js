$(function(){
	function initModal(){
	    $('#adminModal input[name="productCategoryName"]').val('');
		$('#adminModal input[name="isValid"][value="1"]').attr('checked',true);
		$('#adminModal input[name="actionType"]').val('');
	}
	//点击添加按钮
	$('.addPat button').click(function(){
		initModal();
		$('#adminModal input[name="actionType"]').val('add');
	    $('#adminModal').modal();
	});
	//点击修改链接
	$('.editProductCategory').click(function(){
	    var id = $(this).attr('data-id');
		if(!id){
		    alert("未找到该产品分类！");
			return false;
		}
		//根据id获取这条数据
		var questURL = runParams.mainUrl+'getProductCategoryById.do';
		var questArr = {
			id:id
		};
		$.post(questURL,questArr,function(result){
			result = eval("("+result+")");   
			if(1==result.status){
				$('#adminModal input[name="productCategoryName"]').val(result.data.name);
		        $('#adminModal input[name="isValid"][value="'+result.data.isValid+'"]').attr('checked',true);
				$('#adminModal input[name="productCategoryId"]').val(result.data.id);
		        $('#adminModal input[name="actionType"]').val('edit');
				$('#adminModal').modal();
			}else{  
				alert("未找到该产品分类！");
			    return false;
			}
		});
	});
	//点击提交
	$('#doSubmit').click(function(){
	    var actionType = $('#adminModal input[name="actionType"]').val();
		if(actionType == 'add'){ doAdd(); }
		if(actionType == 'edit'){ doEdit(); }
	});
	//添加逻辑
	function doAdd(){
	    var productCategoryName = $('#adminModal input[name="productCategoryName"]').val();
		var isValid = $('#adminModal input[name="isValid"]:checked').val();
		var token = $('input[name="token"]').val();
		var creater = $('input[name="currentUserName"]').val();
		if(!productCategoryName){
		    alert("请输入产品分类名称！");
			return false;
		}
		if(!token){
		    alert("非法提交！");
			return false;
		}
		//判断重名
		var questURL = runParams.mainUrl+'getProductCategoryByName.do';
		var questArr = {
			name:productCategoryName
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert("该产品分类已经存在，请重新填写！");
			    return false;
			}else{
				var questURL = runParams.mainUrl+'addProductCategory.do';
				var questArr = {
					name:productCategoryName,
					isValid:isValid,  
					token:token,
					creater:creater
				};
				$.post(questURL,questArr,function(result){
					if(1==result){  
						location.reload();
					}else{
						alert('添加失败！');
						return false;
					}
				});
			}
		});
	}
	//修改逻辑
	function doEdit(){
		var id = $('#adminModal input[name="productCategoryId"]').val();
	    var productCategoryName = $('#adminModal input[name="productCategoryName"]').val();
		var isValid = $('#adminModal input[name="isValid"]:checked').val();
		var token = $('input[name="token"]').val();
		if(!id){
		    alert("未找到该产品分类！");
			return false;
		}
		if(!productCategoryName){
		    alert("请输入产品分类名称！");
			return false;
		}
		if(!token){
		    alert("非法提交！");
			return false;
		}
		//判断数据库中除了当前id的记录中是否有重名的记录
		var questURL = runParams.mainUrl+'getProductCategoryByNameForUpdate.do';
		var questArr = {
			id:id,
			name:productCategoryName
		};
		$.post(questURL,questArr,function(result){  
			if(1==result){
				alert("该产品分类已经存在，请重新填写！");
			    return false;
			}else{
				var questURL = runParams.mainUrl+'editProductCategory.do';
				var questArr = {
					id:id,
					name:productCategoryName,
					isValid:isValid,
					token:token
				};
				$.post(questURL,questArr,function(result){
					if(1==result){
						location.reload();
					}else{
						alert('修改失败！');
						return false;
					}
				});
			}
		});
	}
	//删除
	$(".deleteProductCategory").click(function(){
		var id = $(this).attr('data-id');
		var name = $(this).parent().parent('tr').children('td:eq(0)').html();
		var token = $('input[name="token"]').val();
	    if(confirm('确定要把分类“'+name+'"从列表中删除吗？')){
			//查找该分类下是否已经有产品
			var questURL = runParams.mainUrl+'fineProductByCategoryId.do';
			var questArr = {id:id};
			$.get(questURL,questArr,function(result){
				if(1==result){
					alert('已经有产品使用该分类，请先删除该分类下的产品！');
					return false;
				}else{
					var questURL = runParams.mainUrl+'deleteProductCategory.do';
					var questArr = {
							id:id,
							token:token
							};
					$.get(questURL,questArr,function(result){
						if(1==result){
							alert('删除成功！');  
							location.reload();
						}else{
							alert('删除失败！');
							return false;
						}
					});
				}
			});
		}
	});
});