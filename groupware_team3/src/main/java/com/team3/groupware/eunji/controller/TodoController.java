package com.team3.groupware.eunji.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team3.groupware.eunji.model.TodoVO;
import com.team3.groupware.eunji.service.TodoService;

@Controller
public class TodoController {

	@Inject
	TodoService todoService;
	
	// todo
	@GetMapping("/todo")
	public ModelAndView todo(TodoVO todoVo, Map<String,Object> map) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("todoMapList",todoService.todo_board_list(map));
		mv.setViewName("/eunji/todo/todo");
		return mv;
	}

	/*
	 * @PostMapping("/todo") public ModelAndView todoWrite(TodoVO todoVo) {
	 * Map<String, Object> todoMap = new HashMap<>(); todoMap.put("todo_title",
	 * todoVo.getTodo_title()); todoMap.put("todo_contents",
	 * todoVo.getTodo_contents());
	 * 
	 * todoService.todo_insert(todoVo); ModelAndView mv = new ModelAndView();
	 * mv.addObject("todoMap", todoMap); mv.setViewName("/eunji/todo/todo_write");
	 * return mv;
	 */
		
		
//		// 글이 없을 때 todo모달 창 어떻게 그대로 있게하지?
//		if(todoMap.values() != null) {
//			return new ModelAndView("redirect:/todo");
//		} else {
//			return new ModelAndView();
//		}
		
		
	
	
	@PostMapping("/todo_list")
	public ModelAndView todoList(@RequestBody Map<String,Object> map) {
		todoService.todo_insert(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", todoService.todo_board_New(map));
		mv.setViewName("/eunji/todo/todo_write");
		System.out.println(mv);
		return mv;
	}
}
