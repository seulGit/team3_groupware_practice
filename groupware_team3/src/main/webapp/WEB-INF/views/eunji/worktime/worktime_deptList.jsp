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
    <link rel="stylesheet" href="../../resources/css/worktime/worktime_new.css">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

<table id="deptList_table">
	<tr>
		<th class="deptList_bg">선택</th>	
		<th class="deptList_bg">이름</th>
		<th class="deptList_bg">직위</th>
		<th class="deptList_bg">부서</th>
		<th class="deptList_bg">사원번호</th>
	</tr>
<c:forEach	var="list" items="${data}">
	<tr>
	    <td><input type="radio" id="dept_name" name="dept_info"></td>
		<td>${list.emp_name}</td>
		<td>${list.position_grade}</td>
		<td>${list.dept_name}</td>
		<td>${list.emp_num}</td>
	</tr>
	
	
</c:forEach>
</table>
</body>