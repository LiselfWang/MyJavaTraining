package com.leo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.leo.dto.Todo;

@Repository
public interface TodoDao {
	List<Todo> getAllTodos(@Param("keywords") String keywords, @Param("pageSize") int pageSize,  @Param("pageIndex") int pageIndex);
	
	int getAllTodosCount(@Param("keywords") String keywords);
	
	Todo getTodo(int id);
	
	void addTodo(Todo todo);
	
	void updateTodo(Todo todo);
}
