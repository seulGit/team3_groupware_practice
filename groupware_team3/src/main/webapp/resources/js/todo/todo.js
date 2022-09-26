/*
 * 이은지
 * 220912
 * + 클릭 시 모달 생성 
 * 버튼 클릭 시 빈 값 확인
 * 220925 
 * todo 글 작성 후 ajax로 보여지기
 * 220926 
 * todo 버튼 위치 수정
 * */

// 모달
let todo_back = document.querySelector(".todo_modal_back"); // 모달 뒷배경
let todo_add = document.querySelector(".todo_add");			// create todo 버튼
let todo_save = document.querySelector(".todo_save"); 		// 모달 창의 저장버튼
let todo_cancel = document.querySelector(".todo_cancel");   // 모달 창의 취소버튼

// 빈 값 확인
let todo_title = document.querySelector("#todo_modal_title");  // todo 제목
let todo_text = document.querySelector("#todo_modal_text");    // todo 내용
let todo_write = document.querySelector(".my_board_list");     // todo 내용

// 아이콘
let star = document.querySelectorAll(".xi-star-o"); 			// 별 아이콘
let x_icon = document.querySelectorAll(".xi-close-min"); 		// x 아이콘


// create todo 버튼 클릭 시 모달이 맨 앞으로 보이기
todo_add.addEventListener("click", function(){
    todo_back.style.display="block";
});

/** 취소버튼 클릭 시 모달 창 사라지기 */
todo_cancel.addEventListener("click", function(){
     todo_back.style.display="none";
});

// 저장 버튼 클릭 시 내용이 없을 경우 alert창 뜨기
todo_save.addEventListener("click", function(e){
     if(todo_title.value==null || todo_title.value==""){
        alert("제목을 입력하세요");
 	   e.preventDefault();
     } else if(todo_text.value==null || todo_text.value==""){
        alert("내용을 입력하세요");
 	   e.preventDefault();
     }
});


// 별 아이콘 클릭 시 색깔 별로 바뀜
for(let i=0; i<star.length; i++){
    let y_star = true; // 토글

star[i].addEventListener("click", function(){
    if(y_star == true){
    star[i].className="xi-star";
    y_star = !y_star;

    } else if(y_star == false){
        star[i].className="xi-star-o";
        y_star = !y_star;
  }
});
}

// x 아이콘 클릭 시 삭제할 것인지 물어보기
for(i=0; i<x_icon.length; i++){
	x_icon[i].addEventListener("click", function(){
		confirm("삭제하겠습니까?");
	});
}

// 저장 버튼 클릭 후 ajax
let my_board = document.querySelector(".my_board_box_list");
todo_save.addEventListener("click", function(){
	let todo_board = {
			todo_title : todo_title.value,
			todo_contents : todo_text.value		
	};
	
	$.ajax({
		type : "POST",
		url : "/todo_list",
		dataType : "text",
		contentType : "application/json",
		data : JSON.stringify(todo_board),
		success : function(data){
			$(todo_write).prepend(data);
			todo_back.style.display="none";
			todo_title.value='';
			todo_text.value='';
		},
		error : function(data){
			console.log(data);
		}
	});
});
