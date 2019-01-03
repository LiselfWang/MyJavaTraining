package com.leo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leo.dto.PractiseDto;
import com.leo.service.PractiseService;

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

}
