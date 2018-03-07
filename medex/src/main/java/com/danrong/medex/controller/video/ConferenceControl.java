package com.danrong.medex.controller.video;

import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.rpc.ServiceException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danrong.medex.bean.video.ConferenceControlRequest;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.video.MeetingModule;
import com.danrong.medex.module.video.MeetingModuleImpl;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;

@Controller
public class ConferenceControl {

  @Value("#{properties['vmedex.web.host']}")
  public String mainUrl;

  private final MedexToken medexToken = new MedexToken();
  private final MeetingModule meetingModule = new MeetingModuleImpl();

  @RequestMapping(value = "/conferenceDeleteAction")
  @ResponseBody
  public String conferenceDeleteAction(@ModelAttribute ConferenceControlRequest conferenceControlRequest,
      HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      result.put(TableFieldName.status, Status.STATUS_ERROR);
    } else {
      try {
        String returnXML = meetingModule.conferenceControl(conferenceControlRequest);
        meetingModule.deleteConferenceRecord(conferenceControlRequest.getMeetingId());
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", returnXML);
      } catch (RemoteException | MalformedURLException | ServiceException e) {
        result.put(TableFieldName.status, Status.STATUS_ERROR);
      }
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/deleteConferenceRecord")
  @ResponseBody
  public int deleteConferenceRecord(HttpServletRequest request) {
    return meetingModule.deleteConferenceRecord(request.getParameter(TableFieldName.meeting_id));
  }
}
