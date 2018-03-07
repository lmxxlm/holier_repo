package com.danrong.mmedex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 总控制器
 * 
 * @author cyzsj
 */
@Controller
public class MainController {

  @Value("#{properties['mmedex.web.main.url']}")
  public String mainUrl;

  @RequestMapping(value = "/")
  public ModelAndView getMainPage(HttpServletRequest request) {
    ModelAndView view = new ModelAndView("");
    view.setViewName("main");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/center")
  public ModelAndView getCenter(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("center");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/top")
  public ModelAndView getTop(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("top");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/down")
  public ModelAndView getDown(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("down");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/left")
  public ModelAndView getLeft(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("left");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/tab/tab")
  public ModelAndView getTabTab(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/tab");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/tab/unfinished")
  public ModelAndView getTabUnfinished(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/unfinished");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

}
