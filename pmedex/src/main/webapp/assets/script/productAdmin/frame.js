$(function(){
	NProgress.start();
	initMenu();
	function initMenu(){
		var menuIndex = $("input[name='menuIndex']").val();
        	switch(menuIndex){
	        	case "bddd":
	    	    	$('a[data-event="collapse"]:eq(3)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(3)').addClass('active');
	    	    	$('#ddcz').show();
	    	        $('#ddcz').children('.sub_bddd').addClass('active');
	    	    	break;
	        	case "qrdj":
	    	    	$('a[data-event="collapse"]:eq(4)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(4)').addClass('active');
	    	    	$('#cwcz').show();
	    	        $('#cwcz').children('.sub_qrdj').addClass('active');
	    	    	break;
	        	case "qryk":
	    	    	$('a[data-event="collapse"]:eq(4)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(4)').addClass('active');
	    	    	$('#cwcz').show();
	    	        $('#cwcz').children('.sub_qryk').addClass('active');
	    	    	break;
	        	case "pfjf":
	    	    	$('a[data-event="collapse"]:eq(4)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(4)').addClass('active');
	    	    	$('#cwcz').show();
	    	        $('#cwcz').children('.sub_pfjf').addClass('active');
	    	    	break;
	        	case "sqpfjf":
	    	    	$('a[data-event="collapse"]:eq(3)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(3)').addClass('active');
	    	    	$('#ddcz').show();
	    	        $('#ddcz').children('.sub_sqpfjf').addClass('active');
		    	    break;
	        	case "cxqrdd":
        	    case "qrdd":
	    	    	$('a[data-event="collapse"]:eq(3)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(3)').addClass('active');
	    	    	$('#ddcz').show();
	    	        $('#ddcz').children('.sub_qrdd').addClass('active');
    	    	    break;
        	    case "ypfjflb":
        	    	$('a[data-event="collapse"]:eq(1)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(1)').addClass('active');
        	    	$('#ywcz').show();
        	        $('#ywcz').children('.ypfjflb').addClass('active');
        	    	break;
        	    case "beansOperation":
        	    	$('a[data-event="collapse"]:eq(1)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(1)').addClass('active');
        	    	$('#ywcz').show();
        	        $('#ywcz').children('.beansOperation').addClass('active');
        	    	break;
        	    case "tjdd":
	       	        $('.menulist').children('.sub_tjdd').addClass('active');
	       	    	break;
        	    case "bookProduct":
        	        $('.menulist').children('.sub_cpyd').addClass('active');
        	    	break;
        	    case "simpleOrder":
        	    	$('a[data-event="collapse"]:eq(1)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(1)').addClass('active');
        	    	$('#ywcz').show();
        	        $('#ywcz').children('.sub_jjdd').addClass('active');
        	    	break;
        	    case "quickPay":
	    	    	$('a[data-event="collapse"]:eq(2)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(2)').addClass('active');
	    	    	$('#ddcx').show();
	    	        $('#ddcx').children('.sub_kjdd').addClass('active');
    	    	    break;
        	    case "allOrder":
	    	    	$('a[data-event="collapse"]:eq(2)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(2)').addClass('active');
	    	    	$('#ddcx').show();
	    	        $('#ddcx').children('.sub_sydd').addClass('active');
    	    	    break;
        	    case "scoreRate":
        	    	$('a[data-event="collapse"]:eq(1)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(1)').addClass('active');
        	    	$('#ywcz').show();
        	        $('#ywcz').children('.sub_jfdhbl').addClass('active');
        	    	break;
        	    case "withdrawCash":
        	    	$('a[data-event="collapse"]:eq(1)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(1)').addClass('active');
        	    	$('#ywcz').show();
        	        $('#ywcz').children('.sub_txgl').addClass('active');
        	    	break;
        	    case "withdrawForRecureOrder":
        	    	$('a[data-event="collapse"]:eq(1)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(1)').addClass('active');
        	    	$('#ywcz').show();
        	        $('#ywcz').children('.sub_zuddtx').addClass('active');
        	    	break;
        	    case "product":
        	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
        	    	$('#cpgl').show();
    	            $('#cpgl').children('a:eq(2)').addClass('active');
        	    	break;
        	    case "productCategory":
        	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
        	    	$('#cpgl').show();
	                $('#cpgl').children('a:eq(1)').addClass('active');
        	    	break;
        	    case "productOwner":
        	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
        	    	$('#cpgl').show();
                    $('#cpgl').children('a:eq(0)').addClass('active');
        	    	break;
        	    	
        	    //套餐管理
        	    case "serviceManager":
	    	    	$('a[data-event="collapse"]:eq(5)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(5)').addClass('active');
	    	    	$('#tcgl').show();
	    	        $('#tcgl').children('.serviceManager').addClass('active');
	    	    	break;
	        	case "packageManager":
	    	    	$('a[data-event="collapse"]:eq(5)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(5)').addClass('active');
	    	    	$('#tcgl').show();
	    	        $('#tcgl').children('.packageManager').addClass('active');
	    	    	break;
	    	    	
	        	case "newOrderManager":
        	        $('.menulist').children('.newOrderManager').addClass('active');
        	    	break;
        	    
	        	case "allOrderManager":
        	        $('.menulist').children('.newOrderManager').addClass('active');
        	    	break;
        	    	
        	    //授牌管理	
	        	case "awardManager":
        	        $('.menulist').children('.awardManager').addClass('active');
        	    	break;
        	    	
	        	case "kfTransferOrder":
        	        $('.menulist').children('.kfTransferOrder').addClass('active');
        	    	break;
        	    //授牌管理	
        	    	
        	    	//康复信息管理
        	    case "kfHospital":
	    	    	$('a[data-event="collapse"]:eq(6)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(6)').addClass('active');
	    	    	$('#kfgl').show();
	    	        $('#kfgl').children('.kfHospital').addClass('active');
	    	    	break;
	    	    	
        	    case "sickRoom":
	    	    	$('a[data-event="collapse"]:eq(7)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(7)').addClass('active');
	    	    	$('#kfgl').show();
	    	        $('#kfgl').children('.sickRoom').addClass('active');
	    	    	break;
	    	    	
        	    case "kfRegHospital":
	    	    	$('a[data-event="collapse"]:eq(8)').removeClass("collapse-r").addClass("expanding-r");
	    	    	$('a[data-event="collapse"]:eq(8)').addClass('active');
	    	    	$('#kfgl').show();
	    	        $('#kfgl').children('.kfRegHospital').addClass('active');
	    	    	break;
        	    	
        	}
	}
	$("#menu,#content").niceScroll({   
		touchbehavior : false, // 是否在触摸屏下使用
		cursorcolor : "#87C844", // 滚动条颜色
		cursoropacitymax : 1, // 滚动条是否透明
		cursorwidth : 4, // 滚动条宽度
		horizrailenabled : false, // 是否水平滚动
		cursorborderradius : 0, // 滚动条是否圆角大小
		autohidemode : true, // 是否隐藏滚动条
		cursorborder : 0 // 滚动条边框大小
	});
	$(".menulist a[data-event='collapse']").click(function(){
	    var id = $(this).next('.hidden-menu');
		if(id.css("display") != 'block'){
		    $(this).removeClass("collapse-r");
			$(this).addClass("expanding-r");
            $(this).addClass("active");
            id.slideDown(200,function(){
                $("#menu,#content").getNiceScroll().resize();
            });
		}else{
			$(this).removeClass("expanding-r");
		    $(this).addClass("collapse-r");
            $(this).removeClass("active");
            id.slideUp(200,function(){
                $("#menu,#content").getNiceScroll().resize();
            });
		}
	});
	$(".nav-r .hideBtn").click(function(){
		var obj = $("#menu");
	    if(obj.css("display") == 'block'){
		    obj.hide();
		}else{
			obj.show();
		}
	});
	$(".nav-search button").hover(function(){
	    $(this).css("borderLeft","1px solid #87C844");
	});
	$('.user-action').mouseover(function(){
		$(this).addClass('open');
	})
	$('.user-action').mouseout(function(){
		$(this).removeClass('open');
	})
	$('.messageTagWrap').mouseover(function(){
		$(this).addClass('open');
	})
	$('.messageTagWrap').mouseout(function(){
		$(this).removeClass('open');
	})
	$('.logout').click(function(){
	    if(confirm('确定要退出当前账号吗？')){
			var userId = $('input[name="currentUserId"]').val();
		    var questURL = runParams.mainUrl+'doLoginOut.do';
			var questArr = {
				userId:userId
			};
			$.post(questURL,questArr,function(result){
				if(1==result){
					location.href = runParams.mainUrl+'login.html';
				}else{
					alert('退出失败！');
					return false;
				}
			});
		}
	});   
	$('.selectAccount').click(function(){   
		if(confirm('是否要跳转到账户选择页面？')){   
			var userType = $('input[name="currentUserType"').val();
			if('doctor'==userType){
				 location.href = runParams.mainUrl+'chooseAccountDoc.html';
			}
			if('patient'==userType){
				location.href = runParams.mainUrl+'chooseAccountPat.html';
			}
		}
	});
});
$(window).load(function(){
    NProgress.done();
});
//指定位数的随机数
function RndNum(n){
	var rnd="";
	for(var i=0;i<n;i++)
	rnd+=Math.floor(Math.random()*10);
	return rnd;
}
//截取字符串
function cutstr(str,len)
{
   var str_length = 0;
   var str_len = 0;
      str_cut = new String();
      str_len = str.length;
      for(var i = 0;i<str_len;i++)
     {
        a = str.charAt(i);
        str_length++;
        if(escape(a).length > 4)
        {
         //中文字符的长度经编码之后大于4
         str_length++;
         }
         str_cut = str_cut.concat(a);
         if(str_length>=len)
         {
         str_cut = str_cut.concat("...");
         return str_cut;
         }
    }
    //如果给定字符串小于指定长度，则返回源字符串；
    if(str_length<len){
     return  str;
    }
}