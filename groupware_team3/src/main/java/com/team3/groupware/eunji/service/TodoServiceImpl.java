package com.team3.groupware.eunji.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.groupware.eunji.model.TodoDAO;
import com.team3.groupware.eunji.model.TodoVO;

@Service
public class TodoServiceImpl implements TodoService {

	@Inject
	TodoDAO todoDao;
	
	@Override
	public void todo_insert(Map<String, Object> map) {
		this.todoDao.todo_insert(map);
	}
	
	@Override
	public List<TodoVO> todo_board_list(Map<String, Object> map) {
		return todoDao.todo_board_list(map);
	}

	@Override
	public TodoVO todo_board_New(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return todoDao.todo_board_NEW(map);
	}

	

}
