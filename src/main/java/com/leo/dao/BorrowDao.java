package com.leo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.leo.viewModel.Borrowperson;

@Repository
public interface BorrowDao {
	List<Borrowperson> getborrowlist();
}
