$(function(){
    setRightMenu();
    $(window).resize(setRightMenu);
    $('#content').scroll(function(){
        var st = $(this).scrollTop();
        if(st>90){
            $('.rightMenu').addClass('fixpos');
        }else{
            $('.rightMenu').removeClass('fixpos');
        }
    });
    function setRightMenu(){
        var r_height = $(window).height()-90;
        r_height = r_height>400?r_height:400;
        var a_height = r_height/8;
        var paddingTop = (a_height-50)/2;
        $('.rightMenu').height(r_height);
        $('.rightMenu a').height(a_height);
        $('.rightMenu a i').css('paddingTop',paddingTop);
    }
    //点击第一大类
	$('.leftMenu').children('a').click(function(){
		var obj = $(this).next('.subtitle');
		if(obj.css('display')=='none'){
			$('.leftMenu .subtitle').slideUp(200);
			$(this).siblings('a').children('.icon-minus-symbol').attr('class','icon-add-symbol');
			$(this).siblings('a').removeClass('active');
			
		    obj.slideDown(200,function(){
		    	$("#menu,#content").getNiceScroll().resize();
		    });
			$(this).children('.icon-add-symbol').attr('class','icon-minus-symbol');
			$(this).addClass('active');
		}else{
		    obj.slideUp(200);
			$(this).children('.icon-minus-symbol').attr('class','icon-add-symbol');
			$(this).removeClass('active');
		}
	});
});