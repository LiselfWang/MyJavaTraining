package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.mapper.TodoMapper;
import com.leo.dto.Todo;

@Service
public class TodoServiceImpl implements TodoService {
 
    @Autowired
    private TodoMapper userMapper;
 
    @Override
    public List<Todo> getAllTodos() {
        return userMapper.getAllTodos();
    }
}