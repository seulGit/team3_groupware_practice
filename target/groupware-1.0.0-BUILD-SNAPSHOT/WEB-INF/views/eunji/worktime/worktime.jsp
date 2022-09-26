  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JaeHee Group</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../resources/css/styles.css" />
    <link rel="stylesheet" href="../../resources/css/worktime/worktime.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<!-- 상단/왼쪽 메뉴 include -->
<%@ include file="/WEB-INF/views/intro.jsp" %>

        <div id="layoutSidenav_content">
            <div class="content_box">
                근태관리홈
            </div>
			<!-- 출퇴근 기록  -->
            <div class="worktime_container">
            <div class="commute_input">
                 <p>출퇴근입력</p>
                 <form name="form1" class="commute_position" method="post" action="/worktime">
                 <div class="worktime_date">입력일: </div>
                 <div>출근시간입력 <input type="time" name="worktime_go" id="worktime_go" class="commute_input_goto commute_intput_margin"></div>
                 <div>퇴근시간입력 <input type="time" name="worktime_out" id="worktime_out" class="commute_input_leave commute_intput_margin"></div>
                 <div>총 업무시간 <input type="datetime" name="worktime_hours" id="worktime_hours" class="inner_time commute_intput_margin" size="3px">시간</div>
                 <input type="submit" id="worktime_btn" value="출퇴근제출">
                </form>
            </div>

			<!-- 나의 연차 기록  -->
            <div class="my_annual_leave">
                <div>내 연차 내역 <a href="/worktime_new"><input type="button" value="휴가계신청" id="annual_leave_btn"></div></a>
                <div class="my_annual_leave_list">
                    <div class="my_annual_name">
                    <p>${worktimeMap.emp_name} ${worktimeMap.position_grade}<br>${worktimeMap.dept_name}</p>
                    </div>
                      <div class="my_annual_width">
                       <table id="my_annual_table">
                        <tr>
                            <td>총연차 </td>
                            <td>사용연차</td>
                            <td id="my_annual_table_left_line">잔여연차</td>
                        </tr>
                        <tr>
                            <td>${worktimeMap.used_count+worktimeMap.available_count}일</td>
                            <td>${worktimeMap.used_count}일</td>
                            <td id="my_annual_table_left_line">${worktimeMap.available_count}일</td>
                        </tr>
                       </table>
                    </div>
                    </div>
            </div>

			<!-- 내가 결재할 문서  -->
            <div class="docu_list">
                <p>승인 대기중 문서</p>
                <div id="waiting_docu_font">승인할 문서가 <strong>3</strong>건 있습니다.</div>
                <div class="docu_table_position">
                    <table class="docu_table">
                        <tr class="table_bg">
                            <td>문서번호</td>
                            <td>기안일</td>
                            <td>결재양식</td>
                            <td>기안자</td>
                            <td style="width:40%">제목</td>
                            <td>첨부</td>
                        </tr>
                        <tr class="docu_table_hover">
                            <td>3020038</td>
                            <td>2022-08-21</td>
                            <td>반차신청서</td>
                            <td>성선규</td>
                            <td>반차 신청서 올립니다~</td>
                            <td><i class="xi-paper"></i></td>
                        </tr>
                    </table>
               </div>
           </div>

			<!-- 내가 결재 받을 문서  -->
           <div class="docu_list">
            <p>기안 진행 문서</p>
            <div class="docu_table_position">
                <table class="docu_table">
                    <tr class="table_bg">
                        <td>문서번호</td>
                        <td>기안일</td>
                        <td>결재양식</td>
                        <td>제목</td>
                        <td>첨부</td>
                    </tr>
                    <tr class="docu_table_hover">
                        <td>3020037</td>
                        <td>2022-07-14</td>
                        <td>휴가신청서</td>
                        <td>몸이 아파서 휴가사용합니다.</td>
                        <td><i class="xi-paper"></i></td>
                    </tr>
                </table>
           </div>
       </div>
		
		<!-- 결재 받은 완료 문서  -->
       <div class="docu_list table_bottom_margin">
        <p>완료 문서</p>
        <div class="docu_table_position">
            <table class="docu_table">
                <tr class="table_bg">
                    <td>문서번호</td>
                    <td>기안일</td>
                    <td>결재양식</td>
                    <td>제목</td>
                    <td>첨부</td>
                    <td>결재상태</td>
                </tr>
                <tr class="docu_table_hover">
                    <td>302000029</td>
                    <td>2022-03-08</td>
                    <td>반차신청서</td>
                    <td>반차 신청서 결재부탁드립니다~</td>
                    <td><i class="xi-paper"></i></td>
                    <td>반려</td>
                </tr>
                </tr>
            </table>
       </div>
   </div>
</div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="resources/js/worktime/worktime.js"></script>
</body>
</html>