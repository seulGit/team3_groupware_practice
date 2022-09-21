<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JaeHee Group</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="../resources/css/styles.css?ver=1" rel="stylesheet" />
    <link href="../resources/css/message/message_write.css?ver=1" rel="stylesheet" />
    <script src="../resources/js/jquery-3.6.0.min.js?ver=1"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf-8"
        src="../resources/api/libs/smarteditor/js/service/HuskyEZCreator.js"></script>
    <!-- 220902 smart editor -->
</head>
<script>
// ====== 조직도에서 팀이름 클릭 했을때 ====== //
$(document).ready(function () {
	$(".dept_ajax").each(function (){
	$(this).click(function () {
		var dept_code = $(this).val();
	//	 $("input#searchWord").val("");
		$.ajax({ 
			type: "GET",
			url:"/message/writeAddress.os",
			data: {"dept_code" : dept_code},
			dataType:"json",
            success: function(data) {
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
		            "</td><td>" +
		            item.emp_name +
		            "</td><td>" +
		            item.emp_num +
		            "</td></tr>";
		        });
                output += "</tbody></table>";
                $("#modal_personal_info").html(output);
                $("table").addClass("dept_right");
	            }
	            
	            /* 	220920 김정치
	             	* 체크박스 전체 선택 / 해제 기능
	             */
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
	              })
	            })
	            // 체크박스 전체 선택 / 해제 기능 끝
	           /* $("#write_address_selectCheck").click(function () {
	            	//삭제 버튼 클릭 시 선택된 게시물 삭제 알림창
	            	EDMS_tem_docu_del_btn.addEventListener("click",function(){
	            	  const checked = document.querySelectorAll(".EDMS_tem_checkbox:checked");
	            	  if(checked.length>=1){
	            	    confirm("선택한 문서를 삭제하겠습니까?");
	            	  } else if (checked.length==0){
	            	    alert("선택된 문서가 없습니다");
	            	  }
	            	})
	            }); */
	            $(".receive_emp").click(function () {
	            	//삭제 버튼 클릭 시 선택된 게시물 삭제 알림창
	            	EDMS_tem_docu_del_btn.addEventListener("click",function(){
	            	  const checked = document.querySelectorAll(".EDMS_tem_checkbox:checked");
	            	  if(checked.length>=1){
	            	    confirm("선택한 문서를 삭제하겠습니까?");
	            	  } else if (checked.length==0){
	            	    alert("선택된 문서가 없습니다");
	            	  }
	            	})

	            });
	            
			},
	        error: function(request, status, error){
	        	alert("실패했어");
			       // alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	});
	});
});
</script>
<%@ include file="/WEB-INF/views/intro.jsp" %>
        <div id="layoutSidenav_content">
            <div class="content_box">쪽지쓰기</div>
            <div id="message_write_container">
            	<form id="form1" name="form1" action="/message_write/write" method="POST">
                <div class="top_btn">
                    <button class="write_div_btn" id="writeSubmit" value="보내기">보내기</button>
                    <div class="write_div_btn">임시저장</div>
                    <div class="write_div_btn">다시쓰기</div>
                </div>
				<div class="message_write_insert_info">
						<table>
							<tr>
								<td class="message_td1">받는사람</td>
								<td class="message_td2"><input type="text" name="receiver" id="receiver" placeholder="20220801"></td>
								<td class="message_td3"><div class="write_div_btn message_btn-open-popup">주소록</div></td>
							</tr>
							<tr>
								<td class="message_td1">제목 <span><input type="checkbox" id="important">중요!</span></td>
								<td class="message_td2"><input type="text" name="subject" id="subject" placeholder="untitle"></td>
							</tr>
							<tr>
								<td class="message_td1">작성자</td>
								<td class="message_td2"><input type="text" name="writer" id="writer" placeholder="unknown"></td>
							</tr>
							<tr>
								<td class="message_td1">첨부파일</td>
								<td class="message_td2"><input type="file" name="attach_Address" id="attach_Address" placeholder="파일선택"></td>
							</tr>
						</table>
					</div>
                    <div class="message_write_textarea">
              	      <textarea name="contents" id="contents" rows="1" cols="1" style="width: 100%;"></textarea>
              
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
                <button class="modal_close"><i class="fa-solid fa-circle-xmark"></i></button>
                <h1>쪽지쓰기 주소록</h1>
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
            	<button type="reset" id="write_address_cancelCheck">취소</button>
            	<button type="submit" id="write_address_selectCheck">확인</button>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="../resources/js/scripts.js?ver=1"></script>
<!--     <script src="../resources/js/message_jquery.js"></script> -->
    <script src="../resources/js/message/message_write.js?ver=1"></script>

	<script>
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "contents",
			sSkinURI : "../resources/static/libs/smarteditor/SmartEditor2Skin.html",
			htParams : {
				bUseVerticalResizer : false, // 리사이즈 제거
			}, //boolean
				fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["contents"].exec("PASTE_CONTENTS_FIELD", []);
			},
			fCreator : "createSEditor2"
			});
			$("#writeSubmit").click(function() {
				oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#form1").submit();
		});
	</script>

</body>

</html>