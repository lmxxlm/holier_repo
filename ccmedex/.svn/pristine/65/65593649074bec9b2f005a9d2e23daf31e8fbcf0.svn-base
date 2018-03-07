package com.danrong.ccmedex.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Product;
import com.danrong.medex.bean.ProductTimer;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.WeeklyOrderRequest;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.OrderModule;
import com.danrong.medex.module.OrderModuleImpl;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.TimeUtil;

@Controller
public class ProductDetailController {

  @Value("#{properties['ccmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final ProductModule productModule = new ProductModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final MedexToken medexToken = new MedexToken();
  private final OrderModule orderModule = new OrderModuleImpl();
  private final TimeUtil timeUtil = new TimeUtil();

  // private final TimeUtil timeUtil = new TimeUtil();

  @RequestMapping(value = "/productDetail")
  public ModelAndView productCategory(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String maplist = "";
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("productDetail");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品宿主记录
    String productId = request.getParameter(TableFieldName.productId);
    Product product = basicEntityModule.findProductById(productId);
    // 设置当天所在周的服务次数
    // int weekOfYear =
    // timeUtil.getWeekOfYear(timeUtil.d2s2(TimeUtil.now()));
    // ProductTimer pt =
    // productModule.findProductTimerByIdAndWeekOfYear(productId,
    // weekOfYear);
    // if (pt != null) product.setServiceCount(pt.getServiceCount());
    view.addObject("product", product);
    // 设置当前点击日期
    String currentTime = request.getParameter("currentTime");
    if (StringUtils.isBlank(currentTime)) currentTime = product.getStartTime_str();
    view.addObject("currentTime", currentTime);
    // 动态设置导航地图
    String postType = request.getParameter("postType");
    if ("host".equals(postType)) {
      maplist = "<li><a href=\"productOwner.html\">宿主列表</a></li><li><a href=\"ownerProduct.html?hostId="
          + product.getHostId() + "\">" + product.getHostName() + "的产品列表</a></li><li class=\"active\">产品详情</li>";
      view.addObject("menuIndex", "productOwner");
    } else if ("bookProduct".equals(postType)) {
      maplist = "<li><a href=\"ccindex.html\">产品预定</a></li><li class=\"active\">产品详情</li>";
      view.addObject("menuIndex", "bookProduct");
    } else {
      maplist = "<li><a href=\"product.html\">产品一览</a></li><li class=\"active\">产品详情</li>";
      view.addObject("menuIndex", "product");
    }
    view.addObject("maplist", maplist);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/getServiceCountByTime", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getServiceCountByTime(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String sTime = request.getParameter(TableFieldName.startTime_str);
    String eTime = request.getParameter(TableFieldName.endTime_str);
    String productId = request.getParameter(TableFieldName.productId);

    ProductTimer pt = productModule.findProductTimerByIdAndTime(productId, sTime, eTime);
    if (pt != null) {
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", pt);
    } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/editServiceCount")
  @ResponseBody
  public int editServiceCount(@ModelAttribute ProductTimer productTimer, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return productModule.updateProductTimer(productTimer);
  }

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
}
