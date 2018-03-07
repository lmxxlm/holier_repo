package com.danrong.pmedex.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.JbHistoryResultObject;
import com.danrong.medex.bean.result.UserWithDrawCashResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.PageView;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.danrong.miner.fe.StatisticsModuleImpl;
import com.danrong.miner.ir.StatisticsModule;
import com.danrong.miner.result.DoctorCoinsResult;
import com.danrong.miner.result.OrderIncomeResult;
import com.danrong.miner.result.ReturnCoinsResult;

@Controller
public class StatisticsController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();

  private final StatisticsModule staticticsModule = new StatisticsModuleImpl();

  @RequestMapping(value = "/count_doctorCoins")
  public ModelAndView count_doctorCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_doctorCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    DoctorCoinsResult dcr = null;
    String date = request.getParameter(TableFieldName.date);
    view.addObject("date", date);

    if (StringUtils.isNotBlank(date)) {
      date += MedexConfigure.DEFAULT_DATE_START;
      dcr = staticticsModule.doctor_coins_search_by_time(sp, date, null);
    } else dcr = staticticsModule.doctor_coins_list(sp);
    view.addObject("dcr", dcr);
    view.addObject("noorder", (dcr == null) ? true : false);
    view.addObject("searchParam", sp);

    return view;
  }

  @RequestMapping(value = "/showDoctorCoins")
  public ModelAndView showDoctorCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("showDoctorCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    DoctorCoinsResult dcr = staticticsModule.doctor_coins_list(sp);
    view.addObject("dcr", dcr);

    return view;
  }

  @RequestMapping(value = "/optj_search_count.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public ModelAndView optj_search_count(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch) return view;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "tjdd");
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_doctorCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    String date = request.getParameter(TableFieldName.date);
    view.addObject("date", date);
    // ------怎么根据姓名进行查找
    String doctorId = request.getParameter(TableFieldName.doctorId);
    view.addObject("doctorId", doctorId);

    view.addObject("page", 1);
    if (StringUtils.isNotBlank(date)) date += MedexConfigure.DEFAULT_DATE_START;
    DoctorCoinsResult dcr = staticticsModule.doctor_coins_search_by_time(sp, date, doctorId);
    // System.out.println(dcr.getPageView()+"为空！！");
    if (dcr.getPageView() == null) {
      PageView pp = new PageView();
      pp.setLast(1);
      dcr.setPageView(pp);
    }
    view.addObject("dcr", dcr);
    view.addObject("noorder", (dcr == null) ? true : false);
    view.addObject("searchParam", sp);
    return view;
  }

  @RequestMapping(value = "/count_orderIncome")
  public ModelAndView count_orderIncome(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_orderIncome");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    OrderIncomeResult oir = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      oir = staticticsModule.orderIncome_search_by_time(sp, startTime, endTime);
    } else oir = staticticsModule.orderIncome_list(sp);
    view.addObject("oir", oir);
    view.addObject("noorder", (oir == null) ? true : false);
    view.addObject("searchParam", sp);

    return view;
  }

  @RequestMapping(value = "/showOrderIncome")
  public ModelAndView showOrderIncome(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("showOrderIncome");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    OrderIncomeResult oir = staticticsModule.orderIncome_list(sp);
    view.addObject("oir", oir);

    return view;
  }

  @RequestMapping(value = "/optj_search_orderIncome.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public ModelAndView optj_search_orderIncome(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch) return view;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_orderIncome");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    OrderIncomeResult oir = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      oir = staticticsModule.orderIncome_search_by_time(sp, startTime, endTime);
    }
    view.addObject("oir", oir);
    view.addObject("noorder", (oir == null) ? true : false);
    view.addObject("searchParam", sp);

    return view;
  }

  @RequestMapping(value = "/count_sendCoins")
  public ModelAndView count_sendCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_sendCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // JbHistoryResultObject jro = staticticsModule.sendCoins_list(sp);
    JbHistoryResultObject jro = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      jro = staticticsModule.sendCoins_search_by_time(sp, startTime, endTime);
    } else jro = staticticsModule.sendCoins_list(sp);
    view.addObject("jro", jro);
    view.addObject("noorder", (jro == null) ? true : false);
    view.addObject("searchParam", sp);
    return view;
  }

  @RequestMapping(value = "/showSendCoins")
  public ModelAndView showSendCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("showSendCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    JbHistoryResultObject jro = staticticsModule.sendCoins_list(sp);
    view.addObject("jro", jro);
    return view;
  }

  @RequestMapping(value = "/optj_search_sendCoins", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public ModelAndView optj_search_sendCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {

    ModelAndView view = new ModelAndView();
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch) return view;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_sendCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    JbHistoryResultObject jro = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      jro = staticticsModule.sendCoins_search_by_time(sp, startTime, endTime);
    }
    view.addObject("jro", jro);
    view.addObject("noorder", (jro == null) ? true : false);
    view.addObject("searchParam", sp);

    return view;
  }

  // start
  @RequestMapping(value = "/count_returnCoins")
  public ModelAndView count_returnCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_returnCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    ReturnCoinsResult rcr = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      rcr = staticticsModule.auto_returnCoins_search_by_time(sp, startTime, endTime);
    } else rcr = staticticsModule.auto_returnCoins_list(sp);
    view.addObject("rcr", rcr);
    view.addObject("noorder", (rcr == null) ? true : false);
    view.addObject("searchParam", sp);
    return view;
  }

  @RequestMapping(value = "/showReturnCoins")
  public ModelAndView showReturnCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("showReturnCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    ReturnCoinsResult rcr = staticticsModule.auto_returnCoins_list(sp);
    view.addObject("rcr", rcr);
    return view;
  }

  @RequestMapping(value = "/optj_search_returnCoins.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public ModelAndView optj_search_returnCoins(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch) return view;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_returnCoins");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    ReturnCoinsResult rcr = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      rcr = staticticsModule.auto_returnCoins_search_by_time(sp, startTime, endTime);
    }
    view.addObject("rcr", rcr);
    view.addObject("noorder", (rcr == null) ? true : false);
    view.addObject("searchParam", sp);

    return view;
  }

  // end

  @RequestMapping(value = "/count_withdraw")
  public ModelAndView count_withdraw(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_withdraw");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    UserWithDrawCashResultObject udro = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    String status = request.getParameter(TableFieldName.status);
    if ("-1".equals(status)) status = null;
    else if ("1".equals(status)) status = MedexConfigure.alerady_withDrawCash;
    else status = MedexConfigure.check_withDrawCash;

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      udro = staticticsModule.with_draw_search_by_time(sp, startTime, endTime, status);
    } else udro = staticticsModule.with_draw_list(sp);
    view.addObject("udro", udro);
    view.addObject("noorder", (udro == null) ? true : false);
    view.addObject("searchParam", sp);

    // =======
    view.addObject("status", null);
    // =======
    return view;
  }

  @RequestMapping(value = "/showWithdraw")
  public ModelAndView showWithdraw(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("showWithdraw");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    UserWithDrawCashResultObject udro = staticticsModule.with_draw_list(sp);
    view.addObject("udro", udro);
    return view;
  }

  @RequestMapping(value = "/optj_search_Countwithdraw.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public ModelAndView optj_search_Countwithdraw(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch) return view;
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "tjdd");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("count_withdraw");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    UserWithDrawCashResultObject udro = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    view.addObject(TableFieldName.startTime, startTime);

    String endTime = request.getParameter(TableFieldName.endTime);
    view.addObject(TableFieldName.endTime, endTime);

    String status = request.getParameter(TableFieldName.status);
    if ("-1".equals(status)) status = null;
    else if ("1".equals(status)) status = MedexConfigure.alerady_withDrawCash;
    else status = MedexConfigure.check_withDrawCash;

    if (StringUtils.isNotBlank(startTime) && StringUtils.isNotBlank(endTime)) {
      startTime += MedexConfigure.DEFAULT_DATE_START;
      endTime += MedexConfigure.DEFAULT_DATE_START;
      udro = staticticsModule.with_draw_search_by_time(sp, startTime, endTime, status);
    }
    view.addObject("status", status);
    view.addObject("udro", udro);
    view.addObject("noorder", (udro == null) ? true : false);
    view.addObject("searchParam", sp);

    return view;
  }

  /**
   * js导出所需5个接口
   */
  /**
   * 导出医生金币余额
   * 
   * @param sp
   * @param request
   * @return
   */
  @RequestMapping(value = "/doctorCoinsExport.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String doctorCoinsExport(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch)
    // return null;

    DoctorCoinsResult dcr = null;
    String date = request.getParameter(TableFieldName.date);
    if (StringUtils.isBlank(date)) return null;

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    date += MedexConfigure.DEFAULT_DATE_START;
    dcr = staticticsModule.doctor_coins_search_by_time(sp, date, null);

    return Help.bean2Json(dcr);
  }

  /**
   * 订单收入导出
   * 
   * @param sp
   * @param request
   * @return
   */
  @RequestMapping(value = "/orderIncomeExport.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String orderIncomeExport(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch)
    // return null;

    OrderIncomeResult oir = null;
    String startTime = request.getParameter(TableFieldName.startTime);
    String endTime = request.getParameter(TableFieldName.endTime);

    if (StringUtils.isBlank(startTime) || StringUtils.isBlank(endTime)) return null;

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    startTime += MedexConfigure.DEFAULT_DATE_START;
    endTime += MedexConfigure.DEFAULT_DATE_START;
    oir = staticticsModule.orderIncome_search_by_time(sp, startTime, endTime);

    return Help.bean2Json(oir);
  }

  /**
   * 手动派发金币统计
   * 
   * @param sp
   * @param request
   * @return
   */
  @RequestMapping(value = "/sendCoinsExport.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String sendCoinsExport(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch)
    // return null;
    JbHistoryResultObject jro = null;

    String startTime = request.getParameter(TableFieldName.startTime);
    String endTime = request.getParameter(TableFieldName.endTime);
    if (StringUtils.isBlank(startTime) || StringUtils.isBlank(endTime)) return null;

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    startTime += MedexConfigure.DEFAULT_DATE_START;
    endTime += MedexConfigure.DEFAULT_DATE_START;
    jro = staticticsModule.sendCoins_search_by_time(sp, startTime, endTime);

    return Help.bean2Json(jro);
  }

  /**
   * 自动派发金币导出
   * 
   * @param sp
   * @param request
   * @return
   */
  @RequestMapping(value = "/returnCoinsExport.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String returnCoinsExport(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch)
    // return null;
    ReturnCoinsResult rcr = null;

    String startTime = request.getParameter(TableFieldName.startTime);
    String endTime = request.getParameter(TableFieldName.endTime);
    if (StringUtils.isBlank(startTime) || StringUtils.isBlank(endTime)) return null;

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    startTime += MedexConfigure.DEFAULT_DATE_START;
    endTime += MedexConfigure.DEFAULT_DATE_START;
    rcr = staticticsModule.auto_returnCoins_search_by_time(sp, startTime, endTime);

    return Help.bean2Json(rcr);
  }

  @RequestMapping(value = "/withdrawExport.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String withdrawExport(@ModelAttribute SearchParams sp, HttpServletRequest request) {
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch)
    // return null;
    UserWithDrawCashResultObject udro = null;

    String startTime = request.getParameter(TableFieldName.startTime);
    String endTime = request.getParameter(TableFieldName.endTime);
    if (StringUtils.isBlank(startTime) || StringUtils.isBlank(endTime)) return null;

    sp.setPs(MedexConfigure.MAX_TJ_COUNT);
    startTime += MedexConfigure.DEFAULT_DATE_START;
    endTime += MedexConfigure.DEFAULT_DATE_START;

    String status = request.getParameter(TableFieldName.status);
    if ("-1".equals(status)) status = null;
    else if ("1".equals(status)) status = MedexConfigure.alerady_withDrawCash;
    else status = MedexConfigure.check_withDrawCash;

    udro = staticticsModule.with_draw_search_by_time(sp, startTime, endTime, status);

    return Help.bean2Json(udro);
  }

}
