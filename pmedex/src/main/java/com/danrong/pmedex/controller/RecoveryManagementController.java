package com.danrong.pmedex.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.DRPic;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.v2.kfhospital.V2KfBedroomModule;
import com.danrong.medex.module.v2.kfhospital.V2KfBedroomModuleImpl;
import com.danrong.medex.module.v2.kfhospital.V2KfHospitalModule;
import com.danrong.medex.module.v2.kfhospital.V2KfHospitalModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.danrong.medex.util.v2.BedRoomSearchQuery;
import com.danrong.medex.util.v2.DataMap;
import com.danrong.medex.util.v2.HospitalSearchQuery;
import com.danrong.medex.util.v2.map.Coordinate;
import com.danrong.medex.util.v2.map.Location;
import com.dr.core.util.TimeUtil;

@Controller
public class RecoveryManagementController {

  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;
  @Value("#{properties['pmedex.images.url']}")
  public String imagesUrl;

  private final MedexToken medexToken = new MedexToken();
  private final TimeUtil timeUtil = new TimeUtil();
  private final SessionParser sessionParser = new SessionParser();
  private final V2KfHospitalModule v2KfHospitalModule = new V2KfHospitalModuleImpl();
  private final V2KfBedroomModule v2KfBedroomModule = new V2KfBedroomModuleImpl();

  @RequestMapping(value = "/kfHospital")
  public ModelAndView hosInfo(@ModelAttribute HospitalSearchQuery param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "kfHospital");
    view.setViewName("kfHospital");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject(JSTLField.imagesUrl, imagesUrl.trim());
    // 获取医院列表数据
    List<Map<String, Object>> data = null ; // v2KfHospitalModule.getKfHospitals(param);
    if (data == null || data.isEmpty()) view.addObject("noRecord", true);
    view.addObject("data", data);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/addKfHospital")
  @ResponseBody
  public int addKfHospital(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      DataMap dataMap = new DataMap(request);
      // 获取经纬度
      Location lo = Coordinate.addrResolve("", request.getParameter("address"));
      if (StringUtils.isBlank(lo.city) || StringUtils.isBlank(lo.district) || StringUtils.isBlank(lo.province)) return 2;
      Double[] location = new Double[] { lo.lng, lo.lat };
      dataMap.put("location", location);
      dataMap.put("province", lo.province);
      dataMap.put("city", lo.city);
      dataMap.put("district", lo.district);
      dataMap.put("street", lo.street);
      String[] departments = ((String) dataMap.get("departments")).split(",");
      List<String> dl = new ArrayList<>(departments.length);
      for (String str : departments) {
        dl.add(str);
      }
      dataMap.put("departments", dl);
      dataMap.put("auth", false);
      dataMap.put("create_time", timeUtil.now2l());
      dataMap.put("pictures", Help.json2beanArray((String) dataMap.get("pictures"), DRPic.class));
      dataMap.put("image", Help.json2bean((String) dataMap.get("image"), DRPic.class));
      dataMap.remove(SessionField.token);
      dataMap.remove("hospital_id");
      boolean v = v2KfHospitalModule.addKfHospital(dataMap);
      return v ? 1 : 0;
    }
  }

  @RequestMapping(value = "/editKfHospital")
  @ResponseBody
  public int editKfHospital(String hospital_id, HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      DataMap dataMap = new DataMap(request);
      // 获取经纬度
      Location lo = Coordinate.addrResolve("", request.getParameter("address"));
      if (StringUtils.isBlank(lo.city) || StringUtils.isBlank(lo.district) || StringUtils.isBlank(lo.province)) return 2;
      Double[] location = new Double[] { lo.lng, lo.lat };
      dataMap.put("location", location);
      dataMap.put("province", lo.province);
      dataMap.put("city", lo.city);
      dataMap.put("district", lo.district);
      dataMap.put("street", lo.street);
      String[] departments = ((String) dataMap.get("departments")).split(",");
      List<String> dl = new ArrayList<>(departments.length);
      for (String str : departments) {
        dl.add(str);
      }
      dataMap.put("departments", dl);
      dataMap.put("auth", false);
      dataMap.put("create_time", timeUtil.now2l());
      dataMap.put("pictures", Help.json2beanArray((String) dataMap.get("pictures"), DRPic.class));
      dataMap.put("image", Help.json2bean((String) dataMap.get("image"), DRPic.class));
      dataMap.remove(SessionField.token);
      dataMap.put("record_id", hospital_id);
      dataMap.remove("hospital_id");
      boolean v = v2KfHospitalModule.editKfHospital(dataMap);
      return v ? 1 : 0;
    }
  }

  @RequestMapping(value = "/deleteKfHospital")
  @ResponseBody
  public int deleteKfHospital(HttpServletRequest request, String hospital_id) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      boolean v = v2KfHospitalModule.deleteKfHospital(hospital_id);
      return v ? 1 : 0;
    }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/getKfHosInfoById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getKfHosInfoById(String hospital_id, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();

    result.put(TableFieldName.status, Status.STATUS_OK);
    Map<String, Object> data = v2KfHospitalModule.findByHospitalId(hospital_id);
    result.put("data", data);
    return Help.bean2Json(result);
  }

  @RequestMapping(method = RequestMethod.GET, value = "/searchKfHospitalLimit10", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String searchKfHospitalLimit10(@ModelAttribute HospitalSearchQuery param, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    String name = request.getParameter("searchVar");
    param.setPs(MedexConfigure.searchPatLimit10);
    param.setName(name);

    result.put(TableFieldName.status, Status.STATUS_OK);
    List<Map<String, Object>> data = v2KfHospitalModule.getKfHospitals(param);
    result.put("data", data);
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/sickRoom")
  public ModelAndView sickRoom(@ModelAttribute BedRoomSearchQuery query, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
    sessionParser.setSession(request, SessionField.token, token);
    view.addObject(SessionField.token, token);
    view.addObject("menuIndex", "sickRoom");
    view.setViewName("sickRoom");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject(JSTLField.imagesUrl, imagesUrl.trim());
    // 获取病房列表数据
    List<Map<String, Object>> data = null ; // v2KfBedroomModule.getKfBedrooms(query);
    // 级联医院名称
    if (data != null && !data.isEmpty()) {
      for (Map<String, Object> subData : data) {
        String hospital_id = (String) subData.get("hospital_id");
        boolean exist = v2KfHospitalModule.exist(hospital_id);
        if (exist) {
          Map<String, Object> hospital = v2KfHospitalModule.findByHospitalId(hospital_id);
          if (hospital != null) subData.put("hospital_name", hospital.get("name"));
          else subData.put("hospital_name", "数据异常");
        } else {
          subData.put("hospital_name", "数据已删除");
        }
      }
    }
    if (data == null || data.isEmpty()) view.addObject("noRecord", true);
    view.addObject("data", data);
    view.addObject("searchParam", query);
    return view;
  }

  @RequestMapping(value = "/addSickRoom")
  @ResponseBody
  public int addSickRoom(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      DataMap dataMap = new DataMap(request);
      String[] tags = ((String) dataMap.get("tags")).split(",");
      List<String> tgl = new ArrayList<>(tags.length);
      for (String str : tags) {
        tgl.add(str);
      }
      dataMap.put("tags", tgl);
      dataMap.put("pictures", Help.json2beanArray((String) dataMap.get("pictures"), DRPic.class));
      dataMap.put("image", Help.json2bean((String) dataMap.get("image"), DRPic.class));
      dataMap.put("create_time", timeUtil.now2l());
      dataMap.remove(SessionField.token);
      dataMap.remove("record_id");
      boolean v = v2KfBedroomModule.addKfBedroom(dataMap);
      return v ? 1 : 0;
    }
  }

  @RequestMapping(value = "/editSickRoom")
  @ResponseBody
  public int editSickRoom(HttpServletRequest request) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      DataMap dataMap = new DataMap(request);
      String[] tags = ((String) dataMap.get("tags")).split(",");
      List<String> tgl = new ArrayList<>(tags.length);
      for (String str : tags) {
        tgl.add(str);
      }
      dataMap.put("tags", tgl);
      dataMap.put("pictures", Help.json2beanArray((String) dataMap.get("pictures"), DRPic.class));
      dataMap.put("image", Help.json2bean((String) dataMap.get("image"), DRPic.class));
      dataMap.put("create_time", timeUtil.now2l());
      dataMap.remove(SessionField.token);
      boolean v = v2KfBedroomModule.editKfBedroom(dataMap);
      return v ? 1 : 0;
    }
  }

  @RequestMapping(method = RequestMethod.GET, value = "/getSickRoomById", produces = { "application/json;charset=UTF-8" })
  @ResponseBody
  public String getSickRoomById(String bedroom_id, HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();

    result.put(TableFieldName.status, Status.STATUS_OK);
    Map<String, Object> data = v2KfBedroomModule.getKfBedroomDetail(bedroom_id);
    // 级联医院名称
    if (data != null && !data.isEmpty()) {
      String hospital_id = (String) data.get("hospital_id");
      boolean exist = v2KfHospitalModule.exist(hospital_id);
      if (exist) {
        Map<String, Object> hospital = v2KfHospitalModule.findByHospitalId(hospital_id);
        if (hospital != null) data.put("hospital_name", hospital.get("name"));
        else data.put("hospital_name", "数据异常");
      } else {
        data.put("hospital_name", "数据已删除");
      }
    }
    result.put("data", data);
    return Help.bean2Json(result);
  }

  @RequestMapping(value = "/deleteSickRoom")
  @ResponseBody
  public int deleteSickRoom(HttpServletRequest request, String bedroom_id) {
    // 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) return DbOption.DBOPTION_FAILER;
    else {
      boolean v = v2KfBedroomModule.deleteKfBedroom(bedroom_id);
      return v ? 1 : 0;
    }
  }
}
