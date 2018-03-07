$(function(){
    //时间弹出
//	$('input[name="serviceTime"]').datetimepicker({
//        language:  'zh-CN',
//		format: 'yyyy-mm-dd hh:ii',
//		weekStart: 1,
//		todayBtn:  1,
//		autoclose: 1,
//		todayHighlight: 1,
//		forceParse: 0,
//		startView: 2,
//		minView: 0
//    });
	//重置表单
	$('.reset').click(function(){
	    $('input[name="serviceTime"]').val('');
		$('input[name="writePerson"]').val('');
		$('textArea[name="serviceAddr"]').val('');
		$('textArea[name="serviceRemark"]').val('');
	});
	//提交表单
	$('.submit').click(function(){
	    var serviceTime = $('input[name="serviceTime"]').val();
		var writePerson = $('input[name="writePerson"]').val();
		var serviceAddr = $('textArea[name="serviceAddr"]').val();
		var serviceRemark = $('textArea[name="serviceRemark"]').val();
		var orderId = $('input[name="orderId"]').val();
		var score_returned_transfer = $('input[name="score_returned_transfer"]').val();
		var score_returned_requester = $('input[name="score_returned_requester"]').val();
		var score_self = $('input[name="score_self"]').val();
		var score_total_mark = $('input[name="score_total_mark"]').val();
		var score_subsidy_transfer = $('input[name="score_subsidy_transfer"]').val();
		var score_subsidy_requester = $('input[name="score_subsidy_requester"]').val();
		var score_total_subsidy = $('input[name="score_total_subsidy"]').val();
		var token = $('input[name="token"]').val();
		if(!orderId){
		    alert('未找到该订单！');
			return false;
		}
		if(!token){
		    alert('非法提交！');
			return false;
		}
		if(!serviceTime){
		    alert('请输入服务时间！');
			return false;
		}
		if(!serviceAddr){
		    alert('请输入服务地点！');
			return false;
		}
		if(!writePerson){
		    alert('请输入填写人！');
			return false;
		}
		var questURL = runParams.mainUrl+'addOrderConfirmAgain.do';
		var questArr = {
			orderId:orderId,
			serviceTime:serviceTime,
			writePerson:writePerson,
			serviceAddr:serviceAddr,
			serviceRemark:serviceRemark,
			score_returned_transfer:score_returned_transfer,
			score_returned_requester:score_returned_requester,
			score_self:score_self,
			score_total_mark:score_total_mark,
			score_subsidy_transfer:score_subsidy_transfer,
			score_subsidy_requester:score_subsidy_requester,
			score_total_subsidy:score_total_subsidy,
			token:token
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert('操作成功，已重新提交确认单！');
				location.href=runParams.mainUrl+"order_cxqrdd.html";
			}else{
				alert("操作失败！"); 
			    return false;
			}
		});
	})
	//驳回订单
	$('.rejectBtn button').click(function(){
	    var rejectReason = $('textArea[name="rejectReason"]').val();
		var orderId = $('input[name="orderId"]').val();
		var token = $('input[name="token"]').val();
		if(!orderId){
		    alert('未找到该订单！');
			return false;
		}
		if(!token){
		    alert('非法提交！');
			return false;
		}
		if(!rejectReason){
		    alert('请输入驳回理由！');
			return false;
		}
		var questURL = runParams.mainUrl+'rejectOrder.do';
		var questArr = {
			orderId:orderId,
			rejectReason:rejectReason,
			token:token   
		};
		$.post(questURL,questArr,function(result){
			if(1==result){
				alert('操作成功，已驳回订单！');
				location.href=runParams.mainUrl+"allOrder.html?status=已作废";
			}else{
				alert("操作失败！");
			    return false;
			}
		});
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