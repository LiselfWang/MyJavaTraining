package com.leo.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.leo.dto.Borrow;
import com.leo.service.BorrowService;
import com.leo.viewModel.Pagerlist;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
	final int pagesize = 5;
	
//	public ArrayList<Borrow> getfakelist(){
//		ArrayList<Borrow> fakelist = new ArrayList<Borrow>();
//		for (int i = 0; i < 100; i++) {
//			Borrow current = new Borrow();
//			current.setName("Fakename"+i);
//			current.setClasses("Class"+i);
//			current.setBookname("Book"+i);
//			fakelist.add(current);
//		}
//		return fakelist;
//	}
//	
//	public ArrayList<Borrow> getsession(HttpSession session){
//		Object obj = session.getAttribute("borrow");
//		if(obj!=null){
//			return (ArrayList<Borrow>) obj; 	
//		}else{
//			ArrayList<Borrow> fakelist = getfakelist();
//			session.setAttribute("borrow", fakelist);
//			return fakelist;
//		}
//	}
	
	
	@Autowired
    private BorrowService borrowService;
	

	@RequestMapping(path = "", method = RequestMethod.GET)
	public ModelAndView show(HttpSession session) {
		
		ModelAndView mv =new ModelAndView("borrow/list");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(path = "/getborrowlist", method = RequestMethod.GET)
	public Pagerlist<Borrow> getborrowlist(String keywords, Integer pagenumber, HttpSession session) {
		if(pagenumber==null || pagenumber==0){
			pagenumber = 1;
		}
  	
		return borrowService.getborrowlist(keywords, pagenumber, pagesize);
}
	
	@RequestMapping(path = "/addpage", method = RequestMethod.GET)
	public String addpage(Model model, HttpSession session) {
		return "borrow/addpage";
	}
	
	@RequestMapping(path = "/addinfo", method = RequestMethod.POST)
	public String addinfo(Borrow borrow,HttpSession session) {
		borrowService.addBorrowItem(borrow);
		return "redirect:/borrow";
	}
	
	@RequestMapping(path = "/editpage", method = RequestMethod.GET)
	public String editpage(int id, Model model, HttpSession session) {
			Borrow editone = borrowService.getBorrowItem(id);
			model.addAttribute("editone", editone);	
		return "borrow/editpage";
	}
	
	@RequestMapping(path = "/editinfo", method = RequestMethod.POST)
	public String editinfo(Borrow borrow, Model model, HttpSession session) {
		borrowService.updateBorrowItem(borrow);
		return "redirect:/borrow";
	}
	
	@ResponseBody
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public Boolean delete(int id, Model model, HttpSession session) {
		borrowService.deleteBorrowItem(id);
		return true;
	}
}
