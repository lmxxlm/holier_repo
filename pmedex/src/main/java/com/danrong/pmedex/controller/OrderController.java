package com.danrong.pmedex.controller;

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
import com.danrong.medex.bean.OrderSearchQ;
import com.danrong.medex.bean.PayRecord;
import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.QuickPayRequest;
import com.danrong.medex.bean.ScoreBalance;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.WeeklyOrderRequest;
import com.danrong.medex.bean.result.OrderResultObject;
import com.danrong.medex.bean.result.QuickPayResultObject;
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
import com.danrong.medex.module.QuickPayModule;
import com.danrong.medex.module.QuickPayModuleImpl;
import com.danrong.medex.module.ScoreBalanceModule;
import com.danrong.medex.module.ScoreBalanceModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.StatusMapping;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.TimeUtil;

@Controller
public class OrderController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final OrderModule orderModule = new OrderModuleImpl();
  private final QuickPayModule quickPayModule = new QuickPayModuleImpl();
  private final MedexToken medexToken = new MedexToken();
  private final TimeUtil timeUtil = new TimeUtil();
  private final SessionParser sessionParser = new SessionParser();
  private final ProductModule productModule = new ProductModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final ScoreBalanceModule scoreBalanceModule = new ScoreBalanceModuleImpl();

  @RequestMapping(value = "/submitOrderForOP.do")
  @ResponseBody
  public int submitOrderForOP(@ModelAttribute WeeklyOrderRequest weekly_order_request, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      if (weekly_order_request == null) return Status.STATUS_ERROR;
      // 判断是否重复提交
      boolean has_orderd = orderModule.has_orderd(weekly_order_request.getServiceId(),
          weekly_order_request.getPatientId(), weekly_order_request.getStartDate(), weekly_order_request.getEndDate());
      if (has_orderd) return Status.has_ordered;
      // 获取一个position
      int selectNumber = orderModule.get_avalible_select_number(weekly_order_request.getServiceId(),
          weekly_order_request.getStartDate(), weekly_order_request.getEndDate());
      if (selectNumber <= 0) return Status.STATUS_ERROR;
      weekly_order_request.setSelectedNumber(selectNumber);
      weekly_order_request.setTime(timeUtil.now2l());

      String orderId = orderModule.order_weekly_service(weekly_order_request);
      if (StringUtils.isNotBlank(orderId)) return Status.STATUS_OK;
      else return Status.STATUS_ERROR;
    }
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

  @RequestMapping(value = "/confirmAgain")
  @ResponseBody
  public int confirmAgain(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return orderModule.order_confirm_again(request.getParameter("orderId"), request.getParameter("rejectReason")) == true ? DbOption.DBOPTION_SUCCESS
        : DbOption.DBOPTION_FAILER;
  }

  @RequestMapping(value = "/allOrder")
  public ModelAndView allOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
    /*
     * if (param == null) param = new SearchParams(); param.setPs(2);
     */
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "allOrder");
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

  // @RequestMapping(value = "/bindOrder")
  // public ModelAndView bindOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
  // ModelAndView view = new ModelAndView();
  // String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
  // view.addObject(SessionField.token, token);
  // view.addObject("menuIndex", "bindOrder");
  // sessionParser.setSession(request, SessionField.token, token);
  // view.setViewName("bindOrder");
  // view.addObject(JSTLField.mainUrl, mainUrl.trim());
  // // 获取产品分类记录
  // List<Pcategory> categorys = productModule.getPcategoryList();
  // view.addObject("categorys", categorys);
  // // 获取未确认的订单记录
  // String status = request.getParameter(TableFieldName.status);
  // view.addObject("status", status);
  // OrderResultObject oro = orderModule.get_order_list_by_status(param, StatusMapping.status_map.get(status));
  // view.addObject("oro", oro);
  // if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
  // view.addObject("searchParam", param);
  // return view;
  // }

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

  @RequestMapping(value = "/order_qrdd")
  public ModelAndView order_qrdd(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_qrdd");
    view.addObject("menuIndex", "qrdd");
    view.addObject("status", "已预订");
    OrderResultObject oro = orderModule.get_order_list_by_status(param, "已预订");
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_qrdd.do")
  public ModelAndView search_qrdd(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_qrdd");
    view.addObject("menuIndex", "qrdd");
    view.addObject("status", "已预订");

    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());

    osq.setStatus("已预订");
    OrderResultObject oro = orderModule.searchOrder(param, osq);

    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/order_cxqrdd")
  public ModelAndView order_cxqrdd(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_cxqrdd");
    view.addObject("menuIndex", "qrdd");
    view.addObject("status", "重新确认");
    OrderResultObject oro = orderModule.get_order_list_by_status(param, "重新确认");
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_cxqrdd")
  public ModelAndView search_cxqrdd(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_cxqrdd");
    view.addObject("menuIndex", "qrdd");
    view.addObject("status", "重新确认");

    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());

    osq.setStatus("重新确认");
    OrderResultObject oro = orderModule.searchOrder(param, osq);

    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/order_sqpfjf")
  public ModelAndView order_sqpfjf(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_sqpfjf");
    view.addObject("menuIndex", "sqpfjf");
    view.addObject("status", "已支付");
    OrderResultObject oro = orderModule.get_order_list_by_status(param, "已支付");
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/search_sqpfjf")
  public ModelAndView search_sqpfjf(@ModelAttribute OrderSearchQ osq, @ModelAttribute SearchParams param,
      HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);

    view.setViewName("order_sqpfjf");
    view.addObject("menuIndex", "sqpfjf");
    view.addObject("status", "已支付");

    view.addObject("date", osq.getDate());
    view.addObject("category_q", osq.getCategory());
    view.addObject("name", osq.getName());
    view.addObject("orderId", osq.getOrderId());

    osq.setStatus("已支付");
    OrderResultObject oro = orderModule.searchOrder(param, osq);

    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
  }

  /**
   * 快捷支付列表页
   * 
   * @param param
   * @param request
   * @return 快捷支付列表页面
   */
  @RequestMapping(value = "/order_quickpay_list")
  public ModelAndView order_quickpay_list(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 此处设置模板名称
    view.setViewName("order_quickpay_list");
    QuickPayResultObject qpro = quickPayModule.search(param, null);
    view.addObject("qpro", qpro);
    if (qpro == null || qpro.getRecords() == null || qpro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);
    return view;
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

  /**
   * 查询快捷支付订单详情
   * 
   * @param param
   * @param request
   * @return 快捷支付订单详情
   */
  @RequestMapping(value = "/order_quickpay_detail")
  public ModelAndView order_quickpay_detail(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 此处设置模板名称
    view.setViewName("order_quickpay_detail");
    QuickPayRequest qpr = quickPayModule.findQuickPayRecordByOrderId(request.getParameter(TableFieldName.orderId));
    view.addObject("qpr", qpr);
    return view;
  }

  @RequestMapping(value = "/bindOrder")
  public ModelAndView bindOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
    // 通用
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 设置菜单
    view.addObject("menuIndex", "bddd");
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    // 获取订单列表
    // orderModule.getInprogressOrderList(arg0);
    // orderModule.add_resca_for_order(arg0, arg1, arg2);
    // orderModule.add_resma_for_order(arg0, arg1, arg2);

    OrderResultObject oro = orderModule.getInprogressOrderList(param);
    view.addObject("oro", oro);
    if (oro == null || oro.getRecords() == null || oro.getRecords().isEmpty()) view.addObject("noorder", true);
    view.addObject("searchParam", param);

    // 设置返回的页面名字并且返回页面
    view.setViewName("bindOrder");
    return view;
  }

  @RequestMapping(value = "/findOrder", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String findOrder(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String orderId = request.getParameter(TableFieldName.orderId);
    if (StringUtils.isBlank(orderId)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      // 获取订单
      Order order = basicEntityModule.findOrderById(orderId);
      if (order != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", order);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/addRes.do")
  @ResponseBody
  public int addRes(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      String orderId = request.getParameter(TableFieldName.orderId);
      String caId = request.getParameter("caId");
      String caName = request.getParameter("caName");
      String maId = request.getParameter("maId");
      String maName = request.getParameter("maName");
      if (StringUtils.isBlank(orderId)) return Status.STATUS_ERROR;
      else {
        return orderModule.add_resca_for_order(orderId, caId, caName)
            && orderModule.add_resma_for_order(orderId, maId, maName) ? Status.STATUS_OK : Status.STATUS_ERROR;
      }
    }
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
