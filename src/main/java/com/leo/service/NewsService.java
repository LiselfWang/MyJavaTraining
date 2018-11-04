package com.leo.service;

import java.util.List;

import com.leo.dto.NewsDto;
import com.leo.viewModel.Pagerlist;

public interface NewsService {
	List<NewsDto> getNewsShow();

	NewsDto getNewsDetail(int id);

	int getShowNewsCount(String keywords);

	Pagerlist<NewsDto> getShowitems(int pageIndex, String keywords, int pageSize);

	int getNewsCount(String keywords);

	Pagerlist<NewsDto> getNewsitems(int pageIndex, String keywords, int pageSize);

	void getAddInfo(NewsDto addsone);

	void deleteItems(int id);

	NewsDto editPage(int id);

	void getEditInfo(NewsDto editone);
}
