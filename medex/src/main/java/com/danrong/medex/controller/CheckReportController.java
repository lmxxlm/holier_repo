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
import com.danrong.medex.bean.CheckReport;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.SingleTestReport;
import com.danrong.medex.bean.UserLog;
import com.danrong.medex.bean.WTestNorm;
import com.danrong.medex.bean.WTestReport;
import com.danrong.medex.bean.result.WCheckReportImageResultObject;
import com.danrong.medex.bean.result.WCheckReportResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.CheckReportModule;
import com.danrong.medex.module.CheckReportModuleImpl;
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
public class CheckReportController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final MedexToken medexToken = new MedexToken();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final CheckReportModule checkReportModule = new CheckReportModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final TimeUtil timeUtil = new TimeUtil();
  private final CommView commView = new CommView();

  /**
   * 检验展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/checkReport")
  public ModelAndView patient_checkReport(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject("menuIndex", "checkReport");
    view.setViewName("patient/checkReport");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 当前被查询的患者id
    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    // 分类树（到2级）
    view.addObject("cateTreeDeep2", checkReportModule.getCategoryTreeDeep2());
    // 获取所有化验单
    String category = request.getParameter(TableFieldName.category);
    param.setPs(5);
    WCheckReportResultObject wcrro = checkReportModule.searchBySecondName(patientId, category, param);
    view.addObject("wcrro", wcrro);
    boolean noRecord = false;
    if (wcrro.getReports().isEmpty()) {
      noRecord = true;
    }
    view.addObject("noRecord", noRecord);
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * 检验图片展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/checkReportImage")
  public ModelAndView patient_checkReportImage(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject("menuIndex", "checkReport");
    view.setViewName("patient/checkReportImage");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 当前被查询的患者id
    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    // 是否已读
    String checkInStatus = request.getParameter(TableFieldName.checkIn);
    view.addObject("isRead", checkInStatus);
    // 分类树（到2级）
    view.addObject("cateTreeDeep2", checkReportModule.getCategoryTreeDeep2());
    // 获取分类列表下的图片
    String category = request.getParameter(TableFieldName.category);
    param.setPs(8);
    List<WCheckReportImageResultObject> wcriro_list = checkReportModule.searchImageBySecondName(patientId, category,
        param, checkInStatus);
    view.addObject("wcriro_list", wcriro_list);
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * web端检查检验图片添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/addCheckReportImages.do")
  @ResponseBody
  public int patient_checkReportImagesAdd(HttpServletRequest request, HttpServletResponse response) {

    String patientId = request.getParameter(TableFieldName.patientId);
    String imagePath = request.getParameter("imagepath");
    String thirdName = request.getParameter(TableFieldName.thirdName);
    return checkReportModule.addCheckReportImages(patientId, thirdName, imagePath);
  }

  /**
   * web端检查检验图片修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/editCheckReportImageReadStatus.do")
  @ResponseBody
  public int patient_editCheckReportImageReadStatus(HttpServletRequest request, HttpServletResponse response) {

    String patientId = request.getParameter(TableFieldName.patientId);
    String imagePath = request.getParameter("imagepath");
    String thirdName = request.getParameter(TableFieldName.thirdName);
    return checkReportModule.addCheckReportImages(patientId, thirdName, imagePath);
  }

  /**
   * web端病历记录图片删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/deleteCheckReportImage.do")
  @ResponseBody
  public int deleteCheckReportImage(HttpServletRequest request, HttpServletResponse response) {
    String imagepath = request.getParameter("imagepath");
    return checkReportModule.deleteCheckReportImageByPath(imagepath);
  }

  /**
   * 根据时间查找更多检验记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getUserTestListByTimeAndNameLimit5.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getUserTestListByTimeAndNameLimit5(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String patientId = request.getParameter(TableFieldName.patientId);
    String time_str = request.getParameter("lastTime");
    String thirdName = request.getParameter(TableFieldName.thirdName);
    if (StringUtils.isBlank(patientId) || StringUtils.isBlank(time_str) || StringUtils.isBlank(thirdName)) result.put(
        TableFieldName.status, Status.STATUS_ERROR);
    else {
      long time;
      try {
        time = Long.parseLong(time_str);
      } catch (Exception e) {
        time = timeUtil.now2l();
      }
      param.setPs(5);
      WTestReport wr = checkReportModule.getMore(patientId, thirdName, time, param);
      if (wr != null && wr.getValueMap() != null) {
        result.put("data", wr);
        result.put(TableFieldName.status, Status.STATUS_OK);
        // 是否还有更多
        long lastTime = wr.getLastTime();
        WTestReport more = checkReportModule.getMore(patientId, thirdName, lastTime, param);
        if (more != null && more.getValueMap() != null) {
          result.put("isEnd", 1);
        } else {
          result.put("isEnd", 0);
        }
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * 根据时间精确查找检验记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getTestnormListForUserByTime.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getTestnormListForUserByTime(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String patientId = request.getParameter(TableFieldName.patientId);
    String time_str = request.getParameter("time");
    String thirdName = request.getParameter(TableFieldName.thirdName);
    if (StringUtils.isBlank(patientId) || StringUtils.isBlank(time_str) || StringUtils.isBlank(thirdName)) result.put(
        TableFieldName.status, Status.STATUS_ERROR);
    else {
      long time;
      try {
        time = timeUtil.s2l(time_str + ":00");
      } catch (Exception e) {
        time = timeUtil.now2l();
      }
      param.setPs(5);
      SingleTestReport st = checkReportModule.getSingleReport(patientId, thirdName, time);
      if (st != null && st.getUserdata() != null) {
        result.put("data", st);
        result.put(TableFieldName.status, Status.STATUS_OK);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * 检验添加页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/checkReportAdd")
  public ModelAndView patient_checkReportAdd(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("patient/checkReportAdd");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject("menuIndex", "checkReport");

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 当前被查询的患者id
    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    // 所有的一级分类
    List<String> firstNames = checkReportModule.getFirstCategory();
    view.addObject("firstNames", firstNames);
    // 所有的二级分类
    List<String> secondNames = checkReportModule.getAllSecondCategory();
    view.addObject("secondNames", secondNames);
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * 根据一级分类查找二级分类
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getLevel2TestnormFromLevel1.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getLevel2TestnormFromLevel1(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String firstName = request.getParameter("searchVar");
    if (StringUtils.isBlank(firstName)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      List<String> secondNames = checkReportModule.getSecondCategoryByFirst(firstName);
      if (secondNames != null && !secondNames.isEmpty()) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", secondNames);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * 根据二级分类查找三级分类
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getLevel3TestnormFromLevel2.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getLevel3TestnormFromLevel2(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String secondName = request.getParameter("searchVar");
    if (StringUtils.isBlank(secondName)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      List<String> thirdNames = checkReportModule.getThirdCategoryBySecond(secondName);
      if (thirdNames != null && !thirdNames.isEmpty()) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", thirdNames);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * 根据第三级获取对应的第一第二级
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getLevelLineFromLevel3.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getLevelLineFromLevel3(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String thirdName = request.getParameter("searchVar");
    if (StringUtils.isBlank(thirdName)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      Map<String, String> lineNames = checkReportModule.getLevelLineFromLevel3(thirdName);
      if (lineNames != null && !lineNames.isEmpty()) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", lineNames);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * 根据三级分类生成检验单
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getTestnormListByLevel3.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getTestnormListByLevel3(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String thirdName = request.getParameter("searchVar");
    if (StringUtils.isBlank(thirdName)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      WTestNorm testnorm = checkReportModule.getWTestNorm(thirdName);
      if (testnorm != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", testnorm);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  /**
   * web端检验添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/addCheckout.do")
  @ResponseBody
  public int patient_addCheckout(@ModelAttribute CheckReport report, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = checkReportModule.addCheckReport(report);
      // 添加患者检验记录，日志记录
      UserLog userLog = new UserLog();
      userLog.setMa(1);

      Account account = basicEntityModule.findAccount(report.getPatientId(), MedexConfigure.destPatientType);
      if (account != null) userLog.setName(account.getName());
      userLog.setLog_desc("添加患者检验记录");
      userLog.setLog_type("l004");
      userLog.setUser_type(MedexConfigure.destPatient);
      userLog.setUserid(report.getPatientId());
      userLog.setRequester(sessionParser.getUserName(request.getSession()));

      new Thread(new UserLogModuleImpl(userLog, new SendMessageCallBackImpl())).start();
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * web端检验修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/editCheckout.do")
  @ResponseBody
  public int patient_editCheckout(@ModelAttribute CheckReport report, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = checkReportModule.updateCheckReport(report);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * web端检验删除接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/checkoutDelete.do")
  @ResponseBody
  public int patient_checkoutDelete(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String patientId = request.getParameter(TableFieldName.patientId);
      String time_str = request.getParameter("time");
      String thirdName = request.getParameter(TableFieldName.thirdName);

      long time;
      try {
        time = timeUtil.s2l(time_str + ":00");
      } catch (Exception e) {
        time = timeUtil.now2l();
      }

      status = checkReportModule.deleteCheckReport(patientId, thirdName, time);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }
}
