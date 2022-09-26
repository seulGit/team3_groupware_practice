<%@ page language="java" pageEncoding="utf-8" %>
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
    <!-- <link href="styles.css" rel="stylesheet" /> -->
    <!-- <link rel="stylesheet" href="a.css"> -->
    <link rel="stylesheet" href="<c:url value='/resources/css/styles.css'/>">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/calendar/a.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/api/calendar/main.css'/>">

</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/views/intro.jsp" %>

<!-- 220818 성선규 추가 -->
<div id="layoutSidenav_content" class="calendar_main_section">
    <div id='calendar'></div>
    <div class="event_add_container">
        <div class="arrow_arrow">
            <div></div>
            <div>
                <div class="arrow_title_or_color_container">
                    <input type="text" placeholder="새로운 이벤트" id="event_add_title" name="calendar_title">
                    <input type="color" name="calendar_color" id="event_background_color" value="#0D6EFD">
                </div>
                <div class="arrow_datetime_container">
                    <!-- <span class="arrow_datetime" style="background-color: red;"> -->
                    시간 설정
                    <!-- </span> -->
                    <div class="event_datetime_box">
                        <div>
                                    <span class="start_text">
                                        시작:
                                    </span>
                            <input type="datetime-local" class="month_calendar_start_time"
                                   name="calendar_start_date">
                        </div>
                        <div>
                                    <span class="end_text">
                                        종료:
                                    </span>
                            <input type="datetime-local" class="month_calendar_end_time"
                                   name="calendar_end_date">
                        </div>
                    </div>
                </div>
                <div class="arrow_memo">
                    <textarea name="calendar_memo" id="" cols="35" placeholder="메모"></textarea>
                </div>
                <div class="event_add">
                    <div>
                        <input type="button" value="추가" id="event_add_btn">
                    </div>
                </div>
                <div class="event_change">
                    <div>
                        <input type="button" value="수정" id="event_change_btn">
                    </div>
                </div>
                <div class="event_remove">
                    <div>
                        <input type="button" value="삭제" id="event_remove_btn">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="../../../../resources/api/calendar/locales-all.js"></script>
<script src="../../../../resources/api/calendar/main.js"></script>
<script src="../../../../resources/js/calendar/a.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
</script>

</body>

</html>