$(function(){
	NProgress.start();
	initMenu();
	function initMenu(){
		var accountType = $("input[name='accountType']").val();
		var menuIndex = $("input[name='menuIndex']").val();
		if(accountType=='assistantDoctor'){
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
		    case "validRequest":
		    	$('.menulist').children('.validRequest').addClass('active');
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
		    case "devUserMap":
		    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
		    	$('a[data-event="collapse"]:eq(0)').addClass('active');
		    	$('#spfw').show();
	            $('#spfw').children('.sub_sbbd').addClass('active');
		    	break;
		    /*名医推荐*/
		    case "expertsRecommendList":
		    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
		    	$('a[data-event="collapse"]:eq(0)').addClass('active');
		    	$('#ystj').show();
		        $('#ystj').children('.sub_mytj').addClass('active');
		    	break;
		    case "weekHotList":
		    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
		    	$('a[data-event="collapse"]:eq(0)').addClass('active');
		    	$('#ystj').show();
	            $('#ystj').children('.sub_bzrm').addClass('active');
		    	break;	
		    /*名医推荐*/
		    	
		    case "caseCheck":
		    	$('.menulist').children('.caseCheck').addClass('active');
		    	break;
			case "checkCase":
		    	$('.menulist').children('.caseCheck').addClass('active');
		    	break;
		    	
			}
		}
		if(accountType=='doctor'){
			switch(menuIndex){
			    case "docInfo":
			    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
			    	$('.menulist').children('a:eq(0)').addClass('active');
			    	$('#ysxx').show();
			    	$('#ysxx').children('a:eq(0)').addClass('active');
			    	break;
			    case "validDetail":
			    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
			    	$('.menulist').children('a:eq(0)').addClass('active');
			    	$('#ysxx').show();
			    	$('#ysxx').children('a:eq(2)').addClass('active');
			    	break;
			    case "doctorPicManage":
			    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
			    	$('.menulist').children('a:eq(0)').addClass('active');
			    	$('#ysxx').show();
			    	$('#ysxx').children('a:eq(1)').addClass('active');
			    	break;
			    case "patList":
			    	$('.menulist').children('a:eq(1)').addClass('active');
			    	break;
			    case "schedule":
			    	$('.menulist').children('a:eq(2)').addClass('active');
			    	break;
			}
		}
        if(accountType=='patient'){
        	switch(menuIndex){
        	    case "checkRecord":
        	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
        	    	$('#dzbl').show();
        	        $('#dzbl').children('.sub_jcjl').addClass('active');
        	    	break;
        	    case "checkReport":
        	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
        	    	$('#dzbl').show();
    	            $('#dzbl').children('.sub_jyjl').addClass('active');
        	    	break;
        	    case "medicalRecord":
        	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
        	    	$('#dzbl').show();
	                $('#dzbl').children('.sub_bljl').addClass('active');
        	    	break;
        	    case "medicineRecord":
        	    	$('a[data-event="collapse"]:eq(0)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(0)').addClass('active');
        	    	$('#dzbl').show();
                    $('#dzbl').children('.sub_yyjl').addClass('active');
        	    	break;
        	    case "patInfo":
        	    	$('.menulist').children('a:eq(0)').addClass('active');
        	    	break;
        	    case "qotd":
        	    	$('a[data-event="collapse"]:eq(1)').removeClass("collapse-r").addClass("expanding-r");
        	    	$('a[data-event="collapse"]:eq(1)').addClass('active');
        	    	$('#rwgh').show();
    	            $('#rwgh').children('a:eq(0)').addClass('active');
        	    	break;
        	    case "schedule":
        	    	$('.menulist').children('a:eq(1)').addClass('active');
        	    	break;
        	}
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
			var accountType = $("input[name='accountType']").val();
			if('doctor'==accountType){
				 location.href = runParams.mainUrl+'chooseAccountDoc.html';
			}
			if('patient'==accountType){
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