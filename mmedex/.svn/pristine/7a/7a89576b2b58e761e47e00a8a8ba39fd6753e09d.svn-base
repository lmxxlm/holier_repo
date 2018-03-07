package com.danrong.mmedex.controller;

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

import com.danrong.medex.bean.Hospital;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.HospitalResultObject;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.HospitalModule;
import com.danrong.medex.module.HospitalModuleImpl;

@Controller
public class DataController {

  @Value("#{properties['mmedex.web.main.url']}")
  public String mainUrl;

  private final HospitalModule hospitalModule = new HospitalModuleImpl();

  @RequestMapping(value = "/tab/hospital")
  public ModelAndView getTab_data_Hospital(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("/tab/hospital");
    view.addObject("mainUrl", mainUrl.trim());

    // 获取hospital列表
    HospitalResultObject hro = hospitalModule.list(param, null);
    view.addObject("hro", hro);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/tab/hospitalAdd")
  public ModelAndView getTabAccountAdd(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/hospitalAdd");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/hospitalAddForm")
  @ResponseBody
  public int accountAdd(@ModelAttribute Hospital hospital, HttpServletRequest request) {
    if (hospital != null) {
      Hospital hp = hospitalModule.searchByHospitalName(hospital.getName());
      if (hp != null) return -1;
    }
    return hospitalModule.addHospital(hospital) == true ? 1 : 0;
  }

  @RequestMapping(value = "/tab/hospitalEdit")
  public ModelAndView getTabAccountEdit(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/hospitalEdit");
    view.addObject("mainUrl", mainUrl.trim());
    // 获取hospital详情
    Hospital hospital = hospitalModule.getHospitalById(TableFieldName._id);
    view.addObject("hospital", hospital);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/doHospitalDeleteAction")
  @ResponseBody
  public int hospitalSingleDelete(HttpServletRequest request) {
    return hospitalModule.deleteHospital(request.getParameter(TableFieldName._id)) == true ? 1 : 0;
  }

  @RequestMapping(method = RequestMethod.POST, value = "tab/searchHospital")
  public ModelAndView searchHospital(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/hospital");
    view.addObject("mainUrl", mainUrl.trim());
    view.addObject("searchParam", param);
    String searchText = request.getParameter("hospitalName");
    if (StringUtils.isBlank(searchText)) {
      view.addObject("hro", null);
    } else {
      HospitalResultObject hro = hospitalModule.likeWithHospitalName(param, searchText);
      view.addObject("hro", hro);
    }
    return view;
  }
}
