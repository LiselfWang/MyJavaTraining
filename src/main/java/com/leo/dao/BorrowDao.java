package com.leo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.leo.dto.Borrow;

@Repository
public interface BorrowDao {
	List<Borrow> getborrowlist(@Param("keywords")String keywords,@Param("pagenumber")int pagenumber,@Param("pagesize")int pagesize);
	int getborrowCount(@Param("keywords")String keywords);
	Borrow getBorrowItem(int id);
	void deleteBorrowItem(int id);
	void addBorrowItem(Borrow borrow);
	void updateBorrowItem(Borrow borrow);

}
