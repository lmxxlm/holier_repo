package com.danrong.medex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.danrong.medex.bean.DevUserMap;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.DevUserMapResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.DevUserMapModule;
import com.danrong.medex.module.DevUserMapModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class DevUserMapController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final MedexToken medexToken = new MedexToken();
  private final DevUserMapModule devUserMapModule = new DevUserMapModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final CommView commView = new CommView();

  @RequestMapping(value = "/devUserMap")
  public ModelAndView devUserMap(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);

    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    // 获取绑定记录
    DevUserMapResultObject dumo = devUserMapModule.list(param, null);
    if (dumo == null || dumo.getMaps().isEmpty()) view.addObject("noRecord", true);
    view.addObject("dumo", dumo);

    view.addObject("menuIndex", "devUserMap");
    view.setViewName("devUserMap");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/addDevUserMap.do")
  @ResponseBody
  public int addDevUserMap(@ModelAttribute DevUserMap devUserMapRequest, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      Date now = new Date();
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
      String nowTime = dateFormat.format(now);
      devUserMapRequest.setTime(nowTime);
      return devUserMapModule.addMap(devUserMapRequest);
    }
  }

  @RequestMapping(value = "/deleteMap.do")
  @ResponseBody
  public boolean deleteMap(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return false;
    else {
      String id = request.getParameter("id");
      return devUserMapModule.deleteMapById(id);
    }
  }

  @RequestMapping(value = "/updateDevUserMap.do")
  @ResponseBody
  public boolean updateDevUserMap(@ModelAttribute DevUserMap devUserMapRequest, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return false;
    else {
      Date now = new Date();
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
      String nowTime = dateFormat.format(now);
      devUserMapRequest.setTime(nowTime);

      return devUserMapModule.updateMap(devUserMapRequest.getDeviceId(), devUserMapRequest);
    }
  }

  @RequestMapping(value = "/findMapById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String findMapById(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String id = request.getParameter(TableFieldName.id);
    if (StringUtils.isBlank(id)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      DevUserMap dum = devUserMapModule.findMapById(id);
      if (dum != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", dum);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }
}
