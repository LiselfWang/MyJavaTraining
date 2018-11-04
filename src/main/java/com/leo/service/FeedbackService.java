package com.leo.service;

import com.leo.dto.Feedback;
import com.leo.viewModel.Pager;

public interface FeedbackService {
	Pager<Feedback> getAllFeedbacks(String keywords, int pageSize, int pageIndex);

	Feedback getFeedback(int id);

	void addFeedback(Feedback dodo);

	void processFeedback(int id, int processStatus);
}