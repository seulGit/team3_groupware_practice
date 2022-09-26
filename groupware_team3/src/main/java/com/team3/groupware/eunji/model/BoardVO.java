package com.team3.groupware.eunji.model;

import java.util.Date;

public class BoardVO {

	// board(게시판) 테이블
	private int  board_num; 		 	  // 게시판 번호
	private String board_title;      	  // 게시판 제목
	private String board_contents;   	  // 게시판 내용
	private Date board_write_date;   	  // 작성일
	private int board_view_count;    	  // 조회수
	private boolean board_fix_check; 	  // 수정하기
	private boolean board_delete_check;   // 삭제하기
	private String board_file_route;      // 게시판 첨부파일경로
	
	// board_category(게시판 항목) 테이블
	private int board_category_num;       // 게시판 항목 번호
	private String board_catgory_subject; // 게시판 항목 이름
	
	// board_comment(게시판 댓글) 테이블
	private int comment_num;              // 댓글번호
	private int emp_num;                  // 사원번호  key연결 안되있는데 erd클라우드 확인 필요!!
	private Date comment_date;            // 작성일
	private String comment_contents;      // 내용
	private boolean comment_fix_check;    // 수정하기
	private boolean comment_delete_check; // 삭제하기
	
	
	// getter, setter
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_contents() {
		return board_contents;
	}
	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}
	public Date getBoard_write_date() {
		return board_write_date;
	}
	public void setBoard_write_date(Date board_write_date) {
		this.board_write_date = board_write_date;
	}
	public int getBoard_view_count() {
		return board_view_count;
	}
	public void setBoard_view_count(int board_view_count) {
		this.board_view_count = board_view_count;
	}
	public boolean isBoard_fix_check() {
		return board_fix_check;
	}
	public void setBoard_fix_check(boolean board_fix_check) {
		this.board_fix_check = board_fix_check;
	}
	public boolean isBoard_delete_check() {
		return board_delete_check;
	}
	public void setBoard_delete_check(boolean board_delete_check) {
		this.board_delete_check = board_delete_check;
	}
	public String getBoard_file_route() {
		return board_file_route;
	}
	public void setBoard_file_route(String board_file_route) {
		this.board_file_route = board_file_route;
	}
	public int getBoard_category_num() {
		return board_category_num;
	}
	public void setBoard_category_num(int board_category_num) {
		this.board_category_num = board_category_num;
	}
	public String getBoard_catgory_subject() {
		return board_catgory_subject;
	}
	public void setBoard_catgory_subject(String board_catgory_subject) {
		this.board_catgory_subject = board_catgory_subject;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	public boolean isComment_fix_check() {
		return comment_fix_check;
	}
	public void setComment_fix_check(boolean comment_fix_check) {
		this.comment_fix_check = comment_fix_check;
	}
	public boolean isComment_delete_check() {
		return comment_delete_check;
	}
	public void setComment_delete_check(boolean comment_delete_check) {
		this.comment_delete_check = comment_delete_check;
	}
	
	// board toString()
	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_title=" + board_title + ", board_contents=" + board_contents
				+ ", board_write_date=" + board_write_date + ", board_view_count=" + board_view_count
				+ ", board_fix_check=" + board_fix_check + ", board_delete_check=" + board_delete_check
				+ ", board_file_route=" + board_file_route + ", board_category_num=" + board_category_num
				+ ", board_catgory_subject=" + board_catgory_subject + ", comment_num=" + comment_num + ", emp_num="
				+ emp_num + ", comment_date=" + comment_date + ", comment_contents=" + comment_contents
				+ ", comment_fix_check=" + comment_fix_check + ", comment_delete_check=" + comment_delete_check + "]";
	}
	
	
	
}
