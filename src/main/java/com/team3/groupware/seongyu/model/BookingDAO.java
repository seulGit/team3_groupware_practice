package com.team3.groupware.seongyu.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BookingDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    public List<BookingVO> booking_List() {
        return sqlSessionTemplate.selectList("booking.booking_List");
    }

    public int booking_date_change(Map<String, Object> map) {
        return sqlSessionTemplate.update("booking.booking_date_change", map);
    }

    public int booking_delete(Map<String, Object> map) {
        return sqlSessionTemplate.delete("booking.booking_delete", map);
    }

    public int booking_insert(Map<String, Object> param) {
        return sqlSessionTemplate.insert("booking.booking_insert", param);
    }
}
