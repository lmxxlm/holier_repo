package com.danrong.holier.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

  @RequestMapping(value = "/termOfService1")
  public ModelAndView termOfService1(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("termOfService1");
    return view;
  }

  @RequestMapping(value = "/termOfServiceForDoc1")
  public ModelAndView termOfServiceForDoc1(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("termOfServiceForDoc1");
    return view;
  }

  @RequestMapping(value = "/insuranceAgreement")
  public ModelAndView insuranceAgreement(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("insuranceAgreement");
    return view;
  }

  @RequestMapping(value = "/")
  public ModelAndView root(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("index");
    return view;
  }

  @RequestMapping(value = "/index")
  public ModelAndView index(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("index");
    return view;
  }

  @RequestMapping(value = "/termOfService")
  public ModelAndView termOfService(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("termOfService");
    return view;
  }

  @RequestMapping(value = "/termOfServiceForDoc")
  public ModelAndView termOfServiceForDoc(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("termOfServiceForDoc");
    return view;
  }

  @RequestMapping(value = "/submitAdvice")
  public int submitAdvice(HttpServletRequest request) {
    return 1;
  }
}
