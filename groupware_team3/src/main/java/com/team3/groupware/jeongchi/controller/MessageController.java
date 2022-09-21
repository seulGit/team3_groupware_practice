package com.team3.groupware.jeongchi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.common.service.EmployeeService;
import com.team3.groupware.jeongchi.model.MessageVO;
import com.team3.groupware.jeongchi.service.MessageService;

@RestController
public class MessageController {

	@Autowired
	MessageService messageService;
	
	@Autowired
	EmployeeService empService;
	
// 보내기 버튼 눌렀을 때 DB에 저장  //
	@GetMapping("/message/write")
	public ModelAndView write() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jeongchi/message/message_write");
		return mv;
	}
	
	@PostMapping("/message/write")
	public ModelAndView write(MessageVO messageVo, HttpServletRequest request) {
//		System.out.println(request.getParameter("contents"));
//		System.out.println(noteVo);
		messageService.write(messageVo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/message/write");
		return mv;
	}

// === 쪽지함의 쪽지쓰기의 주소록에서 조직 클릭한 경우(ajax) === //
	@GetMapping("/message/writeAddress.os")
	public List<EmployeeVO> writeAddress(HttpServletRequest request) {
//		public List<EmployeeDTO> writeAddress(@RequestParam List<EmployeeDTO> empMap) {
		String dept_code = request.getParameter("dept_code");
		// System.out.println("모달창에서 클릭한 부서 번호 ==> " + fk_dept_no);
		Map<String, Object> empMap = new HashMap<>();
		empMap.put("dept_code", dept_code);
		
		// 부서에 따른 사원조회
		List<EmployeeVO> empList = empService.writeAddress(empMap);
				
//		JSONArray jsonArr = new JSONArray();
//		
//		if(empList != null) {
//			for (EmployeeVO empVo : empList) {
//				JSONObject jsonObj = new JSONObject();
//				jsonObj.put("emp_name", empVo.getEmp_name());
//				jsonObj.put("position_grade", empVo.getPosition_grade());    
//				jsonObj.put("dept_name", empVo.getDept_name());
//				jsonObj.put("emp_num", empVo.getEmp_num());
//
//				jsonArr.put(jsonObj);
//			}
//		}
//		return jsonArr.toString();
		return empList;
	}
	
	// 보낸쪽지함 띄우기 //
	@GetMapping("/message/message_send")
	public ModelAndView sendMessage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jeongchi/message/message_send");
		return mv;
	}
}