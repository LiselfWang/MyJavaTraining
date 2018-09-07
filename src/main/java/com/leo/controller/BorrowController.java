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
			Borrowperson current = fakelist.get(i);
			current.setName("Fakename"+i);
			current.setClasses("Class"+i);
			current.setBookname("Book"+i);
			fakelist.add(current);
		}
		return fakelist;
	}
	
	public ArrayList<Borrowperson> getborrowlist(HttpSession session){
		Object obj = session.getAttribute("borrow");
		ArrayList<Borrowperson> borrowlist = new ArrayList<Borrowperson>();
		if(obj!=null){
			borrowlist= (ArrayList<Borrowperson>) obj; 	
		}else{
			borrowlist = getfakelist();
		}
		return borrowlist;
	}
	

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String show(Model model, HttpSession session) {
		return "borrow/list";
	}
	
	@ResponseBody
	@RequestMapping(path = "/getshowpage", method = RequestMethod.GET)
	public Pagerlist<Borrowperson> getshowpage(String name, Integer pagenumber,Model model, HttpSession session) {
		if(pagenumber==null || pagenumber==0){
			pagenumber = 1;
		}
		
		
}
	
	
}
