package com.danrong.pmedex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.configure.JSTLField;

@Controller
public class AwardManagerController {

	@Value("#{properties['pmedex.web.host']}")
	public String mainUrl;

	@RequestMapping(value = "/awardManager")
	public ModelAndView awardManager(@ModelAttribute SearchParams param,
			HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.addObject("menuIndex", "awardManager");
		view.setViewName("awardManager");
		view.addObject(JSTLField.mainUrl, mainUrl.trim());

		return view;
	}

}
