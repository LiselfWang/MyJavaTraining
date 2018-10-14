package com.leo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.leo.dto.NewsDto;

@Repository
public interface NewsDao {
	List<NewsDto> getNewsShow();
	NewsDto getNewsDetail(int id);
	List<NewsDto> getShowitems(@Param("pageIndex")int pageIndex,@Param("keywords")String keywords,@Param("pageSize")int pageSize);
	List<NewsDto> getNewsitems(@Param("pageIndex")int pageIndex,@Param("keywords")String keywords,@Param("pageSize")int pageSize);
	int getShowNewsCount(String keywords);
	int getNewsCount(String keywords);
	void getAddInfo(NewsDto addsone);
	void deleteItems(int id);
	NewsDto editPage(int id);
	void getEditInfo(NewsDto editone);
}
