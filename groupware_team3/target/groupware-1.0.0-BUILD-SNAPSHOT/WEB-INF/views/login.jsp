<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>재희그룹</title>
    <link rel="stylesheet" href="/resources/css/login.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
<form name="login_form" id="login_form" method="POST">
    <div class="login_body_container">
    </div>
    <div class="login_container">
        <div class="login_leftbox">
            <img src="/resources/img/team.png" alt="">
        </div>
        <div class="login_rightbox">
            <div class="login_title">재희그룹</div>
            <div class="login_idpw login_id">
                <i class="xi-mail"></i>

                <%-- 아이디 입력 --%>
                <input type="text" id="login_id_input" name="emp_num" placeholder="사원번호" onfocus="this.placeholder=''"
                       onblur="this.placeholder='사원번호'">
            </div>
            <div class="login_idpw login_pw">
                <i class="xi-lock"></i>

                <%-- 패스워드 입력 --%>
                <input type="password" id="login_pw_input" name="emp_pw" placeholder="비밀번호"
                       onfocus="this.placeholder=''"
                       onblur="this.placeholder='비밀번호'">
            </div>

            <%-- 접속 버튼 --%>
            <button type="button" class="login_submit btn btn-primary">접속</button>

            <%-- DB와 불일치 시 뜨는 문구 --%>
            <c:if test="${message == 'error'}">
                <div style="color:red; font-size: small;">
                    아이디와 비밀번호를 확인하세요.
                </div>
            </c:if>

            <div class="login_option">
                <div class="login_save_id">
                    <%-- 사원번호 저장 체크박스 --%>
                    <input type="checkbox" id="login_save_id_checkbox" name="login_save_id_checkbox"
                           value="login_id_input?.length>0 : login_id_input : '' ">
                    <label for="login_save_id_checkbox">
                        <span>사원번호 저장</span>
                    </label>
                </div>
                <div class="login_save_pw">
                    <%-- 비밀번호 초기화 버튼 --%>
                    <span>비밀번호 초기화</span>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="/resources/js/login.js"></script>
</body>
</html>