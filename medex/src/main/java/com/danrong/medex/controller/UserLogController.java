package com.danrong.medex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.UserLogResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.LogDir;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.module.UserLogHistoryService;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.RestQ;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class UserLogController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final SessionParser sessionParser = new SessionParser();
  private final CommView commView = new CommView();
  private final UserLogHistoryService userLogHistoryService = new UserLogHistoryService();

  /**
   * 用户日志列表页
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/userLog")
  public ModelAndView transferTreatmentMessage(@ModelAttribute SearchParams param, String user_type,
      HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("userLog");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    if (StringUtils.isBlank(user_type)) user_type = "patient";
    view.addObject("user_type", user_type);
    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 获取列表数据
    UserLogResultObject uro = userLogHistoryService.list(new RestQ(param.getCp(), param.getPs(), param.getSu(),
        user_type, LogDir.ma).toString());
    view.addObject("uro", uro);
    if (uro == null || uro.getLogs() == null || uro.getLogs().isEmpty()) view.addObject("noRecord", true);
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    view.addObject("menuIndex", "userLog");
    view.addObject("searchParam", param);
    return view;
  }

}
