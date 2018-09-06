package com.leo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/borrow")
public class BorrowController {

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String show(Model model, HttpSession session) {
		return "borrow/list";
	}
}
