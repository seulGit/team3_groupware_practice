<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JaeHee Group</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="../resources/css/styles.css?ver=1" rel="stylesheet" />
    <link rel="stylesheet" href="../resources/css/board/board.css?ver=1">
    <script src="../resources/js/jquery-3.6.0.min.js?ver=1"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/intro.jsp" %>
        <div id="layoutSidenav_content">
            <div class="content_box">
                <i class="fa-solid fa-bullhorn"></i>공지사항
            </div>
            <div class="board_con">
                <a href="board_write.html">
                    <button class="board_write_btn">글쓰기</button></a>
                    <div class="board_table_position">
   <table class="board_table">
		<thead>
			<tr class="table_bg">
				<td>글 번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일자</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty map.list}">
				<h1>게시글이 없ㅋ엉</h1>
			</c:if>

			<!-- 컨트롤러에서 전달받은 데이터를 반복하기 위함 -->
			<c:forEach var="row" items="${map.list}">
				<tr class="board_table_hover">
					<td>${row.idx}</td>
					<td class="table_title_left"><a href="/detail?idx=${row.idx}">${row.title}</a></td>
					<td>${row.writer}</td>
					<td>${row.reg_date}</td>
					<td>${row.hit}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">
					<c:if test="${map.page_info.curBlock >1 }">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					 <c:if test="${map.page_info.curBlock >1 }">
						<a href="javascript:list('${map.page_info.prevPage }')">[이전]</a>
					</c:if>
					<c:forEach var="num" begin="${map.page_info.blockBegin }" end="${map.page_info.blockEnd }">
					  <c:choose>
					 	<c:when test="${num==map.page_info.curPage }">
							<span style="color: red">${num }</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num }</a>
						</c:otherwise>
					  </c:choose>
					</c:forEach>
					<c:if test="${map.page_info.curBlock <= map.page_info.totBlock }">
						<a href="javascript:list('${map.page_info.nextPage }')">[다음]</a>
					</c:if>
					<c:if test="${map.page_info.curBlock <= map.page_info.totBlock }">
						<a href="javascript:list('${map.page_info.totPage }')">[끝]</a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
					<!-- 페이징 영역  
                   		 페이징 영역
                    <div class="board_list_number">
                        <div>
                            <div class="board_list_n_menu">
                                <span class="board_disabled"><  이전</span>
                                <span class="board_current">1</span>
                                <a href="#?page=2">2</a>
                                <a href="#?page=3">3</a>
                                <a href="#?page=4">4</a>
                                <a href="#?page=5">5</a>
                                <a href="#?page=6">6</a>
                                <a href="#?page=7">7</a>
                                <a href="#?page=7">8</a>
                                <a href="#?page=7">9</a>
                                <a href="#?page=7">10</a>
                                <span class="board_disabled">다음  ></span>                                
                            </div>                            
                        </div>
                    </div>
                    	검색 폼 영역
                    <div class="board_search">
                        <select id='board_search_select'>
                            <option class="board_search_option" value='A'>제목+내용</option>
                            <option class="board_search_option" value='T'>제목</option>
                            <option class="board_search_option" value='C'>내용</option>
                        </select>
                        <input id="board_search_input" type="text">
                        <button id="board_search_btn">검색</button>
                    </div>
                    -->               
               </div>
           </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="../resources/js/scripts.js"></script>
    <script src="../resources/js/board/board.js?ver=1"></script>
</body>

</html>