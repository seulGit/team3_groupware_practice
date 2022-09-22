package com.team3.groupware.seongyu.controller;

import com.team3.groupware.seongyu.service.CalendarService;
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
public class calendarController {

	@Autowired
	CalendarService CalendarService;

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public ModelAndView view() {
		System.out.println("===============================페이지 로드 성공===============================");
		return new ModelAndView("../views/seongyu/calendar/calendar");
	}

	@RequestMapping(value = "calendarList", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray calendarList() {
		List<Map<String, Object>> list = this.CalendarService.selectList();

		HashMap<String, Object> map = new HashMap<String, Object>();

		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();


		for(int i = 0; i < list.size(); i++){
			map.put("id", list.get(i).get("calendar_num"));
			map.put("title", list.get(i).get("calendar_title"));
			map.put("start", list.get(i).get("calendar_start_date"));
			map.put("end", list.get(i).get("calendar_end_date"));
			map.put("backgroundColor", list.get(i).get("calendar_color"));
			HashMap<String, Object> extendedProps = new HashMap<String, Object>();
			extendedProps.put("content", list.get(i).get("calendar_memo"));
			map.put("extendedProps", extendedProps);

			jsonObj = new JSONObject(map);
			System.out.println("===============================jsonObj" + i + "번째==================================");
			jsonArr.add(jsonObj);
			System.out.println(jsonObj);
		}
		return jsonArr;
	}

	@RequestMapping(value = "/calendarAdd", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView calendarAdd(@RequestParam Map<String, Object> param){

		ModelAndView mav = new ModelAndView();

		System.out.println("======================================이벤트 추가======================================");
		System.out.println(param);
		System.out.println("======================================이벤트 추가======================================");

		this.CalendarService.insert(param);

		mav.setViewName("redirect:/calendarList");
		return mav;
	}

	@RequestMapping(value = "/calendarDelete", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView calendarRemove(@RequestParam Map<String, Object> map){
		ModelAndView mv = new ModelAndView();
		System.out.println("======================================이벤트 삭제======================================");
		System.out.println(map);
		System.out.println("======================================이벤트 삭제======================================");

		this.CalendarService.delete(map);
		mv.setViewName("redirect:/calendarList");
		return mv;
	}

	@RequestMapping(value = "/calendarDateChange", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView calendarDateChange (@RequestParam Map<String, Object> map){
		ModelAndView mv = new ModelAndView();

		System.out.println("======================================이벤트 일시 변경======================================");
		System.out.println(map);
		System.out.println("======================================이벤트 일시 변경======================================");
		
		this.CalendarService.calendarDateChange(map);

		mv.setViewName("redirect:/calendarList");
		return mv;
	}

	@RequestMapping(value = "/calendarChange", method = RequestMethod.POST)
	public ModelAndView calendarChange (@RequestParam Map<String, Object> map){
		ModelAndView mv = new ModelAndView();

		System.out.println("======================================이벤트 내용 수정======================================");
		System.out.println(map);
		System.out.println("======================================이벤트 내용 수정======================================");

		this.CalendarService.calendarChange(map);

		mv.setViewName("redirect:/calendarList");
		return mv;
	}

}
