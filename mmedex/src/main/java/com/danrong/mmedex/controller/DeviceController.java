package com.danrong.mmedex.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Device;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.DeviceResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.DeviceModule;
import com.danrong.medex.module.DeviceModuleImpl;

@Controller
public class DeviceController {

  @Value("#{properties['mmedex.web.main.url']}")
  public String mainUrl;

  private final DeviceModule deviceModule = new DeviceModuleImpl();

  @RequestMapping(value = "/tab/device")
  public ModelAndView getTabDevice(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/device");
    view.addObject("mainUrl", mainUrl.trim());

    // 获取device列表
    DeviceResultObject dro = deviceModule.list(param);
    view.addObject("dro", dro);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(value = "/tab/deviceEdit")
  public ModelAndView getTabDeviceEdit(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/deviceEdit");
    view.addObject("mainUrl", mainUrl.trim());
    // 获取device详情
    Device device = deviceModule.findDeviceById(request.getParameter(TableFieldName.deviceId));
    view.addObject("device", device);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/deviceEditForm")
  @ResponseBody
  public int doDeviceEdit(@ModelAttribute Device currentDevice, HttpServletRequest request) {
    String deviceId = currentDevice.getDeviceId();
    if (StringUtils.isBlank(deviceId)) return DbOption.DBOPTION_FAILER;
    else {
      return deviceModule.updateDevice(deviceId, currentDevice);
    }
  }

  @RequestMapping(value = "/tab/deviceDetail")
  public ModelAndView getTabDeviceDetail(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/deviceDetail");
    view.addObject("mainUrl", mainUrl.trim());

    // 获取device详情
    Device device = deviceModule.findDeviceById(request.getParameter(TableFieldName.deviceId));
    view.addObject("device", device);
    return view;
  }
}
