package com.danrong.femedex.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Doctor;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.WithDrawCash;
import com.danrong.medex.bean.result.UserWithDrawCashResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.module.CostModule;
import com.danrong.medex.module.CostModuleImpl;
import com.danrong.medex.module.WithDrawCashModule;
import com.danrong.medex.module.WithDrawCashModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.TimeUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

@Controller
public class WithDrawCashController {

  @Value("#{properties['femedex.web.host']}")
  public String mainUrl;

  private final CostModule costModule = new CostModuleImpl();
  private final WithDrawCashModule withDrawCaseModule = new WithDrawCashModuleImpl();
  private final MedexToken medexToken = new MedexToken();
  private final SessionParser sessParser = new SessionParser();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final TimeUtil timeUtil = new TimeUtil();

  @RequestMapping(value = "/withdraw")
  public ModelAndView withdraw(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawCash");
    view.setViewName("withdraw");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    DBObject query = new BasicDBObject();
    if ("0".equals(request.getParameter(TableFieldName.status))) {
      query.put(TableFieldName.request_status, "未提现");
      view.addObject("status", "0");
    } else {
      query.put(TableFieldName.request_status, "已提现");
      view.addObject("status", "1");
    }
    // 获取申请列表
    UserWithDrawCashResultObject uro = costModule.get_user_withdraw_cash_records(param, query);
    if (uro == null || uro.getRecords().isEmpty()) view.addObject("noRecord", true);
    // 获取驳回申请的数量
    int acount = withDrawCaseModule.countCheckReject();
    view.addObject("acount", acount);

    view.addObject("uro", uro);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/withdrawReject")
  public ModelAndView withdrawReject(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawCash");
    view.setViewName("withdrawReject");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    DBObject query = new BasicDBObject();
    query.put(TableFieldName.request_status, MedexConfigure.checkReject_withDrawCash);
    // 获取申请列表
    UserWithDrawCashResultObject uro = costModule.get_user_withdraw_cash_records(param, query);
    if (uro == null || uro.getRecords().isEmpty()) view.addObject("noRecord", true);
    // 获取驳回申请的数量
    int acount = withDrawCaseModule.countCheckReject();
    view.addObject("acount", acount);

    view.addObject("uro", uro);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/findWithDrawCashById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String findWithDrawCashById(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String _id = request.getParameter(TableFieldName.id);
    if (StringUtils.isBlank(_id)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      WithDrawCash wdc = withDrawCaseModule.findWithDrawCashById(_id);
      if (wdc != null) {
        String doctorId = wdc.getUserid();
        wdc.setRequest_time_str(timeUtil.l2s2(wdc.getRequest_time()));
        wdc.setDraw_time_str(timeUtil.l2s2(wdc.getDraw_time()));
        if (StringUtils.isNotBlank(doctorId)) {
          Doctor doctor = basicEntityModule.findDoctorById(doctorId);
          if (doctor != null) {
            wdc.setHospital(doctor.getReferHospital());
            wdc.setDepartment(doctor.getReferDepartments());
          }
        }
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", wdc);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/updateWithDrawStatus")
  @ResponseBody
  public int updateWithDrawStatus(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      return DbOption.DBOPTION_FAILER;
    } else {
      String _id = request.getParameter(TableFieldName.id);
      if (StringUtils.isBlank(_id)) return DbOption.DBOPTION_FAILER;
      else {
        return withDrawCaseModule.updateWithDrawStatus(_id, MedexConfigure.alerady_withDrawCash);
      }
    }
  }

  /**
   * 批量提现
   * 
   * @param request
   * @return
   */
  @RequestMapping(value = "/mulity_draw")
  @ResponseBody
  public int mulity_draw(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      return DbOption.DBOPTION_FAILER;
    } else {
      String _ids = request.getParameter("key_checked");
      if (StringUtils.isBlank(_ids)) return DbOption.DBOPTION_FAILER;
      else {
        String[] ids = _ids.split(MedexConfigure.ARRAY_SPILT_TAG);
        return withDrawCaseModule.mulity_checked(ids);
      }
    }
  }

  @RequestMapping(value = "/rejectWithDraw")
  @ResponseBody
  public int rejectWithDraw(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      return DbOption.DBOPTION_FAILER;
    } else {
      String _id = request.getParameter(TableFieldName.id);
      String rejectReason = request.getParameter(TableFieldName.rejectReason);
      if (StringUtils.isBlank(_id)) return DbOption.DBOPTION_FAILER;
      else {
        return withDrawCaseModule.rejectWithDrawStatus(_id, rejectReason, MedexConfigure.checkReject_withDrawCash);
      }
    }
  }

  @RequestMapping(value = "/doRejectWithDraw")
  @ResponseBody
  public boolean doRejectWithDraw(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      return false;
    } else {
      String _id = request.getParameter(TableFieldName.id);
      if (StringUtils.isBlank(_id)) return true;
      else {
        return withDrawCaseModule.rejectConfirm(_id);
      }
    }
  }

  @RequestMapping(value = "/search_withdraw")
  public ModelAndView search_withdraw(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawCash");
    view.setViewName("withdraw");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    String name = request.getParameter("search_name");
    String requesterId = request.getParameter("search_id");
    String start_time = request.getParameter("start_date");
    String end_time = request.getParameter("end_date");
    String status = request.getParameter("search_status");
    if (MedexConfigure.check_withDrawCash.equals(status)) {
      view.addObject("status", "0");
      view.setViewName("withdraw");
    } else if (MedexConfigure.alerady_withDrawCash.equals(status)) {
      view.addObject("status", "1");
      view.setViewName("withdraw");
    } else {
      view.setViewName("withdrawReject");
    }
    view.addObject("search_name", name);
    view.addObject("search_id", requesterId);
    view.addObject("start_time", start_time);
    view.addObject("end_time", end_time);
    view.addObject("search_status", status);
    // 获取订单
    UserWithDrawCashResultObject uro = withDrawCaseModule.searchWithDrawCash(param, status, name, requesterId,
        start_time, end_time);
    if (uro == null || uro.getRecords().isEmpty()) view.addObject("noRecord", true);
    // 获取驳回申请的数量
    int acount = withDrawCaseModule.countCheckReject();
    view.addObject("acount", acount);

    view.addObject("uro", uro);
    view.addObject("searchParam", param);
    return view;
  }

}
