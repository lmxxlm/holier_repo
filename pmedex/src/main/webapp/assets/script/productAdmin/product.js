$(function(){
        	function initModal(){
        	    $('#adminModal input[name="hostId"]').val('');
        		$('#adminModal input[name="host"]').val('');
        		$('#adminModal textarea[name="description"]').val('');
        		$('#adminModal textarea[name="note"]').val('');	
        		$('#adminModal input[name="isValid"][value="1"]').attr('checked',true);
        		$('#adminModal input[name="actionType"]').val('');
        		$('#adminModal input[name="productId"]').val('');
        		$('#adminModal input[name="serviceCount"]').val('3');
        		$('#adminModal input[name="startTime"]').val('');
        		$('#adminModal input[name="endTime"]').val('');
        		$('#adminModal input[name="score_returned_transfer"]').val(0);
        		$('#adminModal input[name="score_returned_requester"]').val(0);
        		$('#adminModal input[name="score_self"]').val(0);
        		$('#adminModal input[name="score_total_mark"]').val(0);
        		$('#adminModal input[name="score_subsidy_transfer"]').val(0);
        		$('#adminModal input[name="score_subsidy_requester"]').val(0);
        		$('#adminModal input[name="score_total_subsidy"]').val(0);
        		$('#adminModal input[name="booking_price"]').val(0);
        		$('#adminModal select[name="type"]').val(0);
        		$('#adminModal input[name="hiddenPrice"][value="0"]').attr('checked',true);
        		$('.hideLine').show();
        	}
        	//区分转诊加号和其他产品
        	function checkProductCategory(){
        		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
        		if(typeVal=='特需门诊'||typeVal=='挂专家号'){
        			$('.hideLine').hide();
        		}else{
        			$('.hideLine').show();
        		}
        	}
        	$('select[name="type"]').change(function(){
        		//预设数据
        		var description = '';
        		var note = '';
        		var index = $(this).children('option:selected').text();
        		if(index=="特需门诊"){
        			description = "1、为您预约特需门诊，若后续您需专家的其他服务，则需另行预约。\n2、每个预约服务的阶段，好乐医易转诊会以短信的方式实时告诉您预约进展，且您可以致电服务热线询问或者在您的手机端的订单中心内查询预约情况。\n3、您在完成预约服务支付后，好乐医医学助理会向您确认是否需要其他配套服务（如代订本地车站接送、代订医院周边酒店等），详情及产生的费用由好乐医医学助理实时告知及确认。\n4、安排专业医学助理陪同您办理挂号手续及就医引导等服务。\n5、好乐医医助会协助您与专家沟通，但不涉及医疗诊治服务。\n6、专业的医学助理会管理并按时更新您手机客户端的日程提示与健康档案。\n注：您支付的服务费用仅包括好乐医易转诊提供的预约服务以及相关咨询服务的费用，不包括就诊过程中产生的医疗费用及其他费用。";
        		    note = "1、预约发起后，请保持联系电话通畅。\n2、预约发起后2小时内，付款方完成全额费用支付，此次预约方可生效，否则此次预约将被取消。\n3、完成支付后如有任何疑义，请及时拨打服务热线400-996-8881。\n4、若因个人原因需取消订单，您的部分或全额服务费用不予退还，请您确认实际情况后再进行预约。\n5、预约处理工作时间：周一到周五8:00 - 20:00，非工作时间订单顺延至下一个工作时间处理。";
        		}
        		if(index=="专家会诊"){
        			description = "1、为您预约指定专家的会诊服务，后续若您需专家的其他服务，则需另行预约。\n2、在每个预约服务的阶段，好乐医易转诊会以短信的方式实时告诉您预约进展，且您可以致电服务热线询问或者在您的手机端的订单中心内查询预约情况。\n3、您在预约服务时，专业医疗助理会电话或现场，了解并收集目前您的病情状况，并提供给应诊医生。\n4、您在完成预约服务支付后，好乐医医学助理会向您确认是否需要其他配套服务，详情及产生的费用好乐医医学助理会实时告知及确认。\n5、安排专业医学助理陪同您办理入院手续、提供出院后两年内的随访等服务。\n6、好乐医医助会协助您与专家沟通，但不涉及医疗诊治服务。\n7、专业的医学助理会管理并按时更新您手机客户端的日程提示与健康档案。\n注：您支付的服务费用仅包括好乐医易转诊提供的预约服务、相关咨询服务以及专家产生的差旅费用，不包括就诊过程中产生的医疗费用及其他费用。";
        		    note = "1、预约发起后，请保持联系电话通畅。\n2、预约发起后2小时内，付款方完成定金支付，此次预约方可生效。\n3、收到订单确认信息后，付款方需在24小时内完成服务费用的余款支付，否则此次预约将被取消。\n4、完成支付后如有任何疑义，请及时拨打服务热线400-996-8881。\n5、若因个人原因需取消订单，根据实际情况会扣除您的部分服务费用且定金不予退还，请您确认实际情况后再进行预约。\n6、预约处理工作时间：周一到周五8:00 - 20:00，非工作时间订单顺延至下一个工作时间处理。";
        		}
                if(index=="专家主刀"){
                	description = "1、为您预约指定的专家主刀服务，若后续您需专家的其他服务，则需另行预约。\n2、每个预约服务的阶段，好乐医易转诊会以短信的方式实时告诉您预约进展，且您可以致电服务热线询问或者在您的手机端的订单中心内查询预约情况。\n3、在预约服务时，专业医疗助理会电话或现场，了解并收集目前您的病情状况及手术环境条件状况，并提供给就诊专家。\n4、在完成预约服务支付后，好乐医医学助理会向您确认是否需要其他配套服务，详情及产生的费用好乐医医学助理会实时告知及确认。\n5、排专业医学助理陪同您办理入院手续、提供出院后两年内的随访等服务。\n6、医助会协助您与专家沟通，但不涉及医疗诊治服务。\n7、业的医学助理会管理并按时更新您手机客户端的日程提示与健康档案。\n注：您支付的服务费用仅包括好乐医易转诊提供的预约服务、相关咨询服务以及专家的差旅费用，不包括就诊过程中产生的医疗费用及其他费用。";
        		    note = "1、预约发起后，请保持联系电话通畅。\n2、预约发起后2小时内，付款方完成定金支付，此次预约方可生效。\n3、收到订单确认信息后，付款方需在24小时内完成服务费用的余款支付，否则此次预约将被取消。\n4、完成支付后如有任何疑义，请及时拨打服务热线400-996-8881。\n5、若因个人原因需取消订单，根据实际情况会扣除您的部分服务费用且定金不予退还，请您确认实际情况后再进行预约。\n6、预约处理工作时间：周一到周五8:00 - 20:00，非工作时间订单顺延至下一个工作时间处理。";
        		}
                $('#adminModal textarea[name="description"]').val(description);
                $('#adminModal textarea[name="note"]').val(note);
            	
        		checkProductCategory();
        	});
        	//点击添加按钮
        	$('.addPat button').click(function(){
        		initModal();
        		$('#adminModal input[name="actionType"]').val('add');
        	    $('#adminModal').modal();
        	});
        	//点击修改链接
        	$('.editProduct').click(function(){
        	    var id = $(this).attr('data-id');
        		if(!id){
        		    alert("未找到该产品！");
        			return false;
        		}
        		//根据id获取这条数据
        		var questURL = runParams.mainUrl+'getProductById.do';
        		var questArr = {
        			productId:id
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result.status){
        				$('#adminModal select[name="type"]').val(result.data.pcid);
        				$('#adminModal input[name="hostId"]').val(result.data.hostId);
        				$('#adminModal input[name="host"]').val(result.data.hostName);
        				$('#adminModal textarea[name="description"]').val(result.data.description);
        				$('#adminModal textarea[name="note"]').val(result.data.note);	
        				$('#adminModal input[name="isValid"][value="'+result.data.isValid+'"]').attr('checked',true);
        				$('#adminModal input[name="actionType"]').val('edit');
        				$('#adminModal input[name="productId"]').val(result.data.productId);
        				$('#adminModal input[name="serviceCount"]').val(result.data.serviceCount);
        		        $('#adminModal input[name="startTime"]').val(result.data.startTime_str);
        		        $('#adminModal input[name="endTime"]').val(result.data.endTime_str);
        		        $('#adminModal input[name="score_returned_transfer"]').val(result.data.score_returned_transfer);
                		$('#adminModal input[name="score_returned_requester"]').val(result.data.score_returned_requester);
                		$('#adminModal input[name="score_self"]').val(result.data.score_self);
                		$('#adminModal input[name="score_total_mark"]').val(result.data.score_total_mark);
                		$('#adminModal input[name="score_subsidy_transfer"]').val(result.data.score_subsidy_transfer);
                		$('#adminModal input[name="score_subsidy_requester"]').val(result.data.score_subsidy_requester);
                		$('#adminModal input[name="score_total_subsidy"]').val(result.data.score_total_subsidy);
                		$('#adminModal input[name="booking_price"]').val(result.data.booking_price);
                		$('#adminModal input[name="hiddenPrice"][value="'+result.data.hiddenPrice+'"]').attr('checked',true);
                		$('#adminModal').modal();
                		checkProductCategory();
        			}else{
        				alert("未找到该产品！");
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
        		var type = $('#adminModal select[name="type"]').val();
        		var hostId = $('#adminModal input[name="hostId"]').val();
        		var description = $('#adminModal textarea[name="description"]').val();
        		var note = $('#adminModal textarea[name="note"]').val();	
        		var isValid = $('#adminModal input[name="isValid"]:checked').val();
        		var serviceCount = parseInt($('#adminModal input[name="serviceCount"]').val());
        		var startTime = $('#adminModal input[name="startTime"]').val();
        		var endTime = $('#adminModal input[name="endTime"]').val();
        		var score_returned_transfer = $('#adminModal input[name="score_returned_transfer"]').val();
        		var score_returned_requester = $('#adminModal input[name="score_returned_requester"]').val();
        		var score_self = $('#adminModal input[name="score_self"]').val();
        		var score_total_mark = $('#adminModal input[name="score_total_mark"]').val();
        		var score_subsidy_transfer = $('#adminModal input[name="score_subsidy_transfer"]').val();
        		var score_subsidy_requester = $('#adminModal input[name="score_subsidy_requester"]').val();
        		var score_total_subsidy = $('#adminModal input[name="score_total_subsidy"]').val();
        		var booking_price = $('#adminModal input[name="booking_price"]').val();
        		var hiddenPrice = parseInt($('#adminModal input[name="hiddenPrice"]:checked').val());
        		var token = $('input[name="token"]').val();
        		if(!hostId){
        		    alert("请输入宿主姓名！");
        			return false;
        		}
        		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
        		if(typeVal!='特需门诊'&&typeVal!='挂专家号'){
        			if(!serviceCount){
            		    alert("请输入每周服务次数！");
            			return false;
            		}
            		if(!startTime){
            		    alert("请输入服务开始时间！");
            			return false;
            		}
            		if(!endTime){
            		    alert("请输入服务结束时间！");
            			return false;
            		}
        		}
        		if(!description){
        		    alert("请输入服务内容！");
        			return false;
        		}
        		if(!note){
        		    alert("请输入注意事项！");
        			return false;
        		}
        		if(!score_total_mark){
        		    alert("请输入产品积分！");
        			return false;
        		}
        		if(!token){
        		    alert("非法提交！");
        			return false;
        		}
//        		if(description.length>200){
//        		    alert('服务内容的字数需要控制在200字以内！');
//        			return false;
//        		}
//        		if(note.length>200){
//        		    alert('注意事项的字数需要控制在200字以内！');
//        			return false;
//        		}
        		if(parseInt(booking_price)>parseInt(score_total_mark)){
        			alert("定金不能大于定价总额！");
        			return false;
        		}
        		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
        		if(typeVal!='特需门诊'&&typeVal!='挂专家号'){
        		    //验证时间先后
        		    var datepickArr1 = startTime.split("-");
        		    var datepickArr2 = endTime.split("-");
        		    var new_datepick1 = new Date(datepickArr1[0],datepickArr1[1],datepickArr1[2]);
        		    var new_datepick2 = new Date(datepickArr2[0],datepickArr2[1],datepickArr2[2]);
        		    if(!new_datepick1 || ! new_datepick2){
        		        alert("请输入正确的时间格式");
        		        return false;
        		    }
        		    var date_result = (new_datepick2-new_datepick1)/(24*60*60*1000);
        		    if(date_result<0){
        		        alert("结束时间不能在开始时间前面，请重新选择");
        		        return false;
        		    }
        		}
        		var questURL = runParams.mainUrl+'addProduct.do';
        		var questArr = {
        			pcid:type,
        			hostId:hostId,
        			description:description,
        			note:note,
        			serviceCount:serviceCount,
        			startTime_str:startTime,
        			endTime_str:endTime,
        			isValid:isValid,
        			score_returned_transfer:score_returned_transfer,
        			score_returned_requester:score_returned_requester,
        			score_self:score_self,
        			score_total_mark:score_total_mark,
        			score_subsidy_transfer:score_subsidy_transfer,
        			score_subsidy_requester:score_subsidy_requester,
        			score_total_subsidy:score_total_subsidy,
        			booking_price:booking_price,
        			hiddenPrice:hiddenPrice,
        			token:token
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result){
        				location.href=runParams.mainUrl+"ownerProduct.html?hostId="+hostId;
        			}else{
        				alert('添加失败！');
        				return false;
        			}
        		});
        	}
        	//修改逻辑
        	function doEdit(){
        		var id = $('#adminModal input[name="productId"]').val();
        		var page = $('input[name="page"]').val();
        	    var type = $('#adminModal select[name="type"]').val();
        		var hostId = $('#adminModal input[name="hostId"]').val();
        		var description = $('#adminModal textarea[name="description"]').val();
        		var note = $('#adminModal textarea[name="note"]').val();	
        		var isValid = $('#adminModal input[name="isValid"]:checked').val();
        		var serviceCount = $('#adminModal input[name="serviceCount"]').val();
        		var startTime = $('#adminModal input[name="startTime"]').val();
        		var endTime = $('#adminModal input[name="endTime"]').val();
        		var score_returned_transfer = $('#adminModal input[name="score_returned_transfer"]').val();
        		var score_returned_requester = $('#adminModal input[name="score_returned_requester"]').val();
        		var score_self = $('#adminModal input[name="score_self"]').val();
        		var score_total_mark = $('#adminModal input[name="score_total_mark"]').val();
        		var score_subsidy_transfer = $('#adminModal input[name="score_subsidy_transfer"]').val();
        		var score_subsidy_requester = $('#adminModal input[name="score_subsidy_requester"]').val();
        		var score_total_subsidy = $('#adminModal input[name="score_total_subsidy"]').val();
        		var booking_price = $('#adminModal input[name="booking_price"]').val();
        		var hiddenPrice = parseInt($('#adminModal input[name="hiddenPrice"]:checked').val());
        		var token = $('input[name="token"]').val();
        		if(!id){  
        		    alert("未找到该产品！");
        			return false;
        		}  
        		if(!hostId){
        		    alert("宿主姓名需要从匹配到的下拉列表中选择！");
        			return false;
        		}
        		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
        		if(typeVal!='特需门诊'&&typeVal!='挂专家号'){
        			if(!serviceCount){
            		    alert("请输入每周服务次数！");
            			return false;
            		}
            		if(!startTime){
            		    alert("请输入服务开始时间！");
            			return false;
            		}
            		if(!endTime){
            		    alert("请输入服务结束时间！");
            			return false;
            		}
        		}
        		if(!score_total_mark){
        		    alert("请输入产品积分！");
        			return false;
        		}
        		if(!description){
        		    alert("请输入服务内容！");
        			return false;
        		}
        		if(!note){
        		    alert("请输入注意事项！");
        			return false;
        		}
        		if(!token){
        		    alert("非法提交！");
        			return false;
        		}
//        		if(description.length>200){
//        		    alert('服务内容的字数需要控制在200字以内！');
//        			return false;
//        		}
//        		if(note.length>200){
//        		    alert('注意事项的字数需要控制在200字以内！');
//        			return false;
//        		}
        		if(parseInt(booking_price)>parseInt(score_total_mark)){
        			alert("定金不能大于定价总额！");
        			return false;
        		}
        		//验证时间先后
        		var typeVal = $('select[name="type"]').children('option[value="'+$('select[name="type"]').val()+'"]').html();
        		if(typeVal!='特需门诊'&&typeVal!='挂专家号'){
        			var datepickArr1 = startTime.split("-");
            		var datepickArr2 = endTime.split("-");
            		var new_datepick1 = new Date(datepickArr1[0],datepickArr1[1],datepickArr1[2]);
            		var new_datepick2 = new Date(datepickArr2[0],datepickArr2[1],datepickArr2[2]);
            		if(!new_datepick1 || ! new_datepick2){
            		    alert("请输入正确的时间格式");
            		    return false;
            		}
            		var date_result = (new_datepick2-new_datepick1)/(24*60*60*1000);
            		if(date_result<0){
            		    alert("结束时间不能在开始时间前面，请重新选择");
            		    return false;
            		}
        		}
        		//****如果次数被修改，则这个产品后面具体哪周定义的次数都要删除
        		//****如果服务时间修改，则超过这次修改时间的自定义哪周次数的设置都要删除
        		var questURL = runParams.mainUrl+'editProduct.do';
        		var questArr = {
        			productId:id,
        			pcid:type,
        			hostId:hostId,
        			description:description,
        			note:note,
        			serviceCount:serviceCount,
        			startTime_str:startTime,
        			endTime_str:endTime,
        			isValid:isValid,      
        			score_returned_transfer:score_returned_transfer,
        			score_returned_requester:score_returned_requester,
        			score_self:score_self,
        			score_total_mark:score_total_mark,
        			score_subsidy_transfer:score_subsidy_transfer,
        			score_subsidy_requester:score_subsidy_requester,
        			score_total_subsidy:score_total_subsidy,
        			booking_price:booking_price,
        			hiddenPrice:hiddenPrice,
        			token:token
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result){
        				location.href=runParams.mainUrl+'product.html?cp='+page;
        			}else{
        				alert('修改失败！');
        				return false;
        			}
        		});
        	}
        	//删除
        	$(".deleteProduct").click(function(){
        		var id = $(this).attr('data-id');
        		var name = $(this).parent().parent('tr').children('td:eq(1)').html();
        	    if(confirm('确定要把产品“'+name+'"从列表中删除吗？')){
        	    	//****删除后这个产品后面具体哪周定义的次数都要删除
					var questURL = runParams.mainUrl+'deleteProduct.do';
					var questArr = {productId:id};
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
        	//医生智能搜索
        	$('.searchResultForDoctor').parent().find('.form-control').keyup(function(){
        		var obj = $(this);
        	    var searchVar = $(this).val();
        		var questURL = runParams.mainUrl+'searchTransableDoctorByNameLimit10.do';
        		var questArr = {
        			searchVar:searchVar
        		};
        		$.post(questURL,questArr,function(result){
        			if(1==result.status){   
        				var con = result.data;
        				var htmlstr = '';
        				for(var i=0;i<con.length;i++){
        				  htmlstr += '<li><a href="javascript:void(0)" data-docid="'+con[i].accountId+'"><span>'+con[i].name+'</span>&nbsp;—&nbsp;'+con[i].referHospital+'&nbsp;—&nbsp;'+con[i].referDepartments+'&nbsp;—&nbsp;'+con[i].doctorTitle+'</i></a></li>';
        				}
        				obj.parent().siblings('.searchResultForDoctor').html(htmlstr).show();
        			}else{
        				obj.parent().siblings('.searchResultForDoctor').hide();
        			}
        		});
        	});
        	$(".searchResultForDoctor li a").live('click',function(){
        		var p_obj = $(this).parents('.searchResultForDoctor');
        		p_obj.parent().find('input[type="text"]').val($(this).find("span").html());
        		p_obj.parent().find('input[type="hidden"]').val($(this).attr("data-docid"));
        		p_obj.hide();
        	});
        	//宿主唯一性检查
        	/* $('#adminModal input[name="host"],input[name="owner"]').blur(function(){
        		var targetObj = $(this);
        	    var doctorName = $(this).val();
        		var questURL = runParams.mainUrl+'doctor/validDoctorByName.do';
        		var questArr = {name:doctorName};
        		$.post(questURL,questArr,function(result){
        			if(1==result.status){
        				var len = result.data.length;
        				if(len>1){
        					alert('您输入的该医生存在重名，请根据输入时的下拉提示选择病人！');
        					return false;
        				}
        				if(len==1){
        					targetObj.siblings('input[type="hidden"]').val(result.data[0].accountId);
        				}
        			}else{
        				//还是没找到    
        				alert('未找到您输入的这个患者，请重新输入！');
        				return false;
        			}
        		});
        	}); */
        	/*
        	//顶部搜索
        	function searchProduct(){
        	    var host = $('input[name="docId"]').val();
        		var type = encodeURIComponent($('select[name="productCategory"]').val());
        		
        		var page = $('input[name="page"]').val();
        		location.href=runParams.mainUrl+'product.html?hostId='+host+'&pcid='+type+'&page='+page;
        	}
        	$('.input-group-addon').click(function(){
        		$('input[name="page"]').val(1);
        	    searchProduct();
        	});
        	$('select[name="productCategory"]').change(function(){
        	    $('input[name="page"]').val(1);
        	    searchProduct();
        	});
        	//点击分页链接
        	$('.pagination a').click(function(){
        	    var page = $(this).attr('data-page');
        	    alert("page:"+page);
        		$('input[name="page"]').val(page);
        		//====
        		var page=$('input[name="page"]').val();
        		
        		//====
        		searchProduct();
        	});
        	*/
            //时间弹出
        	$('input[name="startTime"],input[name="endTime"]').datetimepicker({
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
            //加法运算
            $('input[name="score_returned_transfer"],input[name="score_returned_requester"],input[name="score_self"]').keyup(function(){
            	var score_returned_transfer = parseInt($('input[name="score_returned_transfer"]').val());
            	var score_returned_requester = parseInt($('input[name="score_returned_requester"]').val());
            	var score_self = parseInt($('input[name="score_self"]').val());
            	$('input[name="score_total_mark"]').val(score_returned_transfer+score_returned_requester+score_self)
            });
            $('input[name="score_subsidy_transfer"],input[name="score_subsidy_requester"]').keyup(function(){
            	var score_subsidy_transfer = parseInt($('input[name="score_subsidy_transfer"]').val());
            	var score_subsidy_requester = parseInt($('input[name="score_subsidy_requester"]').val());
            	$('input[name="score_total_subsidy"]').val(score_subsidy_transfer+score_subsidy_requester)
            });
        });