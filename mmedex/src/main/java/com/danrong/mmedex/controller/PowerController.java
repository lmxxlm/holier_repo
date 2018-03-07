package com.danrong.mmedex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.AccountPower;
import com.danrong.medex.bean.Power;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.module.PowerModule;
import com.danrong.medex.module.PowerModuleImpl;

@Controller
public class PowerController {

  @Value("#{properties['mmedex.web.main.url']}")
  public String mainUrl;

  PowerModule powerModule = new PowerModuleImpl();

  @RequestMapping(method = RequestMethod.POST, value = "/tab/doPowerDeleteAction")
  @ResponseBody
  public boolean powerSingleDelete(int power_id, HttpServletRequest request) {
    return powerModule.deletePowerByid(power_id);
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/powerEditForm")
  @ResponseBody
  public boolean doPowerEdit(HttpServletRequest request, int power_id, String power_name, String power_intro) {
    if (power_id < 0 || StringUtils.isBlank(power_name) || StringUtils.isBlank(power_intro)) return false;
    else return powerModule.updatePower(power_id, power_name, power_intro);
  }

  @RequestMapping(value = "/tab/powerEdit")
  public ModelAndView powerEdit(HttpServletRequest request, int power_id) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/powerEdit");
    view.addObject("mainUrl", mainUrl.trim());
    // 获取power详情
    Power power = powerModule.findPowerByid(power_id);
    view.addObject("power", power);
    return view;
  }

  @RequestMapping(value = "/tab/powerDetail")
  public ModelAndView powerDetail(HttpServletRequest request, int power_id) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/powerDetail");
    view.addObject("mainUrl", mainUrl.trim());

    // 获取power详情
    Power power = powerModule.findPowerByid(power_id);
    view.addObject("power", power);

    return view;
  }

  @RequestMapping(value = "/tab/power")
  public ModelAndView getTabPower(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/power");
    view.addObject("mainUrl", mainUrl.trim());

    // get power list
    List<Object> pl = powerModule.getPowerList();
    view.addObject("pl", pl);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/powerAddForm")
  @ResponseBody
  public boolean powerAddForm(HttpServletRequest request, String group_name, String power_name, String power_intro) {
    // params can not be empty
    if (StringUtils.isBlank(group_name) || StringUtils.isBlank(power_name) || StringUtils.isBlank(power_intro)) return false;
    // get current powerid
    int currentPowerId = powerModule.getCurrentPowerId();
    // add to db
    return powerModule.addPower(currentPowerId + 1, group_name, power_name, power_intro);
  }

  @RequestMapping(value = "/tab/powerAdd")
  public ModelAndView getTabPowerAdd(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/powerAdd");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/tab/accountPower")
  public ModelAndView accountPower(HttpServletRequest request, String accountId, String accountName, String type) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/accountPower");
    view.addObject("mainUrl", mainUrl.trim());

    // powerlist
    List<Object> plist = powerModule.getPowerList();
    // 获取account详情
    AccountPower ap = powerModule.findPowerByAccount(accountId, type);
    // 该用户无权限
    if (ap == null) {
      ap = new AccountPower();
      ap.setAccount_id(accountId);
      ap.setAccount_type(type);
      ap.setPower_id(MedexConfigure.default_power_id);
      ap.setPower_name(MedexConfigure.default_power_name);
    }
    ap.setAccount_name(accountName);
    view.addObject("plist", plist);
    view.addObject("ap", ap);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/accountEditPower")
  @ResponseBody
  public boolean accountEditPower(HttpServletRequest request, String accountId, String type, int power, int power_id) {
    if (StringUtils.isBlank(accountId) || StringUtils.isBlank(type) || power < 0 || power_id < 0) return false;
    else {
      // 设置权限
      AccountPower ap = powerModule.findPowerByAccount(accountId, type);

      if (ap == null) return powerModule.addAccountPower(accountId, type, power);
      else return powerModule.updateAccountPower(accountId, type, power);
    }
  }
}
