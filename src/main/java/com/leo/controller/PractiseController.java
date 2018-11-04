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
@RequestMapping("/practise")
public class PractiseController {

	@Autowired
	private PractiseService practiseService;

	@RequestMapping(path = "", method = RequestMethod.GET)
	public ModelAndView show(HttpSession session) {

		ModelAndView mv = new ModelAndView("practise");
		return mv;
	}

	@ResponseBody
	@RequestMapping(path = "/getPlayList", method = RequestMethod.GET)
	public List<PractiseDto> getPlayList() {
		List<PractiseDto> data = practiseService.getPlayList();
		return data;
	}
}
