package com.danrong.medex.controller.video;

import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.rpc.ServiceException;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.video.JoinConferenceRequest;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.video.MeetingModule;
import com.danrong.medex.module.video.MeetingModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.danrong.medex.util.video.VedioHelp;

@Controller
public class JoinConference {

  @Value("#{properties['vmedex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final MeetingModule meetingModule = new MeetingModuleImpl();

  @RequestMapping(value = "/passport")
  public ModelAndView passport(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "joinConference");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("passport");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/joinConferenceAction")
  @ResponseBody
  public String joinConferenceAction(@ModelAttribute JoinConferenceRequest joinConferenceRequest,
      HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) result.put(TableFieldName.status,
        Status.STATUS_ERROR);
    else {
      try {
        String option = joinConferenceRequest.getOption();
        if (StringUtils.isNotBlank(option)) {
          option = VedioHelp.cleanOption2(option);
          joinConferenceRequest.setOption(option);
        }

        String returnXML = meetingModule.joinConference(joinConferenceRequest);
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", returnXML);
      } catch (RemoteException | MalformedURLException | ServiceException e) {
        result.put(TableFieldName.status, Status.STATUS_ERROR);
      }
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/blank")
  public ModelAndView blank(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("blank");
    return view;
  }

  @RequestMapping(value = "/passportFrame")
  public ModelAndView passportFrame(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("passportFrame");
    return view;
  }
}
