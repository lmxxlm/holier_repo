
	$(function(){
		
		//（1）初始化
		function initModal(){
			
			 $('#docModal #docModalLabel').html("新增名医信息");
			 $('#docModal input[name="name"]').attr("disabled",false);
			 $('#docModal input[name="name"]').removeClass("wid"); 
			    
			$('#docModal input[name="accountId"]').val('');
		    $('#docModal input[name="name"]').val('');
		    $('#docModal input[name="referDepartments"]').val('');
		    $('#docModal input[name="patNumber"]').val('');
		    $('#docModal input[name="good"]').val('');
		    
		    $('.fileUploadUnit img').attr("src","assets/image/medex/imgUpload.gif");
		    $('.fileUploadUnit a').attr("href","assets/image/medex/imgUpload.gif");
		    $('.fileUploadUnit button').html("上传头像");
		    $('.fileUploadUnit button').attr('disabled',false);
		    
		    $('.fileUploadUnit input[name="urlImage"]').attr("data-fileName","");
		    $('.fileUploadUnit input[name="urlImage"]').attr("data-large","");
		    $('.fileUploadUnit input[name="urlImage"]').attr("data-small","");
		    $('.fileUploadUnit input[name="urlImage"]').attr("data-middle","");
		    
		    $('.fileUploadUnit input[name="urlImageIos"]').attr("data-fileName","");
		    $('.fileUploadUnit input[name="urlImageIos"]').attr("data-large","");
		    $('.fileUploadUnit input[name="urlImageIos"]').attr("data-small","");
		    $('.fileUploadUnit input[name="urlImageIos"]').attr("data-middle","");
		    
		}
		
		
		//（2）点击新增按钮
		$('.addPat button').live('click',function(){
			
			initModal();
			$('#docModal input[name="actionType"]').val('add');
		    $('#docModal').modal();
		});
		
		//添加逻辑
		function doAdd(){
			var accountId=$('#docModal input[name="accountId"]').val();
			var name=$('#docModal input[name="name"]').val();
			var recommed=$('input[name="recommed"]').val();
			var referDepartments=$('#docModal input[name="referDepartments"]').val();
			var patNumber=$('#docModal input[name="patNumber"]').val();
			var good=$('#docModal input[name="good"]').val();
			var token=$('#docModal input[name="token"]').val();
			
			var fileName=$('.fileUploadUnit input[name="urlImage"]').attr("data-fileName");
		    var large=$('.fileUploadUnit input[name="urlImage"]').attr("data-large");
		    var small=$('.fileUploadUnit input[name="urlImage"]').attr("data-small");
		    var middle=$('.fileUploadUnit input[name="urlImage"]').attr("data-middle");
		    
		    var iFileName=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-fileName");
		    var iLarge=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-large");
		    var iSmall=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-small");
		    var iMiddle=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-middle");
		    
		    var androidImg=$('.fileUploadUnit .androidImg').attr("src");
		    var iosImg=$('.fileUploadUnit .iosImg').attr("src");
		   
			if(!name){
				alert("请添加医生姓名！");
				return false;
			}
			
			if(!token){
				alert("页面过期！");
				return false;
			}
			
			if(!referDepartments){
				alert("请填写科室！");
				return false;
			}
			
			if(!patNumber){
				alert("请填写服务患者个数！");
				return false;
			}
			
			if(!good){
				alert("请填写该医生的爱好！");
				return false;
			}
			
			if(!androidImg){
				alert("没有上传安卓图片");
				return false;
			}
			
			if(!iosImg){
				alert("没有上传ios图片");
				return false;
			}
			//首先先判断该订单是否存在
			var questURL = runParams.mainUrl+'weekHot_search_ById.do';
			var questArr={
				accountId:accountId,
				token,token
			};
			$.post(questURL,questArr,function(result){
				if(result==1){
					alert("该数据已存在，不得重复提交！");
					return false;
				}else{
					var questURL = runParams.mainUrl+'WeekHot_doctor_add.do';
					
					var picData = [{
						fileName:fileName,
						large:large,
						middle:middle,
						small:small,
						iFileName:iFileName,
						iLarge:iLarge,
						iMiddle:iMiddle,
						iSmall:iSmall
					}]
					var pics = JSON.stringify(picData);
					var questArr = {
							pics:pics,
				    		accountId:accountId,
				    		name:name,
				    		token:token,
				    		recommed:recommed,
				    		department:referDepartments,
				    		service_count:patNumber,
				    		specialties:good
				    };
				    $.post(questURL,questArr,function(result){
						if(result==1){
							alert("添加成功")
							location.reload();
						}else{
							alert('添加失败！');
							return false;
						}
					});
				}
			});
			
		}
		
		//（3）添加或修改进行提交：点击提交
		$('#addDoc').click(function(){
		    var actionType = $('#docModal input[name="actionType"]').val();
			if(actionType == 'add'){doAdd();}
			if(actionType == 'edit'){doEdit(); }
		});
		
		 //判断上传图片时浏览器
		if (typeof FileReader == "undified" || !window.FormData) {
			alert("您的浏览器该换了！");
		}
		
		//点击上传图片
		$('.fileUploadUnit button').click(function(){
				var obj=$(this).parents('.fileUploadUnit');
				obj.find('.upd_image_init').empty();
				obj.find('.upd_image_init').html('<input type="file" name="upd_image_init" id="upd_image_init"/>');
				obj.find('input[name="upd_image_init"]').click();
	   });
		
		//上传图片之前进行验证
		function beforeUpload(resultFile){
			//var resultFile = document.getElementById("upd_image_init").files[0];
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
			if (size >= 1) {
				alert('图片大小应控制在1M以内！');
				return false;
			}
			if (size >= 5) {
				alert('图片大小应控制在5M以内！');
				return false;
			}
			return true;
		}
		
		//正式上传
		$('input[name="upd_image_init"]').live('change',function(){//不能用bind  live始终都能用的   常驻状态   全局
			var obj=$(this).parents('.fileUploadUnit');
		   // var resultFile=document.getElementById("upd_image_init");
			var	resultFile = this.files[0];//  ----  this 与 $(this) 的 具体区别 
			if(beforeUpload(resultFile)){
				var reader = new FileReader();
				reader.readAsDataURL(resultFile);
				reader.onload=function(e){
					var img=new Image();
					img.src=this.result;
					img.onload=function(){
						var fd = new FormData();
						fd.append('upd_image', resultFile);
						fd.append('listId', 0);
						$.ajax({
							//url:"${mainUrl}__URL__/imageCut.do",
							url:runParams.mainUrl+'__URL__/imageCut.do',
							type : "POST",
							processData : false,// 告诉jQuery不要去处理发送的数据
							contentType : false,// 告诉jQuery不要去设置Content-Type请求头
							data : fd,
							beforeSend:function(){
								obj.find('button').attr('disabled',true).html('上传中..');//?
								return;
							},
							success:function(result){
								result = eval("("+result+")");
								if(result.status==1){
									obj.find('img').attr("src",result.data.large);
									obj.children('a').attr("href",result.data.fileName);
									obj.find('button').attr('disabled',false).html('上传完毕');
									var imgPathArr = {
											"fileName" : result.data.fileName,
											"large" : result.data.large,
											"middle" : result.data.middle,
											"small" : result.data.small
										}
									var dataType=obj.find('button').attr('data-type');
									if(dataType=="android"){
										obj.find('input[name="urlImage"]').attr({
											"data-fileName":result.data.fileName,
											"data-large":result.data.large,
											"data-middle":result.data.middle,
											"data-small":result.data.small
										});
										
									}else{
										obj.find('input[name="urlImageIos"]').attr({
											"data-fileName":result.data.fileName,
											"data-large":result.data.large,
											"data-middle":result.data.middle,
											"data-small":result.data.small
										});
										
									}
								}else {
									$('.fileUploadUnit button').attr('disabled',false).html('上传头像');
									  alert('上传图像失败！');
									  return false;
								}
								
							}
						});
					}
				}
			}
		});
		
		//医生智能搜索
		$('.searchResultForDoctor').parent().find('.form-control').keyup(function(){
			var obj = $(this);
		    var searchVar = $(this).val();
			var questURL = runParams.mainUrl+'searchDoctorByNameLimit10.do';
			var questArr = {
				searchVar:searchVar
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					var con = result.data;
					var htmlstr = '';
					for(var i=0;i<con.length;i++){
					 // htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span></a></li>';
					  htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].referHospital+'&nbsp;—&nbsp;'+con[i].referDepartments+'&nbsp;—&nbsp;'+con[i].doctorTitle+'</i></a></li>';
					}
					obj.parent().siblings('.searchResultForDoctor').html(htmlstr).show();
				}else{
					obj.parent().siblings('.searchResultForDoctor').hide();
				}
			});
		});
		$(function(){
			$(".searchResultForDoctor li a").live('click',function(){
				var p_obj = $(this).parents('.searchResultForDoctor');
				p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
				p_obj.parent().find('input[name="accountId"]').val($(this).attr("data-docid"));
				p_obj.hide();
			});
		});	
		
		
		//（4）删除：点击进行删除
		$(".delete").live('click',function(){
			var id = $(this).attr('data-id');
			var token = $('.searchForm input[name="token"]').val();
		    if(confirm("你确定要删除该条数据么？")){
		    	var questURL = runParams.mainUrl+'deleteWeekHotById.do';//需要改的
				var questArr = {
						accountId:id,
						token:token
						};
				$.post(questURL,questArr,function(result){
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
		//根据医生姓名进行搜索
		$("#searchDocName").click(function(){
			var searchText=$('input[name="searchText"]').val();
			var token=$('.searchForm input[name="token"]').val();
		    var questURL=runParams.mainUrl+'WeekHotByDocName1.do';
		    var questArr={
		    	searchText:searchText,
		    	token:token
		    }
		    $.post(questURL,questArr,function(result){
		    	$('.searchForm input[name="token"]').val(result.token);
		    	$('#docModal input[name="token"]').val(result.token);
		    	if(result.status==1){
		    		$('.table tr:not(:first)').html("");
		    		
		    		if(result.nopage==true){
		    			$('.pager').css("display","none");
		    		}
		    		var con = result.data;
		    		var appendStr='';
					for(var i=0;i<con.length;i++){//要增加其可读性
						appendStr+='<tr>';
						appendStr+='    <td>';
						if(!con[i].web_small){
							appendStr+='    <img src="assets/image/medex/imgUpload.gif"  style="width:50px;">';
						}else{
							appendStr+='    <a href="'+con[i].web_ori+'"  target="_blank"><img src="'+con[i].web_small+'" id="Toux" style="width:50px;"></a>';
						}
						appendStr+='    </td>';
						appendStr+='    <td>'+con[i].name+'</td>';
						appendStr+='    <td>'+con[i].accountId+'</td>';
						appendStr+='    <td>'+con[i].department+'</td>';
						appendStr+='    <td>'+con[i].service_count+'</td>';
						appendStr+='    <td>';
						for(var j=0;j<=con[i].specialties.length;j++){
							appendStr+=con[i].specialties[j];
						}
						appendStr+='    </td>';
						appendStr+='    <td class="td1" ><a href="javascript:void(0)" data-id="'+con[i].accountId+'" data-name="'+con[i].name+'" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;<a href="javascript:void(0)" data-id="'+con[i].accountId+'" class="delete"><span class="glyphicon glyphicon-remove"></span>删除</a></td>';
						appendStr+='    <td class="td2" style="text-align:center;">';
						if(con[i].recommed==1){
							appendStr+='    <input type="checkbox" name="HLYService"   value="1"  data-recommed="'+con[i].recommed+'" checked="checked"  data-name="'+con[i].name+'" data-id="'+con[i].accountId+'" >';
						}else{
							appendStr+='    <input type="checkbox" name="HLYService"   value="1"  data-recommed="'+con[i].recommed+'"   data-name="'+con[i].name+'" data-id="'+con[i].accountId+'" >';
						}
						appendStr+='        <input type="hidden" name="doctorId" value="'+con[i].accountId+'">';
						appendStr+='    </td>';
						appendStr+='</tr>';
						$('.table').append(appendStr);
						return;
					}
		    	}else{
		    		location.reload()
		    		return;
		    	}
		    });
		});
		
		//点击修改链接
		$('.edit').live('click',function(){
			$('#docModal input[name="actionType"]').val('edit');
			
			//变成不可编辑的
			$('#docModal #docModalLabel').html("修改名医信息");
			$('#docModal input[name="name"]').attr("disabled",true);
			$('#docModal input[name="name"]').addClass("wid"); 
			
			var token=$('#docModal input[name="token"]').val();
			var id=$(this).attr("data-id");
			var questURL=runParams.mainUrl+'hot_result_byId.do';
			var questArr={
					id:id,
					token:token
					}
			$.post(questURL,questArr,function(result){
				if(result.status==true){
					
					var result_str=eval(result.data.pics);
					
						$('#docModal input[name="name"]').val(result.data.name);
						$('#docModal input[name="referDepartments"]').val(result.data.department);
						$('#docModal input[name="patNumber"]').val(result.data.service_count);
						$('#docModal input[name="good"]').val(result.data.specialties);
						$('#docModal input[name="recommed"]').val(result.data.recommed);
						$('#docModal input[name="accountId"]').val(result.data.accountId);
						
						$('#docModal .androidImg').attr("src",result_str[0].small);
	   					$('#docModal .iosImg').attr("src",result_str[0].iSmall);
	   					$('#docModal .androidImg').parent().attr("href",result_str[0].fileName);
	   					$('#docModal .iosImg').parent().attr("href",result_str[0].iFileName);
	   					
	                      
	   					$('.fileUploadUnit input[name="urlImage"]').attr({
	   						"data-fileName":result_str[0].fileName,
	   						"data-large":result_str[0].large,
	   						"data-small":result_str[0].small,
	   						"data-middle":result_str[0].middle
	   					});
	   					$('.fileUploadUnit input[name="urlImageIos"]').attr({
	   						"data-fileName":result_str[0].iFileName,
	   						"data-large":result_str[0].iLarge,
	   						"data-small":result_str[0].iSmall,
	   						"data-middle":result_str[0].iMiddle
	   					});
				}
			});
			$('#docModal').modal();
		});
		//修改逻辑：（点击提交之后，进入后台的修改逻辑）
		function doEdit(){//必须要有fileName那么
			
			//commen();
			var accountId=$('#docModal input[name="accountId"]').val();
			var name=$('#docModal input[name="name"]').val();
			var recommed=$('input[name="recommed"]').val();
			var referDepartments=$('#docModal input[name="referDepartments"]').val();
			var patNumber=$('#docModal input[name="patNumber"]').val();
			var good=$('#docModal input[name="good"]').val();
			var token=$('#docModal input[name="token"]').val();
			
			var fileName=$('.fileUploadUnit input[name="urlImage"]').attr("data-fileName");
		    var large=$('.fileUploadUnit input[name="urlImage"]').attr("data-large");
		    var small=$('.fileUploadUnit input[name="urlImage"]').attr("data-small");
		    var middle=$('.fileUploadUnit input[name="urlImage"]').attr("data-middle");
		    
		    var iFileName=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-fileName");
		    var iLarge=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-large");
		    var iSmall=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-small");
		    var iMiddle=$('.fileUploadUnit input[name="urlImageIos"]').attr("data-middle");
		    
		    var androidImg=$('.fileUploadUnit .androidImg').attr("src");
		    var iosImg=$('.fileUploadUnit .iosImg').attr("src");
		   
			if(!name){
				alert("请添加医生姓名！");
				return false;
			}
			
			if(!token){
				alert("页面过期！");
				return false;
			}
			
			if(!referDepartments){
				alert("请填写科室！");
				return false;
			}
			
			if(!patNumber){
				alert("请填写服务患者个数！");
				return false;
			}
			
			if(!good){
				alert("请填写该医生的爱好！");
				return false;
			}
			
			if(!androidImg){
				alert("没有上传安卓图片");
				return false;
			}
			
			if(!iosImg){
				alert("没有上传ios图片");
				return false;
			}
			var questURL = runParams.mainUrl+'hot_update_byId.do';
			
			var picData = [{
				fileName:fileName,
				large:large,
				middle:middle,
				small:small,
				iFileName:iFileName,
				iLarge:iLarge,
				iMiddle:iMiddle,
				iSmall:iSmall
			}]
			var pics = JSON.stringify(picData);
			var questArr = {
					pics:pics,
		    		accountId:accountId,
		    		name:name,
		    		token:token,
		    		recommed:recommed,
		    		department:referDepartments,
		    		service_count:patNumber,
		    		specialties:good
		    };
			
		 $.post(questURL,questArr,function(result){
				if(result==1){
					alert("修改成功")
					location.reload();
				}else{
					alert('修改失败！');
					return false;
				}
			});
			
		}
		//分页共同
		function divPageCommen(questURL,questArr){
			$.post(questURL,questArr,function(result){
    			//如果有下一页的数据，先清空现有的table里的数据$('.table tr:not(:first)').html("");
    			if(result.status==true){//证明下一页存在数据
    				$('.table tr:not(:first)').html("");//出了第一行标头 ，剩下的清空
    				var con = result.data;
    				var appendStr='';
    				for(var i=0;i<con.length;i++){//要增加其可读性
    					appendStr+='<tr>';
    					appendStr+='    <td>';
    					if(!con[i].web_small){
    						appendStr+='    <img src="assets/image/medex/140-180.gif"  style="width:50px;">';
    					}else{
    						appendStr+='    <a href="'+con[i].web_ori+'"  target="_blank"><img src="'+con[i].web_small+'" id="Toux" style="width:50px;"></a>';
    					}
    					appendStr+='    </td>';
    					appendStr+='    <td>'+con[i].name+'</td>';
    					appendStr+='    <td>'+con[i].accountId+'</td>';
    					appendStr+='    <td>'+con[i].department+'</td>';
    					appendStr+='    <td>'+con[i].service_count+'</td>';
    					appendStr+='    <td>';
    					for(var j=0;j<=con[i].specialties.length;j++){
    						appendStr+=con[i].specialties[j];
    					}
    					appendStr+='    </td>';
    					appendStr+='    <td class="td1" ><a href="javascript:void(0)" data-name="'+con[i].name+'" data-id="'+con[i].accountId+'" class="edit"><span class="glyphicon glyphicon-edit"></span>修改</a>&nbsp;&nbsp;<a href="javascript:void(0)" data-id="'+con[i].accountId+'" class="delete"><span class="glyphicon glyphicon-remove"></span>删除</a></td>';
    					appendStr+='    <td class="td2" style="text-align:center;">';
    					if(con[i].recommed==1){
    						appendStr+='    <input type="checkbox" name="HLYService"   value="1"  data-recommed="'+con[i].recommed+'" checked="checked"  data-name="'+con[i].name+'" data-id="'+con[i].accountId+'" >';
    					}else{
    						appendStr+='    <input type="checkbox" name="HLYService"   value="1"  data-recommed="'+con[i].recommed+'"   data-name="'+con[i].name+'" data-id="'+con[i].accountId+'" >';
    					}
    					appendStr+='        <input type="hidden" name="doctorId" value="'+con[i].accountId+'">';
    					appendStr+='    </td>';
    					appendStr+='</tr>';
    					
    				}
    				$('.table').append(appendStr);
    				//添加分页
    				$('.pager').html("");
    				var pagerAppend="";
    				if(result.cp==1){
    					pagerAppend+='<li class="disabled">';
    					pagerAppend+='    <a class="pre"  data-cp="'+result.back+'"  data-ps="'+result.ps+'" data-dq="'+result.cp+'">上一页</a>';
    					pagerAppend+='</li>';
    				}else{
    					pagerAppend+='<li>';
    					pagerAppend+='    <a class="pre"  data-cp="'+result.back+'"  data-ps="'+result.ps+'" data-dq="'+result.cp+'">上一页</a>';
    					pagerAppend+='</li>';
    				}
    				if(result.last==result.cp){
    					pagerAppend+='<li class="disabled">';
    					pagerAppend+='     <a class="next" data-cp="'+result.next+'" data-ps="'+result.ps+'" data-dq="'+result.cp+'">下一页</a>';
    					pagerAppend+='</li>';
    				}else{
    					pagerAppend+='<li >';
    					pagerAppend+='     <a class="next" data-cp="'+result.next+'" data-ps="'+result.ps+'" data-dq="'+result.cp+'">下一页</a>';
    					pagerAppend+='</li>';
    				}
    				$('.pager').append(pagerAppend);
    			}else{
    				alert("最后一页或是第一页");
    				return false;
    			}
    		},"json");
			
		}
		//添加分页信息
	    $('.pre,.next').live('click',function(){
	    			var cp=$(this).attr("data-cp");
		    		var ps=$(this).attr("data-ps");
		    		var questURL=runParams.mainUrl+'queryHotDocByDivPage.do';
		    		var questArr={
		    				cp:cp,
		    				ps:ps
		    		};
		    		var last="";
		    		
		    		divPageCommen(questURL,questArr);
		    		
		    	});	
		
	//=====================================================
	   // addCheck();
		function addLi(docName,docID,ele){// 绑定在li上的方法  ,通过 传递的 docName ,docID ,以及 checkbox对象（ele） 实现 同步 box的勾选 和 li的追加显示。
			var obj = $(ele);
			$('#checkUL').append('<li ><a href="#" id="'+docID+'" class="removeLink">'+docName+'<span class="glyphicon glyphicon-remove" style="margin-left:5px;"></span></a></li>');
			$(".removeLink").live('click',function(){
				var id=$(this).attr("id");
				$('input[data-id="'+id+'"]').attr("checked",false);
				$(this).parent().remove();
			});
			var length= $("#checkUL li a").length;//$('input[type="checkbox"]:checked').length;
			if(length>2){
				alert("你所勾选的数目超过2了");
				obj.attr("data-recommed","0");
				obj.removeAttr("checked");//obj.attr("checked",false);  -- 两者皆可用
				$('a[id="'+docID+'"]').parent().remove();
			}
		}
		
		function isChecked(ele){// 判断 checkbox是否被选中 
			if($(ele).is(":checked")){
				 return true ;
			}
			return false;
		}
		
		$('input[type="checkbox"]').live('click',function(){// 对 checkbox 进行手动的 勾选 或 取消 操作
			var docName=$(this).attr("data-name");
			var docID=$(this).attr("data-id");
			var recommed=$(this).attr("data-recommed");
			if($(this).is(":checked")){
				$(this).attr("data-recommed",'1');
				addLi(docName,docID,$(this));
			}else{
				$(this).attr("data-recommed",'0');
				//$('a[id="'+docID+'"]').parent().remove();
				$('a[id="'+docID+'"]').parent().detach();
			}
		});

		$("#submitSet").live('click',function(){//将 id 以逗号分隔的形式组成的字符串 提交
			var aLink=$('#checkUL li a');
		    var aLength=aLink.length;
		    if(aLength!=2){
		    	alert("你所选的长度不为2，请重选");
		    	return false;
		    }
			var arrayId=[];
			var string="";
			for(var i=0;i<aLink.length;i++){
				arrayId[i]=aLink[i].id;
				//把值放到字符串里传过去
				string+=aLink[i].id+",";
			}
			var token=$('.searchForm input[name="token"]').val();
			var questURL=runParams.mainUrl+'submit_WeekHot_doctor_to_set.do';
			var questArr={
					stringID:string,
					token:token
			}
			$.post(questURL,questArr,function(result){
				if(1==result){
					alert("设定成功");
					location.reload;
				}else{
					alert("设定失败");
					return false;
				}
			});
		});
		//***-----***------***-----****------****
		addCheckByRec();
		function addCheckByRec(){
			var questURL=runParams.mainUrl+'selectByRemmed.do';
			//var questArr={};
			$.post(questURL,function(result){
				if(result.status==true){
					var con=result.data;
				    for(var i=0;i<con.length;i++){
				    	if(con[i].recommed==1){
				    		$('#checkUL').append('<li ><a href="#" id="'+con[i].accountId+'" class="removeLink">'+con[i].name+'<span class="glyphicon glyphicon-remove" style="margin-left:5px;"></span></a></li>');
				    	    }
					   $(".removeLink").live('click',function(){
							var id=$(this).attr("id");
							$('input[data-id="'+id+'"]').attr("checked",false);
							$(this).parent().remove();
					        });
				     }
				}
		   });
		}
		
	});
	