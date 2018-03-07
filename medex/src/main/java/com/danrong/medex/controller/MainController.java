package com.danrong.medex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class MainController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final CommView commView = new CommView();

  @RequestMapping(value = "/index")
  public ModelAndView index(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.addObject(SessionField.token, TokenGenerater.generateToken(AccountGenerater.generateHexString()));
    view.setViewName("index");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(value = "/access")
  public ModelAndView access(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("access");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    commView.comm(view, request);
    return view;
  }
}
