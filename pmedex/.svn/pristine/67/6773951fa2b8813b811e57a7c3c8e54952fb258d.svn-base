$(function(){
	$(".loginbox").css('marginTop',($(window).height()-490-24)/2);
	$("#submit").on("click",doLogin);
});
/*字符串去空格*/
String.prototype.Trim = function(){    
    return this.replace(/(^\s*)|(\s*$)/g, "");    
}

var keyLogin = function(event){
    if(event.keyCode == 13 ){
    		doLogin();
    }
}

var doLogin = function(){
    var username = $('input[name="username"]').val();
	var password = $('input[name="password"]').val();
	var token = $('input[name="token"]').val();
	var rememberDetail = $('input[name="rememberDetail"]:checked').val();
	password = hex_md5(username+password);
	if(!token){
	    $('#worn_failed').html('页面非法提交！').show();
		return false;
	}
	if(!username || !password){
	    $('#worn_failed').html('请填写完整！').show();
		return false;
	}
	wornShow('loading');
	var questURL = runParams.mainUrl+'checkLogin.do';
	var questArr = {
		accountId:username,
		passwd:password,  
		token:token,
		rememberDetail:rememberDetail
	};
	$.post(questURL,questArr,function(result){
		if(1==result){
			wornShow('success');
			
			//location.href = runParams.mainUrl+'quickPayOrder.html';
			location.href = runParams.mainUrl+'kfTransferOrder.html';
		}else{
			alert('用户名或密码错误！');
			//$('#worn_failed').html('用户名或密码错误！').show();
			location.reload();
			return false;
		}
	});
}


	var wornShow = function(str){
	    switch(str){
		    case 'failed':
			    $('#worn_failed').show();
				$('#worn_success').hide();
				$('#worn_loading').hide();
				break;
			case 'success':
			    $('#worn_failed').hide();
				$('#worn_success').show();
				$('#worn_loading').hide();
				break;
			case 'loading':
			    $('#worn_failed').hide();
				$('#worn_success').hide();
				$('#worn_loading').show();
				break;
			default:
			    $('#worn_failed').hide();
				$('#worn_success').hide();
				$('#worn_loading').hide();
		}
	}