package com.leo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.service.TodoService;
import com.leo.viewModel.Pager;
import com.leo.viewModel.Todo;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/todo")
public class TodoController {

	final String TODO_LIST_SESSION_KEY = "TODO_LIST_SESSION_KEY";
	final String TODO_LIST_MODEL_KEY = "TODO_LIST_MODEL_KEY";
	final String QUERY_NAME_MODEL_KEY = "QUERY_NAME_MODEL_KEY";
	final String QUERY_PAGE_NUMBER_MODEL_KEY = "QUERY_PAGE_NUMBER_MODEL_KEY";
	final String TODO_LIST_TOTAL_PAGE_KEY = "TODO_LIST_TOTAL_PAGE_KEY";
	final int TODO_PAGE_SIZE = 10;

	
	@Autowired
    private TodoService todoService;
	
	private ArrayList<Todo> getFakeList() {
		ArrayList<Todo> fakeList = new ArrayList<>();

		for (int index = 0; index < 100; index++) {

			Todo fakeTodo = new Todo();
			fakeTodo.setName("Fake name" + index);
			fakeTodo.setDetail("Fake detail" + index);
			fakeList.add(fakeTodo);
		}

		return fakeList;
	};

	private ArrayList<Todo> getTodoList(HttpSession session) {
		Object objTodoList = session.getAttribute(TODO_LIST_SESSION_KEY);
		if (objTodoList != null) {
			return (ArrayList<Todo>) objTodoList;
		} else {
			ArrayList<Todo> fakeList = getFakeList();
			session.setAttribute(TODO_LIST_SESSION_KEY, fakeList);
			return fakeList;
		}

	}

	@RequestMapping(path = "", method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		todoService.getAllTodos();
		return "todo/index";
	}

	@ResponseBody
	@RequestMapping(path = "getList", method = RequestMethod.GET)
	public Pager getList(String name, Integer pageNumber, Model model, HttpSession session) {

		if (pageNumber == null || pageNumber == 0) {
			pageNumber = 1;
		}

		ArrayList<Todo> todoList = null;
		if (name == null || "".equals(name)) {
			todoList = getTodoList(session);

		} else {
			ArrayList<Todo> tempTodoList = getTodoList(session);
			todoList = new ArrayList<Todo>();

			for (int i = 0; i < tempTodoList.size(); i++) {
				Todo current = tempTodoList.get(i);

				if (current.getName().indexOf(name) > -1) {
					todoList.add(current);
				}
			}

			// 通过name来筛选
		}

		ArrayList<Object> finalResult = new ArrayList<Object>();
		for (int q = 0; q < todoList.size(); q++) {
			if (q >= (TODO_PAGE_SIZE * (pageNumber - 1)) && q < (TODO_PAGE_SIZE * (pageNumber))) {
				finalResult.add((Object)todoList.get(q));
			}
		}

		int totalPage = todoList.size() / TODO_PAGE_SIZE;

		if (todoList.size() % TODO_PAGE_SIZE != 0) {
			totalPage++;
		}
		
		Pager resultPager = new Pager();
		resultPager.setPageSize(TODO_PAGE_SIZE);
		resultPager.setTotalCount(todoList.size());
		resultPager.setResult(finalResult);
		resultPager.setCurrentPage(pageNumber);
		resultPager.setTotalPage(totalPage);
		
		
		
		return resultPager;
	}

	@RequestMapping(path = "/addPage", method = RequestMethod.GET)
	public String Add(HttpSession session) {
		return "todo/add";
	}

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String Add(Todo todo, HttpSession session) {
		ArrayList<Todo> todoList = getTodoList(session);
		todoList.add(todo);
		return "redirect:/todo";
	}

	
	@RequestMapping(path = "/editPage", method = RequestMethod.GET)
	public String editPage(String id, Model model,  HttpSession session) {
		ArrayList<Todo> todoList = getTodoList(session);
		for(int i = 0; i < todoList.size(); i++) {
			Todo current = todoList.get(i);
			if(current.getId().equals(id)) {
				model.addAttribute("todo", current);
				break;
			}
		}
		
		return "todo/edit";
	}
	
	@RequestMapping(path = "/edit", method = RequestMethod.POST)
	public String edit(Todo todo, Model model,  HttpSession session) {
		ArrayList<Todo> todoList = getTodoList(session);
		for(int i = 0; i < todoList.size(); i++) {
			Todo current = todoList.get(i);
			if(current.getId().equals(todo.getId())) {
				
				current.setName(todo.getName());
				current.setDetail(todo.getDetail());
				
				break;
			}
		}
		
		
		return "redirect:/todo";
	}
	
	@ResponseBody
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public Boolean Delete(String id, HttpSession session) {
		ArrayList<Todo> todoList = getTodoList(session);
		for (int i = 0; i < todoList.size(); i++) {
			Todo current = todoList.get(i);
			if (current.getId().equals(id)) {
				todoList.remove(current);
			}
		}

		return true;
	}

}