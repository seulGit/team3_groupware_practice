package com.team3.groupware.jeongchi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class BoardNoticeController {
	
	@GetMapping("/board/board_notice")
	public ModelAndView board_notice() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jeongchi/board/board_notice");
		return mv;
	}

}
