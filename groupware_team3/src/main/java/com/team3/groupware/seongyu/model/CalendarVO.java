package com.team3.groupware.seongyu.model;

public class CalendarVO {

     private int calendar_num;
     private String calendar_start_date;
     private String calendar_end_date;
     private String calendar_title;
     private String calendar_memo;
     private int emp_num;
     private String calendar_color;

    public int getCalendar_num() {
        return calendar_num;
    }

    public void setCalendar_num(int calendar_num) {
        this.calendar_num = calendar_num;
    }

    public String getCalendar_start_date() {
        return calendar_start_date;
    }

    public void setCalendar_start_date(String calendar_start_date) {
        this.calendar_start_date = calendar_start_date;
    }

    public String getCalendar_end_date() {
        return calendar_end_date;
    }

    public void setCalendar_end_date(String calendar_end_date) {
        this.calendar_end_date = calendar_end_date;
    }

    public String getCalendar_title() {
        return calendar_title;
    }

    public void setCalendar_title(String calendar_title) {
        this.calendar_title = calendar_title;
    }

    public String getCalendar_memo() {
        return calendar_memo;
    }

    public void setCalendar_memo(String calendar_memo) {
        this.calendar_memo = calendar_memo;
    }

    public int getEmp_num() {
        return emp_num;
    }

    public void setEmp_num(int emp_num) {
        this.emp_num = emp_num;
    }

    public String getCalendar_color() {
        return calendar_color;
    }

    public void setCalendar_color(String calendar_color) {
        this.calendar_color = calendar_color;
    }

    @Override
    public String toString(){
        return "CalendarVO [Calendar_num = " + calendar_num + ", calendar_start_date = " + calendar_start_date
                + ", calendar_end_date = " + calendar_end_date + ", calendar_title = " + calendar_title
                + ", calendar_memo = " + calendar_memo + ", emp_num = " + emp_num
                + "calendar_color = " + calendar_color + "]";
    }
}
