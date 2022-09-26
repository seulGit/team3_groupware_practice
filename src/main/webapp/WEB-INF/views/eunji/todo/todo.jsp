<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JaeHee Group</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<!-- <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"> -->
<!-- <link rel="stylesheet" href="<c:url value="/resources/css/todo.css"/>"> -->
<link rel="stylesheet" href="../../resources/css/styles.css">
<link rel="stylesheet" href="../../resources/css/todo/todo.css">

<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<!-- 상단/왼쪽 메뉴 include -->
<%@ include file="/WEB-INF/views/intro.jsp" %>

		<div id="layoutSidenav_content">
			<div class="content_box_first">
				<i class="xi-library-books"></i>
				<p>ToDo+</p>
				<button class="todo_add my">Create Todo</button>
			</div>

			<!-- 즐겨찾는 보드  -->
			<div class="content_box_two">
				<p>즐겨찾는 보드</p>
				<div class="box_position">
					<div class="favorite_borad_box">
						<div class="favorite_content_box">
							<p>스타트업 계획</p>
							<i class="xi-star-o"></i>
							<p class="favorite_borad_box_font">스타트업 강의 중 인원 확인 후 지난주 회의록
								앞의 두장만 다시 뽑아 서명받아야..</p>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 내 보드  -->
			<div class="content_box_three">
				<p>내 보드</p>
				<div class="box_position my_board_list">

					<!-- todo 생성 -->
					<c:forEach var="todo" items="${todoMapList}">
					<div class="my_borad_box">
						<div class="my_content_box">
							<p class="todo_title">${todo.todo_title}</p>
							<i class="xi-star-o" title="즐겨찾기"></i>
							<i class="xi-close-min" title="삭제"></i>
							<p class="my_borad_box_font">${todo.todo_contents}</p>
						</div>
					</div>
					</c:forEach>
				
				</div>
			</div>
			
		</div>
	</div>

	<!-- 모달 창 -->
	<div class="todo_modal_back">
		<div id="todo_modal">
			제목<br> <input type="text" id="todo_modal_title" name="todo_title" size="25"><br> 
			내용<br> <textarea name="todo_contents" id="todo_modal_text" cols="30"
				rows="10"></textarea>
			<br>
			<div class="todo_btn_center">
				<input type="button" value="저장" class="todo_btn todo_save">
				<input type="button" value="취소" class="todo_btn todo_cancel">
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/todo/todo.js" /></script>
</body>

</html>