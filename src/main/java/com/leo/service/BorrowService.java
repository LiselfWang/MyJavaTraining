package com.leo.service;

import com.leo.dto.Borrow;
import com.leo.viewModel.Pagerlist;

public interface BorrowService{
	
	 Pagerlist<Borrow> getborrowlist(String keywords,int pagenumber,int pagesize);
	 
	 Borrow getBorrowItem(int id);
	 
	 void deleteBorrowItem(int id);
	 
	 void addBorrowItem(Borrow borrow);
	 
	 void updateBorrowItem(Borrow borrow);
}
