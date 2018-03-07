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

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.Sweet;
import com.danrong.medex.bean.result.SweetResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.SweetModule;
import com.danrong.medex.module.SweetModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.TimeUtil;

@Controller
public class SweetController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final MedexToken medexToken = new MedexToken();
  private final SweetModule sweetModule = new SweetModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final TimeUtil timeUtil = new TimeUtil();
  private final CommView commView = new CommView();

  /**
   * 每日一条展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/qotd")
  public ModelAndView patient_checkRecord(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject("menuIndex", "qotd");
    view.setViewName("patient/qotd");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 当前被查询的患者id
    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    // 检查记录列表
    param.setPs(10);
    String type = request.getParameter(TableFieldName.type);
    SweetResultObject sro = sweetModule.list(patientId, type, param);
    view.addObject("sro", sro);
    if (sro.getSweets() == null || sro.getSweets().isEmpty()) view.addObject("norecord", true);
    // 是否还有记录
    param.setCp(param.getCp() + 1);
    SweetResultObject more = sweetModule.list(patientId, type, param);
    if (more != null && more.getSweets() != null && !(more.getSweets().isEmpty())) {
      view.addObject("hasMore", true);
      List<Sweet> list = sro.getSweets();
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
   * web端每日一言添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/addQotd.do")
  @ResponseBody
  public int patient_addQotd(@ModelAttribute Sweet sweet, HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      // 完善字段
      sweet.setDoctorName(sessionParser.getCurrentUserName(request.getSession()));
      sweet.setTime(timeUtil.now2l());
      status = sweetModule.add(sweet);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * web端每日一言添加接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/qotdDelete.do")
  @ResponseBody
  public int patient_qotdDelete(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String sweetId = request.getParameter(TableFieldName.sweetId);
      status = sweetModule.delete(sweetId);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  /**
   * 根据时间获取更多
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/getQotdByTimeLimit10.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getQotdByTimeLimit10(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String patientId = request.getParameter(TableFieldName.patientId);
    String time_str = request.getParameter(TableFieldName.time);
    String type = request.getParameter(TableFieldName.type);
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
      SweetResultObject sro = sweetModule.getMore(patientId, type, time, param);
      if (sro != null && sro.getSweets() != null && !(sro.getSweets().isEmpty())) {
        result.put("data", sro.getSweets());
        result.put(TableFieldName.status, Status.STATUS_OK);
        // 是否还有更多
        long lastTime = sro.getSweets().get(sro.getSweets().size() - 1).getTime();
        SweetResultObject more = sweetModule.getMore(patientId, type, lastTime, param);
        if (more != null && more.getSweets() != null && !(more.getSweets().isEmpty())) {
          result.put("isEnd", 1);
        } else {
          result.put("isEnd", 0);
        }
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }
}
