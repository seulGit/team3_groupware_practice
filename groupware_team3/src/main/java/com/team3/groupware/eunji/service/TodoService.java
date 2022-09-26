package com.team3.groupware.eunji.service;

import java.util.List;
import java.util.Map;

import com.team3.groupware.eunji.model.TodoVO;

public interface TodoService {

	List<TodoVO> todo_board_list(Map<String, Object> map);

	void todo_insert(Map<String, Object> map);

	TodoVO todo_board_New(Map<String, Object> map);



}
