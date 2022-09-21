package com.team3.groupware.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.groupware.common.model.EmployeeDAO;
import com.team3.groupware.common.model.EmployeeVO;


@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDAO employeeDao;

	
	// 사원테이블에서 부서에 따른 사원 리스트 가져와서 모달창에 보여주기
	@Override
	public List<EmployeeVO> writeAddress(Map<String, Object> empMap) {
		List<EmployeeVO> empList = employeeDao.writeAddress(empMap);
		return empList;
	}

}
