package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.leo.mapper.TodoMapper;
import com.leo.model.Todo;

public class TodoServiceImpl implements TodoService {
 
    @Autowired
    private TodoMapper userMapper;
 
    public List<Todo> getAllTodos() {
        return userMapper.getAllTodos();
    }
}