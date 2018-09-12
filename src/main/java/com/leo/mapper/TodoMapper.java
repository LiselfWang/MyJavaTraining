package com.leo.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.leo.dto.Todo;

@Repository
public interface TodoMapper {
	List<Todo> getAllTodos();
}
