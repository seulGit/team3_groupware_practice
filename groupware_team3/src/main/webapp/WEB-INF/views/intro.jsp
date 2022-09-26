<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="../main">JaeHee</a>
        <!-- Sidebar Toggle-->
        <!-- <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button> -->
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="../main">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            	Home
                        </a>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_message" aria-expanded="false" aria-controls="collapse_message">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	쪽지
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_message" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../message/write">쪽지쓰기</a>
                                <a class="nav-link" href="../message/message_receive">받은쪽지함</a>
                                <a class="nav-link" href="../message/message_send">보낸쪽지함</a>
                                <a class="nav-link" href="../message/message_important">중요쪽지함</a>
                                <a class="nav-link" href="../message/message_temp">임시보관함</a>
                                <a class="nav-link" href="../message/message_reserved">예약쪽지함</a>
                                <a class="nav-link" href="../message/message_trash">휴지통</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEDMS"
                            aria-expanded="false" aria-controls="collapseEDMS">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	전자결재
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseEDMS" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../EDMS/EDMS_home">전자결재홈</a>
                                <a class="nav-link" href="../EDMS/EDMS_new">새결재진행</a>
                                <a class="nav-link" href="../EDMS/EDMS_Temporary_box">임시보관함</a>
                                <a class="nav-link" href="../EDMS/EDMS_wait">결재대기중</a>
                                <a class="nav-link" href="../EDMS/EDMS_ing">진행중문서</a>
                                <a class="nav-link" href="../EDMS/EDMS_end">완료문서</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_worktime" aria-expanded="false" aria-controls="collapse_worktime">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	근태관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_worktime" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="/worktime">근태관리홈</a>
                                <a class="nav-link" href="/worktime_new">연차신청하기</a>
                                <a class="nav-link" href="/worktime_wait">승인대기중</a>
                                <a class="nav-link" href="/worktime_ing">진행중문서</a>
                                <a class="nav-link" href="/worktime_end">완료문서</a>
                                <a class="nav-link" href="/worktime_view">출퇴근현황</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="/todo">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            	ToDo+
                        </a>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_calendar" aria-expanded="false" aria-controls="collapse_calendar">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	일정
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_calendar" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../calendar/calendar_calendar.html">캘린더</a>
                                <a class="nav-link" href="../calendar/calendar_mycalendar.html">내 캘린더 관리</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_booking" aria-expanded="false" aria-controls="collapse_booking">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	예약
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_booking" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../booking/booking_new">예약하기</a>
                                <a class="nav-link" href="../booking/booking_view">나의 예약 목록 </a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_board" aria-expanded="false" aria-controls="collapse_board">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	게시글
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_board" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="/board_write">게시글작성</a>
                                <a class="nav-link" href="../board/board_notice">공지게시판</a>
                                <a class="nav-link" href="/board_normal">일반게시판</a>
                                <a class="nav-link" href="../board/board_docu">자료실</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collaps_address" aria-expanded="false" aria-controls="collapse_address">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	주소록
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collaps_address" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../address/address_all">전사 주소록</a>
                                <a class="nav-link" href="../address/address_personal">개인 주소록</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="../office_map/office_map">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            	조직도
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
        </div>