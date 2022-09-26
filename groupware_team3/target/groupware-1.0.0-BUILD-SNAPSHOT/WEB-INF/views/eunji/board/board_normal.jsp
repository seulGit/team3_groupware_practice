<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JaeHee Group</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="../../resources/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../resources/css/board/board.css">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<!-- 상단/왼쪽 메뉴 include -->
<%@ include file="/WEB-INF/views/intro.jsp" %>

        <div id="layoutSidenav_content">
            <div class="content_box">
                <i class="fa-regular fa-clipboard"></i>일반게시판
            </div>
            <div class="board_con">
                <a href="board_write.html">
                    <button class="board_write_btn">글쓰기</button></a>
                    <div class="board_table_position">
                    <table class="board_table">
                        <tr class="table_bg">
                            <td>글번호</td>
                            <td>제목</td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                        </tr>
                        <tr class="board_table_hover">
                            <td>80</td>
                            <td class="table_title_left"><a href="board_view.html">
                                금일 구로도에서 번개모임 [7]</a></td>
                            <td>이은지</td>
                            <td>2022-08-01 11:46:02</td>
                            <td>11</td>
                        </tr>
                        <tr class="board_table_hover">
                            <td>78</td>
                            <td class="table_title_left">끝나고 남으세요 [4]</td>
                            <td>김정치</td>
                            <td>2022-08-01 01:30:48</td>
                            <td>2</td>
                        </tr>                    
                    </table>
                    <!-- 페이징 영역 -->
                    <div class="board_list_number">
                        <div>
                            <div class="board_list_n_menu">
                                <span class="board_disabled"><  이전</span>
                                <span class="board_current">1</span>
                                <a href="#?page=2">2</a>
                                <a href="#?page=3">3</a>
                                <span class="board_disabled">다음  ></span>                                
                            </div>                            
                        </div>
                    </div>
                    <!-- 검색 폼 영역 -->
                    <div class="board_search">
                        <select id='board_search_select'>
                            <option class="board_search_option" value='A'>제목+내용</option>
                            <option class="board_search_option" value='T'>제목</option>
                            <option class="board_search_option" value='C'>내용</option>
                        </select>
                        <input id="board_search_input" type="text">
                        <button id="board_search_btn">검색</button>
                    </div>                  
               </div>
           </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>   
    <script src="../../resources/js/board/board.js"></script>
</body>

</html>