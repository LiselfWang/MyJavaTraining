package com.leo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.leo.dto.Todo;

@Repository
public interface TodoDao {
	List<Todo> getAllTodos();
}
