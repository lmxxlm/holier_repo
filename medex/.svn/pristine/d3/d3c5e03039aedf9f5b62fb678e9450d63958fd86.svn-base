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

import com.danrong.medex.bean.video.ConferenceRecord;
import com.danrong.medex.bean.video.GetMeetingInfoRequest;
import com.danrong.medex.bean.video.GetSiteConferencegListRequest;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.video.MeetingModule;
import com.danrong.medex.module.video.MeetingModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class GetSiteConferencegList {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;

  private final SessionParser sessionParser = new SessionParser();
  private final MeetingModule meetingModule = new MeetingModuleImpl();
  private final CommView commView = new CommView();

  @RequestMapping(value = "/siteListView")
  public ModelAndView siteListView(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("menuIndex", "getSiteConferencegList");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("siteListView");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    String videoUrl = mainUrl.trim().replaceAll("ma", "video");
    view.addObject("videoUrl", videoUrl);
    return view;
  }

  @RequestMapping(value = "/siteDetail")
  public ModelAndView siteDetail(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    String _id = request.getParameter(TableFieldName.meeting_id);
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject("meeting_id", _id);
    view.addObject("menuIndex", "getSiteConferencegList");
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.setViewName("siteDetail");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/getSiteConferencegListAction")
  @ResponseBody
  public String getSiteConferencegListAction(
      @ModelAttribute GetSiteConferencegListRequest getSiteConferencegListRequest, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    try {
      String returnXML = meetingModule.getSiteConferencegList(getSiteConferencegListRequest);
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", returnXML);
    } catch (RemoteException | MalformedURLException | ServiceException e) {
      result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/bindMeetingAction.do")
  @ResponseBody
  public boolean bindMeetingAction(@ModelAttribute ConferenceRecord conferenceRecordRequest, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    // if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    // else return orderModule.deleteOrderById(request.getParameter(TableFieldName.id));
    return meetingModule.createConferenceRecord(conferenceRecordRequest);

  }

  @RequestMapping(value = "/findMeetingById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String findMeetingById(HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String _id = request.getParameter(TableFieldName.meeting_id);
    if (StringUtils.isBlank(_id)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      ConferenceRecord conferenceRecord = meetingModule.findMeetingById(_id);
      if (conferenceRecord != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", conferenceRecord);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/getMeetingInfo", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getMeetingInfo(@ModelAttribute GetMeetingInfoRequest getMeetingInfoRequest, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    try {
      String returnXML = meetingModule.getMeetingInfo(getMeetingInfoRequest);
      result.put(TableFieldName.status, Status.STATUS_OK);
      result.put("data", returnXML);
    } catch (RemoteException | MalformedURLException | ServiceException e) {
      result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }
}
