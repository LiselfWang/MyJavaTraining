package com.leo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.leo.dto.NewsDto;

@Repository
public interface NewsDao {
	List<NewsDto> getNewsList();
	NewsDto getNewsDetail(int id);
	List<NewsDto> getNewsitems(@Param("pageIndex")int pageIndex,@Param("keywords")String keywords,@Param("pageSize")int pageSize);
	int getNewsCount(String keywords);
}
