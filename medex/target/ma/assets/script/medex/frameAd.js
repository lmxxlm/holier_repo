$(function(){
	NProgress.start();
	initMenu();
	function initMenu(){
		var accountType = $("input[name='accountType']").val();
		var menuIndex = $("input[name='menuIndex']").val();
		switch(menuIndex){
		case "userLog":
	    	$('.menulist').children('.userLog').addClass('active');
	    	break;
	    case "chooseAccountDoc":
	    	$('.menulist').children('.chooseAccountDoc').addClass('active');
	    	break;
	    case "chooseAccountPat":
	    	$('.menulist').children('.chooseAccountPat').addClass('active');
	    	break;
	    case "transferTreatment":
	    	$('.menulist').children('.transferTreatment').addClass('active');
	    	break;
	    case "getSiteConferencegList":
	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
	    	$('#spfw').show();
            $('#spfw').children('.sub_fwyylb').addClass('active');
	    	break;
	    case "createConference":
	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
	    	$('#spfw').show();
            $('#spfw').children('.sub_sjxfw').addClass('active');
	    	break;
	    }
	}
	$("#menu,#content").niceScroll({   
		touchbehavior : false, // 是否在触摸屏下使用
		cursorcolor : "#AF86B9", // 滚动条颜色
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
	    $(this).css("borderLeft","1px solid #AF86B9");
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