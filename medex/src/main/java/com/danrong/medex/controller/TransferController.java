package com.danrong.medex.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.TransRequestRecordsObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.TransferModule;
import com.danrong.medex.module.TransferModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class TransferController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final MedexToken medexToken = new MedexToken();
  private final SessionParser sessionParser = new SessionParser();
  private final TransferModule transModule = new TransferModuleImpl();
  private final CommView commView = new CommView();

  /**
   * 转诊申请展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/transferTreatmentMessage")
  public ModelAndView transferTreatmentMessage(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("transferTreatmentMessage");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 获取列表数据
    TransRequestRecordsObject trro = transModule.search(param, null);
    view.addObject("trro", trro);
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * 根据转诊申请记录id获取记录详情
   * 
   * @param param
   * @param request
   * @return
   */
  @RequestMapping(method = RequestMethod.POST, value = "/findTransferRecordById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String findTransferRecordById(@ModelAttribute SearchParams param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String transferRecordId = request.getParameter("transferRecordId");

    result.put(TableFieldName.status, Status.STATUS_OK);
    result.put("data", transModule.findRecordById(transferRecordId));
    return Help.bean2Json(result);
  }

  /**
   * web端转诊申请修改接口
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "editTransferRecordById.do")
  @ResponseBody
  public int patient_check_record_edit(HttpServletRequest request, HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    int status = Status.STATUS_OK;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = MedexToken.code_mismatch;
    } else {
      String transferId = request.getParameter(TableFieldName.transferRequestId);
      String transferStatus = request.getParameter(TableFieldName.status);
      String reason = request.getParameter(TableFieldName.remark);
      status = transModule.confirm(transferId, transferStatus, reason);
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return status;
  }
}
