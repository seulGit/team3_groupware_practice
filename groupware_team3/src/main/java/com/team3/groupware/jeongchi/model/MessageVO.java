package com.team3.groupware.jeongchi.model;

import java.util.Date;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class MessageVO {

	private int message_num;            // 편지번호

	private int message_important;      // 중요편지
	@NotNull
	@Pattern(regexp="/^[가-힣]*$/", message="한글만 입력가능합니다")
	private String message_sender;      // 보낸사람
	@NotNull
	@Pattern(regexp="/^[가-힣]*$/", message="한글만 입력가능합니다")
	private String message_receiver;    // 받는사람
	@NotNull
	private String message_title;       // 쪽지 제목
	private String message_contents;    // 쪽지 내용
	@NotNull
	private Date message_datetime;      // 작성일시
	private String message_file_route;  // 첨부파일 경로

	private int message_read;           // 내가읽은쪽지

	private String message_type;        // 쪽지종류

	private int message_delete_check;   // 삭제여부
	@NotNull
	private int emp_num;                // 사원번호
	@Future(message="예약시간을 확인해주세요")
	private Date message_reserved_datetime;  // 예약 시간설정
	

//	private Boolean note_important;				// 중요도(중요한 파일인지 아닌지 여부, 중요함 체크 : 1, 아니면 0)
//	private Boolean note_reservation_status;	// 예약여부(예약 발송 여부 , 예약발송 : 1, 일반발송 : 0)
//	private Boolean note_read_status;			// 열람여부(쪽지 수신여부, 읽었으면 : 1, 안읽었으면 : 0)
//	private String note_write_date;			// 작성시간
//	private String note_reservation_date;   // 예약 설정 시간(null 허용)
	
//	private String emp_name;				// employeeVO에 있는 이름 가져오기(받은 편지함에서 보낸 사원번호에 해당하는 이름 select 용)
//	private String dept_name_send;			// 쪽지 상세 조회시 보낸사원의 부서명을 알려주기 위한 select 용
//	private String dept_name_receive;		// 쪽지 상세 조회시 받은사원의 부서명을 알려주기 위한 select 용

//	private int note_send_del_status;       // 쪽지 삭제 시 필요한 보낸 사원 삭제 여부 select 용
//	private int note_receive_del_status;    // 쪽지 삭제 시 필요한 받은 사원 삭제 여부 select 용

	
	
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public int getMessage_important() {
		return message_important;
	}
	public void setMessage_important(int message_important) {
		this.message_important = message_important;
	}
	public String getMessage_sender() {
		return message_sender;
	}
	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}
	public String getMessage_receiver() {
		return message_receiver;
	}
	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_contents() {
		return message_contents;
	}
	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}
	public Date getMessage_datetime() {
		return message_datetime;
	}
	public void setMessage_datetime(Date message_datetime) {
		this.message_datetime = message_datetime;
	}
	public String getMessage_file_route() {
		return message_file_route;
	}
	public void setMessage_file_route(String message_file_route) {
		this.message_file_route = message_file_route;
	}
	public int getMessage_read() {
		return message_read;
	}
	public void setMessage_read(int message_read) {
		this.message_read = message_read;
	}
	public String getMessage_type() {
		return message_type;
	}
	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}
	public int getMessage_delete_check() {
		return message_delete_check;
	}
	public void setMessage_delete_check(int message_delete_check) {
		this.message_delete_check = message_delete_check;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public Date getMessage_reserved_datetime() {
		return message_reserved_datetime;
	}
	public void setMessage_reserved_datetime(Date message_reserved_datetime) {
		this.message_reserved_datetime = message_reserved_datetime;
	}
	@Override
	public String toString() {
		return "NoteVO [message_num=" + message_num + ", message_important=" + message_important + ", message_sender="
				+ message_sender + ", message_receiver=" + message_receiver + ", message_title=" + message_title
				+ ", message_contents=" + message_contents + ", message_datetime=" + message_datetime
				+ ", message_file_route=" + message_file_route + ", message_read=" + message_read + ", message_type="
				+ message_type + ", message_delete_check=" + message_delete_check + ", emp_num=" + emp_num
				+ ", message_reserved_datetime=" + message_reserved_datetime + "]";
	}

}