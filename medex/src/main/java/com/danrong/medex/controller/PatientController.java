package com.danrong.medex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Doctor;
import com.danrong.medex.bean.Patient;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.UserLog;
import com.danrong.medex.bean.result.PatientResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.DoctorModule;
import com.danrong.medex.module.DoctorModuleImpl;
import com.danrong.medex.module.PatientModule;
import com.danrong.medex.module.PatientModuleImpl;
import com.danrong.medex.module.SendMessageCallBackImpl;
import com.danrong.medex.module.UserLogModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class PatientController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;

  // private final Logger logger = LoggerFactory.getLogger(PatientController.class);
  private final DoctorModule doctorModule = new DoctorModuleImpl();
  private final PatientModule patientModule = new PatientModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final CommView commView = new CommView();

  @RequestMapping(value = "patient/pat_info")
  public ModelAndView pat_info(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("patient/pat_info");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 根据patientId获取病人基本信息
    String patientId = request.getParameter(TableFieldName.patientId);
    Patient patient = basicEntityModule.findPatientById(patientId);
    if (patient != null) {
      view.addObject("patientId", patient.getAccountId());
    }
    view.addObject("patient", patient);
    view.addObject("menuIndex", "patInfo");
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(value = "pat_select_by_record_date.do")
  public ModelAndView select_by_record_date(int type, String startDate, String endDate, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);

    // 返回一个token，保护post请求
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("chooseAccountPat");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取patient列表
    PatientResultObject pro = patientModule.searchByDateOfRecord(null, type, startDate, endDate);
    view.addObject("pro", pro);
    view.addObject("type", type);
    view.addObject("startDate", startDate);
    view.addObject("endDate", endDate);
    //view.addObject("pagerType", false);
    
    view.addObject("menuIndex", "chooseAccountPat");
    view.addObject("nopage", true);
    return view;
  }

  @RequestMapping(value = "doctor/pat_detail")
  public ModelAndView pat_detail(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("doctor/pat_detail");
    view.addObject("menuIndex", "patList");
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 根据patientId获取病人基本信息
    String patientId = request.getParameter(TableFieldName.patientId);
    Patient patient = basicEntityModule.findPatientById(patientId);
    view.addObject("patient", patient);
    view.addObject("loginer", sessionParser.getCurrentUserName(request.getSession()));
    // 获取当前医生名字
    Doctor doctor = basicEntityModule.findDoctorById(request.getParameter(TableFieldName.doctorId));
    if (doctor != null) view.addObject("doctorName", doctor.getName());
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/editPatInfo")
  @ResponseBody
  public int editPatInfo(@ModelAttribute Patient patient, HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      if (patientModule.updatePatient(patient.getAccountId(), patient) == DbOption.DBOPTION_FAILER) return DbOption.DBOPTION_FAILER;
      else {
        // 患者修改基本信息，日志记录
        UserLog userLog = new UserLog();
        userLog.setMa(1);
        userLog.setName(patient.getName());
        userLog.setLog_desc("患者修改个人信息");
        userLog.setLog_type("l001");
        userLog.setUser_type(MedexConfigure.destPatient);
        userLog.setUserid(patient.getAccountId());
        userLog.setRequester(sessionParser.getUserName(request.getSession()));

        new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
        String doctorId_str = patient.getResponsibilityDoctorId();
        if (StringUtils.isNotBlank(doctorId_str)) {
          for (String doctorId : doctorId_str.split(MedexConfigure.ARRAY_SPILT_TAG)) {
            doctorModule.addPatientForDoctor(doctorId, patient.getAccountId());
          }
        }
        return DbOption.DBOPTION_SUCCESS;
      }
    }
  }

  @RequestMapping(method = RequestMethod.POST, value = "/addPatInfo")
  @ResponseBody
  public int addPatient(@ModelAttribute Patient patient, HttpServletRequest request) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    if (patient != null) {
      Patient pt = basicEntityModule.findPatientById(patient.getAccountId());
      if (pt != null) return -1;
    }
    if (patientModule.addPatient(patient, false) == DbOption.DBOPTION_FAILER) return DbOption.DBOPTION_FAILER;
    else {
      String doctorId_str = patient.getResponsibilityDoctorId();
      if (StringUtils.isNotBlank(doctorId_str)) {
        for (String doctorId : doctorId_str.split(MedexConfigure.ARRAY_SPILT_TAG)) {
          doctorModule.addPatientForDoctor(doctorId, patient.getAccountId());
        }
      }
      return DbOption.DBOPTION_SUCCESS;
    }
  }

  @RequestMapping(value = "/doctor/pat_list")
  public ModelAndView pat_list(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    // 1.docid
    String doctorId = request.getParameter(TableFieldName.doctorId);
    view.addObject(TableFieldName.doctorId, doctorId);
    // 补全param http://127.0.0.1:8080/medex/doctor/pat_list?doctorId=dfc16b4
    param.setSu("pat_list?doctorId=" + doctorId);

    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "patList");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("doctor/pat_list");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取要渲染的数据
    // 2.当前医生的病人列表+分页参数
    PatientResultObject pro = doctorModule.getPatientsFromDoctor(param, doctorId, null);
    view.addObject("pro", pro);
    view.addObject("hasPatients", (pro == null || pro.getPatients() == null || pro.getPatients().isEmpty()) ? false
        : true);
    view.addObject("page", true);
    view.addObject("cp", param.getCp());
    view.addObject("loginer", sessionParser.getCurrentUserName(request.getSession()));
    // 获取当前医生名字
    Doctor doctor = basicEntityModule.findDoctorById(doctorId);
    if (doctor != null) view.addObject("doctorName", doctor.getName());
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "doctor/updatePatientFace")
  @ResponseBody
  public int updatePatientFace(HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      String patientId = request.getParameter(TableFieldName.patientId);
      String faceUrl = request.getParameter(TableFieldName.headPic);
      return patientModule.updatePatientFace(patientId, faceUrl);
    }
  }

  /**
   * 模糊搜索指定医生下面的患者列表
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/searchPatByDocIdLimit10", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchPatByDocIdLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String patientName = request.getParameter("searchVar");
    String doctorId = request.getParameter(TableFieldName.doctorId);
    // 从doctorId中获取患者id列表
    String[] patientIds = doctorModule.getPatientIdsFromDoctor(doctorId);
    if (patientIds == null || patientIds.length == 0) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      param.setPs(MedexConfigure.searchPatLimit10);
      PatientResultObject pro = patientModule.likeWithPatientName(param, patientName, patientIds, "$in");
      List<Patient> patients = pro.getPatients();
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", patients);
    }
    return Help.bean2Json(result);
  }

  /**
   * 模糊搜索除了指定医生下面的其它患者列表
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/searchPatExceptDocIdLimit10", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchPatExceptDocIdLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String patientName = request.getParameter("searchVar");
    String doctorId = request.getParameter(TableFieldName.doctorId);
    // 从doctorId中获取患者id列表
    String[] patientIds = doctorModule.getPatientIdsFromDoctor(doctorId);
    param.setPs(MedexConfigure.searchPatLimit10);
    PatientResultObject pro = patientModule.likeWithPatientName(param, patientName, patientIds, "$nin");
    List<Patient> patients = pro.getPatients();
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", patients);
    return Help.bean2Json(result);
  }

  // /**
  // * 根据患者姓名模糊查询 返回10个
  // *
  // * @param param
  // * @param request
  // * @return
  // */
  // @RequestMapping(method = RequestMethod.GET, value = "/searchPatientByNameLimit10", produces = {
  // "application/json;charset=UTF-8" })
  // @ResponseBody
  // public String searchPatientByNameLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
  // Map<String, Object> result = new HashMap<>();
  // String patientName = request.getParameter("searchVar");
  // // 从doctorId中获取患者id列表
  // param.setPs(MedexConfigure.searchPatLimit10);
  // PatientResultObject pro = patientModule.likeWithPatientName(param, patientName, null, "$nin");
  // List<Patient> patients = pro.getPatients();
  // result.put(TableFieldName.status, Status.STATUS_OK);
  // result.put("data", patients);
  // return Help.bean2Json(result);
  // }

  /**
   * 判断患者姓名跟id是否正确
   * 
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/patient/validPatByIdAndName.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String validPatByIdAndName(HttpServletRequest request) {
    String patientName = request.getParameter("schedulePat");
    String patientId = request.getParameter("schedulePatId");

    int status = Status.STATUS_ERROR;
    Patient patient = basicEntityModule.findPatientById(patientId);
    if (patient != null && patientName.equals(patient.getName())) status = Status.STATUS_OK;

    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    return Help.bean2Json(result);
  }

  /**
   * 根据患者id查询
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.GET, value = "/searchPatByPatId", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchPatByPatId(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String patientId = request.getParameter(TableFieldName.patientId);
    // 根据患者id获取患者详情
    Patient patient = basicEntityModule.findPatientById(patientId);
    if (patient == null) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", patient);
    }
    return Help.bean2Json(result);
  }

}
