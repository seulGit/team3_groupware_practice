package com.team3.groupware.seongyu.service;

import com.team3.groupware.seongyu.model.CalendarDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CalendarServiceImpl implements CalendarService {

    @Autowired
    CalendarDAO calendarDAO;

    @Override
    public int insert(Map<String, Object> map){
        System.out.println("서비스 진입 성공");
        int rowCnt = this.calendarDAO.insert(map);
        System.out.println("DAO 반환 성공");
        if(rowCnt == 1){
            return rowCnt;
        }
        return 0;
    }

    @Override
    public List<Map<String, Object>> selectList(){
        return this.calendarDAO.selectList();
    }

    @Override
    public int delete(Map<String, Object> map) {
        this.calendarDAO.delete(map);
        return 0;
    }

    @Override
    public int calendarDateChange(Map<String, Object> map) {
        this.calendarDAO.DateChange(map);
        return 0;
    }

    @Override
    public void calendarChange(Map<String, Object> map) {
        this.calendarDAO.Change(map);
    }
}
