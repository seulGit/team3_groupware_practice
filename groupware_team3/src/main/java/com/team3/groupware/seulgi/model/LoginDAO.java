package com.team3.groupware.seulgi.model;

import com.team3.groupware.common.model.EmployeeVO;

public interface LoginDAO {
    EmployeeVO login_check(EmployeeVO vo);
}
