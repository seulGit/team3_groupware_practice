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
    <link href="../../resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../resources/css//worktime/worktime_end.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<!-- 상단/왼쪽 메뉴 include -->
<%@ include file="/WEB-INF/views/intro.jsp" %>

        <div id="layoutSidenav_content">
            <div class="content_box">
                완료문서
            </div>

            <!-- 완료문서 리스트 테이블 -->
            <div class="worktime_end_docu_list">
                <div class="worktime_end_docu_table_list">
                <table class="worktime_end_docu_table">
                    <tr class="worktime_end_table_bg">
                        <td>문서번호</td>
                        <td>기안일</td>
                        <td>결재양식</td>
                        <td>기안자</td>
                        <td style="width:40%">제목</td>
                        <td>첨부</td>
                        <td>결재상태</td>
                    </tr>
                    <tr class="worktime_end_table_hover">
                        <td>20203086</td>
                        <td>2021-12-10</td>
                        <td>연차신청서</td>
                        <td>이은지</td>
                        <td>휴가쓸래요</td>
                        <td><i class="xi-paper"></i></td>
                        <td>승인</td>
                    </tr>
                    <tr class="worktime_end_table_hover">
                        <td>20203075</td>
                        <td>2021-12-05</td>
                        <td>연차신청서</td>
                        <td>이은지</td>
                        <td>휴가</td>
                        <td></td>
                        <td>반려</td>
                    </tr>
                    <tr class="worktime_end_table_hover">
                        <td>20203064</td>
                        <td>2021-11-15</td>
                        <td>연차신청서</td>
                        <td>박예솔</td>
                        <td>휴가</td>
                        <td><i class="xi-paper"></i></td>
                        <td>승인</td>
                    </tr>
                
                </table>
        </div>

         <!-- 페이지 넘버 -->
         <div class="worktime_end_list_number">
            <div>
                <div class="worktime_end_list_n_menu">
                    <span class="worktime_end_disabled"><  이전</span>
                    <span class="worktime_end_current">1</span>
                    <a href="#?page=2">2</a>
                    <a href="#?page=3">3</a>
                    <span class="worktime_end_disabled">다음  ></span>                                
                </div>                            
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
   
</body>

</html>