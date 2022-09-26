package com.team3.groupware.common.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {
   
   @GetMapping("/main")
   public ModelAndView main() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("/main");
      return mv;
   }

}