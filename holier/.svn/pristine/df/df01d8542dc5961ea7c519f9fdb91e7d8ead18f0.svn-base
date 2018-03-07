package com.danrong.holier.module;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class UserAuthHandlerInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    return true;
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
