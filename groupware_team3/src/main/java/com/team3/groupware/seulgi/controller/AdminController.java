package com.team3.groupware.seulgi.controller;

import com.team3.groupware.common.model.EmployeeDAO;
import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.common.service.EmployeeService;
import com.team3.groupware.seulgi.model.LoginDAO;
import com.team3.groupware.seulgi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    EmployeeService employeeService;

    @Autowired
    AdminService adminService;

    @GetMapping ("/admin/admin_personnelCard")
    public ModelAndView personnelCard() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/seulgi/admin/admin_personnelCard");
        return mv;
    }

    @GetMapping ("/admin/admin_personnelCardRegister")
    public ModelAndView personnelCardRegister() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/seulgi/admin/admin_personnelCardRegister");
        return mv;
    }



}
