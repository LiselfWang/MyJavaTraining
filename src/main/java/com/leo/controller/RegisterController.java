package com.leo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.dto.RegisterDto;
import com.leo.service.RegisterService;
import com.leo.viewModel.Pagerlist;

@Controller
@RequestMapping("/maomao")
public class RegisterController {

	final int pagesize = 2;

	@Autowired
	private RegisterService registerService;

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String goToWeb(HttpSession session) {
		String website = "Register/mainpage";
		return website;
	}

	@RequestMapping(path = "/myself", method = RequestMethod.GET)
	public String goToIntroduction(HttpSession session) {
		String website = "Register/introductionPage";
		return website;
	}

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String goToRegisterPage(HttpSession session) {
		String website = "Register/registerPage";
		return website;
	}

	@RequestMapping(path = "/add", method = RequestMethod.GET)
	public String goToAddPaege(HttpSession session) {
		String website = "Register/addPage";
		return website;
	}

	@RequestMapping(path = "/addInfo", method = RequestMethod.POST)
	public String getAddInfo(RegisterDto addOne, HttpSession session) {
		registerService.insertItem(addOne);
		return "redirect:/maomao/register";
	}

	@ResponseBody
	@RequestMapping(path = "/getRegisterList", method = RequestMethod.GET)
	public Pagerlist<RegisterDto> getRegisterList(String keywords, Integer pageNumber, HttpSession session) {
		if (pageNumber == null || pageNumber == 0) {
			pageNumber = 1;
		}
		return registerService.getRegisterList(keywords, pageNumber, pagesize);
	}

	@RequestMapping(path = "/edit", method = RequestMethod.GET)
	public String goToEditPage(int id, HttpSession session, Model model) {
		RegisterDto editOne = registerService.getEditItem(id);
		model.addAttribute("editOne", editOne);
		return "Register/editPage";
	}

	@RequestMapping(path = "/editInfo", method = RequestMethod.POST)
	public String getEditInfo(RegisterDto editOne, HttpSession session) {
		registerService.editItem(editOne);
		return "redirect:/maomao/register";
	}

	@ResponseBody
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public boolean deleteItem(int id, HttpSession session) {
		registerService.deleteItem(id);
		boolean result = true;
		return result;
	}
}
