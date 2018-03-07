package com.danrong.medex.controller;

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

import com.danrong.medex.bean.Medication;
import com.danrong.medex.bean.MedicationRecord;
import com.danrong.medex.bean.Prescription;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.PreScriptionResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.PrescriptionModule;
import com.danrong.medex.module.PrescriptionModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.TimeUtil;

@Controller
public class PrescriptionController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final PrescriptionModule prescriptionModule = new PrescriptionModuleImpl();
  private final SessionParser sessionParser = new SessionParser();
  private final TimeUtil timeUtil = new TimeUtil();
  private final CommView commView = new CommView();

  /**
   * 处方展示页面
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "/patient/medicineRecord")
  public ModelAndView patient_checkRecord(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.addObject("menuIndex", "medicineRecord");
    view.setViewName("patient/medicineRecord");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());

    // 当前登录账号姓名
    String currentUserName = sessionParser.getCurrentUserName(request.getSession());
    view.addObject(SessionField.currentUserName, currentUserName);
    // 当前被查询的患者id
    String patientId = request.getParameter(TableFieldName.patientId);
    view.addObject(TableFieldName.patientId, patientId);
    // 病历记录列表
    param.setPs(10);
    PreScriptionResultObject psro = prescriptionModule.list(patientId, param);
    view.addObject("psro", psro);
    // 第一个记录
    List<Prescription> list = psro.getPrescriptions();
    if (!list.isEmpty()) {
      Prescription firstPrescription = list.get(0);
      view.addObject("firstPrescription", firstPrescription);
      // 最后一条的时间戳
      view.addObject("lastTime", list.get(list.size() - 1).getTime());
    }
    // 是否还有记录
    param.setCp(param.getCp() + 1);
    PreScriptionResultObject more = prescriptionModule.list(patientId, param);
    if (more != null && !(more.getPrescriptions().isEmpty())) {
      view.addObject("hasMore", true);
    }
    // 生成token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    commView.comm(view, request);
    return view;
  }

  /**
   * 根据id查找处方记录
   * 
   * @param request
   * @param response
   * @return
   */
  @RequestMapping(value = "patient/findmedicineRecordById.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String findmedicineRecordById(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    // 根据id获取记录
    String prescriptionId = request.getParameter(TableFieldName.prescriptionId);
    if (StringUtils.isBlank(prescriptionId)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      Prescription record = prescriptionModule.findPrescriptionById(prescriptionId);
      if (record != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", record);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "patient/getMedicineItem.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String getMedicineItem(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    // 根据病人id，处方时间，药名获取对应的用药计划和记录
    String patientId = request.getParameter(TableFieldName.patientId);
    String drugName = request.getParameter("medicine_name");
    String time = request.getParameter(TableFieldName.time);
    if (StringUtils.isBlank(patientId) || StringUtils.isBlank(drugName) || StringUtils.isBlank(time)) result.put(
        TableFieldName.status, Status.STATUS_ERROR);
    else {
      long tl = 0;
      try {
        tl = Long.parseLong(time);
      } catch (Exception e) {
        result.put(TableFieldName.status, Status.STATUS_ERROR);
      }
      Medication medication = prescriptionModule.getMedicineItem(patientId, tl, drugName);
      if (medication != null) {
        result.put(TableFieldName.status, Status.STATUS_OK);
        result.put("data", medication);
      } else result.put(TableFieldName.status, Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "patient/updateMedicineStatus.do")
  @ResponseBody
  public String updateMedicineStatus(HttpServletRequest request, HttpServletResponse response) {
    Map<String, Object> result = new HashMap<>();
    // 根据病人id，处方时间，药名更新服药状态
    String patientId = request.getParameter(TableFieldName.patientId);
    String drugName = request.getParameter("medicine_name");
    String time = request.getParameter(TableFieldName.time);
    String finished = request.getParameter("status");
    String medicine_date = request.getParameter("medicine_date");
    if (StringUtils.isBlank(patientId) || StringUtils.isBlank(drugName) || StringUtils.isBlank(time)
        || StringUtils.isBlank(medicine_date)) result.put(TableFieldName.status, Status.STATUS_ERROR);
    else {
      long tl = 0;
      long tt = 0;
      try {
        tl = Long.parseLong(time);
        tt = timeUtil.s2l2(medicine_date);
      } catch (Exception e) {
        result.put(TableFieldName.status, Status.STATUS_ERROR);
      }
      MedicationRecord mr = prescriptionModule.updateMedicineStatus(patientId, tl, drugName, tt,
          finished.equals("0") ? true : false);
      result.put("data", mr);
      result.put("status", Status.STATUS_OK);
    }
    return Help.bean2Json(result);
  }
}
