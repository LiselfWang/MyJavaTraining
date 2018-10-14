package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.dao.NewsDao;
import com.leo.dto.NewsDto;
import com.leo.viewModel.Pagerlist;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
    private NewsDao newsDao;
	
	@Override
	public Pagerlist<NewsDto> getNewsShow(){
		List<NewsDto> result = newsDao.getNewsShow();
		Pagerlist<NewsDto> data = new Pagerlist<NewsDto>();
		data.setResult(result);
		return data;
	}
	
	@Override
	public NewsDto getNewsDetail(int id){
		return newsDao.getNewsDetail(id);
		
	}
	
	@Override
	public int getShowNewsCount(String keywords){
		return newsDao.getShowNewsCount(keywords);
	}
	
	
	@Override
	public int getNewsCount(String keywords){
		return newsDao.getNewsCount(keywords);
	}
	
	
	@Override
	public Pagerlist<NewsDto> getNewsitems(int pageIndex,String keywords,int pageSize){
	List<NewsDto> result = newsDao.getNewsitems(pageIndex,keywords,pageSize);
	int allCount = newsDao.getNewsCount(keywords);
	int totalPage = allCount/pageSize;
	if(allCount%pageSize!=0) {
		totalPage++;
	}
	
	
	Pagerlist<NewsDto> data = new Pagerlist<NewsDto>();
	data.setResult(result);
	data.setTotalpage(totalPage);
	data.setPagenumber(pageIndex);
	data.setPagesize(pageSize);
	return data;
	}
	
	@Override
	public Pagerlist<NewsDto> getShowitems(int pageIndex,String keywords,int pageSize){
	List<NewsDto> result = newsDao.getShowitems(pageIndex,keywords,pageSize);
	int allCount = newsDao.getShowNewsCount(keywords);
	int totalPage = allCount/pageSize;
	if(allCount%pageSize!=0) {
		totalPage++;
	}
	
	
	Pagerlist<NewsDto> data = new Pagerlist<NewsDto>();
	data.setResult(result);
	data.setTotalpage(totalPage);
	data.setPagenumber(pageIndex);
	data.setPagesize(pageSize);
	return data;
	}
	
	@Override
	public void getAddInfo(NewsDto addsone){
		if(addsone.getStatus() == null || "".equals(addsone.getStatus())) {
			addsone.setStatus("N");
		}
		newsDao.getAddInfo(addsone);
		
	}
	
	@Override
	public void deleteItems(int id) {
		newsDao.deleteItems(id);
	}
	
	@Override
	public NewsDto editPage(int id) {
		return newsDao.editPage(id);
	}
	
	@Override
	public void getEditInfo(NewsDto editone) {
		newsDao.getEditInfo(editone);
	}
}
