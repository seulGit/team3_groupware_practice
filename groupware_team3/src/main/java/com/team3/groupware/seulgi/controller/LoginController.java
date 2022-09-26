package com.team3.groupware.seulgi.controller;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.seulgi.model.LoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    LoginDAO loginDao;

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value="/login_check", method= RequestMethod.POST)
    public ModelAndView loginPost(EmployeeVO vo, HttpSession session, ModelAndView mv) {
        System.out.println("컨트롤러 실행");
        EmployeeVO emp_info = loginDao.login_check(vo);
//        System.out.println(emp_info.getAuth_code());
//        System.out.println(session);
//        System.out.println(mv);


        //로그인 정보가 DB와 일치하는지 확인
        if(emp_info != null) { //일치할 시}
            session.setAttribute("emp_num", emp_info.getEmp_num());
            session.setAttribute("auth_code", emp_info.getAuth_code()); //권한별 사이드메뉴바 항목 구분을 위해 auth_code 받아놓음
            mv.addObject("emp_num", emp_info.getEmp_num());
            mv.addObject("auth_code", emp_info.getAuth_code());
            mv.addObject("message", "success");

            //권한 확인(일반 Or 관리자)
            if(emp_info.getAuth_code().equals("normal")) {
                mv.setViewName("/main");
                return mv;
            }
            else if(emp_info.getAuth_code().equals("admin")) {
                mv.setViewName("/main_admin");
                return mv;
            }
        }
        else if(emp_info == null){ //불일치할 시
            mv.addObject("message", "error");
            mv.setViewName("/login");
            System.out.println(mv);
        }
        return mv;
    }

}
