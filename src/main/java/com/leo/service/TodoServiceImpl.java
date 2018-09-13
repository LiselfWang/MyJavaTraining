package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.dao.TodoDao;
import com.leo.dto.Todo;

@Service
public class TodoServiceImpl implements TodoService {
 
    @Autowired
    private TodoDao userDao;
 
    @Override
    public List<Todo> getAllTodos() {
        return userDao.getAllTodos();
    }
}