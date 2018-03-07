package com.danrong.medex.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.PatientResultObject;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.DoctorModule;
import com.danrong.medex.module.DoctorModuleImpl;
import com.danrong.medex.module.PatientModule;
import com.danrong.medex.module.PatientModuleImpl;
import com.danrong.medex.module.TransferModule;
import com.danrong.medex.module.TransferModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.CommView;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;

@Controller
public class SearchController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;
  private final SessionParser sessionParser = new SessionParser();
  private final MedexToken medexToken = new MedexToken();
  private final DoctorModule doctorModule = new DoctorModuleImpl();
  private final PatientModule patientModule = new PatientModuleImpl();
  private final TransferModule transferModule = new TransferModuleImpl();
  private final CommView commView = new CommView();

  @RequestMapping(method = RequestMethod.GET, value = "/searchAccount")
  public ModelAndView simpleSearch_get(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("chooseAccountDoc");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    commView.comm(view, request);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/searchAccount")
  public ModelAndView simpleSearch(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    String actionType = request.getParameter("actionType");
    if(actionType.equals("doc")){
    	view.addObject("menuIndex", "chooseAccountDoc");
	}else {
		view.addObject("menuIndex", "chooseAccountPat");
	}
  if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
    	if(actionType.equals("doc")){
    		view.setViewName("chooseAccountDoc");
            response.sendRedirect(mainUrl + "chooseAccountDoc.html");
    	}else {
    		view.setViewName("chooseAccountPat");
            response.sendRedirect(mainUrl + "chooseAccountPat.html");
    	}
      } catch (IOException e) {
        view.setViewName("access");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    String searchType = request.getParameter("searchType");
    String searchText = request.getParameter("searchText");
    if (StringUtils.isBlank(searchText) || StringUtils.isBlank(searchType)) {
      view.setViewName("chooseAccountDoc");
      view.addObject("dro", null);
      return view;
    } else {
      param.setPs(100);
      searchType = searchType.trim();
      switch (searchType) {
      case MedexConfigure.docId:
        view.setViewName("chooseAccountDoc");
        view.addObject("dro", doctorModule.likeWithDoctorId(param, searchText));
        break;
      case MedexConfigure.docName:
        view.setViewName("chooseAccountDoc");
        view.addObject("dro", doctorModule.likeWithDoctorName(param, searchText));
        break;

      case MedexConfigure.patId:
        view.setViewName("chooseAccountPat");
        view.addObject("pro", patientModule.likeWithPatientId(param, searchText));
        break;

      case MedexConfigure.patName:
        view.setViewName("chooseAccountPat");
        view.addObject("pro", patientModule.likeWithPatientName(param, searchText));
        break;
      default:
        view.setViewName("chooseAccountDoc");
        view.addObject("dro", null);
        break;
      }
    }
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("searchParam", param);
    view.addObject("searchType", searchType);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/searchAccountForTreatmentListByName")
  public ModelAndView searchAccountForTreatmentListByName(@ModelAttribute SearchParams param,
      HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
        view.setViewName("transferTreatmentList");
        response.sendRedirect(mainUrl + "transferTreatmentList.html");
      } catch (IOException e) {
        view.setViewName("access");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    String searchType = request.getParameter("searchType");
    String searchText = request.getParameter("searchText");
    if (StringUtils.isBlank(searchText) || StringUtils.isBlank(searchType)) {
      view.setViewName("transferTreatmentList");
      view.addObject("dro", null);
      return view;
    } else {
      param.setPs(100);
      searchType = searchType.trim();
      switch (searchType) {
      case MedexConfigure.docId:
        view.setViewName("transferTreatmentList");
        view.addObject("dro", doctorModule.likeWithDoctorId(param, searchText));
        break;
      case MedexConfigure.docName:
        view.setViewName("transferTreatmentList");
        view.addObject("dro", doctorModule.likeWithDoctorName(param, searchText));
        break;
      default:
        view.setViewName("transferTreatmentList");
        view.addObject("dro", null);
        break;
      }
    }
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("searchParam", param);
    view.addObject("searchType", searchType);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/searchAccountForTreatmentList.do")
  public ModelAndView searchAccountForTreatmentList(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
        view.setViewName("transferTreatmentList");
        response.sendRedirect(mainUrl + "transferTreatmentList");
      } catch (IOException e) {
        view.setViewName("access");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    String referHospital = request.getParameter("referHospital");
    String referDepartments = request.getParameter("referDepartments");
    // 生成数据
    param.setPs(100);
    view.addObject("dro", doctorModule.searchWithHospitalAndDepartment(param, referHospital, referDepartments));

    view.setViewName("transferTreatmentList");
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("searchParam", param);
    view.addObject("referHospital", referHospital);
    view.addObject("referDepartments", referDepartments);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/searchTransferRecord.do")
  public ModelAndView searchTransferRecord(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
        view.setViewName("transferTreatmentMessage");
        response.sendRedirect(mainUrl + "transferTreatmentMessage");
      } catch (IOException e) {
        view.setViewName("access");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    String requester_id = request.getParameter("requester_id");
    String doctor_id = request.getParameter("doctor_id");
    String patient_id = request.getParameter("patient_id");
    String status = request.getParameter("status");
    // 生成数据
    param.setPs(100);
    view.addObject("trro", transferModule.search(param, requester_id, doctor_id, patient_id, status));

    view.setViewName("transferTreatmentMessage");
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject("searchParam", param);
    // 渲染页面用
    view.addObject("requester_id", requester_id);
    view.addObject("doctor_id", doctor_id);
    view.addObject("patient_id", patient_id);
    view.addObject("status", status);
    // 暂时搜索结果页不分页
    view.addObject("nopage", true);
    return view;
  }

  // searchPatResult
  @RequestMapping(method = RequestMethod.POST, value = "/doctor/searchPatResult")
  public ModelAndView searchPatResult(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    commView.comm(view, request);
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    // medex每个post请求都需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      try {
        view.setViewName("index");
        response.sendRedirect(mainUrl + "index.html");
      } catch (IOException e) {
        view.setViewName("index");
        view.addObject(JSTLField.mainUrl, mainUrl.trim());
      }
      return view;
    }
    // 获取请求参数
    String doctorId = request.getParameter("docId");
    view.addObject(TableFieldName.doctorId, doctorId);
    String patientName = request.getParameter("searchPat");
    // 获取doctorId下的患者id
    String[] patientIds = doctorModule.getPatientIdsFromDoctor(doctorId);
    if (patientIds == null || patientIds.length == 0) {
      view.addObject("hit", false);
      view.addObject("pro", null);
    } else {
      // 获取搜索结果
      PatientResultObject pro = patientModule.likeWithPatientName(param, patientName, patientIds, "$in");
      // 设置渲染参数
      view.addObject("hit", (pro == null || pro.getPatients() == null || pro.getPatients().isEmpty()) ? false : true);
      view.addObject("pro", pro);
    }
    view.addObject("loginer", sessionParser.getCurrentUserName(request.getSession()));
    view.addObject("page", false);
    view.setViewName("doctor/pat_list");
    // 重置token
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    view.addObject(SessionField.token, token);
    sessionParser.setSession(request, SessionField.token, token);
    return view;
  }
}
