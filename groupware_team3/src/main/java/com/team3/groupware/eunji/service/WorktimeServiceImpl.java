package com.team3.groupware.eunji.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.eunji.model.WorktimeDAO;
import com.team3.groupware.eunji.model.WorktimeVO;

@Service
public class WorktimeServiceImpl implements WorktimeService {
	
	@Inject
	WorktimeDAO worktimeDao;

	@Override
	public void insert(WorktimeVO worktimeVo) {
		
		this.worktimeDao.insert(worktimeVo);
	}

	@Override
	public List<WorktimeVO> worktime_view_select() {
		// TODO Auto-generated method stub
		return worktimeDao.worktime_view_select();
	}

	
	@Override
	public Map<String, Object> select_vacation_days(WorktimeVO worktimeVo) {
		
		return worktimeDao.select_vacation_days(worktimeVo);
	}

	// ajax 연결 list 오버라이드
	@Override
	public List<EmployeeVO> dept_name_list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return worktimeDao.dept_name_list(map);
	}

	@Override
	public Map<String, Object> select_worktime_new_name(EmployeeVO employeeVo) {
		// TODO Auto-generated method stub
		return worktimeDao.select_worktime_new_name(employeeVo);
	}






}
