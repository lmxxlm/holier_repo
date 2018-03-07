package com.danrong.medex.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.HotDoc;
import com.danrong.medex.bean.RecomDoc;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.HotDocResultObject;
import com.danrong.medex.bean.result.RecomDocResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.HotDocModule;
import com.danrong.medex.module.HotDocModuleImpl;
import com.danrong.medex.module.RecomDocModule;
import com.danrong.medex.module.RecomDocModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class RecomHotController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final RecomDocModule recomDocModule = new RecomDocModuleImpl();
  private final HotDocModule hotDocModule = new HotDocModuleImpl();
  private final CommView commView = new CommView();

  @RequestMapping(value = "expertsRecommend")
  public ModelAndView expertsRecommend(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    // 返回一个token，保护post请求
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("expertsRecommend");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取doctor列表和分页
    RecomDocResultObject dro = recomDocModule.list(param, -1);
    view.addObject("dro", dro);
    view.addObject("searchParam", param);
    view.addObject("nopage", false);
    view.addObject("menuIndex", "expertsRecommendList");
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/fuzzyQueryByDocName")
  public ModelAndView fuzzyQueryByDocName(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject("menuIndex", "expertsRecommend");
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
        view.setViewName("expertsRecommend");
        response.sendRedirect(mainUrl + "expertsRecommend.html");
      } catch (IOException e) {
        view.setViewName("access");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    String searchText = request.getParameter("searchText");

    if (StringUtils.isBlank(searchText)) {
      view.setViewName("exportsRecommend");
      view.addObject("dro", null);
      return view;
    } else {
      param.setPs(100);
      view.setViewName("expertsRecommend");
      view.addObject("dro", recomDocModule.searchByDoctorName(param, searchText));
    }
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("searchParam", param);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    view.addObject("menuIndex", "expertsRecommendList");
    return view;
  }

  @RequestMapping(value = "recom_search_ById.do")
  @ResponseBody
  public int recom_search_ById(String accountId, HttpServletRequest request, HttpServletResponse response) {
    return recomDocModule.exist(accountId) == true ? Status.STATUS_OK : Status.STATUS_ERROR;
  }

  @RequestMapping(value = "recom_doctor_add.do")
  @ResponseBody
  public int recom_doctor_add(@ModelAttribute RecomDoc rd, HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      Map<String, String> pic_data = recomDocModule.parse_web_pic_data(rd.getPics());
      rd.setPic_android(pic_data.get(TableFieldName.pic_android));
      rd.setPic_ios(pic_data.get(TableFieldName.pic_ios));
      rd.setWeb_small(pic_data.get(TableFieldName.web_small));
      rd.setWeb_ori(pic_data.get(TableFieldName.web_ori));

      status = recomDocModule.recom_doctor_add(rd);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  @RequestMapping(value = "submit_famous_doctor_to_set.do")
  @ResponseBody
  public int submit_famous_doctor_to_set(String stringID, HttpServletRequest request, HttpServletResponse response) {
    if (StringUtils.isBlank(stringID)) return DbOption.DBOPTION_FAILER;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = recomDocModule.recom_doctor_set(stringID.split(MedexConfigure.ARRAY_SPILT_TAG));
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  @RequestMapping(value = "deleteRecomdocById.do")
  @ResponseBody
  public int deleteRecomdocById(String accountId, HttpServletRequest request, HttpServletResponse response) {
    if (StringUtils.isBlank(accountId)) return DbOption.DBOPTION_FAILER;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = recomDocModule.delete_recom_doc_by_accountid(accountId);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  // 分页操作
  /**
   * @param param
   * @param request
   * @return
   */
  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/queryRecomDocByDivPage.do", produces = { "application/json;charset=UTF-8" })
  public String queryRecomDocByDivPage(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String ps = request.getParameter("ps");
    String cp = request.getParameter("cp");
    param.setCp(Integer.parseInt(cp));
    param.setPs(Integer.parseInt(ps));
    RecomDocResultObject dro = recomDocModule.list(param, -1);
    int last = dro.getPageView().getLast();
    int first = dro.getPageView().getFirst();
    int next = dro.getPageView().getNext();
    int back = dro.getPageView().getBack();
    List<RecomDoc> RecomDoc = dro.getRecords();
    result.put("status", (dro == null) ? false : true);
    result.put("page", true);
    result.put("cp", param.getCp());
    result.put("ps", param.getPs());
    result.put("last", last);
    result.put("first", first);
    result.put("next", next);
    result.put("back", back);
    result.put("data", RecomDoc);
    return Help.bean2Json(result);
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/selectByRecomRemmed.do", produces = { "application/json;charset=UTF-8" })
  public String selectByRecomRemmed(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    RecomDocResultObject dro = recomDocModule.list(param, 1);
    List<RecomDoc> RecomDoc = dro.getRecords();
    result.put("data", RecomDoc);
    result.put("status", (dro == null) ? false : true);
    result.put("nopage", true);
    return Help.bean2Json(result);
  }

  // 还得加token：根据姓名进行搜索查找
  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/RecomByDocName.do", produces = { "application/json;charset=UTF-8" })
  public String RecomByDocName(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {

    Map<String, Object> result = new HashMap<>();
    String searchText = request.getParameter("searchText");

    if (StringUtils.isBlank(searchText)) return mainUrl + "expertsRecommend.html";
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
      return mainUrl + "expertsRecommend.html";
    } else {
      RecomDocResultObject dro = recomDocModule.searchByDoctorName(null, searchText);
      List<RecomDoc> HotDoc = dro.getRecords();
      int last = dro.getPageView().getLast();
      result.put("data", HotDoc);
      result.put("last", last);
      status = 1;
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    result.put("nopage", true);
    result.put("token", token);
    result.put("status", status);
    return Help.bean2Json(result);
  }
  // 本周热门==============++++++====================****===========+++++============***============++++++==============***

  @RequestMapping(value = "weekHot")
  public ModelAndView weekHot(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    // 返回一个token，保护post请求
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("weekHot");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 获取doctor列表和分页
    HotDocResultObject dro = hotDocModule.list(param, -1);
    view.addObject("dro", dro);
    view.addObject("searchParam", param);
    view.addObject("nopage", false);
    view.addObject("menuIndex", "weekHotList");
    return view;
  }

  @RequestMapping(value = "submit_WeekHot_doctor_to_set.do")
  @ResponseBody
  public int submit_WeekHot_doctor_to_set(String stringID, HttpServletRequest request, HttpServletResponse response) {
    if (StringUtils.isBlank(stringID)) return DbOption.DBOPTION_FAILER;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = hotDocModule.recom_doctor_set(stringID.split(MedexConfigure.ARRAY_SPILT_TAG));
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  @RequestMapping(value = "weekHot_search_ById.do")
  @ResponseBody
  public int weekHot_search_ById(String accountId, HttpServletRequest request, HttpServletResponse response) {
    return hotDocModule.exist(accountId) == true ? Status.STATUS_OK : Status.STATUS_ERROR;
  }

  // 新增
  @RequestMapping(value = "WeekHot_doctor_add.do")
  @ResponseBody
  public int WeekHot_doctor_add(@ModelAttribute HotDoc hd, HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      Map<String, String> pic_data = recomDocModule.parse_web_pic_data(hd.getPics());
      hd.setPic_android(pic_data.get(TableFieldName.pic_android));
      hd.setPic_ios(pic_data.get(TableFieldName.pic_ios));
      hd.setWeb_small(pic_data.get(TableFieldName.web_small));
      hd.setWeb_ori(pic_data.get(TableFieldName.web_ori));
      String spec = request.getParameter(TableFieldName.specialties);
      if (StringUtils.isNotBlank(spec)) hd.setSpecialties(spec.split(MedexConfigure.ARRAY_SPILT_TAG));
      status = hotDocModule.hot_doctor_add(hd);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;

  }

  @RequestMapping(value = "deleteWeekHotById.do")
  @ResponseBody
  public int deleteWeekHotById(String accountId, HttpServletRequest request, HttpServletResponse response) {
    if (StringUtils.isBlank(accountId)) return DbOption.DBOPTION_FAILER;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      status = hotDocModule.delete_hot_doc_by_accountid(accountId);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  // 分页操作
  /**
   * 本周热门==进行分页操作
   * 
   * @param param
   * @param request
   * @return
   */

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/queryHotDocByDivPage.do", produces = { "application/json;charset=UTF-8" })
  public String queryHotDocByDivPage(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String ps = request.getParameter("ps");
    String cp = request.getParameter("cp");
    param.setCp(Integer.parseInt(cp));
    param.setPs(Integer.parseInt(ps));
    HotDocResultObject dro = hotDocModule.list(param, -1);
    int last = dro.getPageView().getLast();
    int first = dro.getPageView().getFirst();
    int next = dro.getPageView().getNext();
    int back = dro.getPageView().getBack();
    List<HotDoc> HotDoc = dro.getRecords();
    result.put("status", (dro == null) ? false : true);
    result.put("page", true);
    result.put("cp", param.getCp());
    result.put("ps", param.getPs());
    result.put("last", last);
    result.put("first", first);
    result.put("next", next);
    result.put("back", back);
    result.put("data", HotDoc);
    return Help.bean2Json(result);
  }

  // 还得加token：根据姓名进行搜索查找
  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/WeekHotByDocName1.do", produces = { "application/json;charset=UTF-8" })
  public String WeekHotByDocName1(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {

    Map<String, Object> result = new HashMap<>();
    String searchText = request.getParameter("searchText");

    if (StringUtils.isBlank(searchText)) return mainUrl + "weekHot.html";
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
      return mainUrl + "weekHot.html";
    } else {
      HotDocResultObject dro = hotDocModule.searchByDoctorName(null, searchText);
      List<HotDoc> HotDoc = dro.getRecords();
      int last = dro.getPageView().getLast();
      result.put("data", HotDoc);
      result.put("last", last);
      result.put("token", token);
      status = 1;
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    result.put("nopage", true);
    result.put("status", status);
    return Help.bean2Json(result);
  }
  
 

  // 默认checkbox在UL上面显示
  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/selectByRemmed.do", produces = { "application/json;charset=UTF-8" })
  public String selectByRemmed(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    param.setPs(100);
    HotDocResultObject dro = hotDocModule.list(param, -1);
    List<HotDoc> HotDoc = dro.getRecords();
    result.put("data", HotDoc);
    result.put("status", (dro == null) ? false : true);
    result.put("nopage", true);
    return Help.bean2Json(result);
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/recom_result_byId.do", produces = { "application/json;charset=UTF-8" })
  public String recom_result_byId(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String accountId = request.getParameter(TableFieldName.id);
    RecomDoc recomDoc = recomDocModule.getRecomDocByAccountId(accountId);
    result.put("data", recomDoc);
    result.put("status", (recomDoc == null) ? false : true);
    return Help.bean2Json(result);
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/recom_update_byId.do", produces = { "application/json;charset=UTF-8" })
  public int recom_update_byId(@ModelAttribute RecomDoc rd, @ModelAttribute SearchParams param,
      HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      Map<String, String> pic_data = recomDocModule.parse_web_pic_data(rd.getPics());
      rd.setPic_android(pic_data.get(TableFieldName.pic_android));
      rd.setPic_ios(pic_data.get(TableFieldName.pic_ios));
      rd.setWeb_small(pic_data.get(TableFieldName.web_small));
      rd.setWeb_ori(pic_data.get(TableFieldName.web_ori));

      status = recomDocModule.recom_doctor_update(rd.getAccountId(), rd);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/hot_result_byId.do", produces = { "application/json;charset=UTF-8" })
  public String hot_result_byId(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    String accountId = request.getParameter(TableFieldName.id);
    HotDoc hotDoc = hotDocModule.getHotDocByAccountId(accountId);
    result.put("data", hotDoc);
    result.put("status", (hotDoc == null) ? false : true);
    return Help.bean2Json(result);
  }

  @ResponseBody
  @RequestMapping(method = RequestMethod.POST, value = "/hot_update_byId.do", produces = { "application/json;charset=UTF-8" })
  public int hot_update_byId(@ModelAttribute HotDoc hd, @ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {

    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = DbOption.DBOPTION_FAILER;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      Map<String, String> pic_data = recomDocModule.parse_web_pic_data(hd.getPics());
      hd.setPic_android(pic_data.get(TableFieldName.pic_android));
      hd.setPic_ios(pic_data.get(TableFieldName.pic_ios));
      hd.setWeb_small(pic_data.get(TableFieldName.web_small));
      hd.setWeb_ori(pic_data.get(TableFieldName.web_ori));
      String spec = request.getParameter(TableFieldName.specialties);
      if (StringUtils.isNotBlank(spec)) hd.setSpecialties(spec.split(MedexConfigure.ARRAY_SPILT_TAG));
      status = hotDocModule.hot_doctor_update(hd.getAccountId(), hd);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;

  }
}
