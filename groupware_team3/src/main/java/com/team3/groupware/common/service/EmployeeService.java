package com.team3.groupware.common.service;

import java.util.List;
import java.util.Map;

import com.team3.groupware.common.model.EmployeeVO;

public interface EmployeeService {
	
	List<EmployeeVO> writeAddress(Map<String, Object> empMap);

}
