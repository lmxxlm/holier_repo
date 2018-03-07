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
  
//提现
	$('.Withdraw').click(function(){
		initModal();
		var dataId=$(this).attr("data-id");
		
		var token=$('input[name="token"]').val();
		$(this).attr("data-target", "#myModal");
		$('#qrtx').click(function(){
		var dataId=$("a").attr("data-id");
		alert(id);
		});
	
		 alert(dataId);
	
		return;
		/*var questURL = runParams.mainUrl+'editServiceCount.do';
		var questArr = {
			dataId:dataId,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				  $('#myModal input[name="id"]').val();
				  $('#myModal input[name="userid"]').val();
				  $('#myModal input[name="username"]').val();
				  $('#myModal input[name="type"]').val();
				  $('#myModal input[name="payAccountId"]').val();
				  $('#myModal input[name="payAccountName"]').val();
				  $('#myModal input[name="amount"]').val();
				  $('#myModal input[name="scoreBalance"]').val();
				  $('#myModal input[name="request_time"]').val();
				  $('#myModal input[name="draw_time"]').val();
				  $('#myModal input[name="remark"]').val();
				  $('#myModal input[name="reject_reason"]').val();
				  $('#myModal input[name="request_status"]').val();
				  $('#myModal input[name="person"]').val();
				  $('#myModal input[name="hospital"]').val();
				  $('#myModal input[name="department"]').val();
				 // $("a").attr("data-target", "#myModal");
				  $("a").attr("data-target", "#myModal1");	
			}else{     
			    alert('该订单不存在！');
			}  
		});*/
	});

	
	
	$('.Details').click(function(){
		initModal();
		var dataId=$(this).attr("data-id");
		$("#adminModalLabel").html("提现详情页面");
		$("#qrtx").attr("type", "hidden");
		var token=$('input[name="token"]').val();
        alert(dataId);
		$(this).attr("data-target", "#myModal");
		return;
		/*var questURL = runParams.mainUrl+'editServiceCount.do';
		var questArr = {
			dataId:dataId,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				  $('#myModal input[name="id"]').val();
				  $('#myModal input[name="userid"]').val();
				  $('#myModal input[name="username"]').val();
				  $('#myModal input[name="type"]').val();
				  $('#myModal input[name="payAccountId"]').val();
				  $('#myModal input[name="payAccountName"]').val();
				  $('#myModal input[name="amount"]').val();
				  $('#myModal input[name="scoreBalance"]').val();
				  $('#myModal input[name="request_time"]').val();
				  $('#myModal input[name="draw_time"]').val();
				  $('#myModal input[name="remark"]').val();
				  $('#myModal input[name="reject_reason"]').val();
				  $('#myModal input[name="request_status"]').val();
				  $('#myModal input[name="person"]').val();
				  $('#myModal input[name="hospital"]').val();
				  $('#myModal input[name="department"]').val();
				 // $("a").attr("data-target", "#myModal");
				 // $("a").attr("data-target", "#myModal1");	
			}else{     
			    alert('该订单不存在！');
			}  
		});*/
	});

});