package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.dao.BorrowDao;
import com.leo.viewModel.Borrowperson;

@Service
public class BorrowServiceImpl implements BorrowService{

	 @Autowired
	    private BorrowDao userDao;
	 
	    @Override
	    public List<Borrowperson> getborrowlist() {
	        return userDao.getborrowlist();
	    }
}
