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

import com.danrong.medex.bean.Account;
import com.danrong.medex.bean.Doctor;
import com.danrong.medex.bean.OutPatientSchedule;
import com.danrong.medex.bean.Patient;
import com.danrong.medex.bean.ScheduleItem;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.UserLog;
import com.danrong.medex.bean.result.DoctorLinerScheduleResultObject;
import com.danrong.medex.bean.result.OutPatientScheduleResultObject;
import com.danrong.medex.bean.result.PatientScheduleResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.PatientModule;
import com.danrong.medex.module.PatientModuleImpl;
import com.danrong.medex.module.ScheduleModule;
import com.danrong.medex.module.ScheduleModuleImpl;
import com.danrong.medex.module.SendMessageCallBackImpl;
import com.danrong.medex.module.UserLogModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.TimeUtil;

@Controller
public class ScheduleController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final MedexToken medexToken = new MedexToken();
  private final ScheduleModule scheduleModule = new ScheduleModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final PatientModule patientModule = new PatientModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final TimeUtil timeUtil = new TimeUtil();
  private final CommView commView = new CommView();

  /**
   * 病人日程项展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/schedule")
  public ModelAndView patient_schedule(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("patient/schedule");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    Patient patient = basicEntityModule.findPatientById(patientId);
    if (patient != null) {
      String[] resDoctorIds = patient.getResponsibilityDoctorId_array();
      if (resDoctorIds != null && resDoctorIds.length > 0) {
        view.addObject("doctorId", resDoctorIds[0]);
        Doctor doctor = basicEntityModule.findDoctorById(resDoctorIds[0]);
        if (doctor != null) view.addObject("responsibilityDoctor", doctor.getName());
      }
      // 生成当前天的数据
      String day = request.getParameter("day");
      if (StringUtils.isBlank(day)) day = timeUtil.l2s2(TimeUtil.todayStart());
      PatientScheduleResultObject sro = scheduleModule.getScheduleItemsByPatientIdWithDay(patientId, day);
      view.addObject("sro", sro);
      boolean noRecord = false;
      if (sro.getScheduleItems().isEmpty()) {
        noRecord = true;
      }
      view.addObject("noRecord", noRecord);
      // 用于切换日历
      view.addObject("day", day);
      // 用于展示
      String displayDay = day;
      displayDay = displayDay.replaceFirst("-", "年");
      displayDay = displayDay.replaceFirst("-", "月");
      displayDay += "日";
      view.addObject("displayDay", displayDay);
    }
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "schedule");
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * web端病人日程项添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/doScheduleAdd.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String patient_schedule_add(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      ScheduleItem[] scheduleItems = scheduleModule.buildPatientScheduleItems(request);
      if (scheduleItems == null || scheduleItems.length == 0) status = Status.STATUS_ERROR;
      else {
        status = scheduleModule.addScheduleItems(scheduleItems);
        // 添加患者检验记录，日志记录
        UserLog userLog = new UserLog();
        userLog.setMa(1);
        String patientId = request.getParameter("patientId");
        Account account = basicEntityModule.findAccount(patientId, MedexConfigure.destPatientType);
        if (account != null) userLog.setName(account.getName());
        userLog.setLog_desc("添加患者日程项");
        userLog.setLog_type("l006");
        userLog.setUser_type(MedexConfigure.destPatient);
        userLog.setUserid(patientId);
        userLog.setRequester(sessionParser.getUserName(request.getSession()));

        new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端病人日程修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/doScheduleEdit.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String patient_schedule_edit(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      ScheduleItem[] currentItems = scheduleModule.buildPatientScheduleItems(request);
      if (currentItems == null || currentItems.length == 0) status = Status.STATUS_ERROR;
      else status = scheduleModule.updateScheduleItems(MedexConfigure.destPatient, currentItems);
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端病人日程标记完成接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/doScheduleDone.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String patient_schedule_done(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String scheduleId = request.getParameter("scheduleId");
      if (StringUtils.isBlank(scheduleId)) status = Status.STATUS_ERROR;
      else {
        ScheduleItem item = basicEntityModule.findScheduleItemById(scheduleId);
        item.setStatus(Status.FINISH);
        status = scheduleModule.updateScheduleItem(MedexConfigure.destPatient, item);
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端病人日程删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/doScheduleDelete.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String patient_schedule_delete(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String scheduleId = request.getParameter("scheduleId");
      if (StringUtils.isBlank(scheduleId)) status = Status.STATUS_ERROR;
      else {
        status = scheduleModule.deleteScheduleItem(MedexConfigure.destPatient, scheduleId);
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生日程项展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/doctor/schedule")
  public ModelAndView doctor_schedule(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("/doctor/schedule");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject("menuIndex", "schedule");

    String doctorId = request.getParameter(TableFieldName.doctorId);
    view.addObject(SessionField.doctorId, doctorId);
    if (StringUtils.isNotBlank(doctorId)) {
      String[] focus_patient_ids = patientModule.patientsUnderRespDoctor(doctorId);
      if (focus_patient_ids != null && focus_patient_ids.length > 0) {
        view.addObject("focus_patientId", focus_patient_ids[0]);
        Patient patient = basicEntityModule.findPatientById(focus_patient_ids[0]);
        view.addObject("focus_patientName", patient.getName());
      }
      // 生成当前日期的数据
      String day = request.getParameter("day");
      if (StringUtils.isBlank(day)) day = timeUtil.l2s2(TimeUtil.todayStart());
      DoctorLinerScheduleResultObject sro = scheduleModule.getLinerScheduleItemsByDoctorIdWithDay(doctorId, day);
      view.addObject("sro", sro);
      // 用于切换日历
      view.addObject("day", day);
      // 用于展示
      String displayDay = day;
      displayDay = displayDay.replaceFirst("-", "年");
      displayDay = displayDay.replaceFirst("-", "月");
      displayDay += "日";
      view.addObject("displayDay", displayDay);

      String prevDay = timeUtil.getFeatureDay(day, -1);
      String nextDay = timeUtil.getFeatureDay(day, 1);
      String weekDay = timeUtil.getWeakDayToady(day);
      view.addObject("prevDay", prevDay);
      view.addObject("nextDay", nextDay);
      view.addObject("weekDay", weekDay);
    }
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * web端获取当天有余号的排班
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/getAvalibleOutPatientScheduleWithDay.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getAvalibleOutPatientScheduleWithDay(HttpServletRequest request, HttpServletResponse response) {
    int status = Status.STATUS_OK;

    String day = request.getParameter("day");
    String doctorId = request.getParameter("doctorId");
    // String scheduleType = request.getParameter("scheduleType");
    // 门诊池数据
    OutPatientScheduleResultObject opsro = scheduleModule.getAvalibleOutPatientScheduleItemsByDoctorIdWithDay(doctorId,
        day);
    List<OutPatientSchedule> scheduleItems = opsro.getScheduleItems();

    if (scheduleItems == null || scheduleItems.isEmpty()) status = Status.STATUS_ERROR;
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("data", scheduleItems);
    return Help.bean2Json(result);
  }

  /**
   * web端医生日程项添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doScheduleAdd.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doctor_schedule_add(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      ScheduleItem[] scheduleItems = scheduleModule.buildDoctorAddScheduleItems(request);
      if (scheduleItems == null || scheduleItems.length == 0) status = Status.STATUS_ERROR;
      else {
        // 添加了日程，日志记录
        UserLog userLog = new UserLog();
        userLog.setMa(1);
        String doctorId = request.getParameter("doctorId");
        Account account = basicEntityModule.findAccount(doctorId, MedexConfigure.destDoctorType);
        if (account != null) userLog.setName(account.getName());
        userLog.setLog_desc("添加了日程");
        userLog.setLog_type("l010");
        userLog.setUser_type(MedexConfigure.destDoctor);
        userLog.setUserid(doctorId);
        userLog.setRequester(sessionParser.getUserName(request.getSession()));

        new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
        status = scheduleModule.addScheduleItems(scheduleItems);
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    if (status != Status.STATUS_OK) result.put("message", "新建日程失败！");
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生门诊预约添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doOutPatientAppointAdd.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doctor_outPatientAppoint_add(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;
    Map<String, Object> result = new HashMap<>();
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      ScheduleItem item = scheduleModule.buildOutPatientAppointItem(request);
      if (item == null) status = Status.STATUS_ERROR;
      else {
        // 添加门诊预约，日志记录
        UserLog userLog = new UserLog();
        userLog.setMa(1);
        String doctorId = request.getParameter("doctorId");
        Account account = basicEntityModule.findAccount(doctorId, MedexConfigure.destDoctorType);
        if (account != null) userLog.setName(account.getName());
        userLog.setLog_desc("添加门诊预约");
        userLog.setLog_type("l012");
        userLog.setUser_type(MedexConfigure.destDoctor);
        userLog.setUserid(doctorId);
        userLog.setRequester(sessionParser.getUserName(request.getSession()));

        new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
        status = scheduleModule.addOutPatientAppoint(item);
      }
    }
    result.put(TableFieldName.status, status);
    if (status != Status.STATUS_OK) result.put("message", "门诊预约修改失败！");
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生门诊预约修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doOutPatientAppointEdit.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doOutPatientAppointEdit(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;
    Map<String, Object> result = new HashMap<>();
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      ScheduleItem item = scheduleModule.buildOutPatientAppointItem(request);
      if (item == null) status = Status.STATUS_ERROR;
      else {
        // 先删除，再添加
        status = scheduleModule.deleteScheduleItem(MedexConfigure.destPatient, item.getScheduleId());
        if (status == Status.STATUS_OK) {
          status = scheduleModule.addOutPatientAppoint(item);
          // 门诊预约修改，日志记录
          UserLog userLog = new UserLog();
          userLog.setMa(1);
          String doctorId = request.getParameter("doctorId");
          Account account = basicEntityModule.findAccount(doctorId, MedexConfigure.destDoctorType);
          if (account != null) userLog.setName(account.getName());
          userLog.setLog_desc("门诊预约修改");
          userLog.setLog_type("l013");
          userLog.setUser_type(MedexConfigure.destDoctor);
          userLog.setUserid(doctorId);
          userLog.setRequester(sessionParser.getUserName(request.getSession()));

          new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
        }
      }
    }
    result.put(TableFieldName.status, status);
    if (status != Status.STATUS_OK) result.put("message", "门诊预约失败！");
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生排班添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doOutPatientScheduleAdd.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doctor_outPatientSchedule_add(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    Map<String, Object> result = new HashMap<>();
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
      result.put("message", "非法请求！");
    } else {
      OutPatientSchedule[] scheduleItems = scheduleModule.buildAddOutPatientSchedule(request);
      if (scheduleItems == null || scheduleItems.length == 0) {
        status = Status.STATUS_ERROR;
        result.put("message", "添加失败！");
      } else {
        status = scheduleModule.addOutPatientSchedules(scheduleItems);
        if (status < 0) {
          String message = "添加失败！";
          int index = status * -1 - 1;
          if (index >= 0 && index < scheduleItems.length) {
            message = "添加冲突-->" + timeUtil.l2s2(scheduleItems[index].getStartDate());
          }
          result.put("message", message);
        }
        // 添加门诊排班，日志记录
        UserLog userLog = new UserLog();
        userLog.setMa(1);
        String doctorId = request.getParameter("doctorId");
        Account account = basicEntityModule.findAccount(doctorId, MedexConfigure.destDoctorType);
        if (account != null) userLog.setName(account.getName());
        userLog.setLog_desc("添加门诊排班");
        userLog.setLog_type("l011");
        userLog.setUser_type(MedexConfigure.destDoctor);
        userLog.setUserid(doctorId);
        userLog.setRequester(sessionParser.getUserName(request.getSession()));

        new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
      }
    }
    result.put(TableFieldName.status, status);
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生排班加号修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doOpstAdditionalRegistrationEdit.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doOpstAdditionalRegistrationEdit(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    Map<String, Object> result = new HashMap<>();
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
      result.put("message", "非法请求！");
    } else {
      String shiftId = request.getParameter("shiftId");
      String additionalRegistration = request.getParameter("additionalRegistration");
      status = scheduleModule.updateOutPatientScheduleAdditionalRegistration(shiftId,
          Integer.parseInt(additionalRegistration));
      if (status == Status.STATUS_OK) {
        result.put("data", basicEntityModule.findOutPatientItemById(shiftId));
      }
    }
    result.put(TableFieldName.status, status);
    if (status != Status.STATUS_OK) {
      if (status < 0) result.put("message", "已经有" + status * -1 + "个患者预约！不能修改加号数量");
      else result.put("message", "修改失败！");
    }
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生日程修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doScheduleEdit.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doctor_schedule_edit(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      ScheduleItem currentItem = scheduleModule.buildDoctorUpdateScheduleItem(request);
      if (currentItem == null) status = Status.STATUS_ERROR;
      else status = scheduleModule.updateScheduleItem(MedexConfigure.destDoctor, currentItem);
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * 根据医生的scheduleId获取日程详情
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "doctor/getDoctorScheduleByscheduleId.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getScheduleByscheduleId(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String scheduleId = request.getParameter("scheduleId");
    ScheduleItem item = basicEntityModule.findScheduleItemById(scheduleId);
    if (item != null) {
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", item);
    } else {
      result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * 根据shiftId获取排班记录详情
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "doctor/getOutPatientScheduleByshiftId.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getOutPatientScheduleByshiftId(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String shiftId = request.getParameter("shiftId");
    OutPatientSchedule item = basicEntityModule.findOutPatientItemById(shiftId);
    if (item != null) {
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", item);
    } else {
      result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * web端医生排班删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doOpstDelete.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doOpstDelete(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String shiftId = request.getParameter("shiftId");
      if (StringUtils.isBlank(shiftId)) status = Status.STATUS_ERROR;
      else {
        status = scheduleModule.deleteOutPatientSchedule(null, shiftId, 0);
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    if (status != Status.STATUS_OK) result.put("message", "删除失败！");
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生排班组删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doOpstDeleteByGroupId.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doOpstDeleteByGroupId(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String shiftGroupId = request.getParameter("shiftGroupId");
      if (StringUtils.isBlank(shiftGroupId)) status = Status.STATUS_ERROR;
      else {
        status = scheduleModule.deleteOutPatientSchedule(shiftGroupId, null, 1);
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    if (status != Status.STATUS_OK) result.put("message", "删除失败！");
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生日程组删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doScheduleDeleteByGroupId.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doScheduleDeleteByGroupId(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String groupId = request.getParameter("groupId");
      if (StringUtils.isBlank(groupId)) status = Status.STATUS_ERROR;
      else {
        status = scheduleModule.deleteScheduleGroup(MedexConfigure.destDoctor, groupId);
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    if (status != Status.STATUS_OK) result.put("message", "删除失败！");
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }

  /**
   * web端医生日程删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "doctor/doScheduleDelete.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String doctor_schedule_delete(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String scheduleId = request.getParameter("scheduleId");
      if (StringUtils.isBlank(scheduleId)) status = Status.STATUS_ERROR;
      else {
        status = scheduleModule.deleteScheduleItem(MedexConfigure.destDoctor, scheduleId);
      }
    }
    Map<String, Object> result = new HashMap<>();
    result.put(TableFieldName.status, status);
    result.put("token", token);
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return Help.bean2Json(result);
  }
}
