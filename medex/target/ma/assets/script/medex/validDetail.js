$(function(){
	/*
	$('.accessV').click(function(){
		if (confirm('确定要通过该医生的认证申请吗？')) {
			var status = 1;
			var doctorId = $('input[name="doctorId"]').val();
			var token = $('input[name="token"]').val();
			var questURL = runParams.mainUrl + 'doctor/validDoctor.do';
			if(!token){
			    alert("页面非法提交！");
				return false;
			}
			var questArr = {
				doctorId : doctorId,
				status : status,
				token : token
			};
			$.post(questURL, questArr, function(result) {
				if (1 == result) {
					alert('已认证该医生。');
					location.reload();
				} else {
					alert('认证操作失败！');
				}
			});
		}
	});
	*/
	$('.removeV').click(function(){
		if (confirm('确定要取消该医生的认证状态吗？')) {
			var status = 0;
			var doctorId = $('input[name="doctorId"]').val();
			var token = $('input[name="token"]').val();
			var questURL = runParams.mainUrl + 'doctor/validDoctor.do';
			if(!token){
			    alert("页面非法提交！");
				return false;
			}
			var questArr = {
				doctorId : doctorId,
				status : status,
				token : token
			};
			$.post(questURL, questArr, function(result) {
				if (1 == result) {
					alert('已取消认证。');
					location.reload();
				} else {
					alert('操作失败！');
				}
			});
		}
	});
    $('.refuseV').click(function(){
        $('#refuseModal').modal('show');
    });
    $('.dosubmit').click(function(){
		var doctorId = $('input[name="doctorId"]').val();
		var token = $('input[name="token"]').val();
		var reason = $('#refuseModal textarea[name="reason"]').val();
		var questURL = runParams.mainUrl + 'doctor/refuseValidRequest.do';
		if(!token){
		    alert("页面非法提交！");
			return false;
		}
		var questArr = {
			doctorId : doctorId,
			token : token,
			reason: reason
		};
		$.post(questURL, questArr, function(result) {
			if (1 == result) {
				alert('已驳回申请。');
				location.reload();
			} else {
				alert('操作失败！');
			}
		});
    });
});