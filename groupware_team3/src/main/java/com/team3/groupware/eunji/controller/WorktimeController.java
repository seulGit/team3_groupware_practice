package com.team3.groupware.eunji.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.eunji.model.WorktimeVO;
import com.team3.groupware.eunji.service.WorktimeService;

@RestController
public class WorktimeController {

	@Inject
	WorktimeService worktimeService;
	
	// 근태관리 홈
	@GetMapping("/worktime")
	public ModelAndView worktime(WorktimeVO worktimeVo) {
		Map<String, Object> worktimeMap = worktimeService.select_vacation_days(worktimeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("worktimeMap", worktimeMap);
		mv.setViewName("/eunji/worktime/worktime");
		return mv;
	}
	
	// worktime 메인에서 출퇴근 현황 버튼 클릭 시 데이터가 출퇴근 현황 페이지에 출력될 수 있도록 
	@PostMapping("/worktime")
	public ModelAndView worktimeVies(WorktimeVO worktimeVo) {
		Map<String, Object> worktimeMap = new HashMap<>();
		worktimeMap.put("worktime_go", worktimeVo.getWorktime_go());
		worktimeMap.put("worktime_out", worktimeVo.getWorktime_out());
		
		// 값이 있을 때 데이터 입력
		if(worktimeMap.values() != null) {
			worktimeService.insert(worktimeVo);
			return new ModelAndView("redirect:/worktime");
		// 값이 없을 때 데이터 입력 안됨
		} else {
			return new ModelAndView();
		}
		
	}
	
	// 출퇴근 현황
	@GetMapping("/worktime_view")
	public ModelAndView worktimeView() {
		ModelAndView mv = new ModelAndView();
		List<WorktimeVO> list = worktimeService.worktime_view_select();
		mv.addObject("worktime_view_list", list);
		mv.setViewName("/eunji/worktime/worktime_view");
		return mv;
	}
	
	// 휴가계 신청
	@GetMapping("/worktime_new")
	public ModelAndView worktimeNew(EmployeeVO employeeVo) {
		Map<String, Object> WorktimeNameMap = worktimeService.select_worktime_new_name(employeeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("WorktimeNameMap", WorktimeNameMap);
		mv.setViewName("/eunji/worktime/worktime_new");
		return mv;
	}
	
	
	// 승인 대기중
	@GetMapping("/worktime_wait")
	public ModelAndView worktimeWait() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/eunji/worktime/worktime_wait");
		return mv;
	}
	
	// 진행준 문서
	@GetMapping("/worktime_ing")
	public ModelAndView worktimeIng() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/eunji/worktime/worktime_ing");
		return mv;
	}
	
	// 완료문서
	@GetMapping("/worktime_end")
	public ModelAndView worktimeEnd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/eunji/worktime/worktime_end");
		return mv;
	}
	
	// 휴가계 신청 조직도 클릭 시 ajax
	@PostMapping("/worktime_dept")
	public ModelAndView deptList(@RequestBody Map<String, Object> map) {
		System.out.println(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", worktimeService.dept_name_list(map));
		mv.setViewName("/eunji/worktime/worktime_deptList");
		System.out.println(mv);
		return mv;
	}
	
}
