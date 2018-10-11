package com.leo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leo.service.TodoService;
import com.leo.viewModel.Pager;
import com.leo.dto.Todo;

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
	final int TODO_PAGE_SIZE = 3;

	
	@Autowired
    private TodoService todoService;
	
	@RequestMapping(path = "", method = RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		
		return "todo/index";
	}

	@ResponseBody
	@RequestMapping(path = "getList", method = RequestMethod.GET)
	public Pager<Todo> getList(String keywords, Integer pageIndex, Model model, HttpSession session) {

		if (pageIndex == null || pageIndex == 0) {
			pageIndex = 1;
		}

		return todoService.getAllTodos(keywords, TODO_PAGE_SIZE, pageIndex);
		
	}

	@RequestMapping(path = "/addPage", method = RequestMethod.GET)
	public String Add(HttpSession session) {
		return "todo/add";
	}

	@RequestMapping(path = "/add", method = RequestMethod.POST)
	public String Add(Todo todo, HttpSession session) {
		System.out.println(todo.getId());
		todoService.addTodo(todo);
		System.out.println(todo.getId());
		return "redirect:/todo";
	}

	
	@RequestMapping(path = "/editPage", method = RequestMethod.GET)
	public String editPage(int id, Model model,  HttpSession session) {
		Todo current = todoService.getTodo(id);
		model.addAttribute("todo", current);
		return "todo/edit";
	}
	
	@RequestMapping(path = "/edit", method = RequestMethod.POST)
	public String edit(Todo todo, Model model,  HttpSession session) {
		todoService.updateTodo(todo);
		
		return "redirect:/todo";
	}
	
	@ResponseBody
	@RequestMapping(path = "/delete", method = RequestMethod.POST)
	public Boolean Delete(int id, HttpSession session) {
//		List<Todo> todoList = getTodoList();
//		for (int i = 0; i < todoList.size(); i++) {
//			Todo current = todoList.get(i);
//			if (current.getId() == id) {
//				todoList.remove(current);
//			}
//		}

		return true;
	}

}