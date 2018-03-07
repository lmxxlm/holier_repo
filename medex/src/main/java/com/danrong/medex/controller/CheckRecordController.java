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
import com.danrong.medex.bean.CheckRecord;
import com.danrong.medex.bean.DRPic;
import com.danrong.medex.bean.Patient;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.UserLog;
import com.danrong.medex.bean.result.CheckRecordResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.CheckRecordModule;
import com.danrong.medex.module.CheckRecordModuleImpl;
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
public class CheckRecordController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final MedexToken medexToken = new MedexToken();
  private final CheckRecordModule checkRecordModule = new CheckRecordModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final TimeUtil timeUtil = new TimeUtil();
  private final CommView commView = new CommView();

  /**
   * 检查记录展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/checkRecord")
  public ModelAndView patient_checkRecord(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject("menuIndex", "checkRecord");
    view.setViewName("patient/checkRecord");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 当前被查询的患者id
    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    // 当前病人所在的医院currentHospital
    Patient patient = basicEntityModule.findPatientById(patientId);
    if (patient != null) {
      String currentHospital = patient.getCurrentHospital();
      view.addObject(TableFieldName.currentHospital, currentHospital);
    }
    // 当前category
    String category = request.getParameter(TableFieldName.category);
    view.addObject("defaultCategory", category);
    // 检查记录列表
    param.setPs(10);
    CheckRecordResultObject crro = checkRecordModule.search(patientId, category, param);
    view.addObject("crro", crro);
    boolean noRecord = false;
    if (crro.getRecords().isEmpty()) {
      noRecord = true;
    }
    view.addObject("noRecord", noRecord);
    // 是否还有记录
    param.setCp(param.getCp() + 1);
    CheckRecordResultObject more = checkRecordModule.search(patientId, category, param);
    if (more != null && more.getRecords() != null && !(more.getRecords().isEmpty())) {
      view.addObject("hasMore", true);
      List<CheckRecord> list = crro.getRecords();
      if (!list.isEmpty()) {
        // 最后一条的时间戳
        view.addObject("lastTime", list.get(list.size() - 1).getTime());
      }
    }
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * web端检查记录添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/checkUpAdd.do")
  @ResponseBody
  public int patient_checkUpAdd(@ModelAttribute CheckRecord record, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = checkRecordModule.addCheckRecord(record);
      // 添加患者检查记录，日志记录
      UserLog userLog = new UserLog();
      userLog.setMa(1);

      Account account = basicEntityModule.findAccount(record.getPatientId(), MedexConfigure.destPatientType);
      if (account != null) userLog.setName(account.getName());
      userLog.setLog_desc("添加患者检查记录");
      userLog.setLog_type("l003");
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
   * web端检查记录图片添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/addCheckUpImages.do")
  @ResponseBody
  public int patient_checkUpImagesAdd(HttpServletRequest request, HttpServletResponse response) {

    String checkRecordId = request.getParameter(TableFieldName.check_recordId);
    String imagePath = request.getParameter("imagepath");
    return checkRecordModule.addCheckRecordImages(checkRecordId, imagePath);
  }

  /**
   * 根据id查找检查记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/findcheckUpById.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String findcheckUpById(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    // 根据id获取记录
    String check_recordId = request.getParameter(TableFieldName.check_recordId);
    if (StringUtils.isBlank(check_recordId)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      CheckRecord record = checkRecordModule.findRecordById(check_recordId);
      if (record != null) {
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
  @RequestMapping(value = "patient/getImageListById.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getImageListById(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    // 根据id获取记录
    String check_recordId = request.getParameter(TableFieldName.check_recordId);
    if (StringUtils.isBlank(check_recordId)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      List<DRPic> images = checkRecordModule.getCheckRecordImages(check_recordId);
      if (images != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", images);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * web端检查记录修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/checkUpEdit.do")
  @ResponseBody
  public int patient_check_record_edit(@ModelAttribute CheckRecord record, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = checkRecordModule.updateCheckRecord(record);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * web端病历记录图片删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/deleteCheckUpImage.do")
  @ResponseBody
  public int deleteCheckUpImage(HttpServletRequest request, HttpServletResponse response) {
    String imagepath = request.getParameter("imagepath");
    return checkRecordModule.deleteCheckRecordImageByPath(imagepath);
  }

  /**
   * web端病历记录删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/checkUpDelete.do")
  @ResponseBody
  public int patient_check_record_delete(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String recordId = request.getParameter(TableFieldName.check_recordId);
      status = checkRecordModule.deleteCheckRecord(recordId);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  // /**
  // * 模糊搜索医院
  // *
  // * @param param
  // * @param request
  // * @return
  // */
  // @RequestMapping(method = RequestMethod.GET, value = "/searchHospitalByNameLimit10", produces = {
  // "application/json;charset=UTF-8" })
  // @ResponseBody
  // public String searchHospitalByNameLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
  // Map<String, Object> result = new HashMap<>();
  // String searchVar = request.getParameter("searchVar");
  // List<String> hospitals = basicEntityModule.likeWithHospital(searchVar, 10);
  // result.put(TableFieldName.status, Status.STATUS_OK);
  // result.put("data", hospitals);
  // return Help.bean2Json(result);
  // }

  /**
   * 根据时间查找病历记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/findCheckUpListLimit10ByTime.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String findCheckUpListLimit10ByTime(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String patientId = request.getParameter(TableFieldName.patientId);
    String time_str = request.getParameter(TableFieldName.time);
    String category = request.getParameter(TableFieldName.category);
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
      CheckRecordResultObject crro = checkRecordModule.getMore(patientId, category, time, param);
      if (crro != null && !(crro.getRecords().isEmpty())) {
        result.put("data", crro.getRecords());
        // 是否还有更多
        long lastTime = crro.getRecords().get(crro.getRecords().size() - 1).getTime();
        CheckRecordResultObject more = checkRecordModule.getMore(patientId, category, lastTime, param);
        if (more != null && more.getRecords() != null && !(more.getRecords().isEmpty())) {
          result.put(TableFieldName.status, Status.STATUS_OK);
        } else {
          result.put(TableFieldName.status, Status.NOMORE);
        }
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }
}
