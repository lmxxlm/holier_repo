package com.danrong.mmedex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Account;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.module.LoginModule;
import com.danrong.medex.module.LoginModuleImpl;
import com.danrong.medex.util.SessionParser;

/**
 * 登录控制器
 * 
 * @author cyzsj
 */
@Controller
public class LoginController {

  @Value("#{properties['mmedex.web.main.url']}")
  public String mainUrl;

  private final LoginModule lm = new LoginModuleImpl();
  private final SessionParser sessionParser = new SessionParser();

  @RequestMapping(value = "/login")
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("login");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/doLogoutAction")
  @ResponseBody
  public int doLogoutAction(HttpServletRequest request) {
    sessionParser.setSession(request, SessionField.username, null);
    return Status.STATUS_OK;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/checkLogin")
  @ResponseBody
  public int check(@ModelAttribute Account account, HttpServletRequest request) {
    account.setLastloginIP(request.getRemoteAddr());
    int code = lm.adminLogin(account);
    if (code == DbOption.DBOPTION_SUCCESS) {
      sessionParser.setSession(request, SessionField.username, account.getAccountId());
    }
    return code;
  }
}
