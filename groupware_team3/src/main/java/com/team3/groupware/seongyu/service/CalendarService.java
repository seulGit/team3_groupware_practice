package com.team3.groupware.seongyu.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {
    int insert(Map<String, Object> map);

    List<Map<String, Object>> selectList();

    int delete(Map<String, Object> map);

    int calendarDateChange(Map<String, Object> map);

    void calendarChange(Map<String, Object> map);
}
