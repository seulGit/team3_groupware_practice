const modal = document.querySelector('.message_modal');
const btnOpenPopup = document.querySelector('.message_btn-open-popup');
const modal_close = document.querySelector('.modal_close');

// 22/08/22 김정치 모달창 띄우기
btnOpenPopup.addEventListener('click', () => {
    modal.style.display = 'block';
});

modal_close.addEventListener('click', () => {
    modal.style.display = 'none';
});

// 모달 on
body.style.overflow = 'hidden';

// 모달 off
body.style.overflow = 'auto';



