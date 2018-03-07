package com.danrong.pmedex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.CaSnapshot;
import com.danrong.medex.bean.OrderSearchQ;
import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.CaResultObject;
import com.danrong.medex.bean.result.MaResultObject;
import com.danrong.medex.bean.result.OrderResultObject;
import com.danrong.medex.bean.video.MaSnapshot;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.AccountModule;
import com.danrong.medex.module.AccountModuleImpl;
import com.danrong.medex.module.OrderModule;
import com.danrong.medex.module.OrderModuleImpl;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.StatusMapping;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class BindOrderController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;
  private final OrderModule orderModule = new OrderModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final ProductModule productModule = new ProductModuleImpl();
  private final AccountModule accountModule = new AccountModuleImpl();

  @RequestMapping(method = RequestMethod.POST, value = "/maListConnect", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String maListConnect(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String maName = request.getParameter("searchVar");
    param.setPs(MedexConfigure.searchPatLimit10);
    MaResultObject mro = accountModule.likeWithMaName(param, maName);
    List<MaSnapshot> maSnapshots = mro.getMas();
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", maSnapshots);
    return Help.bean2Json(result);
  }

  @RequestMapping(method = RequestMethod.POST, value = "/caListConnect", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String caListConnect(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String caName = request.getParameter("searchVar");
    param.setPs(MedexConfigure.searchPatLimit10);
    CaResultObject mro = accountModule.likeWithCaName(param, caName);
    List<CaSnapshot> caSnapshots = mro.getCas();
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", caSnapshots);
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/search_bindOrder1.do")
  public ModelAndView search_bindOrder1(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    // 通用
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    view.setViewName("bindOrder");
    view.addObject("menuIndex", "bddd");

    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());
    view.addObject("caName", osq.getCaName());
    view.addObject("maName", osq.getMaName());
    view.addObject("responsible", osq.getResponsible());

    osq.setStatus(StatusMapping.status_map.get("inprogress"));
    OrderResultObject oro = orderModule.searchOrder(param, osq);
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

}
