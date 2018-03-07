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

import com.danrong.medex.bean.video.CreateConferenceRequest;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.video.MeetingModule;
import com.danrong.medex.module.video.MeetingModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.danrong.medex.util.video.VedioHelp;

@Controller
public class CreateConference {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final MeetingModule meetingModule = new MeetingModuleImpl();
  private final CommView commView = new CommView();

  @RequestMapping(value = "/createConferenceView")
  public ModelAndView createConferenceView(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "createConference");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("createConferenceView");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 创建会议
    return view;
  }

  @RequestMapping(value = "/bindMeetingView")
  public ModelAndView bindMeetingView(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "createConference");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("bindMeetingView");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // 创建会议
    return view;
  }

  @RequestMapping(value = "/createConferenceAction")
  @ResponseBody
  public String createConferenceAction(@ModelAttribute CreateConferenceRequest conferenceRequest,
      HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) result.put(TableFieldName.status,
        Status.STATUS_ERROR);
    else {
      try {
        String option = conferenceRequest.getOption();
        if (StringUtils.isNotBlank(option)) {
          option = VedioHelp.cleanOption2(option);
          conferenceRequest.setOption(option);
        }

        String returnXML = meetingModule.createConference(conferenceRequest);
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", returnXML);
      } catch (RemoteException | MalformedURLException | ServiceException e) {
        result.put(TableFieldName.status, Status.STATUS_ERROR);
      }

    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/valid_conf_time.do")
  @ResponseBody
  public boolean valid_conf_time(HttpServletRequest request) {
    String type = request.getParameter(TableFieldName.type);
    String ma_id = request.getParameter(TableFieldName.ma_id);
    String pat_id = request.getParameter(TableFieldName.patient_id);
    String doc_id = request.getParameter(TableFieldName.doctor_id);
    String meetingStartTime = request.getParameter("meetingStartTime");
    String meetingEndTime = request.getParameter("meetingEndTime");
    boolean returnVal = false;
    if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(meetingStartTime)
        && StringUtils.isNotBlank(meetingEndTime)) {
      // System.out.println(meetingStartTime+"|||");
      long start_time = Long.parseLong(meetingStartTime);
      // System.out.println(start_time);
      long end_time = Long.parseLong(meetingEndTime);
      if ("ma".equals(type)) {
        if (StringUtils.isNotBlank(ma_id)) {
          returnVal = meetingModule.valid_ma_conf_time(ma_id, start_time, end_time);
        }
      }
      if ("doctor".equals(type) || "community".equals(type)) {
        if (StringUtils.isNotBlank(ma_id) && StringUtils.isNotBlank(doc_id) && StringUtils.isNotBlank(pat_id)) {
          returnVal = meetingModule.valid_doc_conf_time(doc_id, start_time, end_time)
              && meetingModule.valid_pat_conf_time(pat_id, start_time, end_time)
              && meetingModule.valid_ma_conf_time(ma_id, start_time, end_time);
        }
      }
    }
    return returnVal;
  }
}
