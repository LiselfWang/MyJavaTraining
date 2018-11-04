package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.dao.FeedbackDao;
import com.leo.dto.Feedback;
import com.leo.viewModel.Pager;

@Service
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	private FeedbackDao feedbackDao;

	@Override
	public Pager<Feedback> getAllFeedbacks(String keywords, int pageSize, int pageIndex) {
		int totalCount = feedbackDao.getAllFeedbacksCount(keywords);
		List<Feedback> result = feedbackDao.getAllFeedbacks(keywords, pageSize, pageIndex);

		int totalPage = totalCount / pageSize;

		if (totalCount % pageSize != 0) {
			totalPage++;
		}

		Pager<Feedback> resultPager = new Pager<Feedback>();
		resultPager.setCurrentPage(pageIndex);
		resultPager.setPageSize(pageSize);
		resultPager.setTotalCount(totalCount);
		resultPager.setTotalPage(totalPage);
		resultPager.setResult(result);

		return resultPager;
	}

	@Override
	public Feedback getFeedback(int id) {
		return feedbackDao.getFeedback(id);
	}

	@Override
	public void addFeedback(Feedback feedback) {
		if (feedback.getIsProcessed() == null) {
			feedback.setIsProcessed(0);
		}

		feedbackDao.addFeedback(feedback);
	}

	@Override
	public void processFeedback(int id, int processStatus) {

		Feedback feedback = new Feedback();
		feedback.setId(id);
		feedback.setIsProcessed(processStatus);

		feedbackDao.updateFeedback(feedback);

	}

}