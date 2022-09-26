<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div class="my_borad_box" id="todo_list">
		<div class="my_content_box">
			<p>${data.todo_title}</p>
				<i class="xi-star-o" title="즐겨찾기"></i>
				<i class="xi-close-min" title="삭제"></i>
					<p class="my_borad_box_font">${data.todo_contents}</p>
		</div>
	</div>
