package com.danrong.femedex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.danrong.medex.bean.ScoreBalance;
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
import com.danrong.medex.module.ScoreBalanceModule;
import com.danrong.medex.module.ScoreBalanceModuleImpl;
import com.danrong.medex.module.TransactionModule;
import com.danrong.medex.module.TransactionModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.StatusMapping;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class OrderController {

  @Value("#{properties['femedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final OrderModule orderModule = new OrderModuleImpl();
  private final TransactionModule transactionModule = new TransactionModuleImpl();
  private final ProductModule productModule = new ProductModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final MedexToken medexToken = new MedexToken();
  private final ScoreBalanceModule scoreBalanceModule = new ScoreBalanceModuleImpl();

  @RequestMapping(value = "/feindex")
  public ModelAndView allOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
    /*
     * if (param == null) param = new SearchParams(); param.setPs(2);
     */
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "order");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("feindex");
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
    view.setViewName("feindex");
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
    if (order == null || order.getOrderId() == null || order.getOrderId().isEmpty()) view.addObject("noorder", true);
    // 动态设置导航地图
    String maplist = "";
    String postType = request.getParameter("postType");
    if ("qrdj".equals(postType)) {
      maplist = "<li><a href='#'>订单操作</a></li><li><a href=\"order_qrdj.html\">待确认定金订单列表</a></li><li class=\"active\">订单详情</li>";
      view.addObject("allowAction", "yes");
      view.addObject("menuIndex", "qrdj");
    } else if ("qryk".equals(postType)) {
      maplist = "<li><a href='#'>订单操作</a></li><li><a href=\"order_qryk.html\">待确认余款订单列表</a></li><li class=\"active\">订单详情</li>";
      view.addObject("allowAction", "yes");
      view.addObject("menuIndex", "qryk");
    } else if ("pfjf".equals(postType)) {
      maplist = "<li><a href='#'>订单操作</a></li><li><a href=\"order_pfjf.html\">待派发积分订单列表</a></li><li class=\"active\">订单详情</li>";
      view.addObject("allowAction", "yes");
      view.addObject("menuIndex", "pfjf");
    } else {
      maplist = "<li><a href='#'>Home</a></li><li><a href='feindex.html?status=" + order.getStatus() + "'>"
          + order.getStatus() + "订单</a></li><li class='active'>订单详情</li>";
      view.addObject("allowAction", "no");
      view.addObject("menuIndex", "order");
    }
    view.addObject("maplist", maplist);
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

  @RequestMapping(value = "/confirmAgain")
  @ResponseBody
  public int confirmAgain(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return orderModule.order_confirm_again(request.getParameter("orderId"), request.getParameter("rejectReason")) == true ? DbOption.DBOPTION_SUCCESS
        : DbOption.DBOPTION_FAILER;
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

  @RequestMapping(value = "/order_qrdj")
  public ModelAndView order_qrdj(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_qrdj");
    view.addObject("menuIndex", "qrdj");
    view.addObject("status", "未支付");
    OrderResultObject oro = orderModule.get_order_list_by_status(param, "未支付");
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_qrdj")
  public ModelAndView search_qrdj(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_qrdj");
    view.addObject("menuIndex", "qrdj");
    view.addObject("status", "未支付");

    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());

    osq.setStatus("未支付");
    OrderResultObject oro = orderModule.searchOrder(param, osq);

    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/order_qryk")
  public ModelAndView order_qryk(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_qryk");
    view.addObject("menuIndex", "qryk");
    view.addObject("status", "已确认");
    OrderResultObject oro = orderModule.get_order_list_by_status(param, "已确认");
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_qryk")
  public ModelAndView search_qryk(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_qryk");
    view.addObject("menuIndex", "qryk");
    view.addObject("status", "已确认");

    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());

    osq.setStatus("已确认");
    OrderResultObject oro = orderModule.searchOrder(param, osq);

    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/order_pfjf")
  public ModelAndView order_pfjf(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_pfjf");
    view.addObject("menuIndex", "pfjf");
    view.addObject("status", "积分待派发");
    OrderResultObject oro = orderModule.get_order_list_by_status(param, "积分待派发");
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_pfjf")
  public ModelAndView search_pfjf(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_pfjf");
    view.addObject("menuIndex", "pfjf");
    view.addObject("status", "积分待派发");

    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());

    osq.setStatus("积分待派发");
    OrderResultObject oro = orderModule.searchOrder(param, osq);

    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }
  @RequestMapping(value = "/get_user_score_balance", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String get_user_score_balance(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String highDoc = request.getParameter("highDoc");
    String lowDoc = request.getParameter("lowDoc");
    if (StringUtils.isBlank(highDoc)) {
      result.put("highScore", null);
      result.put("high_status", Status.STATUS_ERROR);
    } else {
      ScoreBalance highScore = scoreBalanceModule.get_user_score_balance(highDoc, MedexConfigure.destDoctorType);
      result.put("highScore", highScore);
      result.put("high_status", Status.STATUS_OK);
    }
    if (StringUtils.isBlank(lowDoc)) {
      result.put("lowScore", null);
      result.put("low_status", Status.STATUS_ERROR);
    } else {
      ScoreBalance lowScore = scoreBalanceModule.get_user_score_balance(lowDoc, MedexConfigure.destDoctorType);
      result.put("lowScore", lowScore);
      result.put("low_status", Status.STATUS_OK);
    }
    return Help.bean2Json(result);
  }
}
