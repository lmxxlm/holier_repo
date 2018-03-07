package com.danrong.medex.controller;

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

import com.danrong.medex.bean.Account;
import com.danrong.medex.bean.Doctor;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.UserLog;
import com.danrong.medex.bean.result.DoctorResultObject;
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
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class DoctorController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;

  private final DoctorModule doctorModule = new DoctorModuleImpl();
  private final PatientModule patientModule = new PatientModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final CommView commView = new CommView();

  @RequestMapping(value = "doctor/doc_info")
  public ModelAndView doc_info(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("doctor/doc_info");
    view.addObject("menuIndex", "docInfo");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 根据doctorId获取医生基本信息
    String doctorId = request.getParameter(TableFieldName.doctorId);

    Doctor doctor = basicEntityModule.findDoctorById(doctorId);
    view.addObject("doctor", doctor);
    if (doctor != null) view.addObject("doctorId", doctor.getAccountId());
    view.addObject("loginer", sessionParser.getCurrentUserName(request.getSession()));
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(value = "doctor/validDetail")
  public ModelAndView validDetail(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("doctor/validDetail");
    view.addObject("menuIndex", "validDetail");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 根据doctorId获取医生基本信息
    String doctorId = request.getParameter(TableFieldName.doctorId);
    Doctor doctor = basicEntityModule.findDoctorById(doctorId);
    view.addObject("doctor", doctor);
    if (doctor != null) view.addObject("doctorId", doctorId);
    view.addObject("loginer", sessionParser.getCurrentUserName(request.getSession()));
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(value = "doctor/doctorPicManage")
  public ModelAndView doctorPicManage(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("doctor/doctorPicManage");
    view.addObject("menuIndex", "doctorPicManage");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 根据doctorId获取医生基本信息
    String doctorId = request.getParameter(TableFieldName.doctorId);
    Doctor doctor = basicEntityModule.findDoctorById(doctorId);
    view.addObject("doctor", doctor);
    if (doctor != null) view.addObject("doctorId", doctorId);
    view.addObject("loginer", sessionParser.getCurrentUserName(request.getSession()));
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(value = "transferTreatmentList")
  public ModelAndView chooseAccountDoc(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    // 返回一个token，保护post请求
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("transferTreatmentList");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取doctor列表和分页
    DoctorResultObject dro = doctorModule.list(param, null);
    view.addObject("dro", dro);
    view.addObject("searchParam", param);
    view.addObject("nopage", false);
    view.addObject("menuIndex", "transferTreatment");
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/editDocInfo")
  @ResponseBody
  public int editDocInfo(@ModelAttribute Doctor doctor, HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      // 修改了基本信息，日志记录
      if (doctor != null) {
        UserLog userLog = new UserLog();
        userLog.setMa(1);
        userLog.setName(doctor.getName());
        userLog.setLog_desc("修改了基本信息");
        userLog.setLog_type("l008");
        userLog.setUser_type(MedexConfigure.destDoctor);
        userLog.setUserid(doctor.getAccountId());
        userLog.setRequester(sessionParser.getUserName(request.getSession()));

        new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
      }
      return doctorModule.updateDoctor(doctor.getAccountId(), doctor);
    }
  }

  @RequestMapping(method = RequestMethod.POST, value = "doctor/updateDoctorFace")
  @ResponseBody
  public int updateDoctorFace(HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      String doctorId = request.getParameter(TableFieldName.doctorId);
      String faceUrl = request.getParameter(TableFieldName.headPic);

      // 修改了头像，日志记录
      UserLog userLog = new UserLog();
      userLog.setMa(1);
      Account account = basicEntityModule.findAccount(doctorId, MedexConfigure.destDoctorType);
      if (account != null) userLog.setName(account.getName());
      userLog.setLog_desc("修改了头像");
      userLog.setLog_type("l009");
      userLog.setUser_type(MedexConfigure.destDoctor);
      userLog.setUserid(doctorId);
      userLog.setRequester(sessionParser.getUserName(request.getSession()));

      new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
      return doctorModule.updateDoctorFace(doctorId, faceUrl);
    }
  }

  @RequestMapping(method = RequestMethod.POST, value = "doctor/updateDoctorAuthPhoto")
  @ResponseBody
  public int updateDoctorAuthPhoto(HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      String doctorId = request.getParameter(TableFieldName.doctorId);
      String picType = request.getParameter("picType");
      String authPic = request.getParameter("authPic");

      // 修改了证照，日志记录
      UserLog userLog = new UserLog();
      userLog.setMa(1);
      Account account = basicEntityModule.findAccount(doctorId, MedexConfigure.destDoctorType);
      if (account != null) userLog.setName(account.getName());
      userLog.setLog_desc("修改了证照");
      userLog.setLog_type("l009");
      userLog.setUser_type(MedexConfigure.destDoctor);
      userLog.setUserid(doctorId);
      userLog.setRequester(sessionParser.getUserName(request.getSession()));

      new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
      return doctorModule.updateDoctorAuthPhoto(doctorId, picType, authPic);
    }
  }

  @RequestMapping(method = RequestMethod.POST, value = "editTranasferTreatmentInfo.do")
  @ResponseBody
  public int editTranasferTreatmentInfo(HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    String confirmIdList = request.getParameter("confirmIdList");
    if (StringUtils.isNotBlank(confirmIdList)) {
      List<Map<String, Object>> result = doctorModule.buildTransferParam(confirmIdList);
      for (Map<String, Object> map : result) {
        String accountId = (String) map.get("key");
        boolean value = (boolean) map.get("value");
        doctorModule.updateTransfer(accountId, value);
      }
      return Status.STATUS_OK;
    } else return Status.STATUS_ERROR;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/addDocInfo")
  @ResponseBody
  public int addDoctor(@ModelAttribute Doctor doctor, HttpServletRequest request) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    if (doctor != null) {
      Doctor dt = basicEntityModule.findDoctorById(doctor.getAccountId());
      if (dt != null) return -1;
    }
    return doctorModule.addDoctor(doctor, false);
  }

  @RequestMapping(method = RequestMethod.POST, value = "/addPatByPatId")
  @ResponseBody
  public int addPatByPatId(@ModelAttribute SearchParams param, HttpServletRequest request) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;

    String patientId = request.getParameter(TableFieldName.patientId);
    String doctorId = request.getParameter(TableFieldName.doctorId);
    // 确定对应的医生和患者都存在
    Doctor doctor = basicEntityModule.findDoctorById(doctorId);
    if (doctor == null) return DbOption.DBOPTION_FAILER;
    // 往医生的patients字段中添加patientId
    if (doctorModule.addPatientForDoctor(doctorId, patientId) == DbOption.DBOPTION_FAILER) return DbOption.DBOPTION_FAILER;
    else return patientModule.addRespDoctorForPatient(patientId, doctorId);
  }

  @RequestMapping(method = RequestMethod.POST, value = "/doPatDeleteAction")
  @ResponseBody
  public int doPatDeleteAction(@ModelAttribute SearchParams param, HttpServletRequest request) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;

    String patientId = request.getParameter(TableFieldName.patientId);
    String doctorId = request.getParameter(TableFieldName.doctorId);

    if (doctorModule.removePatientFromDoctor(doctorId, patientId) == DbOption.DBOPTION_SUCCESS) {
      return patientModule.removeRespFromPatient(patientId, doctorId);
    } else return DbOption.DBOPTION_FAILER;
  }

  @RequestMapping(method = RequestMethod.POST, value = "doctor/validDoctor")
  @ResponseBody
  public int validDoctor(@ModelAttribute SearchParams param, HttpServletRequest request) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    String auth = request.getParameter(TableFieldName.status);
    String doctorId = request.getParameter(TableFieldName.doctorId);
    boolean authStatus = false;
    if ("1".equals(auth)) {
      authStatus = true;
    }
    // System.out.println(authStatus);
    return doctorModule.updateAuth(doctorId, authStatus, sessionParser.getCurrentUserName(request.getSession()));
  }

  @RequestMapping(method = RequestMethod.POST, value = "doctor/refuseValidRequest")
  @ResponseBody
  public int refuseValidRequest(@ModelAttribute SearchParams param, HttpServletRequest request) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    String doctorId = request.getParameter(TableFieldName.doctorId);
    String reason = request.getParameter(TableFieldName.reason);
    return doctorModule.refuseAuth(doctorId, reason, sessionParser.getCurrentUserName(request.getSession()));
  }

  // /**
  // * 根据姓名模糊查询 返回10个
  // *
  // * @param param
  // * @param request
  // * @return
  // */
  // @RequestMapping(method = RequestMethod.GET, value = "/searchDoctorByNameLimit10", produces = {
  // "application/json;charset=UTF-8" })
  // @ResponseBody
  // public String searchDoctorByNameLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
  // Map<String, Object> result = new HashMap<>();
  // String doctorName = request.getParameter("searchVar");
  // param.setPs(MedexConfigure.searchPatLimit10);
  // DoctorResultObject dro = doctorModule.likeWithDoctorName(param, doctorName);
  // List<Doctor> doctors = dro.getDoctors();
  // result.put(TableFieldName.status, Status.STATUS_OK);
  // result.put("data", doctors);
  // return Help.bean2Json(result);
  // }
}
