package com.leo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path = "/")
public class ElephantController {

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public ModelAndView littlelephant() {
		ModelAndView mv = new ModelAndView("myElephant");
		// mv.addObject("Animal", puppy);
		return mv;
	}

	@RequestMapping(path = "/import", method = RequestMethod.POST)
	public ModelAndView adopt(Elephant toy) {
		ModelAndView mv = new ModelAndView("data");
		mv.addObject("weight", toy.getWeight());
		mv.addObject("height", toy.getHeight());
		mv.addObject("color", toy.getColor());
		return mv;
	}
}
