// 카카오 주소 찾기 api

const zip_btn = document.querySelector(".zip_btn"); //주소검색 버튼
let address_one = document.querySelector(".address_one"); //주소
let address_two = document.querySelector(".address_two"); //상세주소

zip_btn.addEventListener('click',function(){
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
            address_one.value = data.address; // 주소 넣기
            address_two.focus(); //상세입력 포커싱
        }
    }).open();
});