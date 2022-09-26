package com.team3.groupware.eunji.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TodoDAOImpl implements TodoDAO {

	@Inject
	SqlSessionTemplate session;
	
	@Override
	public void todo_insert(Map<String, Object> map) {
		this.session.insert("todo.todo_write", map);
		
	}
	
	@Override
	public List<TodoVO> todo_board_list(Map<String, Object> map) {
		return session.selectList("todo.todo_board_list", map);
	}

	@Override
	public TodoVO todo_board_NEW(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("todo.todo_New_select", map);
	}



}
