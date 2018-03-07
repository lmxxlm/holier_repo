package com.danrong.ccmedex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.ProductResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

/**
 * 登录控制器
 * 
 * @author cyzsj
 */
@Controller
public class ProductController {

  @Value("#{properties['ccmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final ProductModule productModule = new ProductModuleImpl();
  private final MedexToken medexToken = new MedexToken();

  @RequestMapping(value = "/ccindex")
  public ModelAndView ccindex(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "bookProduct");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("ccindex");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    // 获取产品记录
    DBObject query = new BasicDBObject();
    String hostId = request.getParameter(TableFieldName.hostId);
    if (StringUtils.isNotBlank(hostId)) query.put(TableFieldName.hostId, hostId);

    String pcid = request.getParameter(TableFieldName.pcid);
    if (StringUtils.isNotBlank(pcid)) query.put(TableFieldName.pcid, pcid);

    ProductResultObject pro = productModule.list(param, query);
    view.addObject("pro", pro);
    if (pro == null || pro.getProducts() == null || pro.getProducts().isEmpty()) view.addObject("noproduct", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/product_search.do")
  public ModelAndView product_search(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return view;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "bookProduct");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("ccindex");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    // 获取产品记录
    String hostId = request.getParameter(TableFieldName.hostId);
    String pcid = request.getParameter(TableFieldName.pcid);
    String owner = request.getParameter(TableFieldName.owner);

    view.addObject("hostId", hostId);
    view.addObject("pcid", pcid);
    view.addObject("owner", owner);

    ProductResultObject pro = productModule.searchProductByHostIdAndPcid(param, hostId, pcid);
    view.addObject("pro", pro);
    if (pro == null || pro.getProducts() == null || pro.getProducts().isEmpty()) view.addObject("noproduct", true);
    view.addObject("searchParam", param);
    return view;
  }
}
