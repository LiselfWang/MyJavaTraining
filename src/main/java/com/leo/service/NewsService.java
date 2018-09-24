package com.leo.service;

import com.leo.dto.NewsDto;
import com.leo.viewModel.Pagerlist;

public interface NewsService {
	Pagerlist<NewsDto> getNewsList();
	NewsDto getNewsDetail(int id);
	int getNewsCount(String keywords);
	Pagerlist<NewsDto> getNewsitems(int pageIndex,String keywords,int pageSize);
}
