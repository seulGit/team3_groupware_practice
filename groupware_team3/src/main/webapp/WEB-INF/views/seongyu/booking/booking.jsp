<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>JaeHee Group</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<%--    <script>--%>
<%--        window.onload = function(){--%>
<%--            $('head').append('<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/booking/booking.css'/>">');--%>
<%--        }--%>
<%--    </script>--%>
    <link rel="stylesheet" href="<c:url value='/resources/css/styles.css'/>">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/booking/booking.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/api/calendar/main.css'/>">

</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/views/intro.jsp" %>

<!-- 220818 성선규 추가 -->
<div id="layoutSidenav_content" class="calendar_main_section">
    <div id='calendar'></div>
    <div class="booking_modal">
        <div class="booking_event_container">
            <div>
                <div class="booking_event_title_or_color_container">
                    <input type="text" placeholder="새로운 이벤트" class="booking_event_title" name="booking_title">
                </div>
                <!-- 시간 설정 -->
                <div class="booking_event_datetime_container">
                    시간 설정
                    <div class="booking_event_datetime_box">
                        <div class="booking_start_datetime">
                                    <span class="booking_start_text">
                                        시작
                                    </span>
                            <input type="datetime-local" name="booking_start_date" class="booking_start_date">
                        </div>
                        <div class="booking_end_datetime">
                                    <span class="booking_end_datetime">
                                        종료
                                    </span>
                            <input type="datetime-local" name="booking_end_date" class="booking_end_date">
                        </div>
                    </div>
                </div>
                <div class="booking_event_use_select">
                    <!-- 회의실선택 -->
                    <div class="booking_event_meetingroom">
                        <select name="meetingroom_num" id="booking_event_meetingroom">
                            <option value="null">회의실 선택</option>
                            <option value="meetingroom_1">1번 회의실</option>
                            <option value="meetingroom_2">2번 회의실</option>
                            <option value="meetingroom_3">3번 회의실</option>
                            <option value="meetingroom_4">4번 회의실</option>
                            <option value="meetingroom_5">5번 회의실</option>
                        </select>
                    </div>
                    <!-- 비품 선택 -->
                    <div class="booking_event_fixtures">
                        <select name="fixtures_num" id="booking_event_fixtures">
                            <option value="null">비품 선택</option>
                            <option value="fixtures_1">1번 비품</option>
                            <option value="fixtures_2">2번 비품</option>
                            <option value="fixtures_3">3번 비품</option>
                            <option value="fixtures_4">4번 비품</option>
                            <option value="fixtures_5">5번 비품</option>
                        </select>
                    </div>
                </div>
                <div class="booking_event_attendees_container">
                    <!-- 참석자 -->
                    <div class="booking_attendees_list">
                        <div>
                            참석자및 사용자를 선택해주세요
                            <!-- <div class="attendees user_1">
                                <div>
                                    <span>김사장</span>
                                </div>
                            </div> -->
                        </div>
                    </div>
                    <div class="booking_attendees_check">
                        <c:forEach var="info" items="${emp_info}">
                            <div>
                                <input type="checkbox" name="user${info.emp_num}" id="user${info.emp_num}">
                                <label for="user${info.emp_num}">${info.emp_name}</label>
                            </div>
                        </c:forEach>
<%--                                                <div>--%>
<%--                                                    <input type="checkbox" name="user1" id="user1">--%>
<%--                                                    <label for="user1">김사장</label>--%>
<%--                                                </div>--%>
<%--                                                <div>--%>
<%--                                                    <input type="checkbox" name="user2" id="user2">--%>
<%--                                                    <label for="user2">백이사</label>--%>
<%--                                                </div>--%>
<%--                                                <div>--%>
<%--                                                    <input type="checkbox" name="user3" id="user3">--%>
<%--                                                    <label for="user3">노부장</label>--%>
<%--                                                </div>--%>
<%--                                                <div>--%>
<%--                                                    <input type="checkbox" name="user931005" id="user931005">--%>
<%--                                                    <label for="user931005">오팀장</label>--%>
<%--                                                </div>--%>
<%--                                                <div>--%>
<%--                                                    <input type="checkbox" name="user5" id="user5">--%>
<%--                                                    <label for="user5">이과장</label>--%>
<%--                                                </div>--%>
<%--                                                <div>--%>
<%--                                                    <input type="checkbox" name="user990810" id="user990810">--%>
<%--                                                    <label for="user990810">성대리</label>--%>
<%--                                                </div>--%>
                    </div>
                </div>
                <div class="booking_content_container">
                    <!-- 용도 메모 -->
                    <div class="booking_content_box">
                        <textarea placeholder="용도" name="booking_memo" class="booking_memo"></textarea>
                    </div>
                </div>
                <div class="booking_change_event">
                    <button>수정</button>
                </div>
                <div class="booking_add_event">
                    <button>등록</button>
                </div>
                <div class="booking_remove_event">
                    <button>삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/api/calendar/locales-all.js'/>"></script>
<script src="<c:url value='/resources/api/calendar/main.js'/>"></script>
<script src="<c:url value='/resources/js/booking/booking.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
</script>

</body>

</html>