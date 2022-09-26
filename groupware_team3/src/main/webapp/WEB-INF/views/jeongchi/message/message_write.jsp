<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JaeHee Group</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"	rel="stylesheet" />
<link href="../resources/css/styles.css?ver=1" rel="stylesheet" />
<link href="../resources/css/message/message_write.css?ver=1" rel="stylesheet" />
<script src="../resources/js/jquery-3.6.0.min.js?ver=1"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf-8"
	src="../resources/api/smarteditor/libs/smarteditor/js/service/HuskyEZCreator.js"></script>
<!-- 220902 smart editor -->
<script>
    
   
// ====== 조직도에서 팀이름 클릭 했을때 ====== //
$(document).ready(function () {
	
    // ====== 보내기 버튼 클릭 이벤트 ====== // 
    $("#writeSubmit").click(function(){
    	
		// ====== 유효성 검사 ====== //
	    // 받는사람
	    let receiver = $("#message_receiver").val().trim();
	    if(receiver == "") {
	    	alert("받는사람을 선택해주세요!");
	    	return false;
	    }
	    
	    // 제목
	    let subject = $("#message_title").val().trim();
	    if(subject == "") {
	    	alert("제목을 입력해주세요!");
	    	return false;
	    }	    
	    
	    // 작성자
	    let writer = $("#message_sender").val().trim();
	    if(writer == "") {
	    	alert("작성자를 입력해주세요!");
	    	return false;
	    }	    
	    
	    // 작성내용(SmartEditor 유효성 검사)
		var contentval = $("#message_contents").val();
		oEditors.getById["message_contents"].exec("UPDATE_CONTENTS_FIELD", []);
		if(contentval == "") {
			alert(contentval);
			return false;
		} else{
		$("#form1").submit();
		}
	    
	    // 중요! 체크박스가 선택되어있는지 아닌지 확인하자
	    let note_important = 0;
	    
	    if($("input[name=important]").prop("checked")) {
	    	// 중요 체크박스가 체크되어 있으면 
	    	note_importantVal = 1;
	    }
    	
    });
	
	// 팀명 클릭 시 ajax 
	
	$(".dept_ajax").each(function (){
	$(this).click(function () {
		
		// 검색어 비우기
		$("input#messageAddressSearch").val("");
		
		var dept_code = $(this).val();
		
		
		$.ajax({ 
			type: "GET",  						// DB를 가져옴
			url:"/message/writeAddress",  		// 해당주소에서
			data: {"dept_code" : dept_code},  	// {"dept_code" : dept_code} << 과 같은 형식의 데이터를
			dataType:"json",  					// 데이터 받는 형식
            success: function(data) {  			// 데이터 가져온거 성공했으면 
            									// data = 위에서 가져올 데이터
            	// console.log(fk_dept_no); .dept_ajax의  value값
                var output =
                  "<table><thead><tr><th style=\"width: 40px;\"><input type=\"checkbox\" name=\"checkAll\" id=\"checkAll\">"+
                  "</th><th style=\"width: 35%;\">부서</th><th style=\"width: 15%;\">직책</th><th style=\"width: 20%;\">이름</th><th style=\"width: 30%;\">사원코드</th></thead><tbody>";
	            if(data.length > 0) {
		            $.each(data, function(index, item){
		            output +=
	                "<tr class=\"receive_emp\"><td> " +
                    "<input type=\"checkbox\" name=\"chkbox\" class=\"chkbox\">" +
                    "</td><td>"+
		            item.dept_name +
		            "</td><td>" +
		            item.position_grade +
		            "</td><td class=\"itemEmpName\">" +
		            item.emp_name +
		            "</td><td class=\"itemEmpNum\">" +
		            item.emp_num +
		            "</td></tr>";
		        });
                output += "</tbody></table>";
                $("#modal_personal_info").html(output);
                $("table").addClass("dept_right");
	            }
	            
	            writeAddressChkBox();
	            
	            textinReceiver();
	            

			},
	        error: function(request, status, error){
	        	alert("실패했어");
			       // alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	});
	});
	// ====== 주소록 모달창 내에서 사원 검색하는 버튼 클릭(사원명 또는 부서 검색) ====== // 
	$(document).on("click", "button#searchBtn", function(){
		
		// 입력되어있는 검색어 구하기 
		var searchWord = $("input#messageAddressSearch").val().trim();
		
		if(searchWord == "") {
			alert("검색어를 입력하세요!");
			return false;
		}
		
        $.ajax({
            url : "",
            data : {"searchWord" : searchWord},
            dataType : 'JSON',
            success : function(data){
            	var output = "";
	            if(data.length > 0) {
	               $.each(data, function(index, item){
	            	console.log(item.emp_name + " & " + item.emp_no);
	            	html += "<tr>";	
                    html += "<td style='width: 40px; height: 10px; padding-left:2px;'> ";
                    html += "<input type='checkbox' name='chkbox' class='"+ index + "'>";
                    html += "</td>";
                    html += "<td style='width: 80px; height: 10px; padding-left:2px;' >";
                    html += item.emp_name;
                    html += "</td>";
                    html += "<td style='width: 80px; height: 10px; padding-left:2px;' >";
                    html += item.position_name;
                    html += "</td>";	
                    html += "<td style='width: 80px; height: 10px; padding-left:2px;' >";
                    html += item.dept_name;
                    html += "</td>";	 
                    html += "<td style='width: 80px; height: 10px; padding-left:2px;' >";
                    html += item.emp_no;
                    html += "</td>";	
                    html += "</tr>";	
					
	               });
	               
            	   
            	   $("tbody#empListTbody").html(html);
            	   
	            }	    
	            else {
	            	html += "<tr>";	
	            	html += "<td colspan='5' style='height: 20px; text-align: center;'> 검색어와 일치한 사원이 없습니다. </td>"
	            	html += "</tr>";
	            	$("tbody#empListTbody").html(html);
	            }
            },
	        error: function(request, status, error){
			       alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
        });

	});	
    /* 	220920 김정치   체크박스 전체 선택 / 해제 기능  */
    function writeAddressChkBox() {
    	const chkBox = document.querySelectorAll(".chkbox"); // 체크박스 생성
    	const checkAll = document.querySelector("#checkAll"); // 전체 체크박스 생성
    	//체크박스 전체 선택 / 해제
    	$(checkAll).click(function () {
    		console.log(chkBox);
    	    if(checkAll.checked==true){
        	    for(let i=0; i<chkBox.length; i++){
            	chkBox[i].checked = true;
            	}
    	    } else if (checkAll.checked==false){
        	    for(let i=0; i<chkBox.length; i++){
            	chkBox[i].checked = false;
        		}
        	}
    	});

    	//체크박스 하나 해제 시 전체선택 체크박스 해제
    	$(chkBox).each(function (){
    		$(this).click(function () {
    	    const checked = document.querySelectorAll(".chkbox:checked");
        	if(chkBox.length == checked.length){
        		checkAll.checked = true;
    	    } else {
        		checkAll.checked = false;
    	    }
      	});
    	});

    	// 체크박스 전체 선택 / 해제 기능 끝
	}
 	// 쪽지 주소록에서 확인 버튼 누를 시 받는 사람으로 관련 내용 in
    function textinReceiver() {
    	$("#write_address_selectCheck").click(function () {
    		let receive_emp = document.querySelectorAll(".receive_emp");
    		console.log(receive_emp);
    		// 확인 버튼 클릭 시
    		$(receive_emp).each(function (){
    	     //   if($(chkBox).checked==true){
    	        	alert("test1");
    	        	let receiver = receive_emp.childNodes[3].textContent;
	        		console.log(receiver);
    	    	//}
    	    });
    	    $(".message_modal").css("display", "none");
    	});
	}
});


</script>
</head>

<%@ include file="/WEB-INF/views/intro.jsp"%>
<div id="layoutSidenav_content">
	<div class="content_box">쪽지쓰기</div>
	<div id="message_write_container">
		<form id="form1" name="form1" action="/message/write"
			method="POST">
			<div class="top_btn">
				<button class="write_div_btn" id="writeSubmit" value="보내기">보내기</button>
				<div class="write_div_btn">임시저장</div>
				<div class="write_div_btn" id="writeReset">다시쓰기</div>
			</div>
			<div class="message_write_insert_info">
				<table>
					<tr>
						<td class="message_td1">받는사람</td>
						<td class="message_td2"><input type="text" name="message_receiver"
							id="message_receiver" value=""></td>
						<td class="message_td3"><div
								class="write_div_btn message_btn-open-popup">주소록</div></td>
					</tr>
					<tr>
						<td class="message_td1">제목 <span><input
								type="checkbox" id="important">중요!</span></td>
						<td class="message_td2"><input type="text" name="message_title"
							id="message_title" value=""></td>
					</tr>
					<tr>
						<td class="message_td1">작성자</td>
						<td class="message_td2"><input type="text" name="message_sender"
							id="message_sender" value=""></td>
					</tr>
					<tr>
						<td class="message_td1">첨부파일</td>
						<td class="message_td2"><input type="file"
							name="message_file_route" id="message_file_route" value=""></td>
					</tr>
				</table>
			</div>
			<div class="message_write_textarea">
				<textarea name="message_contents" id="message_contents" rows="1" cols="1"
					style="width: 100%;"></textarea>

			</div>
		</form>
		<div class="bottom_btn">
			<button>예약발송</button>
		</div>
	</div>
</div>
<!-- 주소록 모달 시작 -->
<div class="message_modal">
	<div class="message_modal_body">
		<button class="modal_close">
			<i class="fa-solid fa-circle-xmark"></i>
		</button>
		<h1>쪽지쓰기 주소록</h1>
		<div id="searchBox">
			<form name="form1" method="POST" action="/list">
				<select name="search_option">
					<option value="all"
						<c:out value="${map.search_option == 'all' ? 'selected' : ''}"/>>전체</option>
					<option value="empName"
						<c:out value="${map.search_option == 'empName' ? 'selected' : ''}"/>>사원명</option>
					<option value="empNum"
						<c:out value="${map.search_option == 'empNum' ? 'selected' : ''}"/>>사원번호</option>
				</select> <input type="text" placeholder="검색하세욧" name="keyword"
					id="messageAddressSearch" value=""> <input type="submit"
					value="검색" id="searchBtn">
			</form>
		</div>
		<div class="modal_container">
			<div class="dept">
				<ul>
					<li><button class="dept_ajax" value="001">전략기획팀</button></li>
					<li><button class="dept_ajax" value="002">경영지원팀</button></li>
					<li><button class="dept_ajax" value="003">인사팀</button></li>
					<li><button class="dept_ajax" value="004">영업팀</button></li>
					<li><button class="dept_ajax" value="005">마켓팅팀</button></li>
					<li><button class="dept_ajax" value="006">IT팀</button></li>
				</ul>
			</div>
			<div id="modal_personal_info">

				<!-- <table class="dept_right">
                            <thead>
                                <tr>
                                    <th>부서</td>
                                    <th>직책</td>
                                    <th>사원명</td>
                                    <th>사원번호</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="dept1">전략기획</td>
                                    <td id="posion1">부장</td>
                                    <td id="name1">노현</td>
                                    <td id="code1">2208011</td>
                                </tr>
                                <tr>
                                    <td>전략기획</td>
                                    <td>부장</td>
                                    <td>노현</td>
                                    <td>2208011</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table> -->
			</div>
		</div>
		<div>
			<button type="reset" id="write_address_cancelCheck"
				class="write_div_btn">취소</button>
			<button type="submit" id="write_address_selectCheck"
				class="write_div_btn">확인</button>
		</div>
	</div>
</div>
<!-- 모달 끝 -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="../resources/js/scripts.js?ver=1"></script>
<!--     <script src="../resources/js/message_jquery.js"></script> -->
<script src="../resources/js/message/message_write.js?ver=1"></script>

<script>
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "message_contents",
			sSkinURI : "../resources/api/smarteditor/libs/smarteditor/SmartEditor2Skin.html",
			htParams : {
				bUseVerticalResizer : false, // 리사이즈 제거
			}, //boolean
				fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["message_contents"].exec("PASTE_CONTENTS_FIELD", []);
			},
				fCreator : "createSEditor2"
			});

			// ====== 다시쓰기 버튼 이벤트 ====== // 
			$("#writeReset").click(function() {
				oEditors.getById["message_contents"].exec("SET_IR", [""]); //내용초기화
			});
	</script>

</body>

</html>