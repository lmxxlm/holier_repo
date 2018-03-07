package com.danrong.ccmedex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danrong.medex.bean.Doctor;
import com.danrong.medex.bean.Patient;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.DoctorResultObject;
import com.danrong.medex.bean.result.PatientResultObject;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.DoctorModule;
import com.danrong.medex.module.DoctorModuleImpl;
import com.danrong.medex.module.PatientModule;
import com.danrong.medex.module.PatientModuleImpl;
import com.danrong.medex.util.Help;

@Controller
public class SearchController {

  @Value("#{properties['ccmedex.web.host']}")
  public String mainUrl;

  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final PatientModule patientModule = new PatientModuleImpl();
  private final DoctorModule doctorModule = new DoctorModuleImpl();

  /**
   * 模糊搜索医院
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/searchHospitalByNameLimit10", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchHospitalByNameLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String searchVar = request.getParameter("searchVar");
    List<String> hospitals = basicEntityModule.likeWithHospital(searchVar, 10);
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", hospitals);
    return Help.bean2Json(result);
  }

  /**
   * 根据患者姓名模糊查询 返回10个
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/searchPatientByNameLimit10", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchPatientByNameLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String patientName = request.getParameter("searchVar");
    // 从doctorId中获取患者id列表
    param.setPs(MedexConfigure.searchPatLimit10);
    PatientResultObject pro = patientModule.likeWithPatientName(param, patientName, null, "$nin");
    List<Patient> patients = pro.getPatients();
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", patients);
    return Help.bean2Json(result);
  }

  /**
   * 根据姓名模糊查询 返回10个
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/searchDoctorByNameLimit10", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchDoctorByNameLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String doctorName = request.getParameter("searchVar");
    param.setPs(MedexConfigure.searchPatLimit10);
    DoctorResultObject dro = doctorModule.likeWithDoctorName(param, doctorName);
    List<Doctor> doctors = dro.getDoctors();
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", doctors);
    return Help.bean2Json(result);
  }
}
