package com.danrong.medex.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.module.SendMessageCallBackImpl;
import com.danrong.medex.module.SendMessageImpl;
import com.danrong.medex.module.v2.medical.image.V2MedicalImageModule;
import com.danrong.medex.module.v2.medical.image.V2MedicalImageModuleImpl;
import com.danrong.medex.module.v2.message.V2MessageMap;
import com.danrong.medex.module.v2.message.V2MessageModule;
import com.danrong.medex.module.v2.message.V2MessageModuleImpl;
import com.danrong.medex.module.v2.message.V2MessageType;
import com.danrong.medex.module.v2.order.V2OrderModule;
import com.danrong.medex.module.v2.order.V2OrderModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.MessageUtil;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.danrong.medex.util.v2.OrderSearchQuery;
import com.danrong.medex.util.v2.V2OrderStatus;
import com.danrong.medex.util.v2.V2PhoneMessageTemplate;
import com.danrong.medex.util.v2.V2TableFieldName;

@Controller
public class CaseCheckController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final CommView commView = new CommView();
  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final V2OrderModule v2OrderModule = new V2OrderModuleImpl();
  private final V2MedicalImageModule v2MedicalImageModule = new V2MedicalImageModuleImpl();
  private final V2MessageModule v2MessageModule = new V2MessageModuleImpl();

  /**
   * 订单记录展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "caseCheck")
  public ModelAndView caseCheck(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject("menuIndex", "caseCheck");
    view.setViewName("caseCheck");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    commView.comm(view, request);

    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);

    // 获取订单列表页数据(状态为已上传病历的订单)
    OrderSearchQuery query = new OrderSearchQuery();
    query.setCp(param.getCp());
    query.setPs(param.getPs());
    query.setStatus(V2OrderStatus.uploadImage);

    List<Map<String, Object>> orderlist = v2OrderModule.getOrderList(query);
    view.addObject("orderlist", orderlist);
    view.addObject("page", param);

    return view;
  }

  /**
   * 病历审核详情页
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "checkCase")
  public ModelAndView checkCase(HttpServletRequest request, HttpServletResponse response, String order_id) {
    ModelAndView view = new ModelAndView();
    view.addObject("menuIndex", "caseCheck");
    view.setViewName("checkCase");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    if (StringUtils.isNotBlank(order_id)) {
      // 获取订单详情
      Map<String, Object> orderDetail = v2OrderModule.getOrderDetail(order_id);
      view.addObject("orderDetail", orderDetail);
      // 获取订单对应的病历图片数据
      List<Map<String, Object>> imageList = v2MedicalImageModule.getImagesByOrderId(order_id);
      if (imageList == null || imageList.isEmpty()) view.addObject("nolist", true);
      else {
        view.addObject("imageList", imageList);
      }
    }
    return view;
  }

  /**
   * 图片审核
   * 
   * @param record
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "checkPass.do")
  @ResponseBody
  public boolean checkPass(String order_id, boolean check_status, String reason, HttpServletRequest request,
      HttpServletResponse response) {
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    boolean result = false;

    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      result = false;
    } else {
      Map<String, Object> order = new HashMap<>();
      order.put(V2TableFieldName.order_id, order_id);
      if (check_status) order.put(V2TableFieldName.status, V2OrderStatus.pass);
      else {
        order.put(V2TableFieldName.check_unpass_reason, reason);
        order.put(V2TableFieldName.status, V2OrderStatus.unpass);
      }
      result = v2OrderModule.update(order);
      if (result) {
        // 审核通过给医生发消息
        Map<String, Object> orderDetail = v2OrderModule.getOrderDetail(order_id);

        String lower_doctor_id = (String) orderDetail.get(V2TableFieldName.lower_doctor_id);

        if (check_status) {
          String message_to_lower_doctor = "订单" + order_id + "的病历图片审核已通过。";
          v2MessageModule.addMessage(new V2MessageMap(lower_doctor_id, MedexConfigure.destDoctor,
              message_to_lower_doctor, V2MessageType.order));
        } else {
          // 审核不通过给医生发消息
          String message_to_lower_doctor = "订单" + order_id + "的病历图片审核未通过。原因为：" + reason;
          v2MessageModule.addMessage(new V2MessageMap(lower_doctor_id, MedexConfigure.destDoctor,
              message_to_lower_doctor, V2MessageType.order));
          // 不通过给医生发短信
          String phone_message = V2PhoneMessageTemplate.template.get("v2_07");

          List<String> values = new ArrayList<>();
          String patient_name = (String) orderDetail.get(V2TableFieldName.patient_name);
          String sp_title = (String) orderDetail.get(V2TableFieldName.sp_title);

          values.add(patient_name);
          values.add(sp_title);
          values.add(order_id);
          values.add(reason);

          phone_message = MessageUtil.replace(phone_message, values);
          new Thread(new SendMessageImpl(lower_doctor_id, phone_message, new SendMessageCallBackImpl())).start();

        }
      }
    }
    // 重置session
    sessionParser.setSession(request, SessionField.token, token);
    return result;
  }
}
