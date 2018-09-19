package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.dao.BorrowDao;
import com.leo.dto.Borrow;
import com.leo.viewModel.Pagerlist;


@Service
public class BorrowServiceImpl implements BorrowService{

	 	@Autowired
	    private BorrowDao borrowDao;
	 
	    
	    
	    @Override
	    public Borrow getBorrowItem(int id) {
	        return borrowDao.getBorrowItem(id);
	    }
	    
	    @Override
	    public void deleteBorrowItem(int id) {
	        borrowDao.deleteBorrowItem(id);
	    }
	    
	    @Override
	    public void addBorrowItem(Borrow borrow) {
	    	borrowDao.addBorrowItem(borrow);
	    }


		@Override
		public void updateBorrowItem(Borrow borrow) {
			borrowDao.updateBorrowItem(borrow);;
		}

		@Override
		public Pagerlist<Borrow> getborrowlist(String keywords, int pagenumber, int pagesize) {
			List<Borrow> resultlist = borrowDao.getborrowlist(keywords, pagenumber, pagesize);
			int allCount = borrowDao.getborrowCount(keywords);
			int totalpage =allCount/pagesize;
			if(allCount%pagesize!=0) {
				totalpage++;
			}
			
			Pagerlist<Borrow> data = new Pagerlist<Borrow>();
			data.setResult(resultlist);
			data.setPagenumber(pagenumber);
			data.setPagesize(pagesize);
			data.setTotalpage(totalpage);
			return data;
		}
}
