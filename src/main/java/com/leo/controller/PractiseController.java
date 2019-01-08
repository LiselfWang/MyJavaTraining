package com.leo.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/maomao")
public class PractiseController {

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String goToWeb(HttpSession session) {
		String website = "Practise/mainpage";
		return website;
	}

	@RequestMapping(path = "/myself", method = RequestMethod.GET)
	public String goToIntroduction(HttpSession session) {
		String website = "Practise/introductionPage";
		return website;
	}

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String goToRegisterPage(HttpSession session) {
		String website = "Practise/registerPage";
		return website;
	}

	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String goToAddPaege(HttpSession session) {
		String website = "Practise/addPage";
		return website;
	}
}
