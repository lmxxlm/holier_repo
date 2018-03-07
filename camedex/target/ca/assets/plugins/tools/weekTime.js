//格式化日期
function getLocalDate(unixTime,type){
	var year = unixTime.getFullYear();
	var month = unixTime.getMonth()+1;
	var day = unixTime.getDate();
	var returnDate;
	switch(type){
		case 2:returnDate = year+'-'+month+'-'+day;break;
		case 3:returnDate = year+'年'+month+'月'+day+'日';break;
		default:returnDate = year+'/'+month+'/'+day;
	}
	return returnDate;
}
//-----------------------------------------------------------------------------------------
//根据指定日期获取当年第几周
//selectDate为当前日期
//startDay为日期偏移量 0：星期天，1：为星期一，2,：星期二，依次类推
function getDayInWeekOfYear(selectDate,startDay){
	//将字符串转化为date
	var date = eval('new Date(' + selectDate.replace(/\d+(?=-[^-]+$)/,function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
	var year =date.getFullYear();
	var start_date=new Date(year,0,1);
	//求该年开始时间,本年一月一号所在的下一个周三
	if(start_date.getDay()>startDay){
		start_date.setDate(start_date.getDate() +((7-start_date.getDay())+startDay));
	}else if(start_date.getDay()<startDay){
		start_date.setDate(start_date.getDate() +(startDay-start_date.getDay()));
	}
	var days=(date.getTime()-start_date.getTime())/(24*60*60*1000);
	//如果days小于0说明该天属于上一年最后一周，计算上一年的最后一周
	if(days<0){
		var last_year_start_date=new Date(year-1,0,1);
		var last_year_end_date=new Date(year-1,11,31);
		//求该年开始时间,本年一月一号所在的下一个周三
		if(last_year_start_date.getDay()>startDay){
			last_year_start_date.setDate(last_year_start_date.getDate() +((7-last_year_start_date.getDay())+startDay));
		}else if(last_year_start_date.getDay()<startDay){
			last_year_start_date.setDate(last_year_start_date.getDate() +(startDay-last_year_start_date.getDay()));
		}
		//求该年结束时间，本年12月31号所在的下一个周三
		if(last_year_end_date.getDay()>=startDay){
			last_year_end_date.setDate(last_year_end_date.getDate() +((7-last_year_end_date.getDay())+startDay));
		}else if(last_year_end_date.getDay()<startDay){
			last_year_end_date.setDate(last_year_end_date.getDate() +(startDay-last_year_end_date.getDay()));
		}
		//该年有多少天
		var days=(last_year_end_date.getTime()-last_year_start_date.getTime())/(24*60*60*1000);
		//该年有多少周
		var weeks=days/7.0;
		weeks=weeks<10?"0"+weeks:weeks;
		return (year-1)+"-"+weeks;
	}
	var weeks =Math.floor(days/7.0+1);
	weeks=weeks<10?"0"+weeks:weeks;
	return year+"-"+weeks;
}
//-----------------------------------------------------------------------------------------
//根据周数获取时间
function mm(theyear,weekcount){   
	var year = theyear;
	var week = weekcount;
	if(year=="" || week=="") return;
	var d = new Date(year, 0, 1);
	d.setDate(parseInt("1065432".charAt(d.getDay())) +   week * 7);
	var fe = getFirstAndEnd(d); 
	return fe.first.format("yyyy-MM-dd")+'||'+fe.end.format("yyyy-MM-dd");
}  
Date.prototype.getWeek = function(flag){   
	var first = new Date(this.getFullYear(), 0, 1); 
	var n = parseInt("1065432".charAt(first.getDay())); 
	n = this.getTime()-first.getTime()-n*24*60*60*1000; 
	n = Math.ceil(n/(7*24*60*60*1000)); 
	return (flag==true&&first.getDay()!=1)?(n+1):n; 
};   
Date.prototype.format = function(format){   
	var o = { 
		"M+" : this.getMonth()+1, //month 
		"d+" : this.getDate(), //day 
		"h+" : this.getHours(), //hour 
		"m+" : this.getMinutes(), //minute 
		"s+" : this.getSeconds(), //second 
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter 
		"S" : this.getMilliseconds() //millisecond 
	}   
	if(/(y+)/.test(format)) format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	for(var k in o)if(new RegExp("("+ k +")").test(format)) 
		format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] :("00"+ o[k]).substr((""+ o[k]).length)); 
	return format; 
};  
function getFirstAndEnd(d){   
	var w = d.getDay(), n = 24*60*60*1000; 
	var first = new Date(d.getTime() - parseInt("6012345".charAt(w))*n); 
	var end = new Date(d.getTime() + parseInt("0654321".charAt(w))*n); 
	return {first: first, end: end}; 
}   
//----------------------------------------------------------------------------------------
//获取一年的周数
function getNumOfWeeks(year){
	var d=new Date(year,0,1);
	var yt=( ( year%4==0 && year%100!=0) || year%400==0)?366:365;
	return Math.ceil((yt-d.getDay())/7.0);
}