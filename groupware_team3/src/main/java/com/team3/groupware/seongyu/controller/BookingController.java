package com.team3.groupware.seongyu.controller;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.seongyu.model.BookingVO;
import com.team3.groupware.seongyu.service.BookingServce;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookingController {

    @Autowired
    BookingServce bookingServce;

    @RequestMapping(value = "/booking", method = RequestMethod.GET)
    public ModelAndView booking_view(){
        ModelAndView mv = new ModelAndView();
        List<EmployeeVO> empList = bookingServce.emp_num_name_select();
        System.out.println(empList);
        mv.addObject("emp_info", empList);
        mv.setViewName("../views/seongyu/booking/booking");
        System.out.println(mv);
        return mv;
    }

    @RequestMapping(value = "bookingList", method = RequestMethod.GET)
    @ResponseBody
    public JSONArray booking_List(){
        List<BookingVO> list = bookingServce.bookingList();
        HashMap<String, Object> map = new HashMap<String, Object>();

        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();


        for(int i = 0; i < list.size(); i++){
            map.put("id", list.get(i).getBooking_num());
            map.put("title", list.get(i).getBooking_title());
            map.put("start", list.get(i).getBooking_start_date());
            map.put("end", list.get(i).getBooking_end_date());
            map.put("backgroundColor", list.get(i).getBooking_color());
            HashMap<String, Object> extendedProps = new HashMap<String, Object>();
            extendedProps.put("content", list.get(i).getBooking_memo());
            extendedProps.put("attendees", list.get(i).getBooking_attendees());
            extendedProps.put("meetingroom", list.get(i).getMeetingroom_num());
            extendedProps.put("fixtures_num", list.get(i).getFixtures_num());
            map.put("extendedProps", extendedProps);

            jsonObj = new JSONObject(map);
            System.out.println("===============================jsonObj" + (i + 1) + "번째==================================");
            jsonArr.add(jsonObj);
            System.out.println(jsonObj);
        }
        return jsonArr;
    }

    @RequestMapping(value = "/booking_add", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView booking_insert(@RequestParam Map<String, Object> param){

        ModelAndView mav = new ModelAndView();

        System.out.println("======================================이벤트 추가======================================");
        System.out.println(param);
        System.out.println("======================================이벤트 추가======================================");

        this.bookingServce.insert(param);

        mav.setViewName("redirect:/bookingList");
        return mav;
    }

    @RequestMapping(value = "/booking_delete", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView bookingRemove(@RequestParam Map<String, Object> map){
        ModelAndView mv = new ModelAndView();
        System.out.println("======================================이벤트 삭제======================================");
        System.out.println(map);
        System.out.println("======================================이벤트 삭제======================================");

        this.bookingServce.delete(map);
        mv.setViewName("redirect:/bookingList");
        return mv;
    }

    @RequestMapping(value = "/bookingDateChange", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView bookingDateChange(@RequestParam Map<String, Object> map){
        ModelAndView mv = new ModelAndView();

        System.out.println("=============================== 이벤트 일시 수정 ===============================");
        System.out.println(map);
        System.out.println("=============================== 이벤트 일시 수정 ===============================");

        this.bookingServce.bookingDateChange(map);
        mv.setViewName("redirect:/bookingList");
        return mv;
    }

    @RequestMapping(value = "/booking_event_change", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView booking_event_change(@RequestParam Map<String, Object> map){
        ModelAndView mv = new ModelAndView();

        System.out.println("=============================== 이벤트 정보 수정 ===============================");
        System.out.println(map);
        System.out.println("=============================== 이벤트 정보 수정 ===============================");

        this.bookingServce.booking_event_change(map);
        mv.setViewName("redirect:/bookingList");
        return mv;
    }
}
