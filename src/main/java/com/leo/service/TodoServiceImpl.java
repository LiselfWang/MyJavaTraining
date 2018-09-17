package com.leo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leo.dao.TodoDao;
import com.leo.dto.Todo;
import com.leo.viewModel.Pager;

@Service
public class TodoServiceImpl implements TodoService {
 
    @Autowired
    private TodoDao todoDao;
 
    @Override
    public Pager<Todo> getAllTodos(String keywords, int pageSize, int pageIndex) {
    	int totalCount = todoDao.getAllTodosCount(keywords);
    	List<Todo> result = todoDao.getAllTodos(keywords,pageSize,pageIndex);
    	
    	int totalPage = totalCount / pageSize;

		if (totalCount % pageSize != 0) {
			totalPage++;
		}
		
    	Pager<Todo> resultPager = new Pager<Todo>();
    	resultPager.setCurrentPage(pageIndex);
		resultPager.setPageSize(pageSize);
		resultPager.setTotalCount(totalCount);
		resultPager.setTotalPage(totalPage);
		resultPager.setResult(result);
		
        return resultPager;
    }
    
    

	@Override
	public Todo getTodo(int id) {
		return todoDao.getTodo(id);
	}

	@Override
	public void addTodo(Todo todo) {
		todoDao.addTodo(todo);
	}

	@Override
	public void updateTodo(Todo todo) {
		todoDao.updateTodo(todo);
	}
}