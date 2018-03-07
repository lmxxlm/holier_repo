package com.danrong.pmedex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.module.ExchangeRateModule;
import com.danrong.medex.module.ExchangeRateModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class ScoreController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final ExchangeRateModule exchangeRateModule = new ExchangeRateModuleImpl();

  @RequestMapping(value = "/scoreRate")
  public ModelAndView productCategory(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "scoreRate");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("scoreRate");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取积分比率
    int scoreRate = exchangeRateModule.getRate();
    view.addObject("scoreRate", scoreRate);
    return view;
  }

  @RequestMapping(value = "/updateRate")
  @ResponseBody
  public boolean updateRate(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    int rate;
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return false;
    else rate = Integer.parseInt(request.getParameter("rate"));
    return exchangeRateModule.updateRate(rate);
  }

}
