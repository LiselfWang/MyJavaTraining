package com.leo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.dto.NewsDto;
import com.leo.service.NewsService;
import com.leo.viewModel.Pagerlist;

@Controller
@RequestMapping("/news")
public class NewsController {

	final int pageSize = 8;

	@Autowired
	private NewsService newsService;

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String show(HttpSession session) {
		return "News/MainPage";
	}

	@ResponseBody
	@RequestMapping(path = "/getNewsList", method = RequestMethod.GET)
	public List<NewsDto> getNewsShow(HttpSession session) {
		return newsService.getNewsShow();

	}

	@RequestMapping(path = "/getNewsDetail", method = RequestMethod.GET)
	public String getNewsDetail(Integer id, Model model, HttpSession session) {
		System.out.println("getNewsDetail: id:" + id.toString());
		NewsDto checkone = newsService.getNewsDetail(id);
		model.addAttribute("checkone", checkone);
		return "News/NewsDetail";
	}

	@RequestMapping(path = "/getNewsPage", method = RequestMethod.GET)
	public String getNewsPage(HttpSession session) {
		return "News/NewsPage";
	}

	@ResponseBody
	@RequestMapping(path = "/getNewsitems", method = RequestMethod.GET)
	public Pagerlist<NewsDto> getShowitems(Integer pageIndex, String keywords, HttpSession session) {
		if (pageIndex == null || pageIndex == 0) {
			pageIndex = 1;
		}
		return newsService.getShowitems(pageIndex, keywords, pageSize);
	}
}
