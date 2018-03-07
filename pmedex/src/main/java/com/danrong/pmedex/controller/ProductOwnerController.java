package com.danrong.pmedex.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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

import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.DoctorResultObject;
import com.danrong.medex.bean.result.ProductOwnerResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.module.DoctorModule;
import com.danrong.medex.module.DoctorModuleImpl;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class ProductOwnerController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final ProductModule productModule = new ProductModuleImpl();
  private final MedexToken medexToken = new MedexToken();
  private final DoctorModule doctorModule = new DoctorModuleImpl();

  @RequestMapping(value = "serviceProvide")
  public ModelAndView serviceProvide(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    // 返回一个token，保护post请求
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("serviceProvide");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取doctor列表和分页
    DoctorResultObject dro = doctorModule.list(param, null);
    view.addObject("dro", dro);
    view.addObject("searchParam", param);
    view.addObject("nopage", false);
    view.addObject("menuIndex", "productOwner");
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "editServiceProvide.do")
  @ResponseBody
  public int editServiceProvide(HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    String confirmIdList = request.getParameter("confirmIdList");
    if (StringUtils.isNotBlank(confirmIdList)) {
      List<Map<String, Object>> result = doctorModule.buildTransferParam(confirmIdList);
      for (Map<String, Object> map : result) {
        String accountId = (String) map.get("key");
        boolean value = (boolean) map.get("value");
        doctorModule.updateTransfer(accountId, value);
      }
      return Status.STATUS_OK;
    } else return Status.STATUS_ERROR;
  }

  @RequestMapping(method = RequestMethod.POST, value = "editHLYServiceProvide.do")
  @ResponseBody
  public int editHLYServiceProvide(HttpServletRequest request, HttpServletResponse response) {
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    String confirmIdList = request.getParameter("confirmIdList");
    if (StringUtils.isNotBlank(confirmIdList)) {
      List<Map<String, Object>> result = doctorModule.buildTransferParam(confirmIdList);
      for (Map<String, Object> map : result) {
        String accountId = (String) map.get("key");
        boolean value = (boolean) map.get("value");
        doctorModule.updateProvider(accountId, value);
      }
      return Status.STATUS_OK;
    } else return Status.STATUS_ERROR;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/searchAccountForServiceProvide.do")
  public ModelAndView searchAccountForServiceProvide(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
        view.setViewName("serviceProvide");
        response.sendRedirect(mainUrl + "serviceProvide");
      } catch (IOException e) {
        view.setViewName("serviceProvide");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    String referHospital = request.getParameter("referHospital");
    String referDepartments = request.getParameter("referDepartments");
    // 生成数据
    param.setPs(100);
    view.addObject("dro", doctorModule.searchWithHospitalAndDepartment(param, referHospital, referDepartments));

    view.setViewName("serviceProvide");
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("searchParam", param);
    view.addObject("referHospital", referHospital);
    view.addObject("referDepartments", referDepartments);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/searchAccountForServiceProvideByName")
  public ModelAndView searchAccountForServiceProvideByName(@ModelAttribute SearchParams param,
      HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
        view.setViewName("serviceProvide");
        response.sendRedirect(mainUrl + "serviceProvide.html");
      } catch (IOException e) {
        view.setViewName("serviceProvide");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    String searchType = request.getParameter("searchType");
    String searchText = request.getParameter("searchText");
    if (StringUtils.isBlank(searchText) || StringUtils.isBlank(searchType)) {
      view.setViewName("serviceProvide");
      view.addObject("dro", null);
      return view;
    } else {
      param.setPs(100);
      searchType = searchType.trim();
      switch (searchType) {
      case MedexConfigure.docId:
        view.setViewName("serviceProvide");
        view.addObject("dro", doctorModule.likeWithDoctorId(param, searchText));
        break;
      case MedexConfigure.docName:
        view.setViewName("serviceProvide");
        view.addObject("dro", doctorModule.likeWithDoctorName(param, searchText));
        break;
      default:
        view.setViewName("serviceProvide");
        view.addObject("dro", null);
        break;
      }
    }
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("searchParam", param);
    view.addObject("searchType", searchType);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    return view;
  }

  @RequestMapping(value = "/productOwner")
  public ModelAndView productOwner(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "productOwner");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("productOwner");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    // 获取宿主记录
    ProductOwnerResultObject poro = productModule.listOwner(param, null);
    view.addObject("poro", poro);
    view.addObject("searchParam", param);
    if (poro == null || poro.getOwners() == null || poro.getOwners().isEmpty()) {
      view.addObject("noowner", true);
      view.addObject("noownerStr", "请添加宿主医生。");
    }
    String maplist = "<li class=\"active\">宿主列表</li>";
    view.addObject("maplist", maplist);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/searchAccountForProductOwner.do")
  public ModelAndView searchAccountForProductOwner(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject("menuIndex", "productOwner");
    String doctorName = request.getParameter("owner");
    // 生成数据
    param.setPs(100);
    ProductOwnerResultObject poro = productModule.searchOwnerByName(param, doctorName);
    view.addObject("poro", poro);
    view.setViewName("productOwner");
    view.addObject("searchParam", param);
    view.addObject("host", doctorName);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    if (poro == null || poro.getOwners() == null || poro.getOwners().isEmpty()) {
      view.addObject("noowner", true);
      view.addObject("noownerStr", "未搜索到这个宿主医生。");
    }
    String maplist = "<li><a href=\"productOwner.html\">宿主列表</a></li><li class=\"active\">搜索宿主</li>";
    view.addObject("maplist", maplist);
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    return view;
  }
}
