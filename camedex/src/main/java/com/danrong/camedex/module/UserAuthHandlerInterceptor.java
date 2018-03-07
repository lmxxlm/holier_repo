package com.danrong.camedex.module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.util.SessionParser;

@Component
public class UserAuthHandlerInterceptor implements HandlerInterceptor {

  @Value("#{properties['camedex.web.host']}")
  public String mainUrl;

  // private final static Logger logger = LoggerFactory.getLogger(UserAuthHandlerInterceptor.class);
  private final SessionParser sessionParser = new SessionParser();

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    if (StringUtils.equals("/login.html", request.getServletPath())) { return true; }
    if (StringUtils.equals("/checkLogin.do", request.getServletPath())) { return true; }
    HttpSession session = request.getSession();
    String username = sessionParser.getUserName(session);
    if (StringUtils.isNotBlank(username)) {
      return true;
    } else {
      response.sendRedirect(mainUrl + "login.html");
    }
    return false;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
  }

  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
      throws Exception {
  }

  public static String getIpAddr(HttpServletRequest request) {
    String ip = request.getHeader(" x-forwarded-for ");
    if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
      ip = request.getHeader(" Proxy-Client-IP ");
    }
    if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
      ip = request.getHeader(" WL-Proxy-Client-IP ");
    }
    if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
      ip = request.getRemoteAddr();
    }
    return ip;
  }
}
