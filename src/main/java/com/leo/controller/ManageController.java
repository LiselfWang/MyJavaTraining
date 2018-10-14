package com.leo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.dto.NewsDto;
import com.leo.service.NewsService;
import com.leo.util.CheckUtil;
import com.leo.viewModel.Pagerlist;

@Controller
@RequestMapping("/manage")
public class ManageController{
	
	@Autowired
	private NewsService newsService;
	final int pageSize = 10;

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String show(HttpSession session) {
		return "Manage/ManagePage";
	}
	
	
	@ResponseBody
	@RequestMapping(path = "/getNewsItems", method = RequestMethod.GET)
	public Pagerlist<NewsDto> getNewsitems(Integer pageIndex,String keywords,HttpSession session) {
		if(pageIndex == null||pageIndex ==0) {
			pageIndex=1;
		}
		return newsService.getNewsitems(pageIndex,keywords,pageSize);	
}
	@RequestMapping(path = "/getAddPage", method = RequestMethod.GET)
	public String addPage(HttpSession session) {
		return "Manage/AddPage";
	
	}

	
	@RequestMapping(path = "/getAddInfo", method = RequestMethod.POST)
	public String AddInfo(HttpSession session,NewsDto addsone) {
		if(CheckUtil.isEmptyString(addsone.getTitle())||CheckUtil.isEmptyString(addsone.getContent())){
			return "Manage/AddPage";
		}
		
		if(addsone.getStatus()==null||"".equals(addsone.getStatus())) {
			addsone.setStatus("N");
		}
		newsService.getAddInfo(addsone);
		return "redirect:/manage";
	
	}
	
	@ResponseBody
	@RequestMapping(path = "/deleteItems", method = RequestMethod.POST)
	public Boolean deleteItems(Integer id,HttpSession session) {
		newsService.deleteItems(id);
		return true;	
}
	
	@RequestMapping(path = "/editPage", method = RequestMethod.GET)
	public String editPage(Integer id,HttpSession session,Model model) {
		NewsDto editone = newsService.editPage(id);
		model.addAttribute("editone",editone);
		return "Manage/EditPage";
	
	}
	
	@RequestMapping(path = "/getEditInfo", method = RequestMethod.POST)
	public String getEditInfo(NewsDto editone,HttpSession session) {
		if(CheckUtil.isEmptyString(editone.getTitle())||CheckUtil.isEmptyString(editone.getContent())){
			return "Manage/EditPage";
		}
		
		if(editone.getStatus()==null||"".equals(editone.getStatus())) {
			editone.setStatus("N");
		}
		newsService.getEditInfo(editone);
		return "redirect:/manage";
	}
}
