package com.team3.groupware.seongyu.service;

import com.team3.groupware.seongyu.model.BookingDAO;
import com.team3.groupware.seongyu.model.BookingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BookingServiceImpl implements BookingServce{

    @Autowired
    BookingDAO bookingDAO;

    @Override
    public List<BookingVO> bookingList() {
        return bookingDAO.booking_List();
    }

    @Override
    public int bookingDateChange(Map<String, Object> map) {
        return bookingDAO.booking_date_change(map);
    }

    @Override
    public int delete(Map<String, Object> map) {
        return bookingDAO.booking_delete(map);
    }

    @Override
    public int insert(Map<String, Object> param) {
        return bookingDAO.booking_insert(param);
    }
}
