<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="../resources/css/styles.css?ver=1" rel="stylesheet" />
    <link href="../resources/css/message/message_send.css?ver=1" rel="stylesheet" />
    <script src="../resources/js/jquery-3.6.0.min.js?ver=1"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/intro.jsp" %>
<div id="layoutSidenav_content">
	<div class="content_box">보낸쪽지</div>
	<div id="message_send_container">
		<div class="message_send_table_position">
			<button>
				<i class="xi-trash"></i>삭제
			</button>
			<table class="message_send_table">
				<tr class="table_bg">
					<td><input type="checkbox"></td>
					<td><i class="xi-star"></i></td>
					<td><i class="xi-attachment"></i></td>
					<td>받은사원id</td>
					<td>사원명</td>
					<td>제목</td>
					<td>날짜</td>
					<td>수신확인</td>
					<td>비고</td>
				</tr>
				<c:forEach var="row" items="${map.list}">
				<tr class="message_send_table_hover">
					<td><input type="checkbox"></td>
					<td><i class="xi-star"></i></td>
					<td><i class="xi-attachment"></i></td>
					<td>${row.idx}</td>
					<td>${row.idx}</td>
					<td><a href="/detail?idx=${row.idx}">${row.title}</a></td>
					<td>${row.writer}</td>
					<td>${row.reg_date}</td>
					<td>${row.hit}</td>
				</tr>
				</c:forEach>
				<tr class="message_send_table_hover">
					<td><input type="checkbox"></td>
					<td><i class="xi-star"></i></td>
					<td><i class="xi-attachment"></i></td>
					<td>2022012</td>
					<td>이은지</td>
					<td>업무 협조 요청드립니다.</td>
					<td>2022-08-22 17:47:40</td>
					<td>Y</td>
					<td>일반</td>
				</tr>
			</table>
			<div class="message_send_list_number">
				<div>
					<div class="message_send_list_n_menu">
						<span class="message_send_disabled">< 이전</span> <span
							class="message_send_current">1</span> <a href="#?page=2">2</a> <a
							href="#?page=3">3</a> <a href="#?page=4">4</a> <a href="#?page=5">5</a>
						<a href="#?page=6">6</a> <a href="#?page=7">7</a> <a
							href="#?page=7">8</a> <a href="#?page=7">9</a> <a href="#?page=7">10</a>
						<span class="message_send_disabled">다음 ></span>
					</div>
				</div>
			</div>
			<!-- 검색 폼 영역 -->
			<div class="message_send_search">
				<select id='message_send_search_select'>
					<option value='A'>제목+내용</option>
					<option value='T'>제목</option>
					<option value='C'>내용</option>
				</select> <input type="text">
				<button>검색</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="../resources/js/scripts.js?ver=1"></script>
</body>
</html>