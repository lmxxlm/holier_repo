package com.danrong.pmedex.controller;

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
import com.danrong.medex.module.v2.order.V2KfOrderModule;
import com.danrong.medex.module.v2.order.V2KfOrderModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.danrong.medex.util.v2.BillSearchQuery;
import com.danrong.medex.util.v2.V2WithDrawStatus;
import com.dr.core.util.TimeUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

@Controller
public class WithDrawCashController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  private final CostModule costModule = new CostModuleImpl();
  private final WithDrawCashModule withDrawCaseModule = new WithDrawCashModuleImpl();
  private final MedexToken medexToken = new MedexToken();
  private final SessionParser sessionParser = new SessionParser();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  private final V2KfOrderModule v2KfOrderModule = new V2KfOrderModuleImpl();
  private final TimeUtil timeUtil = new TimeUtil();

  @RequestMapping(value = "/withdraw")
  public ModelAndView withdraw(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
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

  // 转院待提现
  @RequestMapping(value = "/withdrawForRecureOrder")
  public ModelAndView withdrawForRecureOrder(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawForRecureOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    view.setViewName("withdrawForRecureOrder");

    // 获取数据
    BillSearchQuery query = new BillSearchQuery();
    query.setStatus(V2WithDrawStatus.sqz);
    Map<String, Integer> sort = new HashMap<>();
    sort.put("submit_time", 1);
    query.setSort(sort);
    List<Map<String, Object>> dataList = null ; //v2KfOrderModule.get_withdraw_list(query);
    if (dataList == null || dataList.isEmpty()) {
      view.addObject("noRecord", true);
    }
    view.addObject("data", buildDataList(dataList));

    view.addObject("pageparam", param);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/search_transfers_withdraw")
  public ModelAndView search_transfers_withdraw(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawForRecureOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    String status = request.getParameter("search_status");
    Map<String, Integer> sort = new HashMap<>();
    if ("1".equals(status)) {
      status = V2WithDrawStatus.sqz;
      sort.put("submit_time", 1);
      view.setViewName("withdrawForRecureOrder");
    } else if ("2".equals(status)) {
      status = V2WithDrawStatus.ytx;
      sort.put("deal_time", -1);
      view.setViewName("haveWithdrawalForTransfers");
    } else if ("3".equals(status)) {
      sort.put("deal_time", -1);
      status = V2WithDrawStatus.bbh;
      view.setViewName("rejectForTransfers");
    }

    // param
    String pay_account_name = request.getParameter("pay_account_name");
    String doctor_id = request.getParameter("doctor_id");
    String submit_time_start = request.getParameter("submit_time_start");
    String submit_time_end = request.getParameter("submit_time_end");
    String orderid = request.getParameter("orderid");

    Map<String, String> bsq = new HashMap<>();

    // 获取数据
    BillSearchQuery query = new BillSearchQuery();
    query.setCp(param.getCp());
    query.setPs(param.getPs());

    if (StringUtils.isNotBlank(pay_account_name)) {
      query.setPay_account_name(pay_account_name);
      bsq.put("pay_account_name", pay_account_name);
    }
    if (StringUtils.isNotBlank(doctor_id)) {
      query.setDoctor_id(doctor_id);
      bsq.put("doctor_id", doctor_id);
    }
    if (StringUtils.isNotBlank(orderid)) {
      query.setOrderid(orderid);
      bsq.put("orderid", orderid);
    }
    if (StringUtils.isNotBlank(submit_time_start)) {
      query.setSubmit_time_start(timeUtil.s2l2(submit_time_start));
      bsq.put("submit_time_start", submit_time_start);
    }
    if (StringUtils.isNotBlank(submit_time_end)) {
      query.setSubmit_time_end(timeUtil.s2l2(submit_time_end));
      bsq.put("submit_time_end", submit_time_end);
    }
    query.setStatus(status);
    query.setSort(sort);
    List<Map<String, Object>> dataList = v2KfOrderModule.get_withdraw_list(query);
    if (dataList == null || dataList.isEmpty()) {
      view.addObject("noRecord", true);
    }
    view.addObject("data", buildDataList(dataList));

    view.addObject("pageparam", param);
    view.addObject("bsq", bsq);
    return view;
  }

  @RequestMapping(value = "kf_transfer_bill_withdraw_ok.do")
  @ResponseBody
  public boolean kf_transfer_bill_withdraw_ok(String recordid, HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    boolean result = false;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      result = false;
    } else if (StringUtils.isBlank(recordid)) result = false;
    else {
      Map<String, Object> withdraw = new HashMap<>();
      withdraw.put("recordid", recordid);
      withdraw.put("status", V2WithDrawStatus.ytx);
      withdraw.put("deal_time", timeUtil.now2l());
      return v2KfOrderModule.bill_update(withdraw);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return result;
  }

  @RequestMapping(value = "mulity_kf_transfer_bill_withdraw_ok.do")
  @ResponseBody
  public boolean mulity_kf_transfer_bill_withdraw_ok(String key_checked, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    boolean result = false;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      result = false;
    } else if (StringUtils.isBlank(key_checked)) result = false;
    else {
      String[] array = key_checked.split(",");
      boolean v = true;
      for (String recordid : array) {
        Map<String, Object> withdraw = new HashMap<>();
        withdraw.put("recordid", recordid);
        withdraw.put("status", V2WithDrawStatus.ytx);
        withdraw.put("deal_time", timeUtil.now2l());
        v &= v2KfOrderModule.bill_update(withdraw);
      }
      return v;
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return result;
  }

  @RequestMapping(value = "reject_kf_transfer_withdraw.do")
  @ResponseBody
  public boolean reject_kf_transfer_withdraw(String recordid, String rejectReason, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    boolean result = false;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      result = false;
    } else if (StringUtils.isBlank(recordid)) result = false;
    else {
      Map<String, Object> withdraw = new HashMap<>();
      withdraw.put("recordid", recordid);
      withdraw.put("status", V2WithDrawStatus.bbh);
      withdraw.put("reject_reason", rejectReason);
      withdraw.put("deal_time", timeUtil.now2l());
      return v2KfOrderModule.bill_update(withdraw);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return result;
  }

  // 转院已提现
  @RequestMapping(value = "/haveWithdrawalForTransfers")
  public ModelAndView haveWithdrawalForTransfers(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawForRecureOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    view.setViewName("haveWithdrawalForTransfers");

    // 获取数据
    BillSearchQuery query = new BillSearchQuery();
    query.setStatus(V2WithDrawStatus.ytx);
    Map<String, Integer> sort = new HashMap<>();
    sort.put("deal_time", -1);
    List<Map<String, Object>> dataList = null ; //v2KfOrderModule.get_withdraw_list(query);
    if (dataList == null || dataList.isEmpty()) {
      view.addObject("noRecord", true);
    }
    view.addObject("data", buildDataList(dataList));
    view.addObject("pageparam", param);

    return view;
  }

  // 转院已驳回
  @RequestMapping(value = "/rejectForTransfers")
  public ModelAndView rejectForTransfers(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawForRecureOrder");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    view.setViewName("rejectForTransfers");
    // 获取数据
    BillSearchQuery query = new BillSearchQuery();
    query.setStatus(V2WithDrawStatus.bbh);
    Map<String, Integer> sort = new HashMap<>();
    sort.put("deal_time", -1);
    List<Map<String, Object>> dataList = v2KfOrderModule.get_withdraw_list(query);
    if (dataList == null || dataList.isEmpty()) {
      view.addObject("noRecord", true);
    }
    view.addObject("data", buildDataList(dataList));
    view.addObject("pageparam", param);

    return view;
  }

  @RequestMapping(value = "get_reject_kf_transfer_bill_reason.do", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String get_reject_kf_transfer_bill_reason(String recordid, HttpServletRequest request,
      HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    int status = Status.STATUS_OK;
    Map<String, Object> detail = v2KfOrderModule.get_withdraw_detail(recordid);
    if (detail == null) status = Status.STATUS_ERROR;

    result.put(TableFieldName.status, status);
    result.put("data", detail.get("reject_reason"));
    return Help.bean2Json(result);
  }

  // 转院订单结束
  @RequestMapping(value = "/withdrawReject")
  public ModelAndView withdrawReject(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
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
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "withdrawCash");
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

  private List<Map<String, Object>> buildDataList(List<Map<String, Object>> dataList) {

    if (dataList == null) return null;

    for (Map<String, Object> record : dataList) {
      String doctor_id = record.get("doctor_id").toString();
      Doctor doctor = basicEntityModule.findDoctorById(doctor_id);
      String doctor_name = "";
      String doctor_hospital = "";
      String doctor_department = "";

      if (doctor == null) {
        doctor_name = "医生已删除";
        doctor_hospital = "医生已删除";
        doctor_department = "医生已删除";
      } else {
        doctor_name = doctor.getName();
        doctor_hospital = doctor.getReferHospital();
        doctor_department = doctor.getReferDepartments();
      }

      record.put("doctor_name", doctor_name);
      record.put("doctor_hospital", doctor_hospital);
      record.put("doctor_department", doctor_department);
      record.put("submit_time", timeUtil.l2s((long) record.get("submit_time")));

      long deal_time = ((Number) record.get("deal_time")).longValue();
      if (deal_time > 0) record.put("deal_time", timeUtil.l2s(deal_time));
      String account_type = record.get("account_type").toString();
      if (MedexConfigure.card_type_zfb.equals(account_type)) {
        record.put("account_type", "支付宝");
        record.put("open_bank", "无");
      } else if (MedexConfigure.card_type_yhk.equals(account_type)) {
        record.put("account_type", "银行卡");
      } else {
        record.put("account_type", "卡类型有错");
        record.put("open_bank", "无");
      }
    }
    return dataList;
  }

}
