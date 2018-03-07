package com.danrong.pmedex.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Order;
import com.danrong.medex.bean.OrderConfirm;
import com.danrong.medex.bean.OrderPrice;
import com.danrong.medex.bean.OrderReject;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.OrderModule;
import com.danrong.medex.module.OrderModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class OrderConfirmDetailController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final OrderModule orderModule = new OrderModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final MedexToken medexToken = new MedexToken();

  @RequestMapping(value = "/orderConfirmDetail")
  public ModelAndView productCategory(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("orderConfirmDetail");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取订单记录
    String orderId = request.getParameter(TableFieldName.orderId);
    Order order = basicEntityModule.findOrderById(orderId);
    view.addObject("order", order);
    view.addObject("searchParam", param);
    view.addObject("menuIndex", "qrdd");
    return view;
  }

  @RequestMapping(value = "/orderConfirmAgain")
  public ModelAndView orderConfirmAgain(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "cxqrdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("orderConfirmAgain");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取订单记录
    String orderId = request.getParameter(TableFieldName.orderId);
    Order order = basicEntityModule.findOrderById(orderId);
    view.addObject("order", order);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/orderConfirmDetailShow")
  public ModelAndView orderConfirmDetailShow(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "allOrder");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("orderConfirmDetailShow");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取订单记录
    String orderId = request.getParameter(TableFieldName.orderId);
    Order order = basicEntityModule.findOrderById(orderId);
    view.addObject("order", order);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/addOrderConfirm")
  @ResponseBody
  public int addOrderConfirm(@ModelAttribute OrderConfirm orderConfirm, @ModelAttribute OrderPrice price,
      HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      String orderId = orderConfirm.getOrderId();
      if (StringUtils.isBlank(orderId)) return DbOption.DBOPTION_FAILER;
      int confirm_status = orderModule.addOrderConfirm(orderConfirm);
      boolean update_status = orderModule.update_order_price(orderId, price);
      if (!update_status) confirm_status = DbOption.DBOPTION_FAILER;
      return confirm_status;
    }
  }

  @RequestMapping(value = "/addOrderConfirmAgain")
  @ResponseBody
  public int addOrderConfirmAgain(@ModelAttribute OrderConfirm orderConfirm, @ModelAttribute OrderPrice price,
      HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      String orderId = orderConfirm.getOrderId();
      if (StringUtils.isBlank(orderId)) return DbOption.DBOPTION_FAILER;
      // int confirm_status = orderModule.addOrderConfirm(orderConfirm);
      boolean updateStatus = orderModule.update_order_status(orderId, MedexConfigure.alerady_confirmed);
      boolean confirm_status = orderModule.update_order_price(orderId, price);
      return (updateStatus && confirm_status) ? DbOption.DBOPTION_SUCCESS : DbOption.DBOPTION_FAILER;
    }
  }

  @RequestMapping(value = "/rejectOrder")
  @ResponseBody
  public int rejectOrder(@ModelAttribute OrderReject orderReject, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return orderModule.addOrderReject(orderReject, true);
  }
}
