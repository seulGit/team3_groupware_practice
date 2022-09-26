package com.team3.groupware.common.model;

import java.util.List;
import java.util.Map;

public interface EmployeeDAO {
	
	List<EmployeeVO> writeAddress(Map<String, Object> empMap);

}
