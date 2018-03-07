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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Account;
import com.danrong.medex.bean.DRPic;
import com.danrong.medex.bean.MedicalRecord;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.UserLog;
import com.danrong.medex.bean.result.MedicalRecordResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.MedicalRecordModule;
import com.danrong.medex.module.MedicalRecordModuleImpl;
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
public class MedicalRecordController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final MedexToken medexToken = new MedexToken();
  private final MedicalRecordModule medicalRecordModule = new MedicalRecordModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  // private final PatientModule patientModule = new PatientModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final TimeUtil timeUtil = new TimeUtil();
  private final CommView commView = new CommView();

  /**
   * 病历展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/medicalRecord")
  public ModelAndView medicalRecord(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("patient/medicalRecord");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject("menuIndex", "medicalRecord");

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 当前被查询的患者id
    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    // 病历记录列表
    param.setPs(10);
    MedicalRecordResultObject mmro = medicalRecordModule.list(patientId, param);
    view.addObject("mmro", mmro);
    // 第一个记录
    boolean noRecord = false;
    List<MedicalRecord> list = mmro.getRecords();
    if (!list.isEmpty()) {
      MedicalRecord firstRecord = list.get(0);
      // 重构content
      String content = firstRecord.getContent();
      if (StringUtils.isNotBlank(content)) {
        content = content.replace("\n", "</br>");
        firstRecord.setContent(content);
      }
      view.addObject("firstRecord", firstRecord);
      // 最后一条的时间戳
      view.addObject("lastTime", list.get(list.size() - 1).getTime());
    } else {
      noRecord = true;
    }
    view.addObject("noRecord", noRecord);
    // 是否还有记录
    param.setCp(param.getCp() + 1);
    MedicalRecordResultObject more = medicalRecordModule.list(patientId, param);
    if (more != null && !(more.getRecords().isEmpty())) {
      view.addObject("hasMore", true);
    }
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * 根据时间查找病历记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/findMedicalTimeRecordByTime.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String findMedicalTimeRecordByTime(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String patientId = request.getParameter(TableFieldName.patientId);
    String time_str = request.getParameter(TableFieldName.time);
    if (StringUtils.isBlank(patientId) || StringUtils.isBlank(time_str)) result.put(TableFieldName.status,
        Status.STATUS_ERROR);
    else {
      long time;
      try {
        time = Long.parseLong(time_str);
      } catch (Exception e) {
        time = timeUtil.now2l();
      }
      param.setPs(10);
      MedicalRecordResultObject mmro = medicalRecordModule.getMore(patientId, time, param);
      if (mmro != null && !(mmro.getRecords().isEmpty())) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", mmro.getRecords());
        // 是否还有更多
        if (!mmro.getRecords().isEmpty()) {
          long lastTime = mmro.getRecords().get(mmro.getRecords().size() - 1).getTime();
          MedicalRecordResultObject more = medicalRecordModule.getMore(patientId, lastTime, param);
          if (more != null && !(more.getRecords().isEmpty())) {
            result.put(TableFieldName.status, Status.STATUS_OK);
          } else {
            result.put(TableFieldName.status, Status.NOMORE);
          }
        }
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * web端病历记录添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/medicalRecordAdd.do")
  @ResponseBody
  public int patient_medicalRecord_add(@ModelAttribute MedicalRecord record, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      record.setTime(timeUtil.now2l());
      status = medicalRecordModule.addMedicalRecord(record);

      // 添加患者病历记录，日志记录
      UserLog userLog = new UserLog();
      userLog.setMa(1);

      Account account = basicEntityModule.findAccount(record.getPatientId(), MedexConfigure.destPatientType);
      if (account != null) userLog.setName(account.getName());
      userLog.setLog_desc("添加患者病历记录");
      userLog.setLog_type("l002");
      userLog.setUser_type(MedexConfigure.destPatient);
      userLog.setUserid(record.getPatientId());
      userLog.setRequester(sessionParser.getUserName(request.getSession()));

      new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * web端病历记录修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/medicalRecordEdit.do")
  @ResponseBody
  public int patient_medical_record_edit(@ModelAttribute MedicalRecord record, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      record.setTime(timeUtil.now2l());
      status = medicalRecordModule.updateMedicalRecord(record);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * web端病历记录删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/medicalRecordDelete.do")
  @ResponseBody
  public int patient_medical_record_delete(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String recordId = request.getParameter(TableFieldName.medical_recordId);
      status = medicalRecordModule.deleteMedicalRecord(recordId);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * 根据id查找病历记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/findMedicalRecordById.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String findMedicalRecordById(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    // 根据id获取记录
    String medical_recordId = request.getParameter(TableFieldName.medical_recordId);
    if (StringUtils.isBlank(medical_recordId)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      MedicalRecord record = medicalRecordModule.findRecordById(medical_recordId);
      if (record != null) {
        // 重构content
        String content = record.getContent();
        if (StringUtils.isNotBlank(content)) {
          content = content.replace("\n", "</br>");
          record.setHtmlContent(content);
        }
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", record);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * 根据id查找影像记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getMedicalImageListById.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getMedicalImageListById(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    // 根据id获取记录
    String medical_recordId = request.getParameter(TableFieldName.medical_recordId);
    if (StringUtils.isBlank(medical_recordId)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      List<DRPic> images = medicalRecordModule.getmedicalRecordImages(medical_recordId);
      if (images != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", images);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * web端病历图片添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/addMedicalRecordImages.do")
  @ResponseBody
  public int patient_addMedicalRecordImages(HttpServletRequest request, HttpServletResponse response) {
    String patientId = request.getParameter(TableFieldName.patientId);
    String imagePath = request.getParameter("imagepath");
    String check_recordId = request.getParameter(TableFieldName.check_recordId);
    return medicalRecordModule.addmedicalRecordImages(patientId, imagePath, check_recordId);
  }
}
