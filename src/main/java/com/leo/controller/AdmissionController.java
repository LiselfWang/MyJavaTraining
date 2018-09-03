package com.leo.controller;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.leo.model.Register;

@Controller
@RequestMapping("/admission")

public class AdmissionController {

	public ArrayList<Register> getfakelist() {
		ArrayList<Register> getfakelist = new ArrayList<Register>();
		for (int index = 0; index < 10; index++) {
			Register current = new Register();
			current.setName("Fakename" + index);
			current.setAge(index);
			current.setHobby("Fakehobby" + index);
			getfakelist.add(current);
		}
		return getfakelist;
	}

	public ArrayList<Register> getregisterlist(HttpSession session) {
		Object obj = session.getAttribute("registerlist");
		if (obj != null) {
			return (ArrayList<Register>) obj;
		} else {
			ArrayList<Register> getfakelist = getfakelist();
			session.setAttribute("registerlist", getfakelist);
			return getfakelist;
		}
	}

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String present(String name, Model model, HttpSession session) {
		if (name == null || "".equals(name)) {
			ArrayList<Register> registerlist = getregisterlist(session);
			model.addAttribute("showlist", registerlist);
		} else {
			ArrayList<Register> registerlist = getregisterlist(session);
			ArrayList<Register> resultlist = new ArrayList<Register>();
			for (int index = 0; index < registerlist.size(); index++) {
				Register searchone = registerlist.get(index);
				if (searchone.getName().indexOf(name) > -1) {
					resultlist.add(searchone);
				}
			}
			model.addAttribute("showlist", resultlist);
			model.addAttribute("queryname", name);
		}
		return "index";
	}

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String addup(Register register, HttpSession session) {
		ArrayList<Register> registerlist = getregisterlist(session);
		registerlist.add(register);
		return "redirect:/admission";
	}

	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public String delete(String id, HttpSession session) {
		ArrayList<Register> registerlist = getregisterlist(session);
		for (int index = 0; index < registerlist.size(); index++) {
			Register deleteone = registerlist.get(index);
			if (deleteone.getId().equals(id)) {
				registerlist.remove(deleteone);
			}
		}
		return "redirect:/admission";
	}

}
