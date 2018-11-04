package com.leo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.leo.dto.Feedback;

@Repository
public interface FeedbackDao {
	List<Feedback> getAllFeedbacks(@Param("keywords") String keywords, @Param("pageSize") int pageSize,
			@Param("pageIndex") int pageIndex);

	int getAllFeedbacksCount(@Param("keywords") String keywords);

	Feedback getFeedback(int id);

	void addFeedback(Feedback todo);

	void updateFeedback(Feedback todo);
}
