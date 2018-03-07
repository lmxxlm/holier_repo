<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <!--病历记录-->
    <div class="modal fade" id="myModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="patModalLabel">添加病历表</h4>
                 </div>
                 <div class="modal-body">
                    <div class="panel-group" id="accordion">
                         <div class="panel panel-default">
                         <!-- <div class="panel-heading" > -->
                            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" 
                                     href="#collapseOne">
                               <h4 class="panel-title">
                                  <a data-toggle="collapse" data-parent="#accordion" 
                                     href="#collapseOne">
                                    
                                     门诊记录
                                  </a>
                                  <span class="glyphicon glyphicon-chevron-down pull-right"></span>
                               </h4>
                               
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                               <div class="panel-body" class="outpatientRecords"  
    data-value="outpatient_records_modal" onclick="commen(this);">
                                   <a href="javascript:void(0);" >门诊记录</a>
              
                               </div>
                            </div>
                         </div>
                         <div class="panel panel-default">
                            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" 
                                     href="#collapseTwo">
                               <h4 class="panel-title">
                                  <a data-toggle="collapse" data-parent="#accordion" 
                                     href="#collapseTwo">
                                     病历记录
                                  </a>
                                  <span class="glyphicon glyphicon-chevron-down pull-right"></span>
                               </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                               <div class="panel-body" class="persInfo" data-value="pers_info_modal" onclick="commen(this);">
                                     <a href="javascript:void(0);" >个人信息</a>
                                   
                               </div>
                               <div class="panel-body"  class="hospitalisedRecored" data-value="hospitalised_recored_modal" onclick="commen(this);">
                                     <a href="javascript:void(0);">入院记录</a>
                                    
                               </div>
                               <div class="panel-body"  class="healthCheckup" data-value="health_checkup_modal" onclick="commen(this);">
                                    <a href="javascript:void(0);">体格检查</a>
                               </div>
                               <div class="panel-body" class="LabCheck" data-value="lab_check_modal" onclick="commen(this);">
                                    <a href="javascript:void(0);" >实验室检查</a>
                                    
                               </div>
                               <div class="panel-body" class="assistCheck" data-value="assist_check_modal" onclick="commen(this);">
                               		<a href="javascript:void(0);" >辅助检查</a>
                                    
                               </div>
                               <div class="panel-body" class="firstRecord" data-value="first_record_modal" onclick="commen(this);">
                               		<a href="javascript:void(0);" >首次病程计录</a>
                               </div>
                               <div class="panel-body" class="preSummary" data-value="pre_summary_modal" onclick="commen(this);">
                                    <a href="javascript:void(0);" >术前小结</a>
                               </div>
                               <div class="panel-body" class="operationRecords" data-value="operation_records_modal" onclick="commen(this);">
                                   <a href="javascript:void(0);" >手术记录-手术记录单</a>
                               </div>
                               <div class="panel-body" class="outRecord" data-value="out_record_modal" onclick="commen(this);">
                                   <a href="javascript:void(0);" >转科记录-转出记录</a>
                               </div>
                               <div class="panel-body" class="inRecord"  data-value="in_record_modal" onclick="commen(this);">
                                    <a href="javascript:void(0);" >转科记录-转入记录</a>
                               </div>
                               <div class="panel-body" class="dischargeSummary" data-value="discharge_summary_modal" onclick="commen(this);">
                                    <a href="javascript:void(0);" >出院小结</a>
                               </div>
                            </div>
                         </div>
                         <div class="panel panel-default">
                            <div class="panel-heading" data-toggle="collapse" data-parent="#accordion" 
                                     href="#collapseThree">
                               <h4 class="panel-title">
                                  <a data-toggle="collapse" data-parent="#accordion" 
                                     href="#collapseThree">
                                     随访记录
                                  </a>
                                  <span class="glyphicon glyphicon-chevron-down pull-right"></span>
                               </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse">
                               <div class="panel-body" class="Orthopedics" data-value="orth_opedics_modal" onclick="commen(this);">
                                 <a  href="javascript:void(0);"  >病人随访表（骨科）</a>
                               </div>
                               <div class="panel-body" class="Brain" data-value="brain_scien_modal"  onclick="commen(this)">
                                 <a href="javascript:void(0);"  >病人随访表（脑科）</a> 
                               </div>
                               <div class="panel-body" class="anoRectalSurgery" data-value="ano_surgical_modal"  onclick="commen(this)">
                                  <a href="javascript:void(0);"  >病人随访表（肛肠外科）</a>  
                               </div>
                            </div>
                         </div>
                         
                      </div>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="tableName" value="病历记录">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                 </div>
              </div>
           </div>  
        </div>
       
  
       
        <!-- 模态框 -->
        
        <!--门诊记录表格-->
         <div class="modal fade flag" id="outpatient_records_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    
                    <h4 class="modal-title" id="patModalLabel">门诊记录表格</h4>
                 </div>
                 
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    
                     <form class="table_form">
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td>姓名：<input type="text" name="name" style="outline:none;"/></td>
                            <td>性别：<input type="text" name="sex" /></td>
                            <td>年龄：<input type="text" name="age"/></td>
                        </tr>
                        <tr>
                            <td>出生日期：<input class="commen_date" type="text" name="birth" readonly/></td>
                            <td>婚姻状况：<input type="text" name="marray_status"/></td>
                            <td>证件号码：<input type="text" name="id_num"/></td>
                        </tr>
                         <tr>
                            <td>职业：<input type="text" name="job"/></td>
                            <td>联系方式：<input type="text" name="contact_info1"/></td>
                            <td>出生地：<input type="text" name="birth_place"/></td>
                        </tr>
                        
                        <tr>
                            <td>联系人姓名：<input type="text" name="contact_name" style="width:66%;"/></td>
                            <td>联系方式：<input type="text" name="contact_info2"/></td>
                            <td>关系：<input type="text" name="contact"/></td>
                        </tr>
                        <tr>
                            <td>就诊医院：<input type="text" name="hospital_admission"/></td>
                            <td>科室：<input type="text" name="departments"/></td>
                            <td>就诊时间：<input type="text" class="commen_date" name="admission_time"/></td>
                        </tr>
                        <tr>
                            <td colspan="3">主&nbsp;&nbsp;&nbsp;&nbsp;诉：<textarea type="text" name="pc"></textarea></td>
                          
                        </tr>
                        <tr>
                            <td colspan="3">现&nbsp;病&nbsp;史：<textarea type="text" name="present_history"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="3">过&nbsp;敏&nbsp;史：<textarea type="text" name="allergic_history"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="3">体格检查：<textarea type="text" name="check_up"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="3">各项评估：<textarea type="text" name="evaluation_options"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="3">辅助检查：<textarea type="text" name="assist_examination"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="3">诊&nbsp;&nbsp;&nbsp;&nbsp;断：<textarea type="text" name="diagnose"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="3">处&nbsp;&nbsp;&nbsp;&nbsp;理：<textarea type="text" name="dealwith"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="3">注意事项：<textarea type="text" name="notes"></textarea></td>
                        </tr>
                        
                      </table>
                      
                     </form> 
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                   
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="outpatient_records_modal">
                    <input type="hidden" name="table_name"  value="门诊记录">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
        <!--个人信息-->
        
         <div class="modal fade flag" id="pers_info_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                    <h4 class="modal-title" id="patModalLabel">个人信息</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                     <form >
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td>姓名：<input type="text" name="name"/></td>
                            <td>性别：<input type="text" name="sex"/></td>
                            <td>年龄：<input type="text" name="age1"/></td>
                        </tr>
                        <tr>
                            <td>出生日期：<input class="commen_date" type="text" name="birth_date" /></td>
                            <td>婚姻状况：<input type="text" name="marray_status"/></td>
                            <td>证件号码：<input type="text" name="id_number"/></td>
                        </tr>
                        
                        <tr>
                            <td>职业：<input type="text" name="job"/></td>
                            <td>方式：<input type="text" name="information"/></td>
                            <td>出生地：<input type="text" name="birth_place"/></td>
                        </tr>
                        <tr>
                            <td>联系人姓名：<input type="text" name="contact_name" style="width:66%;"/></td>
                            <td>联系方式：<input type="text" name="contact_infomation"/></td>
                            <td>关系：<input type="text" name="relation"/></td>
                        </tr>
                        <tr>
                            <td colspan="3">医院：<input type="text" name="hospital" style="width:93%"/></td>
                          
                        </tr>
                        <tr>
                            <td>科室：<input type="text" name="departments"/></td>
                            <td>入院日期：<input type="text" class="commen_date" name="in_hospital_date"/></td>
                            <td>入院诊断：<input type="text" name="in_hospital_diagnosis"/></td>
                        </tr>
                        
                        <tr>
                            <td>床号：<input type="text" name="bed_num"/></td>
                            <td>出院日期：<input type="text" class="commen_date" name="out_hospital_date"/></td>
                            <td>出院诊断：<input type="text" name="discharge_diagnosis"/></td>
                        </tr>
                        
                      </table>
                  </form>
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="pers_info_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(个人信息)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
         <!--入院记录-->
        
         <div class="modal fade flag" id="hospitalised_recored_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                   <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                    <h4 class="modal-title" id="patModalLabel">入院记录</h4>
                 </div>
                 <div class="modal-body">
	                 <form>
	                    <!--*****-------------------------------------------------------------------------------------------------------------->
	                    <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
		                   <tr>
		                       <td>
			                       <p>主诉 ：</p>
			                         <textarea type="text"  name="pc" rows="3"></textarea>
			                       
		                       </td>
		                    </tr>
		                    <tr>
		                       <td>
			                       <p>现病史：</p>
			                         <textarea type="text"   name="present_history" rows="3" ></textarea>
		                       </td>
		                    </tr>
		                    <tr>
		                       <td>
			                       <p>既往史：</p>
			                         <textarea type="text"   name="past_history" rows="3" ></textarea>
		                       </td>
		                    </tr>
		                    <tr>
		                       <td>
			                       <p>个人和家族史：</p>
			                         <textarea type="text"   name="own_fmly_history" rows="4" ></textarea>
		                       </td>
		                    </tr>
	                    </table>
	                    <!--*****-------------------------------------------------------------------------------------------------------------->
	                 </form>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="hospitalised_recored_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(入院记录)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
         <!--体格检查-->
        
         <div class="modal fade flag" id="health_checkup_modal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                     <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                   <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                    <h4 class="modal-title" id="patModalLabel">体格检查</h4>
                 </div> 
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                     <form > 
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td rowspan="2">一般情况：</td>
                            <td >意识：<input type="text" name="conscience" /></td>
                            <td>呼吸：<input type="text" name="breathe" style="width:40%;"/>次/分</td>
                            <td>血压：<input type="text" name="bp" style="width:40%;"/>nmhg</td>
                            <td>体温：<input type="text" name="temperature" style="width:40%;"/>℃</td>
                            <td>身高：<input type="text" name="height"/></td>
                           
                        </tr>
                        <tr>
                            <td>体重：<input type="text" name="weight" style="width:40%;"/>kg</td>
                            <td>病容：<input type="text" name="sickly_look"/></td>
                            <td>体位：<input type="text" name="position"/></td>
                            <td>查体配合：<input type="radio" name="body_fit" value="1"/>是<input type="radio" name="body_fit" value="2"/>否</td>
                            <td>其他：<input type="text" name="other1"/></td>
                        </tr>
                        
                        <tr>
                            <td>皮肤、黏膜：</td>
                            <td>色泽：<input type="text" name="color"/></td>
                            <td>水肿：<input type="text" name="dropsy"/></td>
                            <td>皮疹：<input type="text" name="erythra"/></td>
                            <td>出血：<input type="text" name="bleeding"/></td>
                            <td>其他：<input type="text" name="other2"/></td>
                        </tr>
                        <tr>
                            <td rowspan="2">头颅及其器官：</td>
                            <td>外形：<input type="text" name="outline"/></td>
                            <td>听力：<input type="text" name="listen"/></td>
                            <td>结膜：<input type="text" name="conjunctiva"/></td>
                            <td>巩膜：<input type="text" name="sclera"/></td>
                            <td>瞳孔：<input type="text" name="pupil"/></td>
                        </tr>
                        <tr>
                            <td>鼻通气：<input type="text" name="nasopharyngeal" style="width:40%;"/>kg</td>
                            <td>副鼻窦压痛：<input type="text" name="paranasal"/></td>
                            <td>乳突压痛：<input type="text" name="mastoid_tenderness"/></td>
                            <td>口腔黏膜：<input type="text" name="mouth_mucosa"/></td>
                            <td>扁桃体：<input type="text" name="tonsil"/></td>
                        </tr>
                        <tr>
                            <td>颈部：</td>
                            <td>软硬度：<input type="text" name="hardness"/></td>
                            <td>气管：<input type="text" name="weasand"/></td>
                            <td>甲状腺：<input type="text" name="thyroid"/></td>
                            <td>经脉咏：<input type="text" name="channel"/></td>
                            <td>其他：<input type="text" name="other3"/></td>
                        </tr>
                        
                        <tr>
                            <td>胸部：</td>
                            <td>外形：<input type="text" name="shape"/></td>
                            <td>助间隙：<input type="text" name="coformycin"/></td>
                            <td>乳房：<input type="text" name="breast"/></td>
                            <td>其他：<input type="text" name="other4"/></td>
                            <td><input type="text" name="blank"/></td>
                        </tr>
                        
                        <tr>
                            <td>肺脏：</td>
                            <td>呼吸运动：<input type="text" name="breathing_movement"/></td>
                            <td>叩诊：<input type="text" name="percuss"/></td>
                            <td>呼吸音：<input type="text" name="breath_sounds"/></td>
                            <td>罗音：<input type="text" name="rale"/></td>
                            <td>其他：<input type="text" name="other5"/></td>
                        </tr>
                        
                        <tr>
                            <td>心脏：</td>
                            <td>心率：<input type="text" name="heart_rate"/></td>
                            <td>心律：<input type="text" name="heart_rhythm"/></td>
                            <td>心音：<input type="text" name="heart_sounds"/></td>
                            <td>杂音：<input type="text" name="noise"/></td>
                            <td>其他：<input type="text" name="other6"/></td>
                        </tr>
                        
                         <tr>
                            <td>血管：</td>
                            <td colspan="2">周围血管征：<input type="text" name="surround_blood"/></td>
                            <td colspan="3">其他：<input type="text" name="other7"/></td>
                           
                        </tr>
                        
                        <tr>
                            <td rowspan="3">腹部：</td>
                            <td>外形：<input type="text" name="configuration"/></td>
                            <td>蠕动波：<input type="text" name="rushes"/></td>
                            <td>腹壁紧张度：<input type="text" name="guarding"/></td>
                            <td>压痛：<input type="text" name="pressing_pain"/></td>
                            <td>反跳痛：<input type="text" name="jumping_pain"/></td>
                           
                        </tr>
                        
                        <tr>
                            
                            <td>色块：<input type="text" name="color_block"/></td>
                            <td>肝脏：<input type="text" name="liver"/></td>
                            <td>胆囊：<input type="text" name="gallbladder"/></td>
                            <td>脾脏：<input type="text" name="spleen"/></td>
                            <td>肾区叩击痛：<input type="text" name="percu_region"/></td>
                           
                        </tr>
                        
                         <tr>
                            
                            <td>肠鸣音：<input type="text" name="bowel_sound"/></td>
                            <td>移动性浊音：<input type="text" name="shift_dullness"/></td>
                            <td colspan="3">其他：<input type="text" name="other8"/></td>
                            
                        </tr>
                        
                        <tr>
                            <td >神经系统：</td>
                            <td>肌张力：<input type="text" name="muscle_tone"/></td>
                            <td>四肢肌力：<input type="text" name="limbs_muscles_strength"/></td>
                            <td>膝腱反射：<input type="text" name="knee_reflect"/></td>
                            <td>Babinski征：<input type="text" name="babinski"/></td>
                            <td>其他：<input type="text" name="other9"/></td>
                           
                        </tr>
                        
                        <tr>
                            <td >其他检查：</td>
                            <td>外生殖器：<input type="text" name="externalia"/></td>
                            <td>四肢脊柱：<input type="text" name="limbs_spinal"/></td>
                            <td>肛门、直肠：<input type="text" name="anus"/></td>
                            <td colspan="2">其他：<input type="text" name="other10"/></td>
                           
                        </tr>
                        
                      </table>
                  </form>
                    
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="health_checkup_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(体格检查)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
         <!--实验室检查-->
        
         <div class="modal fade flag" id="lab_check_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                   <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                    <h4 class="modal-title" id="patModalLabel">实验室检查</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    <form>
	                    <div class="form-group">
	                        <!--<label for="description">服务内容（200字以内）</label>-->
	                        <textarea type="text" class="form-control notebook" placeholder="请输入实验室检查内容" name="laboratory" rows="3" ></textarea>
	                    </div>
                    </form>
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="lab_check_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(实验室检查)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
        <!--辅助检查-->
        
         <div class="modal fade flag" id="assist_check_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">辅助检查</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    <form>
                     <div class="form-group">
                        <!--<label for="description">服务内容（200字以内）</label>-->
                        <textarea type="text" class="form-control notebook" placeholder="请输入辅助检查内容" name="assistant_examination" rows="3" ></textarea>
                     </div>
                    </form>
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="assist_check_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(辅助检查)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
         <!--首次病历记录-->
        
         <div class="modal fade flag" id="first_record_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">首次病历记录</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    
                    <form >
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td>病例特征：</td>
                            <td width="85%"><textarea type="text" class="form-control notebook" placeholder="" name="clinicop_features" rows="3" ></textarea></td>
                           
                           
                        </tr>
                        <tr>
                            <td>诊断依据：</td>
                            <td><textarea type="text" class="form-control notebook" placeholder="" name="diagnostic_basis" rows="3" ></textarea></td>
                        </tr>
                        
                        <tr>
                            <td>鉴别诊断：</td>
                            <td><textarea type="text" class="form-control notebook" placeholder="" name="differential_diagnosis" rows="3" ></textarea></td>
                        </tr>
                        <tr>
                            <td>初步诊断：</td>
                            <td><textarea  type="text" class="form-control notebook" placeholder="" name="primary_diagnosis" rows="3" ></textarea></td>
                        </tr>
                        <tr>
                            <td>诊疗计划：</td>
                            <td><textarea type="text" class="form-control notebook" placeholder="" name="assessment_plan" rows="3" ></textarea></td>
                        </tr>
                       
                        
                      </table>
                  </form>
                 
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="first_record_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(首次病历记录)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
         <!--术前小结-->
        
         <div class="modal fade flag" id="pre_summary_modal"   data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">术前小结</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    
                     <form >
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td>简要病情：</td>
                            <td width="85%"><input type="text" name="brief_illness"></td>
                           
                           
                        </tr>
                        <tr>
                             <td>术前诊断：</td>
                            <td width="85%"><input type="text" name="preoperative_diagnosi"></td>
                        </tr>
                        
                        <tr>
                            <td>手术指征：</td>
                            <td width="85%"><input type="text" name="operation_indication"></td>
                        </tr>
                        <tr>
                             <td>拟施手术：</td>
                            <td width="85%"><input type="text" name="operate_on"></td>
                        </tr>
                        <tr>
                             <td>拟施麻醉：</td>
                            <td width="85%"><input type="text" name=anesthesia"></td>
                        </tr>
                       
                        
                      </table>
                  </form>
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="pre_summary_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(术前小结)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
          <!--手术记录-手术记录单-->
        
         <div class="modal fade flag" id="operation_records_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">手术记录-手术记录单</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    
                     <form >
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td colspan="2" class="specialInput">姓名：<input type="text" name="name"/> 性别：<input type="text" name="sex"/>年龄：<input type="text" name="age"/></td>
                           
                        </tr>
                        <tr>
                             <td>手术日期</td>
                            <td width="85%"><input type="text" class="commen_date"  name="date_operation"></td>
                        </tr>
                        
                        <tr>
                            <td>术前诊断</td>
                            <td width="85%"><input type="text" name="preoperative_diagnosi"></td>
                        </tr>
                        <tr>
                             <td>术后诊断</td>
                            <td width="85%"><input type="text" name="diagnosis_after"></td>
                        </tr>
                        <tr>
                             <td>手术名称</td>
                            <td width="85%"><input type="text" name="operations_name"></td>
                        </tr>
                        
                         <tr>
                             <td>手术者</td>
                            <td width="85%"><input type="text" name="operator"></td>
                        </tr>
                        <tr>
                             <td>麻醉方式</td>
                            <td width="85%"><input type="text" name="anesthesia_method"></td>
                        </tr>
                         <tr>
                             <td colspan="2">手术步骤：<textarea type="text" style="width:99%;" placeholder="" name="operative_steps" rows="10" ></textarea></td>
                        </tr>
                       
                        
                      </table>
                      
                  </form>
                 
                    
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="operation_records_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(手术记录单)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
        
         <!--转科记录-转出记录-->
        
         <div class="modal fade flag" id="out_record_modal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">转科记录-转出记录</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    
                     
                    <form >
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td>记录时间：<input type="text" class="commen_date" name="write_time"></td>
                           
                        </tr>
                        <tr>
                            <td>转科时间：<input type="text"  class="commen_date" name="change_time"></td>
                        </tr>
                        
                        <tr>
                            <td>转入科室：<input type="text" name="in_department"></td>
                        </tr>
                        <tr>
                            <td>入院情况：<input type="text" name="hospitalized_dondition"></td>
                        </tr>
                        <tr>
                            <td>实验室检查：<input type="text" name="laboratory_eamination"></td>
                        </tr>
                        
                         <tr>
                            <td>入院诊断：<input type="text" name="hospitalized_diagnosis"></td>
                        </tr>
                        <tr>
                           <td>诊疗经过：<input type="text" name="diagnosis_treatment"></td>
                        </tr>
                         <tr>
                           <td>目前情况：<input type="text" name="present_situation"></td>
                        </tr>
                         <tr>
                           <td>目前诊断：<input type="text" name="current_diagnostic"></td>
                        </tr>
                         <tr>
                             <td >专科目的及注意事项：<textarea type="text" style="width:99%;" placeholder="" name="specialties_notes" rows="5" ></textarea></td>
                        </tr>
                       
                        
                      </table>
                      
                      
                      
                  </form>
                  
                    
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="out_record_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(转出记录)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
         <!--转科记录-转入记录-->
        
         <div class="modal fade flag" id="in_record_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">转科记录-转入记录</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    
                     
                    <form >
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td>记录时间：<input type="text" class="commen_date" name="record_time"></td>
                           
                        </tr>
                        <tr>
                            <td>转科时间：<input type="text" class="commen_date" name="change_major_time"></td>
                        </tr>
                        
                        <tr>
                            <td>转入科室：<input type="text" name="in_departments"></td>
                        </tr>
                        <tr>
                            <td>入院情况：<input type="text" name="in_hospital_status"></td>
                        </tr>
                        <tr>
                            <td>实验室检查：<input type="text" name="laboratory_check"></td>
                        </tr>
                        
                         <tr>
                            <td>入院诊断：<input type="text" name="admitting_diagnosis"></td>
                        </tr>
                        <tr>
                           <td>诊疗经过：<input type="text" name="diagnosis_treatment"></td>
                        </tr>
                         <tr>
                           <td>目前情况：<input type="text" name="present_situation"></td>
                        </tr>
                         <tr>
                           <td>目前诊断：<input type="text" name="current_diagnostic"></td>
                        </tr>
                         <tr>
                             <td >诊疗计划：<textarea type="text" style="width:99%;" placeholder="" name="assessment_plan" rows="5" ></textarea></td>
                        </tr>
                       
                        
                      </table>
                      
                      
                      
                  </form>
                  
                    
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="in_record_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(转入记录)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
         <!--出院小结-->
        
         <div class="modal fade flag" id="discharge_summary_modal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">出院小结</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    <form >
                        <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                        <tr>
                            <td>姓名</td>
                            <td><input type="text" name="name"></td>
                            <td>性别</td>
                            <td><input type="text" name="sex"></td>
                            <td>年龄</td>
                            <td><input type="text" name="age"></td>
                            <td>职业</td>
                            <td><input type="text" name="job"></td>
                        </tr>
                        <tr>
                            <td>入院日期</td>
                            <td><input type="text" class="commen_date" name="admission_date" style="width:99%;"></td>
                            <td>出院日期</td>
                            <td><input type="text" class="commen_date" name="discharge_date" style="width:99%;"></td>
                            <td>住院天数</td>
                            <td><input type="text" name="inpatient_days"></td>
                            <td><input type="text"></td>
                            <td><input type="text"></td>
                        </tr>
                        
                        <tr>
                            <td colspan="8">入院诊断：<textarea type="text" placeholder="" name="admitting_diagnosis" rows="1" ></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="8">出院诊断：<textarea  type="text"  placeholder="" name="discharge_diagnosis" rows="1" ></textarea></td>
                        </tr>
                        <tr>
                            <td>诊疗结果：</td>
                            <td colspan="7"><input type="text" name="treatment_result"></td>
                        </tr>
                        
                         <tr>
                             <td>特殊检查编号：</td>
                            <td colspan="7"><input type="text" name="special_check_num"></td>
                        </tr>
                        <tr>
                            <td colspan="8">入院情况：<textarea   type="text"  placeholder="" name="conditions_admission" rows="1" ></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="8">住院情况：<textarea  type="text"   placeholder="" name="hospital_course" rows="1" ></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="8">出院情况：<textarea  type="text"  placeholder="" name="status_ischarge" rows="1" ></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="8">出院医嘱：<textarea  type="text"  placeholder="" name="discharge_advice" rows="1" ></textarea></td>
                        </tr>
                        
                      </table>
                      
                      
                      
                  </form>
                    
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="discharge_summary_modal">
                    <input type="hidden" name="table_name"  value="病历记录-(出院小结)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
        
          <!--病人随访记录---------------------------------------------------------------------------------------------------------------------->
          <!--病人随访表（骨科）-->
        
         <div class="modal fade flag" id="orth_opedics_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                     <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">病人随访表（骨科）</h4>
                 </div>
                 
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                   <form class="table_form">
                   
                      <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                      <tr>
                        <td>手术日期</td>
                        <td colspan="2">
                            <input type="text" class="commen_date" class="commen" name="operation_date">
                        </td>
                        
                      </tr>
                      <tr>
                        <td>出院日期</td>
                         <td colspan="2">
                            <input type="text" class="commen_date" class="commen" name="discharge_date">
                        </td>
                      </tr>
                      <tr>
                        <td>诊断疾病</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="diagnose_disease">
                        </td>
                      </tr>
                      <tr>
                        <td>下级医院</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="lower_hospital">
                        </td>
                      </tr>
                      <tr>
                        <td>下级医生</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="lower_doctor">
                        </td>
                      </tr>
                      <tr>
                        <td>责任专家</td>
                          <td colspan="2">
                            <input type="text" class="commen" name="duty_expert">
                        </td>
                      </tr>
                      <tr>
                        <td>责任MA</td>
                          <td colspan="2">
                            <input type="text" class="commen" name="duty_ma">
                        </td>
                      </tr>
                      <tr>
                        <td>随访时间</td>
                        <td >随访内容</td>
                        <td >随访者</td>
                      </tr>
                      <tr class="three_days">
                        <td>
                            <spn class="span">术后3天</span></br>
                           (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                           
                        </td>
                        <td >
                          <p class="pStyle">1.伤口情况</br>
                             &nbsp;&nbsp;红肿：<input type="checkbox" name="redness" value="1" >有<input type="text" class="undline" name="redness_value"><input type="checkbox" name="redness" value="2" >无</br>
                             &nbsp;&nbsp;疼痛：<input type="checkbox" name="pain" value="1">有<input type="text" class="undline" name="pain_value"><input type="checkbox" name="pain" value="2">无</br>
                             &nbsp;&nbsp;水泡：<input type="checkbox" name="bubble" value="1">有<input type="text" class="undline" name="bubble_value"><input type="checkbox" name="bubble" value="2">无</br></br>
                             2.发烧情况：</br>
                             <input type="checkbox" name="hot" value="1">有，体温<input type="text" class="undlineWidth1 undline" name="hot_value">℃<span></span><span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<input type="checkbox" name="hot" value="2">无</br></br>
                             3.咳嗽情况：</br>
                             <input type="checkbox" name="cough" value="1">有咳嗽、咳痰，痰的颜色是<input type="text" class="undlineWidth2 undline" name="cough_value">&nbsp;&nbsp;&nbsp;<input type="checkbox" name="cough" value="2">无</br></br>
                             4.切口有无不适情况：</br>
                             <input type="checkbox" name="unwell" value="1">有<input type="text" class="undlineWidth3 undline" name="unwell_value">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="unwell" value="2">无</br></br>
                             5.有无按医嘱服药:</br><input type="checkbox" name="medication" value="1">有&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="medication" value="2">无<input type="text" class="undlineWidth3 undline" name="medication_value"></br></br>
                             6.饮食建议，清淡，流质食物
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                       <tr class="seven_days">
                        <td>
                            <spn class="span">术后7天</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                            
                        </td>
                         <td >
                          <p class="pStyle">1.伤口情况</br>
                             &nbsp;&nbsp;红肿：<input type="checkbox" name="redness" value="1">有<input type="text" class="undline" name="redness_value"><input type="checkbox" name="redness" value="2">无</br>
                             &nbsp;&nbsp;疼痛：<input type="checkbox" name="pain" value="1">有<input type="text" class="undline" name="pain_value"><input type="checkbox" name="pain" value="2">无</br>
                             &nbsp;&nbsp;水泡：<input type="checkbox" name="bubble" value="1">有<input type="text" class="undline" name="bubble_value"><input type="checkbox" name="bubble" value="2">无</br></br>
                             
                             2.发烧情况：</br>
                             <input type="checkbox" name="hot" value="1">有，体温<input type="text" class="undlineWidth1 undline" name="hot_value">℃&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="hot" value="2">无</br></br>
                             3.咳嗽情况：</br>
                             <input type="checkbox" name="cough" value="1">有咳嗽、咳痰，痰的颜色是<input type="text" class="undlineWidth2 undline" name="cough_value">&nbsp;&nbsp;&nbsp;<input type="checkbox" name="cough" value="2">无</br></br>
                             4.切口有无不适情况：</br>
                             <input type="checkbox" name="unwell" value="1">有<input type="text" class="undlineWidth3 undline" name="unwell_value">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="unwell" value="2">无</br></br>
                             5.有无按医嘱服药:</br>
                             <input type="checkbox" name="medication" value="1">有&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="medication" value="2">无<input type="text" class="undlineWidth3 undline" name="medication_value"></br></br>
                             6.饮食建议，清淡为主，不要过油腻
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      <tr class="one_month">
                        <td>
                            <spn class="span">术后一个月</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                           
                        </td>
                         <td >
                          <p class="pStyle">1.伤口情况</br>
                             &nbsp;&nbsp;红肿：<input type="checkbox" name="redness" value="1">有<input type="text" class="undline" name="redness_value"><input type="checkbox" name="redness" value="2">无</br>
                             &nbsp;&nbsp;疼痛：<input type="checkbox" name="pain" value="1">有<input type="text" class="undline" name="pain_value"><input type="checkbox" name="pain" value="2">无</br>
                             &nbsp;&nbsp;水泡：<input type="checkbox" name="bubble" value="1">有<input type="text" class="undline" name="bubble_value"><input type="checkbox" name="bubble" value="2">无</br></br>
                             
                             2.发烧情况：</br>
                             <input type="checkbox" name="hot" value="1">有<input type="text" class="undlineWidth1 undline" name="hot_value">℃&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="hot" vlaue=2>无</br></br>
                             3.咳嗽情况：</br>
                             <input type="checkbox" name="cough" value="1">有咳嗽、咳痰，痰的颜色是<input type="text" class="undlineWidth2 undline" name="cough_value">&nbsp;&nbsp;&nbsp;<input type="checkbox" name="cough" value="2">无</br></br>
                             4.切口有无不适情况：</br>
                             <input type="checkbox" name="unwell" value="1">有<input type="text" class="undlineWidth3 undline" name="unwell_value">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"  name="unwell" value="2">无</br></br>
                             5.有无按医嘱服药:</br>
                             <input type="checkbox" name="medication" value="1">有&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="medication" value="2">无<input type="text" class="undlineWidth3 undline" name="medication_value"></br></br>
                             6.饮食建议，清淡为主，不要过油腻
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      <tr class="three_months">
                        <td>
                            <spn class="span">术后三个月</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                            
                        </td>
                         <td >
                          <p class="pStyle">1.伤口情况</br>
                             &nbsp;&nbsp;红肿：<input type="checkbox" name="redness" value="1">有<input type="text" class="undline" name="redness_value"><input type="checkbox" name="redness" value="2">无</br>
                             &nbsp;&nbsp;疼痛：<input type="checkbox" name="pain" value="1">有<input type="text" class="undline" name="pain_value"><input type="checkbox" name="pain" value="2">无</br>
                             &nbsp;&nbsp;水泡：<input type="checkbox" name="bubble" value="1">有<input type="text" class="undline" name="bubble_value"><input type="checkbox" name="bubble" value="2">无</br></br>
                             2.发烧情况：</br>
                             <input type="checkbox" name="hot" value="1">有<input type="text" class="undlineWidth1 undline">℃&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="hot" value="2">无</br></br>
                             3.咳嗽情况：</br>
                             <input type="checkbox" name="cough" value="1">有咳嗽、咳痰，痰的颜色是<input type="text" class="undlineWidth2 undline" name="cough_value">&nbsp;&nbsp;&nbsp;<input type="checkbox" name="cough" value="2">无</br></br>
                             4.有无复查，复查情况怎么样：</br>
                             <input type="checkbox" name="recheck" value="1">有，复查情况<input type="text" class="undlineWidth3 undline"  name="recheck_value">&nbsp;&nbsp;&nbsp;&nbsp;
                             </br><input type="checkbox" name="recheck" value="2">无</br></br>
                             5.活动情况:</br>
                             <input type="checkbox" name="hand_move" value="1">手可以活动</br>
                             <input type="checkbox" name="foot_move" value="1">脚用助步器适当活动</br>
                             <input type="checkbox" name="other_move" value="1">其他<input type="text" class="undlineWidth3 undline" name="other_move_value"></br>
                             6.饮食建议，清淡为主，不要过油腻
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      <tr class="six_months">
                        <td>
                            <spn class="span">术后半年</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                            
                        </td>
                         <td >
                          <p class="pStyle">
                             1.饮食情况：<input type="checkbox" name="diet" value="1">好&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="diet" value="2">良好&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="diet" value="3">一般&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="diet" value="4">差</br></br>
                            
                             2.瘢痕增生情况</br></br>
                             <input type="text" class="undlineWidth4 undline" name="hyperplasia_situation"></br></br>
                             3.伤口是否愈合完整：</br>
                             <input type="checkbox" name="regrowth" value="1">是&nbsp;&nbsp;&nbsp;<input type="checkbox" name="regrowth" value="2">否<input type="text" class="undlineWidth3 undline"  name="regrowth_value"></br></br>
                             4.活动状况：</br>
                             <input type="checkbox" name="activity" value="1">正常活动&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="activity" value="2"></br></br>
                             5.不良反应</br></br>
                             <input type="text" class="undlineWidth4 undline" name="untoward_effect"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      <tr class="feedback">
                         <td>患者反馈</td>
                         <td>
                            <textarea class="textarea" name="feedback"></textarea>
                         </td>
                          <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                    </table>
                   </form>
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="orth_opedics_modal">
                    <input type="hidden" name="table_name"  value="随    访-(骨    科)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit" >确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
                 
              </div>
           </div>  
        </div>
        <!-- --------------------------------------------------------------------------------- -->
        
         <!--病人随访表（脑科）-->
        
         <div class="modal fade flag" id="brain_scien_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">病人随访表（脑科）</h4>
                 </div>
                 
                 
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    <form >
                      <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                      <tr>
                        <td>手术日期</td>
                        <td colspan="2">
                            <input type="text" class="commen_date" class="commen" name="operation_date">
                        </td>
                        
                      </tr>
                      <tr>
                        <td>出院日期</td>
                         <td colspan="2">
                            <input type="text" class="commen_date" class="commen" name="discharge_date">
                        </td>
                      </tr>
                      <tr>
                        <td>诊断疾病</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="diagnose_disease">
                        </td>
                      </tr>
                      <tr>
                        <td>下级医院</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="lower_hospital">
                        </td>
                      </tr>
                      <tr>
                        <td>下级医生</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="lower_doctor">
                        </td>
                      </tr>
                      <tr>
                        <td>责任专家</td>
                          <td colspan="2">
                            <input type="text" class="commen" name="duty_expert">
                        </td>
                      </tr>
                      <tr>
                        <td>责任MA</td>
                          <td colspan="2">
                            <input type="text" class="commen" name="duty_ma">
                        </td>
                      </tr>
                      <tr>
                        <td width="15%">随访时间</td>
                        <td width="70%">随访内容</td>
                        <td >随访者</td>
                      </tr>
                      <tr class="one_day">
                        <form>
                        <td>
                            <spn class="span">术后1天</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">1.意识如何</br>
                             <input type="text" class="BrianText" name="conscience"></br>
                            2.术后片子情况</br>
                             <input type="text" class="BrianText" name="after_film"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                         </form>
                      </tr>
                      
                      <tr class="seven_days">
                        <td>
                            <spn class="span">术后7天</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.伤口愈合情况</br>
                             <textarea type="text" class="BrianText" name="regrowth"></textarea></br>
                             2.有无感染</br>
                             <textarea type="text" class="BrianText" name="infect"></textarea>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                       <tr class="ten_days">
                        <td>
                            <spn class="span">术后10天</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                         <td >
                          <p class="pStyle">
                             1.是否拆线</br>
                             <input type="checkbox" name="remove" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="remove" value="2">否<input type="text" class="undline" name="remove_value"></br>
                             
                             2.是否出院</br>
                             <input type="checkbox" name="discharged" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="discharged" value="2">否<input type="text" class="undline" name="discharged_value"></br>
                             3.出院带药</br>
                             <textarea type="text" class="BrianText" name="discharge_medication"></textarea></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                      <tr class="one_month">
                        <td>
                            <spn class="span">术后一个月</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.拍片复查</br>
                             <input type="text" class="BrianText" name="review_production"></br>
                             2.伤口愈合情况</br>
                             <input type="text" class="BrianText" name="regrowth_status"></br>
                             3.服药情况</br>
                             <input type="text" class="BrianText" name="medication"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                       <tr class="three_months">
                        <td>
                            <spn class="span">术后三个月</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.拍片复查</br>
                             <input type="text" class="BrianText" name="review_production"></br>
                             2.恢复情况</br>
                             <input type="text" class="BrianText" name="recover"></br>
                             3.有无好转改善</br>
                             <input type="text" class="BrianText" name="improve"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                       <tr class="six_months">
                        <td>
                            <spn class="span">术后半年</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.拍片复查</br>
                             <input type="text" class="BrianText" name="review_photo"></br>
                             2.基本恢复，有无复发</br>
                             <input type="text" class="BrianText" name="review"></br>
                             
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                       <tr class="one_year">
                        <td>
                            <spn class="span">术后一年</span></br>
                             (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.拍片复查</br>
                             <input type="text" class="BrianText" name="review_photo"></br>
                             2.已经恢复，药物治疗是否持续</br>
                             <input type="text" class="BrianText" name="review_drug"></br>
                             
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                       <tr class="two_years">
                        <td>
                            <spn class="span">术后两年</span></br>
                            (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.拍片复查</br>
                             <input type="text" class="BrianText" name="review_photo"></br>
                             2.有无复发，是否停药</br>
                             <input type="text" class="BrianText" name="review_stop"></br>
                             
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                      
                      <tr>
                         <td>意见反馈</td>
                         <td>
                            <textarea class="textarea" name="feedback"></textarea>
                         </td>
                          <td>
                            <textarea class="textarea"></textarea>
                         </td>
                      </tr>
                    </table>
                   </form>
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="brain_scien_modal">
                    <input type="hidden" name="table_name"  value="随     访-(脑     科)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit">确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
                 
                
              </div>
           </div>  
        </div>
        
         <!--病人随访表（肛肠外科）-->
        
         <div class="modal fade flag" id="ano_surgical_modal"  data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                   <button type="hidden"  name="close" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <a id="return" data-dismiss="modal" href="#"  class="pull-right"><span class="glyphicon glyphicon-arrow-left"></span>返回</a>
                    <h4 class="modal-title" id="patModalLabel">病人随访表（肛肠外科）</h4>
                 </div>
                 <div class="modal-body">
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                    <form >
                      <table width="100%" border="1" cellspacing="0" cellpadding="1" id="tableBox">
                      <!--
                      <caption>
                        <h2>
                           病人随访表（脑科）
                        </h2>
                      </caption>
                      -->
                      <tr>
                        <td>手术日期</td>
                        <td colspan="2">
                            <input type="text" class="commen_date" class="commen" name="operation_date">
                        </td>
                        
                      </tr>
                      <tr>
                        <td>出院日期</td>
                         <td colspan="2">
                            <input type="text" class="commen_date" class="commen" name="discharge_date">
                        </td>
                      </tr>
                      <tr>
                        <td>诊断疾病</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="diagnose_disease">
                        </td>
                      </tr>
                      <tr>
                        <td>下级医院</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="lower_hospital">
                        </td>
                      </tr>
                      <tr>
                        <td>下级医生</td>
                         <td colspan="2">
                            <input type="text" class="commen" name="lower_doctor">
                        </td>
                      </tr>
                      <tr>
                        <td>责任专家</td>
                          <td colspan="2">
                            <input type="text" class="commen" name="duty_expert">
                        </td>
                      </tr>
                      <tr>
                        <td>责任MA</td>
                          <td colspan="2">
                            <input type="text" class="commen" name="duty_ma">
                        </td>
                      </tr>
                      <tr>
                        <td width="15%">随访时间</td>
                        <td width="70%">随访内容</td>
                        <td >随访者</td>
                      </tr>
                      <tr class="one_week">
                        <td>
                            <spn class="span">术后一周</span></br>
                            (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                            1.肛门是否排气</br>
                             <input type="text" class="BrianText" name="anus_gas"></br>
                            2.是否出院</br>
                             <input type="text" class="BrianText" name="discharged"></br>
                            3.有无造口袋，提示造口袋及时更换</br>
                             <input type="text" class="BrianText" name="stoma_bags"></br>
                            
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                      <tr class="one_month">
                        <td>
                            <spn class="span">术后一月</span></br>
                            (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.有无复查</br>
                             <input type="text" class="BrianText" name="recheck"></br>
                             2.复查情况</br>
                             <input type="text" class="BrianText" name="recheck_status"></br>
                             3.饮食情况</br>
                             <input type="text" class="BrianText" name="diet_status"></br>
                             4.大便性状</br>
                             <input type="text" class="BrianText" name="shit_character"></br>
                             5.是否便血</br>
                             <input type="text" class="BrianText" name="shit_blood"></br>
                             6.有无腹痛</br>
                             <input type="text" class="BrianText" name="belly_pain"></br>
                             7.造口袋情况</br>
                             <input type="text" class="BrianText" name="stomabags_status"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p" ></textarea>
                         </td>
                      </tr>
                      
                      <tr class="three_months">
                        <td>
                            <spn class="span">术后三个月</span></br>
                            (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                         <td >
                          <p class="pStyle">
                             1.是否复查</br>
                             <input type="text" class="BrianText" name="recheck"></br>
                             2.复查情况</br>
                             <input type="text" class="BrianText" name="recheck_status"></br>
                             3.身体状况</br>
                             <input type="text" class="BrianText" name="body_status"></br>
                             4.胃口</br>
                             <input type="text" class="BrianText" name="stomach"></br>
                             5.大便性状</br>
                             <input type="text" class="BrianText" name="shit_character"></br>
                             6.有无腹痛</br>
                             <input type="text" class="BrianText" name="belly_pain"></br>
                             7.造口袋情况</br>
                             <input type="text" class="BrianText" name="stomabags_status"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                      <tr class="six_months">
                        <td>
                            <spn class="span">术后半年</span></br>
                            (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.是否复查</br>
                             <input type="text" class="BrianText" name="recheck"></br>
                             2.复查情况</br>
                             <input type="text" class="BrianText" name="recheck_status"></br>
                             3.身体状况</br>
                             <input type="text" class="BrianText" name="body_status"></br>
                             4.胃口</br>
                             <input type="text" class="BrianText" name="stomach"></br>
                             5.大便性状</br>
                             <input type="text" class="BrianText" name="shit_character"></br>
                             6.是否便血</br>
                             <input type="text" class="BrianText" name="shit_blood"></br>
                             7.有无腹痛</br>
                             <input type="text" class="BrianText" name="belly_pain"></br>
                             8.造口袋情况</br>
                             <input type="text" class="BrianText" name="stomabags_status"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                      <tr class="one_year">
                        <td>
                            <spn class="span">术后一年</span></br>
                            (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.是否复查</br>
                             <input type="text" class="BrianText" name="recheck"></br>
                             2.复查情况</br>
                             <input type="text" class="BrianText" name="recheck_status"></br>
                             3.身体状况</br>
                             <input type="text" class="BrianText" name="body_status"></br>
                             4.胃口</br>
                             <input type="text" class="BrianText" name="stomach"></br>
                             5.大便性状</br>
                             <input type="text" class="BrianText" name="shit_character"></br>
                             6.是否便血</br>
                             <input type="text" class="BrianText" name="shit_blood"></br>
                             7.有无腹痛</br>
                             <input type="text" class="BrianText" name="belly_pain"></br>
                             8.造口袋情况</br>
                             <input type="text" class="BrianText" name="stomabags_status"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                      <tr class="two_years">
                        <td>
                            <spn class="span">术后二年</span></br>
                            (<input type="text" class="date" name="month"/>月<input type="text" class="date" name="date"/>日) 
                        </td>
                        <td >
                          <p class="pStyle">
                             1.是否复查</br>
                             <input type="text" class="BrianText" name="recheck"></br>
                             2.复查情况</br>
                             <input type="text" class="BrianText" name="recheck_status"></br>
                             3.身体状况</br>
                             <input type="text" class="BrianText" name="body_status"></br>
                             4.胃口</br>
                             <input type="text" class="BrianText" name="stomach"></br>
                             5.大便性状</br>
                             <input type="text" class="BrianText" name="shit_character"></br>
                             6.是否便血</br>
                             <input type="text" class="BrianText" name="shit_blood"></br>
                             7.有无腹痛</br>
                             <input type="text" class="BrianText" name="belly_pain"></br>
                             8.造口袋情况</br>
                             <input type="text" class="BrianText" name="stomabags_status"></br>
                          </p>
                        </td>
                         <td>
                            <textarea class="textarea" name="follow_p"></textarea>
                         </td>
                      </tr>
                      
                    </table>
                    
                    </form>
                    
                    <!--*****-------------------------------------------------------------------------------------------------------------->
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="patient_id" value="${patientId}">
                    <input type="hidden" name="record_id" value="${record_id}">
                    <input type="hidden" name="actionType" value="add">
                    <input type="hidden" name="table_id" value="ano_surgical_modal">
                    <input type="hidden" name="table_name"  value="随    访-(肛肠外科)">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary doSubmit" name="doSubmit">确认</button>
                    <button type="button" class="btn btn-primary doEdit"  name="doEdit"/>保存修改</button>
                 </div>
              </div>
           </div>  
        </div>
        
        
        
        <script type="text/javascript">
        //让input变成只读
        function input_readonly(){
        	$('.commen_date').attr('readonly',true);
        	$('form table').css('border-collapse','separate');
        }
        	
        /*
       
		
		//上下折叠：
		$(function () { $('#collapseFour').collapse({
		toggle: false
		 })});
		 $(function () { $('#collapseTwo').collapse('show')});
		 $(function () { $('#collapseThree').collapse('toggle')});
		 $(function () { $('#collapseOne').collapse('hide')});
		 
		
			
		*/
		 //表单初始化
   	    function init(){
   	    	$('button[name="close"]').hide();//隐藏关闭按钮
   	    	$('a[id="return"]').show();
   	    	$('button[name="doSubmit"]').show();//显示提交按钮
  			$('button[name="doEdit"]').hide();//隐藏修改按钮
   	        $('.modal-body form input[type=text],textarea[type="text"],textarea').val('');
  			$('.modal-body form input[type="checkbox"],input[type="radio"]').removeAttr('checked');
  			
   	    }
		//列表页弹出模态框
		var commen = function(obj){
			init();
			var table_id=$(obj).attr('data-value');
			$('#'+table_id).modal();
			$('#myModal').modal('hide');
   			$('body').css('overflow','hidden');
   			$('#'+table_id).css('overflow','scroll');
		}
		
		
        
        </script>
        
        