package com.team3.groupware.common.model;

import java.util.Date;

public class EmployeeVO {
	
	private int emp_num;  			// 사원번호
	private String auth_code;
	private String emp_name;  		// 사원명
	private String emp_pw;  		// 비밀번호
	private String emp_email;  		// 이메일
	private String emp_desk_num;  	// 회사전화번호
	private String emp_phonenum;  	// 휴대폰번호
	private String emp_address; 	// 주소
	private String emp_birth; 		// 생년월일
	private String emp_gender; 		// 성별
	private Date join_date;  		// 입사일
	private Date leave_date;  		// 퇴사일
	private boolean emp_active;
	private String dept_code;  		// 부서번호
	private String position_grade;  // 직급이름
	
	// message select용 
	private String dept_name;  		 // 부서명

	public int getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}

	public String getAuth_code() {
		return auth_code;
	}

	public void setAuth_code(String auth_code) {
		this.auth_code = auth_code;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_pw() {
		return emp_pw;
	}

	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getEmp_desk_num() {
		return emp_desk_num;
	}

	public void setEmp_desk_num(String emp_desk_num) {
		this.emp_desk_num = emp_desk_num;
	}

	public String getEmp_phonenum() {
		return emp_phonenum;
	}

	public void setEmp_phonenum(String emp_phonenum) {
		this.emp_phonenum = emp_phonenum;
	}

	public String getEmp_address() {
		return emp_address;
	}

	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}

	public String getEmp_birth() {
		return emp_birth;
	}

	public void setEmp_birth(String emp_birth) {
		this.emp_birth = emp_birth;
	}

	public String getEmp_gender() {
		return emp_gender;
	}

	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getLeave_date() {
		return leave_date;
	}

	public void setLeave_date(Date leave_date) {
		this.leave_date = leave_date;
	}

	public boolean isEmp_active() {
		return emp_active;
	}

	public void setEmp_active(boolean emp_active) {
		this.emp_active = emp_active;
	}

	public String getDept_code() {
		return dept_code;
	}

	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}

	public String getPosition_grade() {
		return position_grade;
	}

	public void setPosition_grade(String position_grade) {
		this.position_grade = position_grade;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "EmployeeVO [emp_num=" + emp_num + ", auth_code=" + auth_code + ", emp_name=" + emp_name + ", emp_pw="
				+ emp_pw + ", emp_email=" + emp_email + ", emp_desk_num=" + emp_desk_num + ", emp_phonenum="
				+ emp_phonenum + ", emp_address=" + emp_address + ", emp_birth=" + emp_birth + ", emp_gender="
				+ emp_gender + ", join_date=" + join_date + ", leave_date=" + leave_date + ", emp_active=" + emp_active
				+ ", dept_code=" + dept_code + ", position_grade=" + position_grade + ", dept_name=" + dept_name + "]";
	}
	
}
