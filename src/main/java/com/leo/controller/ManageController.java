package com.leo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.dto.NewsDto;
import com.leo.service.NewsService;
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
	@RequestMapping(path = "/getNewsitems", method = RequestMethod.GET)
	public Pagerlist<NewsDto> getNewsitems(Integer pageIndex,String keywords,HttpSession session) {
		if(pageIndex == null||pageIndex ==0) {
			pageIndex=1;
		}
		return newsService.getNewsitems(pageIndex,keywords,pageSize);	
}
}
