package com.leo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/animal")
public class Animal {

	@RequestMapping(path = "", method = RequestMethod.GET)
	public ModelAndView show(HttpSession session) {

		ModelAndView mv = new ModelAndView("practise");
		return mv;
	}

}
