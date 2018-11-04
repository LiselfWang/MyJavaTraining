package com.leo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.service.FeedbackService;
import com.leo.util.CheckUtil;
import com.leo.viewModel.AjaxResult;

import com.leo.dto.Feedback;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {

	final int TODO_PAGE_SIZE = 3;

	@Autowired
	private FeedbackService feedbackService;

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult Add(Feedback feedback, HttpSession session) {

		if (CheckUtil.isEmptyString(feedback.getTitle())) {
			return new AjaxResult(2, "标题是必须的");
		}

		if (feedback.getType() == null || feedback.getType() == 0) {
			return new AjaxResult(2, "类型是必须的");
		}

		if (CheckUtil.isEmptyString(feedback.getContent())) {
			return new AjaxResult(2, "内容是必须的");
		}

		feedbackService.addFeedback(feedback);
		return new AjaxResult(1, "成功");
	}
}