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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Doctor;
import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.Product;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.DoctorResultObject;
import com.danrong.medex.bean.result.ProductResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.Exist;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.DoctorModule;
import com.danrong.medex.module.DoctorModuleImpl;
import com.danrong.medex.module.OrderModule;
import com.danrong.medex.module.OrderModuleImpl;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

@Controller
public class ProductController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final ProductModule productModule = new ProductModuleImpl();
  private final DoctorModule doctorModule = new DoctorModuleImpl();
  private final OrderModule orderModule = new OrderModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final MedexToken medexToken = new MedexToken();

  @RequestMapping(value = "/product")
  public ModelAndView productCategory(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "product");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("product");
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
    view.addObject("type", pcid);
    // ===
    String hostName = request.getParameter(TableFieldName.name);
    view.addObject("hostId", hostId);
    view.addObject("hostName", hostName);
    System.out.println(hostName);
    // ===
    if (pro == null || pro.getProducts() == null || pro.getProducts().isEmpty()) view.addObject("noproduct", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/bookProduct")
  public ModelAndView bookProduct(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "bookProduct");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("bookProduct");
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
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch)
    // return view;
    // String token =
    // TokenGenerater.generateToken(AccountGenerater.generateHexString());
    // view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "bookProduct");
    // sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("bookProduct");
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

  @RequestMapping(value = "/ownerProduct")
  public ModelAndView ownerProduct(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "productOwner");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("ownerProduct");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    String hostId = request.getParameter("hostId");
    // 获取医生基本信息
    Doctor doctor = basicEntityModule.findDoctorById(hostId);
    view.addObject("doctor", doctor);
    if (doctor != null) view.addObject("hostId", doctor.getAccountId());
    view.addObject("doctor", doctor);
    // 获取产品记录
    ProductResultObject pro = productModule.getProductsByHostIdWithPage(param, hostId);
    view.addObject("pro", pro);
    if (pro == null || pro.getProducts() == null || pro.getProducts().isEmpty()) view.addObject("noproduct", true);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/addProduct")
  @ResponseBody
  public int addProduct(@ModelAttribute Product product, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      return productModule.addProduct(product);
    }
  }

  /**
   * 根据产品id获取产品
   * 
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/getProductById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getProductById(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String productId = request.getParameter(TableFieldName.productId);
    Product product = basicEntityModule.findProductById(productId);
    if (product != null) {
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", product);
    } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    return Help.bean2Json(result);
  }

  /**
   * 模糊查询可转诊的医生 返回10个
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/searchTransableDoctorByNameLimit10", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchDoctorByNameLimit10(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String doctorName = request.getParameter("searchVar");
    param.setPs(MedexConfigure.searchPatLimit10);
    DoctorResultObject dro = doctorModule.likeWithTransableDoctorName(param, doctorName);
    List<Doctor> doctors = dro.getDoctors();
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", doctors);
    return Help.bean2Json(result);
  }

  /**
   * 模糊查询可转诊的医生 返回10个
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "doctor/validDoctorByName", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String validDoctorByName(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String doctorName = request.getParameter(TableFieldName.name);
    DoctorResultObject dro = doctorModule.likeWithTransableDoctorName(param, doctorName);
    List<Doctor> doctors = dro.getDoctors();
    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", doctors);
    return Help.bean2Json(result);
  }

  /**
   * 判断改产品有没有被预定
   * 
   * @param request
   * @return
   */
  @RequestMapping(value = "/fineUnCompleteOrderByProductId")
  @ResponseBody
  public int fineUnCompleteOrderByProductId(HttpServletRequest request) {
    String productId = request.getParameter(TableFieldName.productId);
    return orderModule.hasOrder(productId) == true ? Exist.exist : Exist.notExist;
  }

  /**
   * 删除某个产品
   * 
   * @param request
   * @return
   */
  @RequestMapping(value = "/deleteProduct")
  @ResponseBody
  public int deleteProduct(HttpServletRequest request) {
    String productId = request.getParameter(TableFieldName.productId);
    return productModule.deleteProduct(productId);
  }

  @RequestMapping(value = "/editProduct")
  @ResponseBody
  public int editProduct(@ModelAttribute Product product, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return productModule.updateProduct(product);
  }
}
