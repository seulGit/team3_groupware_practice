const id_box = document.querySelector('.login_id'); //id입력되는 전체박스
let id = document.querySelector('#login_id_input'); //id input
const id_input = /^[0-9]*$/; //id정규화

const pw_box = document.querySelector('.login_pw') //pw입력되는 전체박스
let pw = document.querySelector('#login_pw_input'); //pw input
const pw_input = /(?=.*\d)+(?=.*[~`!@#$%\^&*()-+=])+(?=.*[a-z])(?=.*[A-Z])+.{1,}$/; //pw정규화

const submit_btn = document.querySelector('.login_submit'); //접속 버튼 

const save_btn = document.querySelector('#login_save_id_checkbox'); //사원번호 저장 버튼

let login_form = document.querySelector('#login_form');

//로그인 유효성 검사
 submit_btn.addEventListener("click", function (e) { //접속 클릭시
	 
     if (id.value.length == 0 || id_input.test(id.value) != true) { //id 0글자이거나 영문,숫자의 조합이 아닐때
         id_box.style.border = "1px solid red"; //id입력되는 전체박스의 테두리가 빨갛게 되고
         id_box.style.animation = "inputWrong .2s"; //살짝 움직이는 애니메이션을 줬음
         setTimeout(function () {
             id_box.style.animation = "";
         }, 200); //200미리초 후에 애니메이션 삭제
     } else if (id_input.test(id.value) == true) { //id정규화가 맞을시
         if (pw.value.length == 0 || pw_input.test(pw.value) != true) { //pw 0글자이거나 Aa1!의 조합이 아닐때
             pw_box.style.border = "1px solid red"; //pw입력되는 전체박스의 테두리가 빨갛게 되고
             pw_box.style.animation = "inputWrong .2s"; //살짝 움직이는 애니메이션을 줬음
             setTimeout(function () {
                 pw_box.style.animation = "";
             }, 200); //200미리초 후에 애니메이션 삭제
         } else if (pw_input.test(pw.value) == true) { //id와 pw 정규화 맞을때
             login_form.action = "/login_check";
             login_form.submit();
         }
     }


     id.addEventListener("click", function () { //id입력되는 전체박스 클릭시
         id_box.style.border = "none"; //테두리 원래대로
     })
     pw.addEventListener("click", function () { //pw입력되는 전체박스 클릭시
         pw_box.style.border = "none"; //테두리 원래대로
     })
 });




//사원번호 저장 체크&체크해제 기능(로컬스토리지)
if (window.localStorage.getItem("user_id") === null || window.localStorage.getItem("user_id")==="undefined" 
        || JSON.parse(window.localStorage.getItem("user_id")) == "") { // 만약 페이지를 처음 방문한다면 null값(null,undefined,"")으로 되어 있어 확인 후
    window.localStorage.setItem("user_id", JSON.stringify(id.value)); // 첫 방문이라면 빈 배열로 초기화
} else { //페이지 첫방문이 아니라면(user_id로컬스토리지에 값이 들어있다면)
    id.value = JSON.parse(window.localStorage.getItem('user_id')); //id input에 그 로컬스토리지에 들어있는 값을 넣어주고
    save_btn.checked = true; // 사원번호 저장 체크박스는 checked
}

submit_btn.addEventListener("click", function () { //접속 버튼 클릭 시
    if (save_btn.checked == true) { //사원번호 저장 버튼이 체크되어있으면 
        window.localStorage.setItem("user_id", JSON.stringify(id.value)); //로컬스토리지 user_id에 id input값 집어넣는다
    } else {                // 사원번호 저장 버튼이 체크해제되어있으면
        window.localStorage.removeItem("user_id"); //로컬스토리지 user_id의 값들을 제거한다 .
    }
});