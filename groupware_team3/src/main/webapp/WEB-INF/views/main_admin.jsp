<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>JaeHee Group</title>
    <%-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />--%>
    <link href="/resources/css/styles.css" rel="stylesheet"/>
    <link href="/resources/css/main.css" rel="stylesheet"/>
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/intro.jsp" %>
<div id="layoutSidenav_content" class="admin_contents_section">
    <div id="home_content_container">
        <div class="home_content homebox1">
            <div class="home_personal_info">
                <br>
                <br>
                <div class="home_personal_img"></div>
                <div class="home_personal_text">
                    <h1 class="home_personal_name">관리자1</h1>
                    <p class="home_personal_company">(주)JaeHee</p>
                </div>
                <!-- <div class="home_EDMS_docu">
                    <p class="home_EDMS_docu_text">결제할 문서 <span class="home_EDMS_docu_round">10</span></p>
                    <p class="home_EDMS_docu_text">오늘의 일정 <span class="home_EDMS_docu_round">0</span></p>
                </div> -->
            </div>
            <div class="home_personal_insert_info">
                <button class="home_meg_write">쪽지쓰기</button>
                <!-- <button class="home_contact">연락처 추가</button>
                <button class="home_calendar">일정등록</button> -->
                <button class="home_board_write">게시글 작성</button>
            </div>
        </div>
        <div class="home_content homebox2">
            <div>
                <h1 class="home_content_title">전사게시판 최근글</h1>
                <div class="tabmenu">
                    <ul class="tabmenu_list">
                        <li id="tab1" class="btnCon"><input type="radio" checked name="tabmenu" id="tabmenu1">
                            <label for="tabmenu1">전체</label>
                            <div class="tabCon">
                                <table>
                                    <tr>
                                        <td><p class="home_board_title">인사이동</p>
                                            <span class="home_board_info">2022-08-21 | 오슬기 부장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">안녕하세요</p>
                                            <span class="home_board_info">2022-08-19 | 송혜교 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">답변</p>
                                            <span class="home_board_info">2022-08-13 | 장동건 대리</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">8월 일정을 공유합니다</p>
                                            <span class="home_board_info">2022-08-02 | 성선규 차장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">IT 사원 인사이동의 건입니다.</p>
                                            <span class="home_board_info">2022-07-17 | 김혜수 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">부고 소식입니다.</p>
                                            <span class="home_board_info">2022-07-17 | 전지현 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">전체 사원들에게 알려드립니다.</p>
                                            <span class="home_board_info">2022-07-03 | 이은지 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">7월 일정</p>
                                            <span class="home_board_info">2022-07-03 | 박예솔 대리</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">인사이동 공지(필독!)</p>
                                            <span class="home_board_info">2022-07-02 | 김민아 사원</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">안녕하세요</p>
                                            <span class="home_board_info">2022-07-01 | 홍수빈 사원</span></td>
                                    </tr>
                                </table>
                            </div>
                        </li>
                        <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
                            <label for="tabmenu2">전체공지</label>
                            <div class="tabCon">
                                <table>
                                    <tr>
                                        <td><p class="home_board_title">인사이동</p>
                                            <span class="home_board_info">2022-08-21 | 오슬기 부장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">안녕하세요</p>
                                            <span class="home_board_info">2022-08-19 | 송혜교 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">부고 소식입니다.</p>
                                            <span class="home_board_info">2022-07-17 | 전지현 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">전체 사원들에게 알려드립니다.</p>
                                            <span class="home_board_info">2022-07-03 | 이은지 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">7월 일정</p>
                                            <span class="home_board_info">2022-07-03 | 박예솔 대리</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">인사이동 공지(필독!)</p>
                                            <span class="home_board_info">2022-07-02 | 김민아 사원</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">안녕하세요</p>
                                            <span class="home_board_info">2022-07-01 | 홍수빈 사원</span></td>
                                    </tr>
                                </table>
                            </div>
                        </li>
                        <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
                            <label for="tabmenu3">일반게시판</label>
                            <div class="tabCon">
                                <table>
                                    <tr>
                                        <td><p class="home_board_title">인사이동</p>
                                            <span class="home_board_info">2022-08-21 | 오슬기 부장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">안녕하세요</p>
                                            <span class="home_board_info">2022-08-19 | 송혜교 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">답변</p>
                                            <span class="home_board_info">2022-08-13 | 장동건 대리</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">8월 일정을 공유합니다</p>
                                            <span class="home_board_info">2022-08-02 | 성선규 차장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">전체 사원들에게 알려드립니다.</p>
                                            <span class="home_board_info">2022-07-03 | 이은지 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">7월 일정</p>
                                            <span class="home_board_info">2022-07-03 | 박예솔 대리</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">인사이동 공지(필독!)</p>
                                            <span class="home_board_info">2022-07-02 | 김민아 사원</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">안녕하세요</p>
                                            <span class="home_board_info">2022-07-01 | 홍수빈 사원</span></td>
                                    </tr>
                                </table>
                            </div>
                        </li>
                        <li id="tab4" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu4">
                            <label for="tabmenu4">자료게시판</label>
                            <div class="tabCon">
                                <table>
                                    <tr>
                                        <td><p class="home_board_title">인사이동</p>
                                            <span class="home_board_info">2022-08-21 | 오슬기 부장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">안녕하세요</p>
                                            <span class="home_board_info">2022-08-19 | 송혜교 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">답변</p>
                                            <span class="home_board_info">2022-08-13 | 장동건 대리</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">8월 일정을 공유합니다</p>
                                            <span class="home_board_info">2022-08-02 | 성선규 차장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">IT 사원 인사이동의 건입니다.</p>
                                            <span class="home_board_info">2022-07-17 | 김혜수 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">부고 소식입니다.</p>
                                            <span class="home_board_info">2022-07-17 | 전지현 과장</span></td>
                                    </tr>
                                    <tr>
                                        <td><p class="home_board_title">전체 사원들에게 알려드립니다.</p>
                                            <span class="home_board_info">2022-07-03 | 이은지 과장</span></td>
                                    </tr>
                                </table>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="home_content homebox3">
            <div class="home_recent_login">
                <h1 class="home_content_title">최근 로그인 정보</h1>
                <div class="home_todo_content">2022년 09월 26일(월)</div>
                <div class="home_todo_content">2022년 09월 26일(월)</div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>
</body>
</html>