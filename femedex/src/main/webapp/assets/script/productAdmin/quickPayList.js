 
	$(function(){
		function initModal(){
			$('#myModal span[class="orderId"]').html('');
			$('#myModal span[class="time_str"]').html('');
			$('#myModal span[class="status"]').html('');
			$('#myModal span[class="userid"]').html('');
			$('#myModal span[class="userName"]').html('');
			$('#myModal span[class="patientName"]').html('');
			$('#myModal span[class="expertId"]').html('');
			$('#myModal span[class="expertName"]').html('');
			$('#myModal span[class="expertPhone"]').html('');
			$('#myModal span[class="serviceType"]').html('');
			$('#myModal span[class="type"]').html('');
			$('#myModal span[class="amount"]').html('');
			$('#myModal span[class="contactName"]').html('');
			$('#myModal span[class="contactPhone"]').html('');
		}
		$('.showProduct').click(function(){
			initModal();
			var dataId=$(this).attr("data-id");
			var token=$('input[name="token"]').val();
			var questURL = runParams.mainUrl+'getQuickPayOrderById.do';
			var questArr = {
				id:dataId,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					$('#myModal span[class="orderId"]').html(result.data.orderId);
					$('#myModal span[class="time_str"]').html(result.data.time_str);
					$('#myModal span[class="status"]').html(result.data.status);
					$('#myModal span[class="userid"]').html(result.data.userid);
					$('#myModal span[class="userName"]').html(result.data.userName);
					$('#myModal span[class="patientName"]').html(result.data.patientName);
					$('#myModal span[class="expertId"]').html(result.data.expertId);
					$('#myModal span[class="expertName"]').html(result.data.expertName);
					$('#myModal span[class="expertPhone"]').html(result.data.expertPhone);
					$('#myModal span[class="serviceType"]').html(result.data.serviceType);
					$('#myModal span[class="type"]').html(result.data.type);
					$('#myModal span[class="amount"]').html(result.data.amount);
					$('#myModal span[class="contactName"]').html(result.data.contactName);
					$('#myModal span[class="contactPhone"]').html(result.data.contactPhone);
					$('#myModal span[class="maName"]').html(result.data.maName);
					$('#myModal span[class="caName"]').html(result.data.caName);
					  $('#myModal').modal();
				}else{     
				    alert('该订单不存在！');
				}  
			});
		});
		
		  $('.urlConvert').click(function(){
				status = encodeURIComponent($(this).attr('data-val'));
				location.href=runParams.mainUrl+"quickPayOrder.html?status="+status;
			});
			$('.input-group-addon').click(function(){
			    $('#searchForm').submit();
			});
			

	});