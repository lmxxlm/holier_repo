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

import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.result.ProductResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.Exist;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class ProductCategoryController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final ProductModule productModule = new ProductModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final MedexToken medexToken = new MedexToken();

  @RequestMapping(value = "/productCategory")
  public ModelAndView productCategory(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "productCategory");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("productCategory");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取产品分类记录
    List<Pcategory> categorys = productModule.getPcategoryList();
    view.addObject("categorys", categorys);
    if (categorys == null || categorys.isEmpty()) view.addObject("nocategory", true);
    return view;
  }

  @RequestMapping(value = "/getProductCategoryByName")
  @ResponseBody
  public int getProductCategoryByName(HttpServletRequest request) {
    String name = request.getParameter(TableFieldName.name);
    if (StringUtils.isNotBlank(name)) return productModule.exist(name) == true ? Exist.exist : Exist.notExist;
    else return Exist.notExist;
  }

  @RequestMapping(value = "/getProductCategoryByNameForUpdate")
  @ResponseBody
  public int getProductCategoryByNameForUpdate(HttpServletRequest request) {
    String name = request.getParameter(TableFieldName.name);
    String _id = request.getParameter(TableFieldName.id);
    if (StringUtils.isNotBlank(name)) return productModule.existExcepIds(name, _id) == true ? Exist.exist
        : Exist.notExist;
    else return Exist.notExist;
  }

  @RequestMapping(value = "/fineProductByCategoryId")
  @ResponseBody
  public int fineProductByCategoryId(HttpServletRequest request) {
    String _id = request.getParameter(TableFieldName.id);
    if (StringUtils.isNotBlank(_id)) {
      ProductResultObject pro = productModule.getProductsByCategoryId(_id);
      if (pro == null || pro.getProducts() == null || pro.getProducts().isEmpty()) return Exist.notExist;
      else return Exist.exist;
    } else return Exist.notExist;
  }

  @RequestMapping(value = "/addProductCategory")
  @ResponseBody
  public int addProductCategory(@ModelAttribute Pcategory pcategory, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return productModule.addPcategory(pcategory);
  }

  @RequestMapping(value = "/editProductCategory")
  @ResponseBody
  public int editProductCategory(@ModelAttribute Pcategory pcategory, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return productModule.updatePcategory(pcategory);
  }

  @RequestMapping(value = "/deleteProductCategory")
  @ResponseBody
  public int deleteProductCategory(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else return productModule.deletePcategory(request.getParameter(TableFieldName.id));
  }

  @RequestMapping(value = "/getProductCategoryById", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getProductCategoryById(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    // 根据id获取记录
    String pcid = request.getParameter(TableFieldName.id);
    if (StringUtils.isBlank(pcid)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      Pcategory category = basicEntityModule.findPcategoryById(pcid);
      if (category != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", category);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }
}
