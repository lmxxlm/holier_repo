package com.danrong.pmedex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Order;
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
import com.danrong.medex.util.TokenGenerater;

@Controller
public class OrderConfirmController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final OrderModule orderModule = new OrderModuleImpl();
  private final TransactionModule transactionModule = new TransactionModuleImpl();
  private final ProductModule productModule = new ProductModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final MedexToken medexToken = new MedexToken();

  @RequestMapping(value = "/orderConfirm")
  public ModelAndView orderConfirm(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "orderConfirm");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("orderConfirm");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    // 获取未确认的订单记录
    OrderResultObject oro = orderModule.get_unconfirm_user_order_list(param);
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
    if ("qrdd".equals(postType)) {
      maplist = "<li><a href='#'>订单操作</a></li><li><a href=\"order_qrdd.html\">待确认订单列表</a></li><li class=\"active\">订单详情</li>";
      view.addObject("allowAction", "yes");
      view.addObject("menuIndex", "qrdd");
    } else if ("cxqrdd".equals(postType)) {
      maplist = "<li><a href='#'>订单操作</a></li><li><a href=\"order_cxqrdd.html\">待重新确认订单列表</a></li><li class=\"active\">订单详情</li>";
      view.addObject("allowAction", "yes");
      view.addObject("menuIndex", "cxqrdd");
    } else if ("sqpfjf".equals(postType)) {
      maplist = "<li><a href='#'>订单操作</a></li><li><a href=\"order_sqpfjf.html\">可申请派发积分订单列表</a></li><li class=\"active\">订单详情</li>";
      view.addObject("allowAction", "yes");
      view.addObject("menuIndex", "sqpfjf");
    } else if ("qrdj".equals(postType)) {
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
      maplist = "<li><a href='#'>Home</a></li><li><a href='allOrder.html?status=" + order.getStatus() + "'>"
          + order.getStatus() + "订单</a></li><li class='active'>订单详情</li>";
      view.addObject("allowAction", "no");
      view.addObject("menuIndex", "allOrder");
    }
    view.addObject("maplist", maplist);
    // 获取操作历史
    String orderHistory = orderModule.getOrderHistory(request.getParameter(TableFieldName.id));
    view.addObject("orderHistory", orderHistory);
    return view;
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

  @RequestMapping(value = "/orderCheckComplete")
  @ResponseBody
  public int orderCheckComplete(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return Status.STATUS_ERROR;
    else return orderModule.update_order_status(request.getParameter("orderId"), MedexConfigure.check_complete_order) == true ? Status.STATUS_OK
        : Status.STATUS_ERROR;
  }
}
