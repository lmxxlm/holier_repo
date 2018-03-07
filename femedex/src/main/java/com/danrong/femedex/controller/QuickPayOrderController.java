package com.danrong.femedex.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.OrderSearchQ;
import com.danrong.medex.bean.QuickPayRequest;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.QuickPayResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.QuickPayModule;
import com.danrong.medex.module.QuickPayModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

@Controller
public class QuickPayOrderController {

  @Value("#{properties['femedex.web.host']}")
  public String mainUrl;
  private final SessionParser sessParser = new SessionParser();
  private final QuickPayModule quickPayModule = new QuickPayModuleImpl();

  @RequestMapping(value = "/quickPayOrder")
  public ModelAndView quickPayOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "quickPay");
    view.setViewName("quickPayOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    DBObject query = new BasicDBObject();
    if ("0".equals(request.getParameter(TableFieldName.status))) {
      query.put(TableFieldName.status, "未支付");
      view.addObject("status", "0");
    } else {
      query.put(TableFieldName.status, "已支付");
      view.addObject("status", "1");
    }
    // 获取订单
    QuickPayResultObject qpro = quickPayModule.search(param, query);
    if (qpro == null || qpro.getRecords() == null || qpro.getRecords().isEmpty()) view.addObject("noRecord", true);
    view.addObject("qpro", qpro);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_quickPayOrder")
  public ModelAndView search_quickPayOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "quickPay");
    view.setViewName("quickPayOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    String name = request.getParameter("search_name");
    String orderId = request.getParameter("search_orderId");
    String status = request.getParameter("search_status");
    if ("未支付".equals(status)) {
      view.addObject("status", "0");
    } else {
      view.addObject("status", "1");
    }
    view.addObject("search_name", name);
    view.addObject("search_orderId", orderId);
    // 获取订单
    OrderSearchQ osq = new OrderSearchQ();
    osq.setOrderId(orderId);
    osq.setName(name);
    osq.setStatus(status);
    QuickPayResultObject qpro = quickPayModule.searchOrder(param, osq);
    if (qpro == null || qpro.getRecords() == null || qpro.getRecords().isEmpty()) view.addObject("noRecord", true);
    view.addObject("qpro", qpro);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/getQuickPayOrderById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getQuickPayOrderById(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String _id = request.getParameter(TableFieldName.id);
    if (StringUtils.isBlank(_id)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      QuickPayRequest order = quickPayModule.findQuickPayRecordByOrderId(_id);
      if (order != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", order);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }
}
