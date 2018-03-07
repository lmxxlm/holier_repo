package com.danrong.medex.controller;

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
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.LoginModule;
import com.danrong.medex.module.LoginModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CookieParser;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

/**
 * 登录控制器
 * 
 * @author cyzsj
 */
@Controller
public class LoginController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;

  private final LoginModule lm = new LoginModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final CookieParser cookieParser = new CookieParser();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();

  @RequestMapping(value = "/login")
  public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);

    view.addObject(SessionField.token, token);
    view.setViewName("login");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // cookie判断是否需要自动填充账号密码
    Account account = cookieParser.checkLoginFromCookie(request, response);
    if (account != null && StringUtils.isNotBlank(account.getAccountId())
        && StringUtils.isNotBlank(account.getPasswd())) {
      view.addObject("autoLogin", true);
      view.addObject(TableFieldName.accountId, account.getAccountId());
    } else {
      view.addObject("autoLogin", false);
    }
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/doLoginOut.do")
  @ResponseBody
  public int doLogoutAction(HttpServletRequest request) {
    sessionParser.remove(request, SessionField.username);
    sessionParser.remove(request, SessionField.token);
    sessionParser.remove(request, SessionField.currentUserName);
    return Status.STATUS_OK;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/checkLogin")
  @ResponseBody
  public int check(@ModelAttribute Account account, HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) { return DbOption.DBOPTION_FAILER; }

    account.setLastloginIP(request.getRemoteAddr());
    int code = lm.medexLogin(account);
    if (code == DbOption.DBOPTION_SUCCESS) {
      sessionParser.setSession(request, SessionField.username, account.getAccountId());
      String currentUserName = basicEntityModule.findAccount(account.getAccountId(), null).getName();
      sessionParser.setSession(request, SessionField.currentUserName,
          StringUtils.isBlank(currentUserName) ? SessionField.defalut : currentUserName);
      // 如果选中了自动记录用户名密码，则加密后存cookie
      if (MedexConfigure.remember.equals(request.getParameter("rememberDetail"))) cookieParser.setCookie(
          account.getAccountId(), account.getPasswd(), request, response);
    }
    return code;
  }
}
