$(function(){
	NProgress.start();
	initMenu();
	menuFix();
	function menuFix(){
		$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
    	$('a[data-event="collapse"]:eq(0)').addClass('active');
    	$('#ddcz').show();
	}
	function initMenu(){
		var menuIndex = $("input[name='menuIndex']").val();
        	switch(menuIndex){
        	case "order":
		    	$('.menulist').children('.sub_ptdd').addClass('active');
		    	break;
        	case "quickPay":
		    	$('.menulist').children('.sub_kjdd').addClass('active');
		    	break;
        	case "withdrawCash":
		    	$('.menulist').children('.sub_txgl').addClass('active');
		    	break;
        	case "qrdj":
    	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
    	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
    	    	$('#ddcz').show();
    	        $('#ddcz').children('.sub_qrdj').addClass('active');
    	    	break;
        	case "qryk":
    	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
    	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
    	    	$('#ddcz').show();
    	        $('#ddcz').children('.sub_qryk').addClass('active');
    	    	break;
        	case "pfjf":
    	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
    	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
    	    	$('#ddcz').show();
    	        $('#ddcz').children('.sub_pfjf').addClass('active');
    	    	break;
        	case "tjdd":
       	        $('.menulist').children('.sub_tjdd').addClass('active');
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