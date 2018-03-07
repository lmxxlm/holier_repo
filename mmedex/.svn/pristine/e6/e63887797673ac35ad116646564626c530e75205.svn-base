package com.danrong.mmedex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Account;
import com.danrong.medex.bean.Doctor;
import com.danrong.medex.bean.Patient;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.AccountResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.MedexConfigure;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.AccountModule;
import com.danrong.medex.module.AccountModuleImpl;
import com.danrong.medex.module.BasicEntityModule;
import com.danrong.medex.module.BasicEntityModuleImpl;
import com.danrong.medex.util.SessionParser;
import com.dr.core.util.TimeUtil;

/**
 * 账号管理控制器
 * 
 * @author cyzsj
 */
@Controller
public class AccountController {

  @Value("#{properties['mmedex.web.main.url']}")
  public String mainUrl;

  private final AccountModule accountModule = new AccountModuleImpl();
  private final BasicEntityModule basicEntityModule = new BasicEntityModuleImpl();
  // private final AssistantModule assistantModule = new AssistantModuleImpl();
  private final TimeUtil timeUtil = new TimeUtil();
  private final SessionParser sessionParser = new SessionParser();

  @RequestMapping(value = "/tab/account")
  public ModelAndView getTabAccount(@ModelAttribute SearchParams param, HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/account");
    view.addObject("mainUrl", mainUrl.trim());

    // 获取account列表
    AccountResultObject aro = accountModule.list(param);
    view.addObject("aro", aro);
    view.addObject("searchParam", param);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/accountAddForm")
  @ResponseBody
  public int accountAdd(@ModelAttribute Account account, HttpServletRequest request) {
    if (account != null) {
      Account ac = basicEntityModule.findAccount(account.getAccountId(), account.getType());
      if (ac != null) return -1;
    }
    return accountModule.addAccount(account, request.getParameter(TableFieldName.mobilePhone));
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/doAccountDeleteAction")
  @ResponseBody
  public int accountSingleDelete(HttpServletRequest request) {
    String accountId = request.getParameter(TableFieldName.accountId);
    String accountType = request.getParameter(TableFieldName.type);
    // 自己不能删自己的账号
    String currentUserId = sessionParser.getUserName(request.getSession());
    if (currentUserId.equals(accountId) && MedexConfigure.destAdminType.equals(accountType)) return DbOption.DBOPTION_DELETEACCOUNT_SELF_NOTALLOWED;
    else {
      String type = request.getParameter(TableFieldName.type);
      return accountModule.deleteAccountByIdAndType(accountId, type);
    }
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/doAccountDeleteAllAction")
  @ResponseBody
  public int accountAllDelete(HttpServletRequest request) {
    String accountId = request.getParameter(TableFieldName.accountId);
    if (StringUtils.isBlank(accountId)) return DbOption.DBOPTION_FAILER;
    else {
      String[] ids = accountId.split(MedexConfigure.ARRAY_SPILT_TAG);
      Account[] accounts = new Account[ids.length];
      String currentUserId = sessionParser.getUserName(request.getSession());
      for (int i = 0; i < ids.length; i++) {
        if (ids[i].contains(MedexConfigure.ID_TYPE_SPLIT_TAG)) {
          String[] array = ids[i].split(MedexConfigure.ID_TYPE_SPLIT_TAG);
          if (array.length == 2) {
            String deleteId = array[0];
            String type = array[1];
            Account account = new Account();
            account.setAccountId(deleteId);
            account.setType(type);
            accounts[i] = account;
            if (currentUserId.equals(deleteId)) return DbOption.DBOPTION_DELETEACCOUNT_SELF_NOTALLOWED;
          }
        }
      }
      return accountModule.deleteAccounts(accounts);
    }
  }

  @RequestMapping(value = "/tab/accountAdd")
  public ModelAndView getTabAccountAdd(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/accountAdd");
    view.addObject("mainUrl", mainUrl.trim());
    return view;
  }

  @RequestMapping(value = "/tab/accountEdit")
  public ModelAndView getTabAccountEdit(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/accountEdit");
    view.addObject("mainUrl", mainUrl.trim());
    // 获取account详情
    Account account = basicEntityModule.findAccount(request.getParameter(TableFieldName.accountId),
        request.getParameter(TableFieldName.type));
    // peace 测试
    System.out.println(request.getParameter(TableFieldName.accountId));
    System.out.println(request.getParameter(TableFieldName.type));
    view.addObject("account", account);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "/tab/accountEditForm")
  @ResponseBody
  public int doAccountEdit(@ModelAttribute Account currentAccount, HttpServletRequest request) {
    String accountId = currentAccount.getAccountId();
    if (StringUtils.isBlank(accountId)) return DbOption.DBOPTION_FAILER;
    else {
      // 补全参数
      currentAccount.setCreattime(timeUtil.now2l());
      return accountModule.updateAccount(accountId, currentAccount);
    }
  }

  @RequestMapping(value = "/tab/accountDetailDoc")
  public ModelAndView getTabAccountDetailDoc(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/accountDetailDoc");
    view.addObject("mainUrl", mainUrl.trim());

    // 获取doctor详情
    String doctorId = request.getParameter(TableFieldName.doctorId);
    Doctor doctor = basicEntityModule.findDoctorById(doctorId);
    view.addObject("doctor", doctor);
    // 账号基本信息
    Account account = basicEntityModule.findAccount(doctorId, MedexConfigure.destDoctorType);
    view.addObject("account", account);

    return view;
  }

  // @RequestMapping(value = "/tab/accountDetailHep")
  // public ModelAndView getTabAccountDetailHep(HttpServletRequest request) {
  // ModelAndView view = new ModelAndView();
  // view.setViewName("tab/accountDetailHep");
  // view.addObject("mainUrl", mainUrl.trim());
  // // 获取assistant详情
  // String assistantId = request.getParameter(TableFieldName.assistantId);
  // Assistant assistant = assistantModule.findAssistantById(assistantId);
  // view.addObject("assistant", assistant);
  // // 账号基本信息
  // Account account = basicEntityModule.findAccount(assistantId);
  // view.addObject("account", account);
  // return view;
  // }

  @RequestMapping(value = "/tab/accountDetailPat")
  public ModelAndView getTabAccountDetailPat(HttpServletRequest request) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/accountDetailPat");
    view.addObject("mainUrl", mainUrl.trim());
    // 获取patient详情
    String patientId = request.getParameter(TableFieldName.patientId);
    Patient patient = basicEntityModule.findPatientById(patientId);
    view.addObject("patient", patient);
    // 账号基本信息
    Account account = basicEntityModule.findAccount(patientId, MedexConfigure.destPatientType);
    view.addObject("account", account);
    return view;
  }

  @RequestMapping(method = RequestMethod.POST, value = "tab/searchAccount")
  public ModelAndView searchAccount(@ModelAttribute SearchParams param, HttpServletRequest request,
      HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("tab/account");
    view.addObject("mainUrl", mainUrl.trim());
    view.addObject("searchParam", param);
    String searchText = request.getParameter("accountName");
    if (StringUtils.isBlank(searchText)) {
      view.addObject("aro", null);
    } else {
      AccountResultObject aro = accountModule.likeWithAccountName(param, searchText);
      view.addObject("aro", aro);
    }
    return view;
  }
}
