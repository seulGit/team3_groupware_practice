package com.team3.groupware.seongyu.service;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.seongyu.model.BookingVO;

import java.util.List;
import java.util.Map;

public interface BookingServce {
    List<BookingVO> bookingList();

    int bookingDateChange(Map<String, Object> map);

    int delete(Map<String, Object> map);

    int insert(Map<String, Object> param);

    List<EmployeeVO> emp_num_name_select();

    int booking_event_change(Map<String, Object> map);
}
