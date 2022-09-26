package com.team3.groupware.eunji.service;

import java.util.List;
import java.util.Map;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.eunji.model.WorktimeVO;

public interface WorktimeService {

	void insert(WorktimeVO worktimeVo);
	
	List<WorktimeVO> worktime_view_select();
	
	Map<String, Object> select_vacation_days(WorktimeVO worktimeVo);

	// ajax 연결 list
	List<EmployeeVO> dept_name_list(Map<String, Object> map);

	Map<String, Object> select_worktime_new_name(EmployeeVO employeeVo);

	

	
	
	

	

}
