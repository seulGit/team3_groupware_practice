package com.team3.groupware.common.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	
	@Autowired 
	SqlSessionTemplate SqlSessionTemplate;
	
	// 사원테이블에서 사원 리스트 가져와서 모달창에 보여주기
	@Override
	public List<EmployeeVO> writeAddress(Map<String, Object> empMap) {
		
		List<EmployeeVO> empList = SqlSessionTemplate.selectList("note.findList", empMap);
		return empList;
	}	

}
