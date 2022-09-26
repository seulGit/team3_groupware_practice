package com.team3.groupware.eunji.model;

public class TodoVO {

	// todo(할일) 테이블
	private int todo_num;            // todo 번호
	private String todo_title;       // todo 제목
	private String todo_contents;    // todo 내용
	private boolean todo_favorite;   // todo 즐겨찾기
	private int emp_num;		     // 사원번호
	

	// todo getter, setter 
	public int getTodo_num() {
		return todo_num;
	}


	public void setTodo_num(int todo_num) {
		this.todo_num = todo_num;
	}


	public String getTodo_title() {
		return todo_title;
	}


	public void setTodo_title(String todo_title) {
		this.todo_title = todo_title;
	}


	public String getTodo_contents() {
		return todo_contents;
	}


	public void setTodo_contents(String todo_contents) {
		this.todo_contents = todo_contents;
	}


	public boolean isTodo_favorite() {
		return todo_favorite;
	}


	public void setTodo_favorite(boolean todo_favorite) {
		this.todo_favorite = todo_favorite;
	}


	public int getEmp_num() {
		return emp_num;
	}


	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	// todo toString()
	@Override
	public String toString() {
		return "TodoVO [todo_num=" + todo_num + ", todo_title=" + todo_title + ", todo_contents=" + todo_contents
				+ ", todo_favorite=" + todo_favorite + ", emp_num=" + emp_num + "]";
	}
	
	

	
}
