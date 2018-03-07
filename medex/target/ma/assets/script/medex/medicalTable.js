$(function(){
       	//骨科
       	//添加和修改的共用 取到模态框上的值
       	var add_edit_orth=function(targetObj){//也可以传this   
       	    
       		var operation_date = $('#orth_opedics_modal input[name="operation_date"]').val();
       		var discharge_date=$('#orth_opedics_modal input[name="discharge_date"]').val();
       		
       		
       		var diagnose_disease=$('#orth_opedics_modal input[name="diagnose_disease"]').val();
       		var lower_hospital=$('#orth_opedics_modal input[name="lower_hospital"]').val();
       		var lower_doctor=$('#orth_opedics_modal input[name="lower_doctor"]').val();
       		var duty_expert=$('#orth_opedics_modal input[name="duty_expert"]').val();
       		var duty_ma=$('#orth_opedics_modal input[name="duty_ma"]').val();
       		var record_id=$('#orth_opedics_modal input[name="record_id"]').val();
       		//患者反馈
       		var feedback=$('#orth_opedics_modal  .feedback textarea[name="feedback"]').val();
               //随访内容的值
           
               //3days
       		var td_date=$('#orth_opedics_modal .three_days input[name="date"]').val();
       		var td_month=$('#orth_opedics_modal .three_days input[name="month"]').val();
       		var td_redness=$('#orth_opedics_modal .three_days input[name="redness"]:checked').val();
       		var td_redness_value=$('#orth_opedics_modal .three_days input[name="redness_value"]').val();
       		var td_pain=$('#orth_opedics_modal .three_days input[name="pain"]:checked').val();
       		var td_pain_value=$('#orth_opedics_modal .three_days input[name="pain_value"]').val();
       		var td_bubble=$('#orth_opedics_modal .three_days input[name="bubble"]:checked').val();
       		var td_bubble_value=$('#orth_opedics_modal .three_days input[name="bubble_value"]').val();
       		//=================
       		var td_hot=$('#orth_opedics_modal .three_days input[name="hot"]:checked').val();
       		var td_hot_value=$('#orth_opedics_modal .three_days input[name="hot_value"]').val();
       		
       		var td_cough=$('#orth_opedics_modal .three_days input[name="cough"]:checked').val();
       		var td_cough_value=$('#orth_opedics_modal .three_days input[name="cough_value"]').val();
       		var td_unwell=$('#orth_opedics_modal .three_days input[name="unwell"]:checked').val();
       		var td_unwell_value=$('#orth_opedics_modal .three_days input[name="unwell_value"]').val();
       		var td_medication=$('#orth_opedics_modal .three_days input[name="medication"]:checked').val();
       		var td_medication_value=$('#orth_opedics_modal .three_days input[name="medication_value"]').val();
       		var td_follow_p=$('#orth_opedics_modal .three_days textarea[name="follow_p"]').val();
       	
       		//7days
       		var sd_date=$('#orth_opedics_modal .seven_days input[name="date"]').val();
       		var sd_month=$('#orth_opedics_modal .seven_days input[name="month"]').val();
       		var sd_redness=$('#orth_opedics_modal .seven_days input[name="redness"]:checked').val();
       		var sd_redness_value=$('#orth_opedics_modal .seven_days input[name="redness_value"]').val();
       		var sd_pain=$('#orth_opedics_modal .seven_days input[name="pain"]:checked').val();
       		var sd_pain_value=$('#orth_opedics_modal .seven_days input[name="pain_value"]').val();
       		
       		var sd_bubble=$('#orth_opedics_modal .seven_days input[name="bubble"]:checked').val();
       		var sd_bubble_value=$('#orth_opedics_modal .seven_days input[name="bubble_value"]').val();
       		
       		var sd_hot=$('#orth_opedics_modal .seven_days input[name="hot"]:checked').val();
       		var sd_hot_value=$('#orth_opedics_modal .seven_days input[name="hot_value"]').val();
       		
       		var sd_cough=$('#orth_opedics_modal .seven_days input[name="cough"]:checked').val();
       		var sd_cough_value=$('#orth_opedics_modal .seven_days input[name="cough_value"]').val();
       		var sd_unwell=$('#orth_opedics_modal .seven_days input[name="unwell"]:checked').val();
       		var sd_unwell_value=$('#orth_opedics_modal .seven_days input[name="unwell_value"]').val();
       		var sd_medication=$('#orth_opedics_modal .seven_days input[name="medication"]:checked').val();
       		var sd_medication_value=$('#orth_opedics_modal .seven_days input[name="medication_value"]').val();
       		var sd_follow_p=$('#orth_opedics_modal .seven_days textarea[name="follow_p"]').val();
       		
       		//1 month
       		var om_date=$('#orth_opedics_modal .one_month input[name="date"]').val();
       		var om_month=$('#orth_opedics_modal .one_month input[name="month"]').val();
       		var om_redness=$('#orth_opedics_modal .one_month input[name="redness"]:checked').val();
       		var om_redness_value=$('#orth_opedics_modal .one_month input[name="redness_value"]').val();
       		
       		var om_pain=$('#orth_opedics_modal .one_month input[name="pain"]:checked').val();
       		var om_pain_value=$('#orth_opedics_modal .one_month input[name="pain_value"]').val();
       		
       		var om_bubble=$('#orth_opedics_modal .one_month input[name="bubble"]:checked').val();
       		var om_bubble_value=$('#orth_opedics_modal .one_month input[name="bubble_value"]').val();
       		var om_hot=$('#orth_opedics_modal .one_month input[name="hot"]:checked').val();
       		var om_hot_value=$('#orth_opedics_modal .one_month input[name="hot_value"]').val();
       		var om_cough=$('#orth_opedics_modal .one_month input[name="cough"]:checked').val();
       		var om_cough_value=$('#orth_opedics_modal .one_month input[name="cough_value"]').val();
       		var om_unwell=$('#orth_opedics_modal .one_month input[name="unwell"]:checked').val();
       		var om_unwell_value=$('#orth_opedics_modal .one_month input[name="unwell_value"]').val();
       		var om_medication=$('#orth_opedics_modal .one_month input[name="medication"]:checked').val();
       		var om_medication_value=$('#orth_opedics_modal .one_month input[name="medication_value"]').val();
       		var om_follow_p=$('#orth_opedics_modal .one_month textarea[name="follow_p"]').val();
       		
       		//3 months
       		var tm_date=$('#orth_opedics_modal .three_months input[name="date"]').val();
       		var tm_month=$('#orth_opedics_modal .three_months input[name="month"]').val();
       		var tm_redness=$('#orth_opedics_modal .three_months input[name="redness"]:checked').val();
       		var tm_redness_value=$('#orth_opedics_modal .three_months input[name="redness_value"]').val();
       		var tm_pain=$('#orth_opedics_modal .three_months input[name="pain"]:checked').val();
       		var tm_pain_value=$('#orth_opedics_modal .three_months input[name="pain_value"]').val();
       		var tm_bubble=$('#orth_opedics_modal .three_months input[name="bubble"]:checked').val();
       		var tm_bubble_value=$('#orth_opedics_modal .three_months input[name="bubble_value"]').val();
       		var tm_hot=$('#orth_opedics_modal .three_months input[name="hot"]:checked').val();
       		var tm_hot_value=$('#orth_opedics_modal .three_months input[name="hot_value"]').val();
       		var tm_cough=$('#orth_opedics_modal .three_months input[name="cough"]:checked').val();
       		var tm_cough_value=$('#orth_opedics_modal .three_months input[name="cough_value"]').val();
       		var tm_unwell=$('#orth_opedics_modal .three_months input[name="unwell"]:checked').val();
       		var tm_unwell_value=$('#orth_opedics_modal .three_months input[name="unwell_value"]').val();
       		var tm_recheck=$('#orth_opedics_modal .three_months input[name="recheck"]:checked').val();
       		var tm_recheck_value=$('#orth_opedics_modal .three_months input[name="recheck_value"]').val();
       		
       		var tm_hand_move=$('#orth_opedics_modal .three_months input[name="hand_move"]:checked').val();
       		var tm_foot_move=$('#orth_opedics_modal .three_months input[name="foot_move"]:checked').val();
       		var tm_other_move=$('#orth_opedics_modal .three_months input[name="other_move"]:checked').val();
       		
       		var tm_other_move_value=$('#orth_opedics_modal .three_months input[name="other_move_value"]').val();
       		var tm_follow_p=$('#orth_opedics_modal .three_months textarea[name="follow_p"]').val();
       	
       		
       		//6 months
       		var sixm_date=$('#orth_opedics_modal .six_months input[name="date"]').val();
       		var sixm_month=$('#orth_opedics_modal .six_months input[name="month"]').val();
       		var sixm_diet=$('#orth_opedics_modal .six_months input[name="diet"]:checked').val();
       		var sixm_hyperplasia_situation=$('#orth_opedics_modal .six_months input[name="hyperplasia_situation"]').val();
       		var sixm_regrowth=$('#orth_opedics_modal .six_months input[name="regrowth"]:checked').val();
       		var sixm_regrowth_value=$('#orth_opedics_modal .six_monthsonths input[name="regrowth_value"]').val();
       		var sixm_activity=$('#orth_opedics_modal .six_months input[name="activity"]:checked').val();
       		var sixm_untoward_effect=$('#orth_opedics_modal .six_months input[name="untoward_effect"]').val();
       		var sixm_follow_p=$('#orth_opedics_modal .six_months textarea[name="follow_p"]').val();
       	
       		//三天
       		var three_daysArr = [];
       		
       		var three_days={
       			"td_date":td_date,
       			"td_month":td_month,
       			"td_redness":td_redness,
       			"td_redness_value":td_redness_value,
       			"td_pain":td_pain,
       			"td_pain_value":td_pain_value,
       			"td_bubble":td_bubble,
       			"td_bubble_value":td_bubble_value,
       			"td_hot":td_hot,
       			"td_hot_value":td_hot_value,
       			"td_cough":td_cough,
       			"td_cough_value":td_cough_value,
       			"td_unwell":td_unwell,
       			"td_unwell_value":td_unwell_value,
       			"td_medication":td_medication,
       			"td_medication_value":td_medication_value,
       			"td_follow_p":td_follow_p
       			
       		}//对象
       		
       		three_daysArr.push(three_days);
       		
       		three_days= JSON.stringify(three_daysArr);
       		
       		//七天
       		var seven_daysArr = [];
       		
       		var seven_daysString={
       				
       				"sd_date":sd_date,
       				"sd_month":sd_month,
       				
       				"sd_redness":sd_redness,
       				"sd_redness_value":sd_redness_value,
       				
       				"sd_pain":sd_pain,
       				"sd_pain_value":sd_pain_value,
       				
       				"sd_hot":sd_hot,
       				"sd_hot_value":sd_hot_value,
       				
       				"sd_bubble":sd_bubble,
       				"sd_bubble_value":sd_bubble_value,
       				
       				"sd_cough":sd_cough,
       				"sd_cough_value":sd_cough_value,
       				
       				"sd_unwell":sd_unwell,
       				"sd_unwell_value":sd_unwell_value,
       				
       				"sd_medication":sd_medication,
       				"sd_medication_value":sd_medication_value,
       				
       				"sd_follow_p":sd_follow_p
       				
       			
       		}
       		seven_daysArr.push(seven_daysString);//把对象放到数组里
       		seven_days= JSON.stringify(seven_daysArr);//再把数组转换成json字符串

       		//一个月
       		var one_monthArr = [];
       		
       		var one_month={
       				
       				om_date:om_date,
       				om_month:om_month,
       				om_redness:om_redness,
       				
       				om_redness_value:om_redness_value,
       				om_pain:om_pain,
       				om_pain_value:om_pain_value,
       				om_bubble:om_bubble,
       				om_bubble_value:om_bubble_value,
       				om_hot:om_hot,
       			    om_hot_value:om_hot_value,
       				om_cough:om_cough,
       				om_cough_value:om_cough_value,
       				
       				om_unwell:om_unwell,
       				om_unwell_value:om_unwell_value,
       				om_medication:om_medication,
       				om_medication_value:om_medication_value,
       				om_follow_p:om_follow_p
       				
       			
       		}
       		one_monthArr.push(one_month);//把对象放到数组里
       		one_month= JSON.stringify(one_monthArr);//再把数组转换成json字符串
       		
       		//三个月
       		var three_monthsArr=[];
       		
       		var three_months={
       				tm_date:tm_date,
       				tm_month:tm_month,
       				tm_redness:tm_redness,
       				tm_redness_value:tm_redness_value,
       				tm_pain:tm_pain,
       				tm_pain_value:tm_pain_value,
       				tm_bubble:tm_bubble,
       				tm_bubble_value:tm_bubble_value,
       				tm_hot:tm_hot,
       				tm_hot_value:tm_hot_value,
       				tm_cough:tm_cough,
       				tm_cough_value:tm_cough_value,
       				tm_unwell:tm_unwell,
       				tm_unwell_value:tm_unwell_value,
       				tm_recheck:tm_recheck,
       				tm_recheck_value:tm_recheck_value,
       				
       				tm_hand_move:tm_hand_move,
       				tm_foot_move:tm_foot_move,
       				tm_other_move:tm_other_move,
       				
       				tm_other_move_value:tm_other_move_value,
       				tm_follow_p:tm_follow_p
       		}
       		
       		three_monthsArr.push(three_months);
       		three_months=JSON.stringify(three_monthsArr);
       		//半年
       		var six_monthsArr=[];
       		var six_months={
       			sixm_date:sixm_date,
       			sixm_month:sixm_month,
       			sixm_diet:sixm_diet,
       			sixm_hyperplasia_situation:sixm_hyperplasia_situation,
       			sixm_regrowth:sixm_regrowth,
       			sixm_regrowth_value:sixm_regrowth_value,
       			sixm_activity:sixm_activity,
       			sixm_untoward_effect:sixm_untoward_effect,
       			sixm_follow_p:sixm_follow_p
       		}
       		six_monthsArr.push(six_months);
       		six_months=JSON.stringify(six_monthsArr);
              
       		var medical_record_id=$('li .active').attr('data-id');
       	    var table_name=targetObj.siblings('input[name="table_name"]').val();//table的名字
       	    var table_id=targetObj.siblings('input[name="table_id"]').val();//table的id
       	    var patient_id=targetObj.siblings('input[name="patient_id"]').val();
       	    var token=$('input[name="token"]').val();
       	    var result={
       	    		
       	    		medical_record_id:medical_record_id,
       	    		table_name:table_name,
       				table_id:table_id,
       				patient_id:patient_id,
       				token:token,
       				record_id:record_id,
       				
       				operation_date:operation_date,
       				discharge_date:discharge_date,
       				diagnose_disease:diagnose_disease,
       				lower_hospital:lower_hospital,
       				lower_doctor:lower_doctor,
       				duty_expert:duty_expert,
       				duty_ma:duty_ma,
       				feedback:feedback,
       				
       				three_days:three_days,
       				
       				seven_days:seven_days,
       				
       				one_month:one_month,
       				
       				three_months:three_months,
       				
       				six_months:six_months
       		}
       	    
       	    return result;
       	}
       	
 //=====脑科=========================================================================================================      	
       	
     
    	//添加和修改的共用  取值
    	var add_edit_brain=function(targetObj){//也可以传this   
    		
    		var operation_date = $('#brain_scien_modal input[name="operation_date"]').val();
    		var discharge_date=$('#brain_scien_modal input[name="discharge_date"]').val();
    		var diagnose_disease=$('#brain_scien_modal input[name="diagnose_disease"]').val();
    		var lower_hospital=$('#brain_scien_modal input[name="lower_hospital"]').val();
    		var lower_doctor=$('#brain_scien_modal input[name="lower_doctor"]').val();
    		var duty_expert=$('#brain_scien_modal input[name="duty_expert"]').val();
    		var duty_ma=$('#brain_scien_modal input[name="duty_ma"]').val();
    		var record_id=$('#brain_scien_modal input[name="record_id"]').val();
    		
    		//患者反馈
    		var feedback=$('#brain_scien_modal textarea[name="feedback"]').val();
            //随访内容的值
        
    		//术后一天
    		var od_date=$('#brain_scien_modal .one_day input[name="date"]').val();
    		var od_month=$('#brain_scien_modal .one_day input[name="month"]').val();
    		var od_conscience=$('#brain_scien_modal .one_day input[name="conscience"]').val();
    		var od_after_film=$('#brain_scien_modal .one_day input[name="after_film"]').val();
    		var od_follow_p=$('#brain_scien_modal .one_day textarea[name="follow_p"]').val();
    		
    		//术后七天
    		var sd_date=$('#brain_scien_modal .seven_days input[name="date"]').val();
    		var sd_month=$('#brain_scien_modal .seven_days input[name="month"]').val();
    		var sd_regrowth=$('#brain_scien_modal .seven_days textarea[name="regrowth"]').val();
    		var sd_infect=$('#brain_scien_modal .seven_days textarea[name="infect"]').val();
    		var sd_follow_p=$('#brain_scien_modal .seven_days textarea[name="follow_p"]').val();
    		
    		//术后十天
    		var td_date=$('#brain_scien_modal .ten_days input[name="date"]').val();
    		var td_month=$('#brain_scien_modal .ten_days input[name="month"]').val();
    		var td_remove=$('#brain_scien_modal .ten_days input[name="remove"]:checked').val();
    		var td_remove_value=$('#brain_scien_modal .ten_days input[name="remove_value"]').val();
    		
    		var td_discharged=$('#brain_scien_modal .ten_days input[name="discharged"]:checked').val();
    		var td_discharged_value=$('#brain_scien_modal .ten_days input[name="discharged_value"]').val();
    		var td_discharge_medication=$('#brain_scien_modal .ten_days textarea[name="discharge_medication"]').val();
    		var td_follow_p=$('#brain_scien_modal .ten_days textarea[name="follow_p"]').val();
    		
    		
           //术后一个月
    		
    		var om_date=$('#brain_scien_modal .one_month input[name="date"]').val();
    		var om_month=$('#brain_scien_modal .one_month input[name="month"]').val();
    		var om_review_production=$('#brain_scien_modal .one_month input[name="review_production"]').val();
    		var om_regrowth_status=$('#brain_scien_modal .one_month input[name="regrowth_status"]').val();
    		var om_medication=$('#brain_scien_modal .one_month input[name="medication"]').val();
    		var om_follow_p=$('#brain_scien_modal .one_month textarea[name="follow_p"]').val();
    		
    		//术后三个月
    		
    		var tm_date=$('#brain_scien_modal .three_months input[name="date"]').val();
    		var tm_month=$('#brain_scien_modal .three_months input[name="month"]').val();
    		var tm_review_production=$('#brain_scien_modal .three_months input[name="review_production"]').val();
    		var tm_recover=$('#brain_scien_modal .three_months input[name="recover"]').val();
    		var tm_improve=$('#brain_scien_modal .three_months input[name="improve"]').val();
    		var tm_follow_p=$('#brain_scien_modal .three_months textarea[name="follow_p"]').val();
    		
    		//术后半年
    		
    		var sm_date=$('#brain_scien_modal .six_months input[name="date"]').val();
    		var sm_month=$('#brain_scien_modal .six_months input[name="month"]').val();
    		var sm_review_photo=$('#brain_scien_modal .six_months input[name="review_photo"]').val();
    		var sm_review=$('#brain_scien_modal .six_months input[name="review"]').val();
    		var sm_follow_p=$('#brain_scien_modal .six_months textarea[name="follow_p"]').val();
    		
    		
    		//术后一年
    		var oy_date=$('#brain_scien_modal .one_year input[name="date"]').val();
    		var oy_month=$('#brain_scien_modal .one_year input[name="month"]').val();
    		var oy_review_photo=$('#brain_scien_modal .one_year input[name="review_photo"]').val();
    		var oy_review_drug=$('#brain_scien_modal .one_year input[name="review_drug"]').val();
    		var oy_follow_p=$('#brain_scien_modal .one_year textarea[name="follow_p"]').val();
    		
    		//术后二年
    		var ty_date=$('#brain_scien_modal .two_years input[name="date"]').val();
    		var ty_month=$('#brain_scien_modal .two_years input[name="month"]').val();
    		var ty_review_photo=$('#brain_scien_modal .two_years input[name="review_photo"]').val();
    		var ty_review_stop=$('#brain_scien_modal .two_years input[name="review_stop"]').val();
    		var ty_follow_p=$('#brain_scien_modal .two_years textarea[name="follow_p"]').val();
    		
    		//术后一天
    		var one_day=[];
    		var one_day_str={
    			"od_date":od_date,
    			"od_month":od_month,
    			"od_conscience":od_conscience,
    			"od_after_film":od_after_film,
    			"od_follow_p":od_follow_p
    		}//对象
    		one_day.push(one_day_str);
    		one_day= JSON.stringify(one_day);
    		
    		
    		//术后七天
    		var seven_days=[];
    		var seven_days_str={
    			"sd_date":sd_date,
    			"sd_month":sd_month,
    			"sd_regrowth":sd_regrowth,
    			"sd_infect":sd_infect,
    			"sd_follow_p":sd_follow_p
    		}//对象
    		seven_days.push(seven_days_str);
    		seven_days= JSON.stringify(seven_days);
    		
    		//术后十天
    		var ten_days=[];
    		var ten_days_str={
    			"td_date":td_date,
    			"td_month":td_month,
    			"td_remove":td_remove,
    			"td_remove_value":td_remove_value,
    			"td_discharged":td_discharged,
    			"td_discharged_value":td_discharged_value,
    			"td_discharge_medication":td_discharge_medication,
    			"td_follow_p":td_follow_p
    		}//对象
    		ten_days.push(ten_days_str);
    		ten_days= JSON.stringify(ten_days);
    		
    		
    		//术后一个月
    		var one_month=[];
    		var one_month_str={
    				"om_date":om_date,
    				"om_month":om_month,
    				"om_review_production":om_review_production,
    				"om_regrowth_status":om_regrowth_status,
    				"om_medication":om_medication,
    				"om_follow_p":om_follow_p
    		}//对象
    		one_month.push(one_month_str);	
    		one_month= JSON.stringify(one_month);
    		
    		
    		//术后三个月
    		var three_months=[];
    		var three_months_str={
    				"tm_date":om_date,
    				"tm_month":tm_month,
    				"tm_review_production":tm_review_production,
    				"tm_recover":tm_recover,
    				"tm_improve":tm_improve,
    				"tm_follow_p":tm_follow_p
    			}//对象
    		three_months.push(three_months_str);	
    		three_months= JSON.stringify(three_months);
    		
    		//术后半年
    		var six_months=[];
    		var six_months_str={
    				"sm_date":sm_date,
    				"sm_month":sm_month,
    				"sm_review_photo":sm_review_photo,
    				"sm_review":sm_review,
    				"sm_follow_p":sm_follow_p
    			}//对象
    		six_months.push(six_months_str);	
    		six_months= JSON.stringify(six_months);
    		
    		//术后一年
    		var one_year=[];
    		var one_year_str={
    				"oy_date":oy_date,
    				"oy_month":oy_month,
    				"oy_review_photo":oy_review_photo,
    				"oy_review_drug":oy_review_drug,
    				"oy_follow_p":oy_follow_p
    			}//对象
    		one_year.push(one_year_str);	
    		one_year= JSON.stringify(one_year);

    		
    		//术后二年
    		var two_years=[];
    		var two_years_str={
    				"ty_date":ty_date,
    				"ty_month":ty_month,
    				"ty_review_photo":ty_review_photo,
    				"ty_review_stop":ty_review_stop,
    				"ty_follow_p":ty_follow_p
    			}//对象
    		two_years.push(two_years_str);	
    		two_years= JSON.stringify(two_years);

    		var medical_record_id=$('li .active').attr('data-id');
        	 var table_name=targetObj.siblings('input[name="table_name"]').val();//table的名字
       	     var table_id=targetObj.siblings('input[name="table_id"]').val();//table的id
       	     var patient_id=targetObj.siblings('input[name="patient_id"]').val();
       	     var token=$('input[name="token"]').val();
    	    
    	    
    	    var result={
    	    		medical_record_id:medical_record_id,
       	    		table_name:table_name,
       				table_id:table_id,
       				patient_id:patient_id,
       				token:token,
       				record_id:record_id,
    				
    				operation_date:operation_date,
    				discharge_date:discharge_date,
    				diagnose_disease:diagnose_disease,
    				lower_hospital:lower_hospital,
    				lower_doctor:lower_doctor,
    				duty_expert:duty_expert,
    				duty_ma:duty_ma,
    				feedback:feedback,
    				
    				one_day:one_day,
    				
    				seven_days:seven_days,
    				
    				ten_days:ten_days,
    				
    				one_month:one_month,
    				
    				three_months:three_months,
    				
    				six_months:six_months,
    				
    				one_year:one_year,
    				
    				two_years:two_years
    				
    		}
    	    
    	    return result;
    	}
	 
    //===肛肠科========================================================================================
 

    	
    	//添加和修改的共用  取值
    	var add_edit_ano=function(targetObj){
    		var operation_date = $('#ano_surgical_modal input[name="operation_date"]').val();
    		var discharge_date=$('#ano_surgical_modal input[name="discharge_date"]').val();
    		var diagnose_disease=$('#ano_surgical_modal input[name="diagnose_disease"]').val();
    		var lower_hospital=$('#ano_surgical_modal input[name="lower_hospital"]').val();
    		var lower_doctor=$('#ano_surgical_modal input[name="lower_doctor"]').val();
    		var duty_expert=$('#ano_surgical_modal input[name="duty_expert"]').val();
    		var duty_ma=$('#ano_surgical_modal input[name="duty_ma"]').val();
    		var record_id=$('#ano_surgical_modal input[name="record_id"]').val();
    		//患者反馈
    		var feedback=$('#ano_surgical_modal textarea[name="feedback"]').val();
    	    //随访内容的值
    		//术后一周
    		var ow_date=$('#ano_surgical_modal .one_week input[name="date"]').val();
    		var ow_month=$('#ano_surgical_modal .one_week input[name="month"]').val();
    		var ow_anus_gas=$('#ano_surgical_modal .one_week input[name="anus_gas"]').val();
    		var ow_discharged=$('#ano_surgical_modal .one_week input[name="discharged"]').val();
    		var ow_stoma_bags=$('#ano_surgical_modal .one_week input[name="stoma_bags"]').val();
    		var ow_follow_p=$('#ano_surgical_modal .one_week textarea[name="follow_p"]').val();
    	    
    		//术后一个月
    		
    		var om_date=$('#ano_surgical_modal .one_month input[name="date"]').val();
    		var om_month=$('#ano_surgical_modal .one_month input[name="month"]').val();
    		var om_recheck=$('#ano_surgical_modal .one_month input[name="recheck"]').val();
    		var om_recheck_status=$('#ano_surgical_modal .one_month input[name="recheck_status"]').val();
    		var om_diet_status=$('#ano_surgical_modal .one_month input[name="diet_status"]').val();
    		var om_shit_character=$('#ano_surgical_modal .one_month input[name="shit_character"]').val();
    		var om_shit_blood=$('#ano_surgical_modal .one_month input[name="shit_blood"]').val();
    		var om_belly_pain=$('#ano_surgical_modal .one_month input[name="belly_pain"]').val();
    		var om_stomabags_status=$('#ano_surgical_modal .one_month input[name="stomabags_status"]').val();
    		var om_follow_p=$('#ano_surgical_modal .one_month textarea[name="follow_p"]').val();
    		
    		
    		//术后三个月
    		
    		var tm_date=$('#ano_surgical_modal .three_months input[name="date"]').val();
    		var tm_month=$('#ano_surgical_modal .three_months input[name="month"]').val();
    		var tm_recheck=$('#ano_surgical_modal .three_months input[name="recheck"]').val();
    		var tm_recheck_status=$('#ano_surgical_modal .three_months input[name="recheck_status"]').val();
    		var tm_body_status=$('#ano_surgical_modal .three_months input[name="body_status"]').val();
    		var tm_stomach=$('#ano_surgical_modal .three_months input[name="stomach"]').val();
    		var tm_shit_character=$('#ano_surgical_modal .three_months input[name="shit_character"]').val();
    		var tm_belly_pain=$('#ano_surgical_modal .three_months input[name="belly_pain"]').val();
    		var tm_stomabags_status=$('#ano_surgical_modal .three_months input[name="stomabags_status"]').val();
    		var tm_follow_p=$('#ano_surgical_modal .three_months textarea[name="follow_p"]').val();
    		
    		
    		//术后半年
    		
    		var sm_date=$('#ano_surgical_modal .six_months input[name="date"]').val();
    		var sm_month=$('#ano_surgical_modal .six_months input[name="month"]').val();
    		var sm_recheck=$('#ano_surgical_modal .six_months input[name="recheck"]').val();
    		var sm_recheck_status=$('#ano_surgical_modal .six_months input[name="recheck_status"]').val();
    		var sm_body_status=$('#ano_surgical_modal .six_months input[name="body_status"]').val();
    		var sm_stomach=$('#ano_surgical_modal .six_months input[name="stomach"]').val();
    		var sm_shit_character=$('#ano_surgical_modal .six_months input[name="shit_character"]').val();
    		var sm_shit_blood=$('#ano_surgical_modal .six_months input[name="shit_blood"]').val();
    		var sm_belly_pain=$('#ano_surgical_modal .six_months input[name="belly_pain"]').val();
    		var sm_stomabags_status=$('#ano_surgical_modal .six_months input[name="stomabags_status"]').val();
    		var sm_follow_p=$('#ano_surgical_modal .six_months textarea[name="follow_p"]').val();
    		
    		
    		//术后一年
    		var oy_date=$('#ano_surgical_modal .one_year input[name="date"]').val();
    		var oy_month=$('#ano_surgical_modal .one_year input[name="month"]').val();
    		var oy_recheck=$('#ano_surgical_modal .one_year input[name="recheck"]').val();
    		var oy_recheck_status=$('#ano_surgical_modal .one_year input[name="recheck_status"]').val();
    		var oy_body_status=$('#ano_surgical_modal .one_year input[name="body_status"]').val();
    		var oy_stomach=$('#ano_surgical_modal .one_year input[name="stomach"]').val();
    		var oy_shit_character=$('#ano_surgical_modal .one_year input[name="shit_character"]').val();
    		var oy_shit_blood=$('#ano_surgical_modal .one_year input[name="shit_blood"]').val();
    		var oy_belly_pain=$('#ano_surgical_modal .one_year input[name="belly_pain"]').val();
    		var oy_stomabags_status=$('#ano_surgical_modal .one_year input[name="stomabags_status"]').val();
    		var oy_follow_p=$('#ano_surgical_modal .one_year textarea[name="follow_p"]').val();

    		//术后二年
    		var ty_date=$('#ano_surgical_modal .two_years input[name="date"]').val();
    		var ty_month=$('#ano_surgical_modal .two_years input[name="month"]').val();
    		var ty_recheck=$('#ano_surgical_modal .two_years input[name="recheck"]').val();
    		var ty_recheck_status=$('#ano_surgical_modal .two_years input[name="recheck_status"]').val();
    		var ty_body_status=$('#ano_surgical_modal .two_years input[name="body_status"]').val();
    		var ty_stomach=$('#ano_surgical_modal .two_years input[name="stomach"]').val();
    		var ty_shit_character=$('#ano_surgical_modal .two_years input[name="shit_character"]').val();
    		var ty_shit_blood=$('#ano_surgical_modal .two_years input[name="shit_blood"]').val();
    		var ty_belly_pain=$('#ano_surgical_modal .two_years input[name="belly_pain"]').val();
    		var ty_stomabags_status=$('#ano_surgical_modal .two_years input[name="stomabags_status"]').val();
    		var ty_follow_p=$('#ano_surgical_modal .two_years textarea[name="follow_p"]').val();
    		
    		//术后一周
    		var one_week=[];
    		var one_week_str={
    			"ow_date":ow_date,
    			"ow_month":ow_month,
    			"ow_anus_gas":ow_anus_gas,
    			"ow_discharged":ow_discharged,
    			"ow_stoma_bags":ow_stoma_bags,
    			"ow_follow_p":ow_follow_p
    		}//对象
    		one_week.push(one_week_str);
    		one_week= JSON.stringify(one_week);
    		
    		
    		
    		//术后一个月
    		var one_month=[];
    		var one_month_str={
    				"om_date":om_date,
    				"om_month":om_month,
    				"om_recheck":om_recheck,
    				"om_recheck_status":om_recheck_status,
    				"om_diet_status":om_diet_status,
    				"om_shit_character":om_shit_character,
    				"om_shit_blood":om_shit_blood,
    				"om_belly_pain":om_belly_pain,
    				"om_stomabags_status":om_stomabags_status,
    				"om_follow_p":om_follow_p
    		}//对象
    		one_month.push(one_month_str);	
    		one_month= JSON.stringify(one_month);
    		
    		
    		//术后三个月
    		var three_months=[];
    		var three_months_str={
    				"tm_date":tm_date,
    				"tm_month":tm_month,
    				"tm_recheck":tm_recheck,
    				"tm_recheck_status":tm_recheck_status,
    				"tm_body_status":tm_body_status,
    				"tm_stomach":tm_stomach,
    				"tm_shit_character":tm_shit_character,
    				"tm_belly_pain":tm_belly_pain,
    				"tm_stomabags_status":tm_stomabags_status,
    				"tm_follow_p":tm_follow_p
    			}//对象
    		three_months.push(three_months_str);	
    		three_months= JSON.stringify(three_months);
    		
    		//术后半年
    		var six_months=[];
    		var six_months_str={
    				"sm_date":sm_date,
    				"sm_month":sm_month,
    				"sm_recheck":sm_recheck,
    				"sm_recheck_status":sm_recheck_status,
    				"sm_body_status":sm_body_status,
    				"sm_stomach":sm_stomach,
    				"sm_shit_character":sm_shit_character,
    				"sm_shit_blood":sm_shit_blood,
    				"sm_belly_pain":sm_belly_pain,
    				"sm_stomabags_status":sm_stomabags_status,
    				"sm_follow_p":sm_follow_p
    			}//对象
    		six_months.push(six_months_str);	
    		six_months= JSON.stringify(six_months);
    		
    		//术后一年
    		var one_year=[];
    		var one_year_str={
    				"oy_date":oy_date,
    				"oy_month":oy_month,
    				"oy_recheck":oy_recheck,
    				"oy_recheck_status":oy_recheck_status,
    				"oy_body_status":oy_body_status,
    				"oy_stomach":oy_stomach,
    				"oy_shit_character":oy_shit_character,
    				"oy_shit_blood":oy_shit_blood,
    				"oy_belly_pain":oy_belly_pain,
    				"oy_stomabags_status":oy_stomabags_status,
    				"oy_follow_p":oy_follow_p
    			}//对象
    		one_year.push(one_year_str);	
    		one_year= JSON.stringify(one_year);

    		
    		//术后二年
    		var two_years=[];
    		var two_years_str={
    				"ty_date":ty_date,
    				"ty_month":ty_month,
    				"ty_recheck":ty_recheck,
    				"ty_recheck_status":ty_recheck_status,
    				"ty_body_status":ty_body_status,
    				"ty_stomach":ty_stomach,
    				"ty_shit_character":ty_shit_character,
    				"ty_belly_pain":ty_belly_pain,
    				"ty_shit_blood":ty_shit_blood,
    				"ty_stomabags_status":ty_stomabags_status,
    				"ty_follow_p":ty_follow_p
    			}//对象
    		two_years.push(two_years_str);	
    		two_years= JSON.stringify(two_years);

    		var medical_record_id=$('li .active').attr('data-id');
       	     var table_name=targetObj.siblings('input[name="table_name"]').val();//table的名字
      	     var table_id=targetObj.siblings('input[name="table_id"]').val();//table的id
      	     var patient_id=targetObj.siblings('input[name="patient_id"]').val();
      	     var token=$('input[name="token"]').val();
    	    
    	    
    	    var result={
    	    		medical_record_id:medical_record_id,
       	    		table_name:table_name,
       				table_id:table_id,
       				patient_id:patient_id,
       				token:token,
       				record_id:record_id,
    				
    				operation_date:operation_date,
    				discharge_date:discharge_date,
    				diagnose_disease:diagnose_disease,
    				lower_hospital:lower_hospital,
    				lower_doctor:lower_doctor,
    				duty_expert:duty_expert,
    				duty_ma:duty_ma,
    				feedback:feedback,
    				
    				
    				one_week:one_week,
    				
    				one_month:one_month,
    				
    				three_months:three_months,
    				
    				six_months:six_months,
    				
    				one_year:one_year,
    				
    				two_years:two_years
    				
    		}
    	    
    	    return result;
    	}

    
    	//门诊记录（序列化进行取值）
 		var add_edit_commen=function(targetObj){
 			 var medical_record_id=$('input[name="medicalRecordId"]').val();
      	     var table_name=targetObj.siblings('input[name="table_name"]').val();//table的名字
     	     var table_id=targetObj.siblings('input[name="table_id"]').val();//table的id
     	     var patient_id=targetObj.siblings('input[name="patient_id"]').val();
     	     var record_id=targetObj.siblings('input[name="record_id"]').val();
     	     var token=$('input[name="token"]').val();
 			 //var str=targetObj.parent().parent().parent().find('form').serialize();
 			 //判断如果是门诊记录
 			 var outpatient_content=targetObj.parent().parent().parent().find('form').serializeArray();
 			 outpatient_content= JSON.stringify(outpatient_content);
 			 if(table_id=="outpatient_records_modal"){
 	 			  var result={
 	 					medical_record_id:medical_record_id,
 	 	   	    		table_name:table_name,
 	 	   				table_id:table_id,
 	 	   				patient_id:patient_id,
 	 	   				token:token,
 	 	   				record_id:record_id,
 	 	   				outpatient_content:outpatient_content
 	 	 			 }
 	 			 
 			 }else{
 				var result={
 	 					medical_record_id:medical_record_id,
 	 	   	    		table_name:table_name,
 	 	   				table_id:table_id,
 	 	   				patient_id:patient_id,
 	 	   				token:token,
 	 	   				record_id:record_id,
 	 	   			    medical_record_content:outpatient_content
 	 	 			 }
 			 }
 			
 			return result;
 			 
    	  }
    	
    	
    	//时间下拉框
    	$('input[class="commen_date"]').datetimepicker({
			language:  'zh-CN',
			format: 'yyyy-mm-dd',
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			forceParse: 0,
			startView: 2,
			minView: 2
		  });
		
    	
       	//模态框添加表格按钮--------增
       	$('.doSubmit').live('click',function(){
       	      var targetObj=$(this);
       	      var table_name=targetObj.siblings('input[name="table_name"]').val();//自己得
       	      //alert("这是"+table_name+"表格");
       	      var table_id=targetObj.siblings('input[name="table_id"]').val();
       	      var questArr=add_edit_brain(targetObj);
       	      var questArr='';
       	      if(table_id=="brain_scien_modal"){//脑科
       	    	  questArr=add_edit_brain(targetObj);
       	    	  //添加/修改的所有字段取值 
       	      }else if(table_id=="orth_opedics_modal"){//骨科
       	    	  questArr=add_edit_orth(targetObj);
       	      }else if(table_id=="ano_surgical_modal"){//肛肠科
       	    	  questArr=add_edit_ano(targetObj);
       	      }else{
       	    	  questArr=add_edit_commen(targetObj);
       	      }
       	      //添加时间控件
       	      $('#'+table_id).find('.commen_date').each(function(){
       	    	  //checkDate1($(this).val());
       	    	if(!DATE_FORMAT.test($(this).val())){
     	    		  alert("格式有问题，正确格式如2011-01-02");
     	    	  }
     	    	   
       	      });
       	      
       		  var questURL=runParams.mainUrl+'patient/add_medical_record_table.do';
       			 $.post(questURL,questArr,function(result){
          			  result=eval('('+result+')');
          			  if(result.status==true){
          					alert('添加表格成功');
          				    var token =result.data.token;
          				    $('input[name="token"]').val(token);
          					var medical_record_id=$('li .active').attr('data-id');
          					var record_id=result.data.record_id;
          				    //获取录入时间
          					var input_time=result.data.input_time;
          					//获取table_name
          					var table_name=result.data.table_name;
          				    //判断table_name是否含有‘-’
          					if(table_name.contains('-')){
          						var name=table_name.split('-');
              					var name1=name[0];
              					var name2=name[1];
              					$('.virtual_table').before('<div class="tableUnit"><input type="hidden" name="record_id" value="'+record_id+'"/><input type="hidden" name="table_id" value="'+table_id+'"/><input type="hidden" name="input_time" value="'+input_time+'"/><a href="javascript:void(0);"  class="tableName"><span class="name1">'+name[0]+'</span><span class="name2">'+name[1]+'</span></a><span class="span_time">'+input_time+'</span><a href="javascript:void(0)" class="deleteTable" >删除</a></div>');
              					targetObj.siblings('button[data-dismiss="modal"]').click().trigger('click');//把模态框关掉
          					}else{
          						$('.virtual_table').before('<div class="tableUnit"><input type="hidden" name="record_id" value="'+record_id+'"/><input type="hidden" name="table_id" value="'+table_id+'"/><input type="hidden" name="input_time" value="'+input_time+'"/><a href="javascript:void(0);"  class="tableName"><span>'+table_name+'</span></a><span class="span_time">'+input_time+'</span><a href="javascript:void(0)" class="deleteTable" >删除</a></div>');
              					targetObj.siblings('button[data-dismiss="modal"]').click().trigger('click');//把模态框关掉
          					}
          				}else{
          					alert('添加表格失败');
          				}
          		  }); 
       		 
       });
       	/*--右面的删除------------------------------------------------------------------------------------*/
       	
       	$('.recordArea .glyphicon-remove').parent('.btn').click(function(){
		var token = $('input[name="token"]').val();
		var medicalRecordId = $(this).siblings('input[name="medicalRecordId"]').val();
		if(!medicalRecordId){
		    alert('未找到该条记录！');  
			return false;
		}
		if(confirm('确定要删除这条记录吗？')){
		    var questArr = {
		    	medical_recordId:medicalRecordId,
				token:token
			};
			var questURL = runParams.mainUrl+'patient/medicalRecordDelete.do';
			$.post(questURL,questArr,function(result){
				if(1==result){
				    location.reload();
				}else{
				    alert(result.message);
					return false;
				}
			});
		}
	});
       	
       	
       	
       	
       	
       	
       	$("#dataLoad").show(); //进度条显示
    //列表页获取表格数据(一刷新的时候和点击时间的时候用到)-------------刷新和加载页面时用
       	function getMedicalTableList(){
       		var medical_record_id=$('li .active').attr('data-id');
       		var targetObj = $('.medicalTableList');
       		var medical_record_id = $('input[name="medicalRecordId"]').val();
       		if(!medical_record_id){
       			$('.page_table').hide();
       			$('.page_img').hide();
       			return false;
       		}
       		var token=$('input[name="token"]').val();
       		var questURL = runParams.mainUrl+'patient/list_medical_record_table.do';
       		var questArr = {
       			medical_record_id:medical_record_id,
       			token:token
       		};
       		//targetObj.html('<a class="virtual_table" title="新增表格" href="#" title="新增表格"  data-toggle="modal"  data-target="#myModal"><span class="glyphicon glyphicon-plus-sign"></span></a>');
       		$.post(questURL,questArr,function(result){
       			$("#dataLoad").hide(); //进度条隐藏
       			targetObj.html('<a class="virtual_table" title="新增表格" href="javascript:void(0);" title="新增表格"  data-toggle="modal"  data-target="#myModal"><span class="glyphicon glyphicon-plus-sign"></span></a>');
       			result= eval('(' + result + ')');
       			if(result.status==true){
       				for(var i=0;i<result.data.length;i++){
       					//获取这个页面的记录id
       					var medical_record_id=result.data[i].medical_record_id;
       					
       					//获取表格记录id
       					var record_id=result.data[i].record_id;
       					
       					//获取table_id
       					var table_id=result.data[i].table_id;
       					
       					//获取录入时间
       					var input_time=result.data[i].input_time;
       					
       					//循环遍历在页面生成小框框
       			       // targetObj.children('.virtual_table').before('<div class="tableUnit"><input type="hidden" name="record_id" value="'+record_id+'"/><input type="hidden" name="table_id" value="'+table_id+'"/><input type="hidden" name="input_time" value="'+input_time+'"/><a href="javascript:void(0);"  class="tableName"><span>'+table_name+'</span></a><span class="span_time">'+input_time+'</span><a href="javascript:void(0)" class="deleteTable" >删除</a></div>');
       				
       				    //获取table_name
       					var table_name=result.data[i].table_name;
	   				    //判断table_name是否含有‘-’
	   					if(table_name.contains('-')){
	   						var name=table_name.split('-');
	       					var name1=name[0];
	       					var name2=name[1];
	       					targetObj.children('.virtual_table').before('<div class="tableUnit"><input type="hidden" name="record_id" value="'+record_id+'"/><input type="hidden" name="table_id" value="'+table_id+'"/><input type="hidden" name="input_time" value="'+input_time+'"/><a href="javascript:void(0);"  class="tableName"><span class="name1">'+name[0]+'</span><span class="name2">'+name[1]+'</span></a><span class="span_time">'+input_time+'</span><a href="javascript:void(0)" class="deleteTable" >删除</a></div>');
	   					}else{
	   						targetObj.children('.virtual_table').before('<div class="tableUnit"><input type="hidden" name="record_id" value="'+record_id+'"/><input type="hidden" name="table_id" value="'+table_id+'"/><input type="hidden" name="input_time" value="'+input_time+'"/><a href="javascript:void(0);"  class="tableName"><span>'+table_name+'</span></a><span class="span_time">'+input_time+'</span><a href="javascript:void(0)" class="deleteTable" >删除</a></div>');
	   					}
       			        
       				}
       			}
       		});  
       	}
       	getMedicalTableList();  //页面已载入时候就调用
       	//进行延迟测试
       //	setTimeout(function(){
       		//getMedicalTableList();
      	//},3000);
       	//=========================================================
       		
     //骨科---详情页赋值
     function orth_detail_val(result){
    	    $('#orth_opedics_modal input[name="operation_date"]').val(result.data.operation_date);
    		$('#orth_opedics_modal input[name="discharge_date"]').val(result.data.discharge_date);
    		$('#orth_opedics_modal input[name="diagnose_disease"]').val(result.data.diagnose_disease);
    		$('#orth_opedics_modal input[name="lower_hospital"]').val(result.data.lower_hospital);
    		$('#orth_opedics_modal input[name="lower_doctor"]').val(result.data.lower_doctor);
    		$('#orth_opedics_modal input[name="duty_expert"]').val(result.data.duty_expert);
    		$('#orth_opedics_modal input[name="duty_ma"]').val(result.data.duty_ma);
    		$('#orth_opedics_modal input[name="record_id"]').val(result.data.record_id);
    		//患者反馈
    		$('#orth_opedics_modal  .feedback textarea[name="feedback"]').val(result.data.feedback);
            //随访内容的值
            var three_days=eval('('+result.data.three_days+')');
            var seven_days=eval('('+result.data.seven_days+')');
            var one_month=eval('('+result.data.one_month+')');
            var three_months=eval('('+result.data.three_months+')');
            var six_months=eval('('+result.data.six_months+')');
            //3days
    		$('#orth_opedics_modal .three_days input[name="date"]').val(three_days[0].td_date);
    		$('#orth_opedics_modal .three_days input[name="month"]').val(three_days[0].td_month);
    		
    		$('#orth_opedics_modal .three_days input[name="redness"][value="'+three_days[0].td_redness+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_days input[name="redness_value"]').val(three_days[0].td_redness_value);
    		$('#orth_opedics_modal .three_days input[name="pain"][value="'+three_days[0].td_pain+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_days input[name="pain_value"]').val(three_days[0].td_pain_value);
    		$('#orth_opedics_modal .three_days input[name="bubble"][value="'+three_days[0].td_bubble+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_days input[name="bubble_value"]').val(three_days[0].td_bubble_value);
    		
    		
    		$('#orth_opedics_modal .three_days input[name="hot"][value="'+three_days[0].td_hot+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_days input[name="hot_value"]').val(three_days[0].td_hot_value);
    		
    		
    		$('#orth_opedics_modal .three_days input[name="cough"][value="'+three_days[0].td_cough+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_days input[name="cough_value"]').val(three_days[0].td_cough_value);
    		
    		$('#orth_opedics_modal .three_days input[name="unwell"][value="'+three_days[0].td_unwell+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_days input[name="unwell_value"]').val(three_days[0].td_unwell_value);
    		
    		
    		$('#orth_opedics_modal .three_days input[name="medication"][value="'+three_days[0].td_medication+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_days input[name="medication_value"]').val(three_days[0].td_medication_value);
    		$('#orth_opedics_modal .three_days textarea[name="follow_p"]').val(three_days[0].td_follow_p);
    	
    		//7days
    		$('#orth_opedics_modal .seven_days input[name="date"]').val(seven_days[0].sd_date);
    		$('#orth_opedics_modal .seven_days input[name="month"]').val(seven_days[0].sd_month);
    		
    		$('#orth_opedics_modal .seven_days input[name="redness"][value="'+seven_days[0].sd_redness+'"]').attr('checked',true);
    		$('#orth_opedics_modal .seven_days input[name="redness_value"]').val(seven_days[0].sd_redness_value);
    		
    		$('#orth_opedics_modal .seven_days input[name="pain"][value="'+seven_days[0].sd_pain+'"]').attr('checked',true);
    		$('#orth_opedics_modal .seven_days input[name="pain_value"]').val(seven_days[0].sd_pain_value);
    		
    		$('#orth_opedics_modal .seven_days input[name="hot"][value="'+seven_days[0].sd_hot+'"]').attr('checked',true);
    		$('#orth_opedics_modal .seven_days input[name="hot_value"]').val(seven_days[0].sd_hot_value);
    		
    		$('#orth_opedics_modal .seven_days input[name="bubble"][value="'+seven_days[0].sd_bubble+'"]').attr('checked',true);
    		$('#orth_opedics_modal .seven_days input[name="bubble_value"]').val(seven_days[0].sd_bubble_value);
    		
    		$('#orth_opedics_modal .seven_days input[name="cough"][value="'+seven_days[0].sd_cough+'"]').attr('checked',true);
    		$('#orth_opedics_modal .seven_days input[name="cough_value"]').val(seven_days[0].sd_cough_value);
    		
    		$('#orth_opedics_modal .seven_days input[name="unwell"][value="'+seven_days[0].sd_unwell+'"]').attr('checked',true);
    		$('#orth_opedics_modal .seven_days input[name="unwell_value"]').val(seven_days[0].sd_unwell_value);
    		
    		$('#orth_opedics_modal .seven_days input[name="medication"][value="'+seven_days[0].sd_medication+'"]').attr('checked',true);
    		$('#orth_opedics_modal .seven_days input[name="medication_value"]').val(seven_days[0].sd_medication_value);
    		$('#orth_opedics_modal .seven_days textarea[name="follow_p"]').val(seven_days[0].sd_follow_p);
    		
    		//1 month
    		$('#orth_opedics_modal .one_month input[name="date"]').val(one_month[0].om_date);
    		$('#orth_opedics_modal .one_month input[name="month"]').val(one_month[0].om_month);
    		$('#orth_opedics_modal .one_month input[name="redness"][value="'+one_month[0].om_redness+'"]').attr('checked',true);
    		$('#orth_opedics_modal .one_month input[name="redness_value"]').val(one_month[0].om_redness_value);
    		$('#orth_opedics_modal .one_month input[name="pain"][value="'+one_month[0].om_pain+'"]').attr('checked',true);
    		$('#orth_opedics_modal .one_month input[name="pain_value"]').val(one_month[0].om_pain_value);
    		$('#orth_opedics_modal .one_month input[name="bubble"][value="'+one_month[0].om_bubble+'"]').attr('checked',true);
    		$('#orth_opedics_modal .one_month input[name="bubble_value"]').val(one_month[0].om_bubble_value);
    		$('#orth_opedics_modal .one_month input[name="hot"][value="'+one_month[0].om_hot+'"]').attr('checked',true);
    		$('#orth_opedics_modal .one_month input[name="hot_value"]').val(one_month[0].om_hot_value);
    		$('#orth_opedics_modal .one_month input[name="cough"][value="'+one_month[0].om_cough+'"]').attr('checked',true);
    		$('#orth_opedics_modal .one_month input[name="cough_value"]').val(one_month[0].om_cough_value);
    		$('#orth_opedics_modal .one_month input[name="unwell"][value="'+one_month[0].om_unwell+'"]').attr('checked',true);
    		$('#orth_opedics_modal .one_month input[name="unwell_value"]').val(one_month[0].om_unwell_value);
    		$('#orth_opedics_modal .one_month input[name="medication"][value="'+one_month[0].om_medication+'"]').attr('checked',true);
    		$('#orth_opedics_modal .one_month input[name="medication_value"]').val(one_month[0].om_medication_value);
    		$('#orth_opedics_modal .one_month textarea[name="follow_p"]').val(one_month[0].om_follow_p);
    		//3 months
    		$('#orth_opedics_modal .three_months input[name="date"]').val(three_months[0].tm_date);
    		$('#orth_opedics_modal .three_months input[name="month"]').val(three_months[0].tm_month);
    		$('#orth_opedics_modal .three_months input[name="redness"][value="'+three_months[0].tm_redness+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="redness_value"]').val(three_months[0].tm_redness_value);
    		$('#orth_opedics_modal .three_months input[name="pain"][value="'+three_months[0].tm_pain+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="pain_value"]').val(three_months[0].tm_pain_value);
    		$('#orth_opedics_modal .three_months input[name="bubble"][value="'+three_months[0].tm_bubble+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="bubble_value"]').val(three_months[0].tm_bubble_value);
    		$('#orth_opedics_modal .three_months input[name="hot"][value="'+three_months[0].tm_hot+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="hot_value"]').val(three_months[0].tm_hot_value);
    		$('#orth_opedics_modal .three_months input[name="cough"][value="'+three_months[0].tm_cough+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="cough_value"]').val(three_months[0].tm_cough_value);
    		$('#orth_opedics_modal .three_months input[name="recheck"][value="'+three_months[0].tm_recheck+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="recheck_value"]').val(three_months[0].tm_recheck_value);
    		$('#orth_opedics_modal .three_months input[name="hand_move"][value="'+three_months[0].tm_hand_move+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="foot_move"][value="'+three_months[0].tm_foot_move+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="other_move"][value="'+three_months[0].tm_other_move+'"]').attr('checked',true);
    		$('#orth_opedics_modal .three_months input[name="other_move_value"]').val(three_months[0].tm_other_move_value);
    		$('#orth_opedics_modal .three_months textarea[name="follow_p"]').val(three_months[0].tm_follow_p);
    	
    		
    		//6 months
    		$('#orth_opedics_modal .six_months input[name="date"]').val(six_months[0].sixm_date);
    		$('#orth_opedics_modal .six_months input[name="month"]').val(six_months[0].sixm_month);
    		$('#orth_opedics_modal .six_months input[name="diet"][value="'+six_months[0].sixm_diet+'"]').attr('checked',true);
    		$('#orth_opedics_modal .six_months input[name="hyperplasia_situation"]').val(six_months[0].sixm_hyperplasia_situation);
    		$('#orth_opedics_modal .six_months input[name="regrowth"][value="'+six_months[0].sixm_regrowth+'"]').attr('checked',true);
    		$('#orth_opedics_modal .six_months input[name="regrowth_value"]').val(six_months[0].sixm_regrowth_value);
    		$('#orth_opedics_modal .six_months input[name="activity"][value="'+six_months[0].sixm_activity+'"]').attr('checked',true);
    		$('#orth_opedics_modal .six_months input[name="untoward_effect"]').val(six_months[0].sixm_untoward_effect);
    		$('#orth_opedics_modal .six_months textarea[name="follow_p"]').val(six_months[0].sixm_follow_p);
    		
    		
       	}
       		
       		
        //脑科---详情赋值
   	 function brain_detail_val(result){//这个result是被转化完的
   			$('#brain_scien_modal input[name="operation_date"]').val(result.data.operation_date);
   			$('#brain_scien_modal input[name="discharge_date"]').val(result.data.discharge_date);
   			$('#brain_scien_modal input[name="diagnose_disease"]').val(result.data.diagnose_disease);
   			$('#brain_scien_modal input[name="lower_hospital"]').val(result.data.lower_hospital);
   			$('#brain_scien_modal input[name="lower_doctor"]').val(result.data.lower_doctor);
   			$('#brain_scien_modal input[name="duty_expert"]').val(result.data.duty_expert);
   			$('#brain_scien_modal input[name="duty_ma"]').val(result.data.duty_ma);
   			$('#brain_scien_modal input[name="record_id"]').val(result.data.record_id);
   			//患者反馈
   			$('#brain_scien_modal  textarea[name="feedback"]').val(result.data.feedback);
            //随访内容的值
               var one_day=eval('('+result.data.one_day+')');
               var seven_days=eval('('+result.data.seven_days+')');
               var ten_days=eval('('+result.data.ten_days+')');
               var one_month=eval('('+result.data.one_month+')');
               var three_months=eval('('+result.data.three_months+')');
               var six_months=eval('('+result.data.six_months+')');
               var one_year=eval('('+result.data.one_year+')');
               var two_years=eval('('+result.data.two_years+')');
       		//术后一天
       		$('#brain_scien_modal .one_day input[name="date"]').val(one_day[0].od_date);
       		$('#brain_scien_modal .one_day input[name="month"]').val(one_day[0].od_month);
       		$('#brain_scien_modal .one_day input[name="conscience"]').val(one_day[0].od_conscience);
       		$('#brain_scien_modal .one_day input[name="after_film"]').val(one_day[0].od_after_film);
       		$('#brain_scien_modal .one_day textarea[name="follow_p"]').val(one_day[0].od_follow_p);
       		
       		//术后七天
       		$('#brain_scien_modal .seven_days input[name="date"]').val(seven_days[0].sd_date);
       		$('#brain_scien_modal .seven_days input[name="month"]').val(seven_days[0].sd_month);
       		$('#brain_scien_modal .seven_days textarea[name="regrowth"]').val(seven_days[0].sd_regrowth);
       		$('#brain_scien_modal .seven_days textarea[name="infect"]').val(seven_days[0].sd_infect);
       		$('#brain_scien_modal .seven_days textarea[name="follow_p"]').val(seven_days[0].sd_follow_p);
       		
       		//术后十天
       		$('#brain_scien_modal .ten_days input[name="date"]').val(ten_days[0].td_date);
       		$('#brain_scien_modal .ten_days input[name="month"]').val(ten_days[0].td_month);
       		
       		$('#brain_scien_modal .ten_days input[name="remove"][value="'+ten_days[0].td_remove+'"]').attr('checked',true);
       		$('#brain_scien_modal .ten_days input[name="remove_value"]').val(ten_days[0].td_remove_value);
       		$('#brain_scien_modal .ten_days input[name="discharged"][value="'+ten_days[0].td_discharged+'"]').attr('checked',true);
       		$('#brain_scien_modal .ten_days input[name="discharged_value"]').val(ten_days[0].td_discharged_value);
       		$('#brain_scien_modal .ten_days textarea[name="discharge_medication"]').val(ten_days[0].td_discharge_medication);
       		
       		$('#brain_scien_modal .ten_days textarea[name="follow_p"]').val(ten_days[0].td_follow_p);
       		
       		
              //术后一个月
       		
       		$('#brain_scien_modal .one_month input[name="date"]').val(one_month[0].om_date);
       		$('#brain_scien_modal .one_month input[name="month"]').val(one_month[0].om_month);
       		$('#brain_scien_modal .one_month input[name="review_production"]').val(one_month[0].om_review_production);
       		$('#brain_scien_modal .one_month input[name="regrowth_status"]').val(one_month[0].om_regrowth_status);
       		$('#brain_scien_modal .one_month input[name="medication"]').val(one_month[0].om_medication);
       		$('#brain_scien_modal .one_month textarea[name="follow_p"]').val(one_month[0].om_follow_p);
       		
       		//术后三个月
       		
       		$('#brain_scien_modal .three_months input[name="date"]').val(three_months[0].tm_date);
       		$('#brain_scien_modal .three_months input[name="month"]').val(three_months[0].tm_month);
       		$('#brain_scien_modal .three_months input[name="review_production"]').val(three_months[0].tm_review_production);
       		$('#brain_scien_modal .three_months input[name="recover"]').val(three_months[0].tm_recover);
       		$('#brain_scien_modal .three_months input[name="improve"]').val(three_months[0].tm_improve);
       		$('#brain_scien_modal .three_months textarea[name="follow_p"]').val(three_months[0].tm_follow_p);
       		
       		//术后半年
       		
       		$('#brain_scien_modal .six_months input[name="date"]').val(six_months[0].sm_date);
       		$('#brain_scien_modal .six_months input[name="month"]').val(six_months[0].sm_month);
       		$('#brain_scien_modal .six_months input[name="review_photo"]').val(six_months[0].sm_review_photo);
       		$('#brain_scien_modal .six_months input[name="review"]').val(six_months[0].sm_review);
       		$('#brain_scien_modal .six_months textarea[name="follow_p"]').val(six_months[0].sm_follow_p);
       		//术后一年
       		$('#brain_scien_modal .one_year input[name="date"]').val(one_year[0].oy_date);
       		$('#brain_scien_modal .one_year input[name="month"]').val(one_year[0].oy_month);
       		$('#brain_scien_modal .one_year input[name="review_photo"]').val(one_year[0].oy_review_photo);
       		$('#brain_scien_modal .one_year input[name="review_drug"]').val(one_year[0].oy_review_drug);
       		$('#brain_scien_modal .one_year textarea[name="follow_p"]').val(one_year[0].oy_follow_p);
       		
       		//术后二年
       		$('#brain_scien_modal .two_years input[name="date"]').val(two_years[0].ty_date);
       		$('#brain_scien_modal .two_years input[name="month"]').val(two_years[0].ty_month);
       		$('#brain_scien_modal .two_years input[name="review_photo"]').val(two_years[0].ty_review_photo);
       		$('#brain_scien_modal .two_years input[name="review_stop"]').val(two_years[0].ty_review_stop);
       		
       		$('#brain_scien_modal .two_years textarea[name="follow_p"]').val(two_years[0].ty_follow_p);
   	 }
       		
   	function ano_detail_val(result){
   		
   		$('#ano_surgical_modal input[name="operation_date"]').val(result.data.operation_date);
		$('#ano_surgical_modal input[name="discharge_date"]').val(result.data.discharge_date);
		$('#ano_surgical_modal input[name="diagnose_disease"]').val(result.data.diagnose_disease);
		$('#ano_surgical_modal input[name="lower_hospital"]').val(result.data.lower_hospital);
		$('#ano_surgical_modal input[name="lower_doctor"]').val(result.data.lower_doctor);
		$('#ano_surgical_modal input[name="duty_expert"]').val(result.data.duty_expert);
		$('#ano_surgical_modal input[name="duty_ma"]').val(result.data.duty_ma);
		$('#ano_surgical_modal input[name="record_id"]').val(result.data.record_id);
		//患者反馈
		$('#ano_surgical_modal textarea[name="feedback"]').val(result.data.feedback);
	    //随访内容的值
		       var one_week=eval('('+result.data.one_week+')');
               var seven_days=eval('('+result.data.seven_days+')');
               var ten_days=eval('('+result.data.ten_days+')');
               var one_month=eval('('+result.data.one_month+')');
               var three_months=eval('('+result.data.three_months+')');
               var six_months=eval('('+result.data.six_months+')');
               var one_year=eval('('+result.data.one_year+')');
               var two_years=eval('('+result.data.two_years+')');
		//术后一周
		$('#ano_surgical_modal .one_week input[name="date"]').val(one_week[0].ow_date);
		$('#ano_surgical_modal .one_week input[name="month"]').val(one_week[0].ow_month);
		$('#ano_surgical_modal .one_week input[name="anus_gas"]').val(one_week[0].ow_anus_gas);
		$('#ano_surgical_modal .one_week input[name="discharged"]').val(one_week[0].ow_discharged);
		$('#ano_surgical_modal .one_week input[name="stoma_bags"]').val(one_week[0].ow_stoma_bags);
		$('#ano_surgical_modal .one_week textarea[name="follow_p"]').val(one_week[0].ow_follow_p);
	    
		//术后一个月
		
		$('#ano_surgical_modal .one_month input[name="date"]').val(one_month[0].om_date);
		$('#ano_surgical_modal .one_month input[name="month"]').val(one_month[0].om_month);
		$('#ano_surgical_modal .one_month input[name="recheck"]').val(one_month[0].om_recheck);
		$('#ano_surgical_modal .one_month input[name="recheck_status"]').val(one_month[0].om_recheck_status);
		$('#ano_surgical_modal .one_month input[name="diet_status"]').val(one_month[0].om_diet_status);
		$('#ano_surgical_modal .one_month input[name="shit_character"]').val(one_month[0].om_shit_character);
		$('#ano_surgical_modal .one_month input[name="shit_blood"]').val(one_month[0].om_shit_blood);
		$('#ano_surgical_modal .one_month input[name="belly_pain"]').val(one_month[0].om_belly_pain);
		$('#ano_surgical_modal .one_month input[name="stomabags_status"]').val(one_month[0].om_stomabags_status);
		$('#ano_surgical_modal .one_month textarea[name="follow_p"]').val(one_month[0].om_follow_p);
		
		
		//术后三个月
		
		$('#ano_surgical_modal .three_months input[name="date"]').val(three_months[0].tm_date);
		$('#ano_surgical_modal .three_months input[name="month"]').val(three_months[0].tm_month);
		$('#ano_surgical_modal .three_months input[name="recheck"]').val(three_months[0].tm_recheck);
		$('#ano_surgical_modal .three_months input[name="recheck_status"]').val(three_months[0].tm_recheck_status);
		
		$('#ano_surgical_modal .three_months input[name="body_status"]').val(three_months[0].tm_body_status);
		$('#ano_surgical_modal .three_months input[name="stomach"]').val(three_months[0].tm_stomach);
		$('#ano_surgical_modal .three_months input[name="shit_character"]').val(three_months[0].tm_shit_character);
		$('#ano_surgical_modal .three_months input[name="belly_pain"]').val(three_months[0].tm_belly_pain);
		$('#ano_surgical_modal .three_months input[name="stomabags_status"]').val(three_months[0].tm_stomabags_status);
		$('#ano_surgical_modal .three_months textarea[name="follow_p"]').val(three_months[0].tm_follow_p);
		//术后半年
		
		$('#ano_surgical_modal .six_months input[name="date"]').val(six_months[0].sm_date);
		$('#ano_surgical_modal .six_months input[name="month"]').val(six_months[0].sm_month);
		$('#ano_surgical_modal .six_months input[name="recheck"]').val(six_months[0].sm_recheck);
		$('#ano_surgical_modal .six_months input[name="recheck_status"]').val(six_months[0].sm_recheck_status);
		$('#ano_surgical_modal .six_months input[name="body_status"]').val(six_months[0].sm_body_status);
		$('#ano_surgical_modal .six_months input[name="stomach"]').val(six_months[0].sm_stomach);
		$('#ano_surgical_modal .six_months input[name="shit_character"]').val(six_months[0].sm_shit_character);
		$('#ano_surgical_modal .six_months input[name="shit_blood"]').val(six_months[0].sm_shit_blood);
		$('#ano_surgical_modal .six_months input[name="belly_pain"]').val(six_months[0].sm_belly_pain);
		$('#ano_surgical_modal .six_months input[name="stomabags_status"]').val(six_months[0].sm_stomabags_status);
		$('#ano_surgical_modal .six_months textarea[name="follow_p"]').val(six_months[0].sm_follow_p);
		
		//术后一年
		$('#ano_surgical_modal .one_year input[name="date"]').val(one_year[0].oy_date);
		$('#ano_surgical_modal .one_year input[name="month"]').val(one_year[0].oy_month);
		$('#ano_surgical_modal .one_year input[name="recheck"]').val(one_year[0].oy_recheck);
		$('#ano_surgical_modal .one_year input[name="recheck_status"]').val(one_year[0].oy_recheck_status);
		$('#ano_surgical_modal .one_year input[name="body_status"]').val(one_year[0].oy_body_status);
		$('#ano_surgical_modal .one_year input[name="stomach"]').val(one_year[0].oy_stomach);
		$('#ano_surgical_modal .one_year input[name="shit_character"]').val(one_year[0].oy_shit_character);
		$('#ano_surgical_modal .one_year input[name="shit_blood"]').val(one_year[0].oy_shit_blood);
		
		$('#ano_surgical_modal .one_year input[name="belly_pain"]').val(one_year[0].oy_belly_pain);
		$('#ano_surgical_modal .one_year input[name="stomabags_status"]').val(one_year[0].oy_stomabags_status);
		$('#ano_surgical_modal .one_year textarea[name="follow_p"]').val(one_year[0].oy_follow_p);

		//术后二年
		$('#ano_surgical_modal .two_years input[name="date"]').val(two_years[0].ty_date);
		$('#ano_surgical_modal .two_years input[name="month"]').val(two_years[0].ty_month);
		$('#ano_surgical_modal .two_years input[name="recheck"]').val(two_years[0].ty_recheck);
		$('#ano_surgical_modal .two_years input[name="recheck_status"]').val(two_years[0].ty_recheck_status);
		$('#ano_surgical_modal .two_years input[name="body_status"]').val(two_years[0].ty_body_status);
		$('#ano_surgical_modal .two_years input[name="stomach"]').val(two_years[0].ty_stomach);
		$('#ano_surgical_modal .two_years input[name="shit_character"]').val(two_years[0].ty_shit_character);
		$('#ano_surgical_modal .two_years input[name="shit_blood"]').val(two_years[0].ty_shit_blood);
		$('#ano_surgical_modal .two_years input[name="belly_pain"]').val(two_years[0].ty_belly_pain);
		$('#ano_surgical_modal .two_years input[name="stomabags_status"]').val(two_years[0].ty_stomabags_status);
		$('#ano_surgical_modal .two_years textarea[name="follow_p"]').val(two_years[0].ty_follow_p);
		
   	}
       	
       //==========================================================
       	 //列表页点击获取详情----详情页
       	$('.tableName').live('click',function(){
       		init();//所有的表格进行初始化
       		showInit();//把其他的几个按钮隐藏
       		var table_id=$(this).siblings('input[name="table_id"]').val();
       		var record_id=$(this).siblings('input[name="record_id"]').val();
       		var questArr={
       			table_id:table_id,
       			record_id,record_id
       		}
       		var questURL=runParams.mainUrl+'patient/get_medical_record_table.do';
       		$.post(questURL,questArr,function(result){
       			result = eval("("+result+")");
       			if(result.status==1){//该数据存在
       				//赋值
       				if(table_id=="orth_opedics_modal"){
       					//init();
       					orth_detail_val(result);//骨科
       				}else if(table_id=="brain_scien_modal"){
       					brain_detail_val(result);//脑科
       				}else if(table_id=="ano_surgical_modal"){
       				    ano_detail_val(result)//肛肠科
       				}else{
       					commen_detail_val(result)
       				}
       				$("#"+table_id).modal();//弹出模态框
       			}else{
       				alert("该数据不存在");
       			}
       			
       		});
       		
       	})
       	
       	
       	//共用给模态框进行赋值（序列化表格进行赋值）
       	function commen_detail_val(result){
       		var table_id=result.data.table_id;
       		$('#'+table_id).find('input[name="record_id"]').val(result.data.record_id);
       		var input_length=$('#'+table_id).find('input[type=text]').length;
       		var textarea_length=$('#'+table_id).find('textarea[type="text"]').length;
       		var checkbox_length=$('#'+table_id).find('input[type="checkbox"]').length;
       		var radiobox_length=$('#'+table_id).find('input[type="radio"]').length;
       		var content='';
       		if(table_id=="outpatient_records_modal"){
       			content=eval('('+result.data.outpatient_content+')'); 
       		}else{
       			content=eval('('+result.data.medical_record_content+')'); 
       		}
       		var result_length=content.length;
       		
       	   // var outpatient_content=eval('('+result.data.outpatient_content+')'); 
       		//var result_length=outpatient_content.length;
       		for(var i=0;i<result_length;i++){
       			
       			//var result_name=outpatient_content[i].name;
       			var result_name=content[i].name;
       			//给input进行循环赋值
       			for(var j=0;j<input_length;j++){
       				var input_name=$('#'+table_id).find('input[type=text]').eq(j).attr('name');
       				if(result_name==input_name){
       					//$('#'+table_id).find('input[type=text]').eq(j).val(outpatient_content[i].value);	
       					$('#'+table_id).find('input[type=text]').eq(j).val(content[i].value);
       				}
       			}
       			
       			
       			//给textarea进行循环赋值
       			for(var h=0;h<textarea_length;h++){
       				var textarea_name=$('#'+table_id).find('textarea[type=text]').eq(h).attr('name');
       				if(result_name==textarea_name){
       					//$('#'+table_id).find('textarea[type=text]').eq(h).val(outpatient_content[i].value);
       					$('#'+table_id).find('textarea[type=text]').eq(h).val(content[i].value);
       				}
       			}
       			
       			//给checkbox进行循环
       		   for(var t=0;t<checkbox_length;t++){
       			   var checkbox_name=$('#'+table_id).find('input[type="checkbox"]').eq(t).attr('name');
       			   if(result_name==checkbox_name){
       				  //var result_value=outpatient_content[i].value;
       				  var result_value=content[i].value;
       				  //找到value值等于result_name的checkbox并把他勾上
       				  var target_checkbox=$('#'+table_id).find('input[value="'+result_value+'"]');
       				  target_checkbox.attr('checked',true);
       			   }
       		   }
       			
       		//给radio进行循环
       		   for(var x=0;x<radiobox_length;x++){
       			   var radiobox_name=$('#'+table_id).find('input[type="radio"]').eq(t).attr('name');
       			   if(result_name==radiobox_name){
       				  var result_value=content[i].value;
       				  var target_radiobox=$('#'+table_id).find('input[value="'+result_value+'"]');
       				  target_radiobox.attr('checked',true);
       			   }
       		   }
       		
       		}
       	}
       	
       	//模态框修改表格按钮：-----修改
       	$('.doEdit').live('click',function(){
       		//获取到所有的值
       		var targetObj=$(this);
       		var table_id=$(this).siblings('input[name="table_id"]').val();
       		var record_id=$(this).siblings('input[name="record_id"]').val();
       		
       		var questArr='';
       		if(table_id=="brain_scien_modal"){//脑科
     	    	  questArr=add_edit_brain(targetObj);
     	    	  //添加/修改的所有字段取值 
     	      }else if(table_id=="orth_opedics_modal"){//骨科
     	    	  questArr=add_edit_orth(targetObj);
     	      }else if(table_id=="ano_surgical_modal"){//肛肠科
     	    	  questArr=add_edit_ano(targetObj);
     	      }else{
     	    	  questArr=add_edit_commen(targetObj);
     	      }
       		
       	      //添加时间控件
     	      $('#'+table_id).find('.commen_date').each(function(){
       	    	  //checkDate1($(this).val());
       	    	  if(!DATE_FORMAT.test($(this).val())){
       	    		  alert("格式有问题，正确格式如2011-01-02");
       	    	  }
       	    	   
       	      });
       		var questURL=runParams.mainUrl+'patient/update_medical_record_table.do';
       			
       			$.post(questURL,questArr,function(result){
           			result=eval('('+result+')');
           			if(result.status){
           				alert("修改成功");	
           				$('input[name="token"]').val(result.data.token);
           				targetObj.siblings('button[data-dismiss="modal"]').click().trigger('click');//把模态框关掉
       					//location.reload();
           			}else{
           				alert("修改失败");
           				return false;
           			}
           		});
       		
       	});
       	 
       	
       	//列表页删除表格按钮---删除
       	 $('.deleteTable').live('click',function(){
       		 
       		 var record_id=$(this).siblings('input[name="record_id"]').val();
       		 var table_id=$(this).siblings('input[name="table_id"]').val();
       		 var token=$('input[name="token"]').val();
       		 var targetObj = $(this).parent('.tableUnit');
       		 var questArr={
       			 table_id:table_id,
       			 record_id:record_id,
       			 token:token
       		 }
       		 var questURL=runParams.mainUrl+'patient/delete_medical_record_table.do';
       		 if(confirm("确定要删除该表格么？")){
       			 $.post(questURL,questArr,function(result){
           			 if(result.status){
           				 alert("删除表格成功");
           				 $('input[name="token"]').val(result.data.token);
           				 targetObj.remove();//把当前的所删除的进行移除
           				 //location.reload();
           			 }else{
           				 alert("删除失败");
           			 }
           		 },"json");
       			 
       		 }
       			
       		
       	 });
       	
       	
       	function getMedicalImageList(){
       	   //为指定按钮添加数据加载动态显示：即将DIV显示出来
    		var targetObj = $('.medicalImageList');
    		var id = $('input[name="medicalRecordId"]').val();
    		var questURL = runParams.mainUrl+'patient/getMedicalImageListById.do';
    		var questArr = {
    			medical_recordId:id
    		};
    		targetObj.html('<a class="virtual_img" href="javascript:void(0)" title="新增影像"><span class="glyphicon glyphicon-plus-sign"></span></a>');
    		$.post(questURL,questArr,function(result){
    			result = eval("("+result+")");
    			if(1==result.status){
    				for(var i=0;i<result.data.length;i++){
    			        targetObj.children('.virtual_img').before('<div class="imgUnit"><a href="'+result.data[i].fileName+'" target="_blank"><img src="'+result.data[i].large+'"></a><a href="javascript:void(0)" class="delete" data-path="'+result.data[i].fileName+'">删除</a></div>');
    				}
    			}
    		}); 
    	}
    	getMedicalImageList();
     
       	//点击时间
       	$('.timeLine a:not(".getMore")').live('click',function(){
       		//滚动条
       		$("#menu,#content").getNiceScroll().resize();
       		
       		$('.timeLine a').removeClass('active');
       		$(this).addClass('active');
       	    var id = $(this).attr('data-id');
       	    
       		if(id){
       		    //从数据库中取出这条数据
       			var questArr = {
       				medical_recordId:id
       			};
       			var questURL = runParams.mainUrl+'patient/findMedicalRecordById.do';
       			$.post(questURL,questArr,function(result){
       				result = eval("("+result+")");
       				if(1==result.status){
       					$('#h-type').html(result.data.type);
       					$('#h-record_person').html(result.data.chronicler);
       					$('#h-content').html(result.data.htmlContent);
       					$('#h-time').html(result.data.time_str);    
       					$('input[name="medicalRecordId"]').val(result.data.medical_recordId);
       					getMedicalImageList();
       					getMedicalTableList();
       				}else{
       					alert('未找到该条记录！');
       					return false;
       				}
       			});
       		}else{
       		    return false;
       		}
       	});
       	
       
      	
       	//验证时间(1)
       	var DATE_FORMAT = /^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$/;
       	function checkDate(x,y){
       	 if(DATE_FORMAT.test(x)&&DATE_FORMAT.test(y)){
       	   alert("您输入的日期格式正确");
       	  } else {
       	   alert("抱歉，您输入的日期格式有误，正确格式应为2012-01-01");
       	  }
       	}
       //(2)
       	function checkDate1(x){
       	 if(DATE_FORMAT.test(x)){
       	   alert("您输入的日期格式正确");
       	  } else {
       	   alert("抱歉，您输入的日期格式有误，正确格式应为2012-01-01");
       	  }
       	}
       	//返回到病历记录
       	$('#return').live('click',function(){
       	    $('#myModal').delay(100000).modal('show');
       	   //让滚动条进行滚动
       	   $('body').css('overflow','hidden');
       	   $('#myModal').css('overflow','scroll');
       		
       	});
       	
      	function showInit(){//修改
   			$('button[name="close"]').show();
   			$('a[id="return"]').hide();
   			$('button[name="doSubmit"]').hide();
   			$('.doSubmit').hide();
   			$('button[name="doEdit"]').show();
      	}
    
       		
		//删除（鼠标显示）
        $('.tableUnit').live({
        	mouseover:function(){
        		$(this).children('.deleteTable').show();
        		},
        	mouseout:function(){
        		$(this).children('.deleteTable').hide();
        		}
        });
       	
 });