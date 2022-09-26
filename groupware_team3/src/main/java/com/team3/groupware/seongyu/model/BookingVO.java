package com.team3.groupware.seongyu.model;

public class BookingVO {
    private int booking_num;
    private String meetingroom_num;
    private String fixtures_num;
    private int emp_num;
    private String booking_attendees;
    private String booking_start_date;
    private String booking_end_date;
    private String booking_title;
    private String booking_color;
    private String booking_memo;

    public int getBooking_num() {
        return booking_num;
    }

    public void setBooking_num(int booking_num) {
        this.booking_num = booking_num;
    }

    public String getMeetingroom_num() {
        return meetingroom_num;
    }

    public void setMeetingroom_num(String meetingroom_num) {
        this.meetingroom_num = meetingroom_num;
    }

    public String getFixtures_num() {
        return fixtures_num;
    }

    public void setFixtures_num(String fixtures_num) {
        this.fixtures_num = fixtures_num;
    }

    public int getEmp_num() {
        return emp_num;
    }

    public void setEmp_num(int emp_num) {
        this.emp_num = emp_num;
    }

    public String getBooking_attendees() {
        return booking_attendees;
    }

    public void setBooking_attendees(String booking_attendees) {
        this.booking_attendees = booking_attendees;
    }

    public String getBooking_start_date() {
        return booking_start_date;
    }

    public void setBooking_start_date(String booking_start_date) {
        this.booking_start_date = booking_start_date;
    }

    public String getBooking_end_date() {
        return booking_end_date;
    }

    public void setBooking_end_date(String booking_end_date) {
        this.booking_end_date = booking_end_date;
    }

    public String getBooking_title() {
        return booking_title;
    }

    public void setBooking_title(String booking_title) {
        this.booking_title = booking_title;
    }

    public String getBooking_color() {
        return booking_color;
    }

    public void setBooking_color(String booking_color) {
        this.booking_color = booking_color;
    }

    public String getBooking_memo() {
        return booking_memo;
    }

    public void setBooking_memo(String booking_memo) {
        this.booking_memo = booking_memo;
    }

    @Override
    public String toString() {
        return "BookingVO{" +
                "booking_num=" + booking_num +
                ", meetingroom_num=" + meetingroom_num +
                ", fixtures_num=" + fixtures_num +
                ", emp_num=" + emp_num +
                ", booking_attendees='" + booking_attendees + '\'' +
                ", booking_start_date='" + booking_start_date + '\'' +
                ", booking_end_date='" + booking_end_date + '\'' +
                ", booking_title='" + booking_title + '\'' +
                ", booking_color='" + booking_color + '\'' +
                ", booking_memo='" + booking_memo + '\'' +
                '}';
    }
}
