package com.danrong.ccmedex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.danrong.medex.bean.OrderSearchQ;
import com.danrong.medex.bean.PayRecord;
import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.Transaction;
import com.danrong.medex.bean.result.OrderResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.OrderModule;
import com.danrong.medex.module.OrderModuleImpl;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.module.TransactionModule;
import com.danrong.medex.module.TransactionModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.StatusMapping;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class OrderController {

  @Value("#{properties['ccmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final OrderModule orderModule = new OrderModuleImpl();
  private final TransactionModule transactionModule = new TransactionModuleImpl();
  private final ProductModule productModule = new ProductModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final MedexToken medexToken = new MedexToken();

  @RequestMapping(value = "/allOrder")
  public ModelAndView allOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
    /*
     * if (param == null) param = new SearchParams(); param.setPs(2);
     */
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "order");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("allOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    // 获取未确认的订单记录
    String status = request.getParameter(TableFieldName.status);
    view.addObject("status", status);
    OrderResultObject oro = orderModule.get_order_list_by_status(param, StatusMapping.status_map.get(status));
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_order.do")
  public ModelAndView search_order(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch) return view;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "order");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("allOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    // 获取未确认的订单记录
    String status = request.getParameter(TableFieldName.status);
    view.addObject("status", status);
    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());

    osq.setStatus(StatusMapping.status_map.get(status));
    OrderResultObject oro = orderModule.searchOrder(param, osq);
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/orderDetail")
  public ModelAndView orderDetail(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("menuIndex", "order");
    view.setViewName("orderDetail");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取订单
    Order order = basicEntityModule.findOrderById(request.getParameter(TableFieldName.id));
    view.addObject("order", order);
    // 获取财务信息
    Transaction ptp = transactionModule.findRecordByOrderIdAndType(request.getParameter(TableFieldName.id),
        MedexConfigure.pay_type_pre);
    Transaction ptl = transactionModule.findRecordByOrderIdAndType(request.getParameter(TableFieldName.id),
        MedexConfigure.pay_type_last);

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    if (ptp != null) {
      ptp.setRemark(sdf.format(new Date(ptp.getTime())));
    }
    if (ptl != null) {
      ptl.setRemark(sdf.format(new Date(ptl.getTime())));
    }
    view.addObject("ptp", ptp);
    view.addObject("ptl", ptl);
    view.addObject("allowAction", "no");
    if (order == null || order.getOrderId() == null || order.getOrderId().isEmpty()) view.addObject("noorder", true);
    // 获取操作历史
    String orderHistory = orderModule.getOrderHistory(request.getParameter(TableFieldName.id));
    view.addObject("orderHistory", orderHistory);
    return view;
  }

  @RequestMapping(value = "/orderConfirmDetail")
  public ModelAndView productCategory(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "order");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("orderConfirmDetail");
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
    view.addObject("menuIndex", "order");
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

  @RequestMapping(value = "/rejectOrder")
  @ResponseBody
  public int rejectOrder(@ModelAttribute OrderReject orderReject, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return orderModule.addOrderReject(orderReject, true);
  }

  @RequestMapping(value = "/deleteOrderById")
  @ResponseBody
  public int deleteOrderById(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return orderModule.deleteOrderById(request.getParameter(TableFieldName.id));
  }

  @RequestMapping(value = "/orderComplete")
  @ResponseBody
  public int orderComplete(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return Status.STATUS_ERROR;
    else return orderModule.orderComplete(request.getParameter("orderId")) == true ? Status.STATUS_OK
        : Status.STATUS_ERROR;
  }

  @RequestMapping(value = "/addPayInfo.do")
  @ResponseBody
  public int addPayInfo(@ModelAttribute PayRecord pay_record, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      return orderModule.payUnderLine(pay_record) == true ? Status.STATUS_OK : Status.STATUS_ERROR;
    }
  }

  @RequestMapping(value = "/checkRepeatOrder.do")
  @ResponseBody
  public int addPayInfo(HttpServletRequest request) {
    String patientId = request.getParameter("patientId");
    if (StringUtils.isBlank(patientId)) return DbOption.DBOPTION_FAILER;
    return orderModule.hasOrderWithPatientIdBeforeHour(patientId, 48) == true ? Status.STATUS_OK : Status.STATUS_ERROR;
  }

}
