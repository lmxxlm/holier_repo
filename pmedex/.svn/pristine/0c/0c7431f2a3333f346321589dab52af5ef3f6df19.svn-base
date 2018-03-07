package com.danrong.pmedex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.Pcategory;
import com.danrong.medex.bean.SMSRequest;
import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.SimpleOrder;
import com.danrong.medex.bean.result.SimpleOrderResultObject;
import com.danrong.medex.configure.DbOption;
import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.SessionField;
import com.danrong.medex.module.ProductModule;
import com.danrong.medex.module.ProductModuleImpl;
import com.danrong.medex.module.SimpleOrderModule;
import com.danrong.medex.module.SimpleOrderModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.TimeUtil;

@Controller
public class SimpleOrderController {

	@Value("#{properties['pmedex.web.host']}")
	public String mainUrl;
	private final MedexToken medexToken = new MedexToken();
	private final SessionParser sessParser = new SessionParser();
	private final SimpleOrderModule simpleOrderModule = new SimpleOrderModuleImpl();
	private final ProductModule productModule = new ProductModuleImpl();
	private final TimeUtil timeUtil = new TimeUtil();

	@RequestMapping(value = "/simpleOrderAdd")
	public ModelAndView simpleOrderAdd(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String token = TokenGenerater.generateToken(AccountGenerater
				.generateHexString());
		sessParser.setSession(request, SessionField.token, token);
		view.setViewName("simpleOrderAdd");
		view.addObject(SessionField.token, token);
		view.addObject("menuIndex", "simpleOrder");
		view.addObject(JSTLField.mainUrl, mainUrl.trim());

		// 获取产品分类记录
		List<Pcategory> categorys = productModule.getPcategoryList();
		view.addObject("categorys", categorys);

		String orderId = request.getParameter("orderId");
		SimpleOrder so = new SimpleOrder();
		if (null == orderId || "".equals(orderId)
				|| StringUtils.isBlank(orderId)) {
			orderId = simpleOrderModule.get_simpleOrder_id();
			so.setOrderId(orderId);
			so.setStatus(-1);
			so.setRecordDate(timeUtil.now2l());
			so.setRecordUser(sessParser.getCurrentUserName(request.getSession()));
		} else {
			so = simpleOrderModule.findOrderById(orderId);
		}
		view.addObject("order", so);
		return view;
	}

	@RequestMapping(value = "/saveOrder")
	@ResponseBody
	public int saveOrder(@ModelAttribute SimpleOrder simpleOrder,
			HttpServletRequest request) {
		// 该post请求需验证token,，如果验证不成功，直接返回失败，否则，token置空(防止重复提交)，并进行下一步
		if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
			return DbOption.DBOPTION_FAILER;
		} else {
			return simpleOrderModule.saveOrder(simpleOrder);
		}
	}

	@RequestMapping(value = "/orderCompleteForSO")
	@ResponseBody
	public int orderCompleteForSO(@ModelAttribute SimpleOrder simpleOrder,
			HttpServletRequest request) {
		return simpleOrderModule.simpleOrderComplete(simpleOrder);
	}

	@RequestMapping(value = "/sendMessageForSO")
	@ResponseBody
	public int sendMessageForSO(@ModelAttribute SMSRequest smsRequest,
			HttpServletRequest request) {
		return simpleOrderModule.sendMessageForSO(smsRequest);
	}

	@RequestMapping(value = "/simpleOrder")
	public ModelAndView simpleOrder(@ModelAttribute SearchParams param,
			HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		String token = TokenGenerater.generateToken(AccountGenerater
				.generateHexString());
		sessParser.setSession(request, SessionField.token, token);
		view.addObject(SessionField.token, token);
		view.addObject("menuIndex", "simpleOrder");
		view.setViewName("simpleOrder");
		view.addObject(JSTLField.mainUrl, mainUrl.trim());
		// 获取订单
		String status = request.getParameter("status");
		int status_final = -1;
		if (null == status || "".equals(status) || StringUtils.isBlank(status))
			;
		else {
			status_final = Integer.parseInt(status);
			if (status_final != 0 && status_final != 1 && status_final != 2)
				status_final = -1;
		}

		SimpleOrderResultObject soro = simpleOrderModule.get_list_by_status(
				param, status_final);
		if (soro == null || soro.getSimpleOrders() == null
				|| soro.getSimpleOrders().isEmpty())
			view.addObject("noRecord", true);
		view.addObject("soro", soro);
		view.addObject("searchParam", param);
		view.addObject("pageTab", status_final);
		return view;
	}
}
