package com.leo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.model.Borrowperson;
import com.leo.model.Pagerlist;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
	final int pagesize = 10;
	
	public ArrayList<Borrowperson> getfakelist(){
		ArrayList<Borrowperson> fakelist = new ArrayList<Borrowperson>();
		for (int i = 0; i < 100; i++) {
			Borrowperson current = new Borrowperson();
			current.setName("Fakename"+i);
			current.setClasses("Class"+i);
			current.setBookname("Book"+i);
			fakelist.add(current);
		}
		return fakelist;
	}
	
	public ArrayList<Borrowperson> getsession(HttpSession session){
		Object obj = session.getAttribute("borrow");
		if(obj!=null){
			return (ArrayList<Borrowperson>) obj; 	
		}else{
			ArrayList<Borrowperson> fakelist = getfakelist();
			session.setAttribute("borrow", fakelist);
			return fakelist;
		}
	}
	

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String show(Model model, HttpSession session) {
		return "borrow/list";
	}
	
	
	@ResponseBody
	@RequestMapping(path = "/getborrowlist", method = RequestMethod.GET)
	public Pagerlist<Borrowperson> getborrowlist(String name, Integer pagenumber, HttpSession session) {
		if(pagenumber==null || pagenumber==0){
			pagenumber = 1;
		}
		ArrayList<Borrowperson> borrowlist = new ArrayList<Borrowperson>();
		if(name==null || "".equals(name)) {
			 borrowlist = getsession(session);
		}else {
			ArrayList<Borrowperson> tmplist = getsession(session);
			for (int i = 0; i < tmplist.size(); i++) {
				Borrowperson current = tmplist.get(i);
				if(current.getName().indexOf(name)>-1) {
					borrowlist.add(current);
				}
			}
		}
		
			ArrayList<Borrowperson> resultlist = new ArrayList<Borrowperson>();
		for (int q = 0; q < borrowlist.size(); q++) {
			if(q>=pagesize*(pagenumber-1) && q<pagesize*pagenumber-1) {
				resultlist.add(borrowlist.get(q));
			}
		}	
		
		int totalpage = borrowlist.size()/pagesize;
		if(borrowlist.size()%pagesize!=0) {
			totalpage++;
		}
		
		Pagerlist<Borrowperson> data = new Pagerlist<Borrowperson>();
		data.setResult(resultlist);
		data.setPagenumber(pagenumber);
		data.setPagesize(pagesize);
		data.setTotalpage(totalpage);
		return data;
}
	
	@RequestMapping(path = "/addpage", method = RequestMethod.GET)
	public String addpage(Model model, HttpSession session) {
		return "borrow/addpage";
	}
	
	@RequestMapping(path = "/addinfo", method = RequestMethod.POST)
	public String addinfo(Borrowperson borrowone,HttpSession session) {
		ArrayList<Borrowperson> borrowlist = getsession(session);
		borrowlist.add(borrowone);
		session.setAttribute("borrow", borrowlist);
		return "redirect:/borrow";
	}
	
	@RequestMapping(path = "/editpage", method = RequestMethod.GET)
	public String editpage(String id, Model model, HttpSession session) {
		ArrayList<Borrowperson> borrowlist = getsession(session);
		for (int i = 0; i < borrowlist.size(); i++) {
			Borrowperson editone = borrowlist.get(i);
			if(editone.getId().equals(id)) {
				model.addAttribute("editone", editone);
				break;
			}
		}
		return "borrow/editpage";
	}
	
	@RequestMapping(path = "/editinfo", method = RequestMethod.POST)
	public String editinfo(Borrowperson borrowone, Model model, HttpSession session) {
		ArrayList<Borrowperson> borrowlist = getsession(session);
		for (int i = 0; i < borrowlist.size(); i++) {
			Borrowperson editone = borrowlist.get(i);
			if(editone.getId().equals(borrowone.getId())) {
				editone.setName(borrowone.getName());
				editone.setClasses(borrowone.getClasses());
				editone.setBookname(borrowone.getBookname());
				break;
			}
		}
		return "redirect:/borrow";
	}
	
	@ResponseBody
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public Boolean delete(String id, Model model, HttpSession session) {
		ArrayList<Borrowperson> borrowlist = getsession(session);
		for (int i = 0; i < borrowlist.size(); i++) {
			Borrowperson deletetone = borrowlist.get(i);
			if(deletetone.getId().equals(id)) {
				borrowlist.remove(deletetone);
				break;
			}
			}
		return true;
	}
}