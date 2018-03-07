package com.danrong.pmedex.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.ObjectMapper;

import com.danrong.medex.bean.Account;
import com.danrong.medex.configure.CookieField;
import com.dr.core.encrypt.DrEncrypt;
import com.dr.core.encrypt.Encrypt;
import com.dr.core.util.CommonUtil;

public class CookieParser {

  private final Encrypt crypt = new DrEncrypt();
  private static final ObjectMapper mapper = CommonUtil.getInstance();
  private static String host = "";
  static {
    try {
      BufferedReader fileReader = new BufferedReader(new InputStreamReader(
          JsonParser.class.getResourceAsStream("/pmedex_config.txt")));
      JsonNode rootNode = mapper.readTree(fileReader);
      host = rootNode.path("pmedex.web.ip").getTextValue().trim();
      fileReader.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * 从cookie获取账户信息
   * 
   * @param request
   * @param response
   * @return
   */
  public Account checkLoginFromCookie(HttpServletRequest request, HttpServletResponse response) {
    String usernameCookie = null;
    String passwordCookie = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (CookieField.username.equals(cookie.getName())) usernameCookie = cookie.getValue();
        if (CookieField.password.equals(cookie.getName())) passwordCookie = cookie.getValue();
      }
      if (usernameCookie != null && passwordCookie != null) {
        // TODO
        String username = crypt.sy_decrypt(usernameCookie);
        String password = crypt.sy_decrypt(passwordCookie);

        // String username = usernameCookie;
        // String password = passwordCookie;
        return new Account(username, password);
      } else return null;
    } else return null;
  }

  public void setCookie(String username, String password, HttpServletRequest request, HttpServletResponse response) {
    if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) return;
    // TODO 用户名，密码加密存cookie
    username = this.crypt.sy_encrypt(username);
    password = this.crypt.sy_encrypt(password);

    Cookie cookie = new Cookie(CookieField.username, username); // 保存用户名到Cookie
    cookie.setPath("/");
    cookie.setMaxAge(CookieField.cookieDisable);
    cookie.setDomain(host);
    response.addCookie(cookie);
    // 保存密码到Cookie，注意需要加密一下
    cookie = new Cookie(CookieField.password, password);
    cookie.setPath("/");
    cookie.setMaxAge(CookieField.cookieDisable);
    cookie.setDomain(host);
    response.addCookie(cookie);
  }
}
