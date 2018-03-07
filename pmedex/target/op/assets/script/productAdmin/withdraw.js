$(function(){
	
		function initModal(){
			$('#myModal input[name="id"]').val('');
			$('#myModal input[name="userid"]').val('');
			$('#myModal input[name="username"]').val('');
			$('#myModal input[name="type"]').val('');
			$('#myModal input[name="payAccountId"]').val('');
			$('#myModal input[name="payAccountName"]').val('');
			$('#myModal input[name="amount"]').val('');
			$('#myModal input[name="scoreBalance"]').val('');
			$('#myModal input[name="request_time"]').val('');
			$('#myModal input[name="draw_time"]').val('');
			$('#myModal input[name="remark"]').val('');
			$('#myModal input[name="reject_reason"]').val('');
			$('#myModal input[name="request_status"]').val('');
			$('#myModal input[name="person"]').val('');
			$('#myModal input[name="hospital"]').val('');
			$('#myModal input[name="department"]').val('');
			$('#myModal input[name="account_type"]').val('');
			$('#myModal input[name="open_bank"]').val('');
		}
		$('.Withdraw').click(function(){
			initModal();
			var dataId=$(this).attr("data-id");
			var token=$('input[name="token"]').val();
	        if(!token){
	        	alert("页面token已经过期。");
	        	return false;
	        }
	        if(!dataId){
	        	alert("未找到该申请id。");
	        	return false;
	        }
			var questURL = runParams.mainUrl+'findWithDrawCashById.do';
			var questArr = {
				id:dataId,
				token:token
			};
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					//alert(result.data.userid);
					  $('#myModal input[name="id"]').val(result.data.id);
					  $('#myModal input[name="userid"]').val(result.data.userid);
					  $('#myModal input[name="username"]').val(result.data.username);
					  $('#myModal input[name="type"]').val(result.data.type);
					  $('#myModal input[name="payAccountId"]').val(result.data.payAccountId);
					  $('#myModal input[name="payAccountName"]').val(result.data.payAccountName);
					  $('#myModal input[name="amount"]').val(result.data.amount);
					  $('#myModal input[name="scoreBalance"]').val(result.data.scoreBalance);
					  $('#myModal input[name="request_time"]').val(result.data.request_time);
					  $('#myModal input[name="draw_time"]').val(result.data.draw_time);
					  $('#myModal input[name="remark"]').val(result.data.remark);
					  $('#myModal input[name="reject_reason"]').val(result.data.reject_reason);
					  $('#myModal input[name="request_status"]').val(result.data.request_status);
					  $('#myModal input[name="person"]').val(result.data.person);
					  $('#myModal input[name="hospital"]').val(result.data.hospital);
					  $('#myModal input[name="department"]').val(result.data.department);
					  $('#myModal input[name="account_type"]').val(result.data.account_type);
					  $('#myModal input[name="open_bank"]').val(result.data.open_bank);
					  $('#myModal').modal();
					 
					  $("a").attr("data-target", "#myModal");
					  //$("#adminModalLabel").html("提现详情页面");
			          //$("#qrtx").attr("type", "hidden");
				}else{     
				    alert('该订单不存在！');
				}  
			});
		});
	
  


});