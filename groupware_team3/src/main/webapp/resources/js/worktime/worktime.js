/*
 * 이은지
 * 220912
 * 출/퇴근 시간 표시
 * 업무시간 계산 
 * 출/퇴근 시간 제출 버튼 클릭 시 빈 값 체크
 * 
 * */
let goto = document.querySelector(".commute_input_goto"); //출근시간
let leave = document.querySelector(".commute_input_leave"); // 퇴근시간
let time = document.querySelector(".inner_time"); // 총 업무시간
let worktime_btn = document.querySelector("#worktime_btn"); // 출퇴근시간 제출버튼

//입력일 날짜 기능
let worktime_date = document.querySelector(".worktime_date");
let date = new Date();
let year = date.getFullYear();
let month = date.getMonth()+1; // getmonth 배열이기 떄문에 1 더해줌
let day = date.getDate();
worktime_date.append(year+'년 '+month+'월 '+day+'일');

goto.addEventListener("change", function(){
    console.log(goto.value);
});

// 퇴근 시간 선택 후 출/퇴근 업무 시간 계산되어 표시
leave.addEventListener("change", function(){
    
    if(goto.value != null && goto.value != ""){
        time.value=(parseInt(leave.value)-parseInt(goto.value));
    } else if(goto.value == null || goto.value == ""){
       time.value=null;
    	
    }
});

// 출퇴근 버튼 클릭 시 입력 값이 있을 때와 없을 때 
worktime_btn.addEventListener("click", function(e){
   if(goto.value && leave.value){
    alert("출퇴근 시간이 제출되었습니다.");
   } else if(goto.value == null || goto.value == "" ){
	   e.preventDefault(); // 이벤트 실행 방지 메서드
    alert("출근 시간을 입력해주세요");
   } else if(leave.value== null || leave.value== ""){
	   e.preventDefault();
	   alert("퇴근 시간을 입력해주세요");
   }
  
});

