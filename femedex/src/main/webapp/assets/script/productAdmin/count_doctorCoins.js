$(function(){ 
	 //顶部搜索
	   // $('#showAll').click(function(){
	    //	$("#searchForm").submit();
	   // });
	  
		initTime();
	    function initTime(){
	    	var date=$('input[name="date"]').val();
	    	if(date===""){
	    		var d = new Date();
				var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
				$('input[name="date"]').val(str);
	    	}
		}
//		$('#searchTime').click(function(){
//			var date = $('.input-group input[name="date"]').val();
//            var questURL = runParams.mainUrl+'count_doctorCoins.do';
//			var questArr = {
//				date:date,
//				token:token
//			};
//			$.post(questURL,questArr,function(result){
//				if(1==result.status){
//					$('input[name="date"]').val(date);
//					location.href=runParams.mainUrl+"count_doctorCoins.html?hostId="+hostId;
//					
//				}else{
//					alert('查询结果失败！');
//					return false;
//				}
//			});
//		});
		 $('input[name="date"]').datetimepicker({
			  language:'zh-CN',
			  format: 'yyyy-mm-dd',
			  weekStart: 1,
			  todayBtn:  1,
			  autoclose: 1,
			  todayHighlight: 1,
			  forceParse: 0,
			  startView: 2,
			  minView: 2
			  /*pickerPosition:'top-left'  改变弹出框的方向的*/
		  });
		$('.input-group-addon').click(function(){
			initTime();
		    $('#searchForm').submit();
		});
		//tab页面跳转页面
		$('.urlConvert').click(function(){
			var link = $(this).attr('data-link');
			location.href=runParams.mainUrl+link;
		});
//		function searchProduct(){
//			var date = $('input[name="date"]').val();
//			location.href=runParams.mainUrl+'count_doctorCoins.html?date='+date;
//		}
//	   $('.input-group-addon').click(function(){
//		   searchProduct();
//	   });
	});