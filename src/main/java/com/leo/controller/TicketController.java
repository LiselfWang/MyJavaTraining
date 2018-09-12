package com.leo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.viewModel.Information;
import com.leo.viewModel.QuaryPage;

import javax.servlet.http.HttpSession;

import java.util.ArrayList;

@Controller
@RequestMapping("/buytickets")
public class TicketController {
	final int pagesize = 10;

	public ArrayList<Information> getfakelist() {
		ArrayList<Information> fakelist = new ArrayList<Information>();
		for (int i = 0; i < 100; i++) {
			Information customer = new Information();
			customer.setName("fakename" + i);
			customer.setAge(i);
			customer.setId("XA1991" + i);
			customer.setDestination("泰国新加坡印度尼西亚" + i);
			fakelist.add(customer);
		}
		return fakelist;
	}

	public ArrayList<Information> getinfolist(HttpSession session) {
		Object obj = session.getAttribute("infolist");
		if (obj != null) {
			return (ArrayList<Information>) obj;
		} else {
			ArrayList<Information> fakelist = getfakelist();
			session.setAttribute("infolist", fakelist);
			return fakelist;
		}
	}

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String show( Model model, HttpSession session) {
		return "background";
	}
	
	@ResponseBody
	@RequestMapping(path = "/getinfolist", method = RequestMethod.GET)
	public QuaryPage<Information> getinfolist(String id, Integer pagenumber, Model model, HttpSession session) {
		if (pagenumber == null || pagenumber == 0) {
			pagenumber = 1;
		}

		ArrayList<Information> infolist = null;
		if (id == null || "".equals(id)) {
			infolist = getinfolist(session);
		} else {
			ArrayList<Information> templist = getinfolist(session);
			infolist = new ArrayList<Information>();
			for (int i = 0; i < templist.size(); i++) {
				Information selectone = templist.get(i);
				if (selectone.getId().indexOf(id) > -1) {
					infolist.add(selectone);
				}
			}
		}
		ArrayList<Information> finallist = new ArrayList<Information>();
		for (int q = 0; q < infolist.size(); q++) {
			if (q >= (pagenumber - 1) * pagesize && q < pagenumber * pagesize) {
				finallist.add(infolist.get(q));
			}

		}

		int totalpage = infolist.size() / pagesize;

		if ((infolist.size() % pagesize) != 0) {
			totalpage++;
		}
 
		QuaryPage<Information> result = new QuaryPage<Information>();
		result.setTotalcount(infolist.size());
		result.setPagenumber(pagenumber);
		result.setTotalpage(totalpage);
		result.setResult(finallist);
		result.setPagesize(pagesize);
		return result;
		
	}

	@RequestMapping(path = "/addPage", method = RequestMethod.GET)
	public String addpage(HttpSession session) {
		return "Addpage";
	}

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String addinfo(Information info, HttpSession session) {
		ArrayList<Information> infolist = getinfolist(session);
		infolist.add(info);
		return ("redirect:/buytickets");
	}
	
	
	@RequestMapping(path = "/editPage", method = RequestMethod.GET)
	public String editpage(String currentid,Model model,HttpSession session) {
		ArrayList<Information> infolist = getinfolist(session);
		for (int i = 0; i < infolist.size(); i++) {
			Information editone = infolist.get(i);
			if (editone.getId().equals(currentid)) {
				model.addAttribute("info", editone);
				break;
			}
		}
		return "Editpage";
	}
	
	@RequestMapping(path = "/edit", method = RequestMethod.POST)
	public String editinfo(Information info,Model model,HttpSession session) {
		ArrayList<Information> infolist = getinfolist(session);
		for (int i = 0; i < infolist.size(); i++) {
			Information editone = infolist.get(i);
			if (editone.getId().equals(info.getId())) {
				editone.setName(info.getName());
				editone.setAge(info.getAge());
				editone.setDestination(info.getDestination());
				break;
			}
		}
		return "redirect:/buytickets";
	}
	
	@ResponseBody
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public boolean deleteone(String id, HttpSession session) {
		ArrayList<Information> infolist = getinfolist(session);
		for (int i = 0; i < infolist.size(); i++) {
			Information deleteone = infolist.get(i);
			if (deleteone.getId().equals(id)) {
				infolist.remove(deleteone);
			}
		}
		return true;
	}

}
