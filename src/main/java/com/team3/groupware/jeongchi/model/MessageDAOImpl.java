package com.team3.groupware.jeongchi.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired 
	SqlSessionTemplate SqlSessionTemplate;

	@Override
	public void write(MessageVO messageVo) {
		SqlSessionTemplate.insert("note.sendNote", messageVo);
	}
	
}
