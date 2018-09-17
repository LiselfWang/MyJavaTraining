package com.leo.service;

import com.leo.dto.Todo;
import com.leo.viewModel.Pager;


public interface TodoService {
	Pager<Todo> getAllTodos(String keywords, int pageSize, int pageIndex);
    
    Todo getTodo(int id);
    
    void addTodo(Todo dodo);
    
	void updateTodo(Todo todo);
}