package com.team3.groupware.eunji.model;

import java.util.Date;

public class WorktimeVO {

	// vacation_docu(휴가문서) 테이블
	private int vacation_docu_num;			  // 문서 번호
	private String vacation_docu_category;	  // 문서 종류
	private int emp_num;					  // 사원번호
	private Date vacation_docu_date;		  // 작성일
	private String vacation_docu_file_route;  // 첨부파일경로
	private boolean vacation_docu_cancel;     // 취소 여부
	private String vacation_docu_title;		  // 제목
	private String vacation_docu_contents;	  // 내용
	private Date vacation_start_datetime;	  // 휴가시작일시
	private Date vacation_end_datetime;		  // 휴가종료일시
	private int vacation_day_count;			  // 사용일수
	
	// worktime(출퇴근정보) 테이블
	private Date workdate;					  // 근무일자
	private String worktime_go;				  // 출근시간
	private String worktime_out;			  // 퇴근시간
	private String worktime_hours;  		  // 총업무시간
	
	// worktime_days(내연차정보) 테이블
	private int ussed_count; 				  // 사용연차일수
	private int available_count;              // 잔여연차일수

	
	// vacation_approval(근태결재라인) 테이블
	private String vacation_approval_emp_1;   // 결재자1
	private Date vacation_approval_date_1;    // 결재일자1
	private boolean vacation_approval_1;      // 승인1
	private String vacation_approval_emp_2;   // 결재자2
	private Date vacation_approval_date_2;    // 결재일자2
	private boolean vacation_approval_2;      // 승인2
	


	// getter, setter
	public int getVacation_docu_num() {
		return vacation_docu_num;
	}


	public void setVacation_docu_num(int vacation_docu_num) {
		this.vacation_docu_num = vacation_docu_num;
	}


	public String getVacation_docu_category() {
		return vacation_docu_category;
	}


	public void setVacation_docu_category(String vacation_docu_category) {
		this.vacation_docu_category = vacation_docu_category;
	}


	public Date getVacation_docu_date() {
		return vacation_docu_date;
	}


	public void setVacation_docu_date(Date vacation_docu_date) {
		this.vacation_docu_date = vacation_docu_date;
	}


	public String getVacation_docu_file_route() {
		return vacation_docu_file_route;
	}


	public void setVacation_docu_file_route(String vacation_docu_file_route) {
		this.vacation_docu_file_route = vacation_docu_file_route;
	}


	public boolean isVacation_docu_cancel() {
		return vacation_docu_cancel;
	}


	public void setVacation_docu_cancel(boolean vacation_docu_cancel) {
		this.vacation_docu_cancel = vacation_docu_cancel;
	}


	public String getVacation_docu_title() {
		return vacation_docu_title;
	}


	public void setVacation_docu_title(String vacation_docu_title) {
		this.vacation_docu_title = vacation_docu_title;
	}


	public String getVacation_docu_contents() {
		return vacation_docu_contents;
	}


	public void setVacation_docu_contents(String vacation_docu_contents) {
		this.vacation_docu_contents = vacation_docu_contents;
	}


	public Date getVacation_start_datetime() {
		return vacation_start_datetime;
	}


	public void setVacation_start_datetime(Date vacation_start_datetime) {
		this.vacation_start_datetime = vacation_start_datetime;
	}


	public Date getVacation_end_datetime() {
		return vacation_end_datetime;
	}


	public void setVacation_end_datetime(Date vacation_end_datetime) {
		this.vacation_end_datetime = vacation_end_datetime;
	}


	public int getVacation_day_count() {
		return vacation_day_count;
	}


	public void setVacation_day_count(int vacation_day_count) {
		this.vacation_day_count = vacation_day_count;
	}


	public int getEmp_num() {
		return emp_num;
	}


	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}


	public Date getWorkdate() {
		return workdate;
	}


	public void setWorkdate(Date workdate) {
		this.workdate = workdate;
	}


	public String getWorktime_go() {
		return worktime_go;
	}


	public void setWorktime_go(String worktime_go) {
		this.worktime_go = worktime_go;
	}


	public String getWorktime_out() {
		return worktime_out;
	}


	public void setWorktime_out(String worktime_out) {
		this.worktime_out = worktime_out;
	}


	public String getWorktime_hours() {
		return worktime_hours;
	}


	public void setWorktime_hours(String worktime_hours) {
		this.worktime_hours = worktime_hours;
	}


	public int getUssed_count() {
		return ussed_count;
	}


	public void setUssed_count(int ussed_count) {
		this.ussed_count = ussed_count;
	}


	public int getAvailable_count() {
		return available_count;
	}


	public void setAvailable_count(int available_count) {
		this.available_count = available_count;
	}


	public String getVacation_approval_emp_1() {
		return vacation_approval_emp_1;
	}


	public void setVacation_approval_emp_1(String vacation_approval_emp_1) {
		this.vacation_approval_emp_1 = vacation_approval_emp_1;
	}


	public Date getVacation_approval_date_1() {
		return vacation_approval_date_1;
	}


	public void setVacation_approval_date_1(Date vacation_approval_date_1) {
		this.vacation_approval_date_1 = vacation_approval_date_1;
	}


	public boolean isVacation_approval_1() {
		return vacation_approval_1;
	}


	public void setVacation_approval_1(boolean vacation_approval_1) {
		this.vacation_approval_1 = vacation_approval_1;
	}


	public String getVacation_approval_emp_2() {
		return vacation_approval_emp_2;
	}


	public void setVacation_approval_emp_2(String vacation_approval_emp_2) {
		this.vacation_approval_emp_2 = vacation_approval_emp_2;
	}


	public Date getVacation_approval_date_2() {
		return vacation_approval_date_2;
	}


	public void setVacation_approval_date_2(Date vacation_approval_date_2) {
		this.vacation_approval_date_2 = vacation_approval_date_2;
	}


	public boolean isVacation_approval_2() {
		return vacation_approval_2;
	}


	public void setVacation_approval_2(boolean vacation_approval_2) {
		this.vacation_approval_2 = vacation_approval_2;
	}

	// worktime toStrint()
	@Override
	public String toString() {
		return "WorktimeVO [vacation_docu_num=" + vacation_docu_num + ", vacation_docu_category="
				+ vacation_docu_category + ", vacation_docu_date=" + vacation_docu_date + ", vacation_docu_file_route="
				+ vacation_docu_file_route + ", vacation_docu_cancel=" + vacation_docu_cancel + ", vacation_docu_title="
				+ vacation_docu_title + ", vacation_docu_contents=" + vacation_docu_contents
				+ ", vacation_start_datetime=" + vacation_start_datetime + ", vacation_end_datetime="
				+ vacation_end_datetime + ", vacation_day_count=" + vacation_day_count + ", emp_num=" + emp_num
				+ ", workdate=" + workdate + ", worktime_go=" + worktime_go + ", worktime_out=" + worktime_out
				+ ", worktime_hours=" + worktime_hours + ", ussed_count=" + ussed_count + ", available_count="
				+ available_count + ", vacation_approval_emp_1=" + vacation_approval_emp_1
				+ ", vacation_approval_date_1=" + vacation_approval_date_1 + ", vacation_approval_1="
				+ vacation_approval_1 + ", vacation_approval_emp_2=" + vacation_approval_emp_2
				+ ", vacation_approval_date_2=" + vacation_approval_date_2 + ", vacation_approval_2="
				+ vacation_approval_2 + "]";
	}
	
	
}
