package com.team3.groupware.jeongchi.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.groupware.jeongchi.model.MessageDAO;
import com.team3.groupware.jeongchi.model.MessageVO;


@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDao;
	
	// 쪽지테이블에 첨부파일이 없는 쪽지 insert 하기
	@Override
	public void write(MessageVO messageVo) {
		// TODO Auto-generated method stub
		messageDao.write(messageVo);
	}

}
