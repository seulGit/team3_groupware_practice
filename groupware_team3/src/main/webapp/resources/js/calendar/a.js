document.addEventListener('DOMContentLoaded', function () {
    $(function () {
        var request = $.ajax({
            url: "/calendarList",
            method: "get",
            contentType: "application/json; charset=utf-8",
            dataType: "JSON",
            error: function (data) {
                console.log("에러");
            }
        });

        var calendarEl = document.getElementById('calendar');

        request.done(function (data) {
            console.log(data); // log 로 데이터 찍어주기.

            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'listMonth,timeGridDay,timeGridWeek,dayGridMonth'
                },
                initialDate: '2022-09-12',
                navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                editable: true,
                selectable: true,
                dayMaxEventRows: true, // for all non-TimeGrid views
                themeSystem: 'bootstrap5',
                locale: `ko`,
                height: `92vh`,
                views: {
                    timeGrid: {
                        dayMaxEventRows: 4 // adjust to 6 only for timeGridWeek/timeGridDay
                    }
                },
                eventDrop: function (info) {
                    $.ajax({
                        url: "/calendarDateChange",
                        method: "POST",
                        dateType: "text",
                        data: {
                            "calendar_num": info.event.id,
                            "calendar_start_date": info.event.startStr,
                            "calendar_end_date": info.event.endStr
                        }
                    })
                },
                eventClick: function (info) {

                    // 이벤트 변경 버튼
                    const event_change_btn = document.querySelector("#event_change_btn");
                    // 이벤트 삭제 버튼
                    const event_remove_btn = document.querySelector("#event_remove_btn");
                    // 이벤트 추가 타이틀 입력
                    const event_add_title_input = document.querySelector("#event_add_title");
                    // 이벤트 추가 시작 시간 입력 input
                    const month_calendar_start_datetime = document.querySelector(".month_calendar_start_time");
                    // 이벤트 추가 종료 시간 입력 input
                    const month_calendar_end_datetime = document.querySelector(".month_calendar_end_time");
                    // 이벤트 추가 배경 색상
                    const event_background_color = document.querySelector("#event_background_color");
                    // 이벤트 메모
                    const event_content = document.querySelector(".arrow_memo > textarea");

                    console.log('title: ' + info.event.title);
                    console.log('start: ' + info.event.startStr);
                    console.log('end: ' + info.event.endStr);
                    console.log('color: ' + info.event.backgroundColor);
                    console.log('id: ' + info.event.id);
                    console.log('content: ' + info.event.extendedProps.content);

                    event_content.value = info.event.extendedProps.content;

                    // 이벤트 추가 버튼 컨테이너
                    document.querySelector(".event_add").style.display = "none";
                    // 이벤트 수정 버튼 컨테이너
                    document.querySelector(".event_change").style.display = "block";
                    // 이벤트 삭제 버튼 컨테이너
                    document.querySelector(".event_remove").style.display = "block";

                    let user_start_select = info.event.startStr.slice(0, -6);
                    let user_end_select = info.event.endStr.slice(0, -6);

                    event_add_title_input.value = info.event.title;
                    month_calendar_start_datetime.value = user_start_select;
                    month_calendar_end_datetime.value = user_start_select;
                    event_background_color.value = info.event.backgroundColor;

                    // 이벤트 시작 월
                    const user_start_select_month = user_start_select.slice(5, 7);
                    // 이벤트 시작 일
                    const user_start_select_day = user_start_select.slice(8, 10);
                    // 이벤트 시작 시간
                    const user_start_select_hour = user_start_select.slice(11, 13);
                    // 이벤트 시작 분
                    const user_start_select_min = user_start_select.slice(14, 16);

                    // 이벤트 종료 월
                    const user_end_select_month = user_end_select.slice(5, 7);
                    // 이벤트 종료 일
                    const user_end_select_day = user_end_select.slice(8, 10);
                    // 이벤트 종료 시간
                    const user_end_select_hour = user_end_select.slice(11, 13);
                    // 이벤트 종류 분
                    const user_end_select_min = user_end_select.slice(14, 16);

                    event_add_container.style.display = "block";
                    event_add_container.style.transition = "all 1s";
                    event_add_container.style.transform = "rotateX(0deg)";
                    event_add_modal.style.display = "block";

                    event_add_datetime_container.childNodes[2].textContent = user_start_select_month + "월 " + user_start_select_day + "일 " +
                        user_start_select_hour + ":" + user_start_select_min + " ~ " + user_end_select_month + "월 " + user_end_select_day +
                        "일 " + user_end_select_hour + ":" + user_end_select_min;

                    event_change_btn.addEventListener("click", function () {

                        // if(info.event.title != event_add_title_input
                        //     || info.event.backgroundColor != event_background_color.value){
                        //     calendar.refetchEvents();
                        // }

                        info.event.setProp("title", event_add_title_input.value);
                        info.event.setDates(month_calendar_start_datetime.value, month_calendar_end_datetime.value)
                        info.event.setExtendedProp("content", event_content.value);
                        info.event.setProp("backgroundColor", event_background_color.value);


                        $.ajax({
                            url: "/calendarChange",
                            method: "POST",
                            dateType: "text",
                            data: {
                                "calendar_num": info.event.id,
                                "calendar_title": event_add_title_input.value,
                                "calendar_start_date": month_calendar_start_datetime.value,
                                "calendar_end_date": month_calendar_end_datetime.value,
                                "calendar_color": event_background_color.value,
                                "calendar_memo": event_content.value
                            }
                        })
                    })

                    event_remove_btn.addEventListener("click", function () {

                        $.ajax({
                            url: "/calendarDelete",
                            method: "POST",
                            dateType: "text",
                            data: {
                                "calendar_num": info.event.id
                            }
                        })

                        // 이벤트 삭제
                        info.event.remove();

                        // 모달창 내리기
                        event_add_container.style.display = "none";
                        event_add_container.style.transform = "rotateX(90deg)";
                        event_add_container.style.transition = "all 1s";
                        event_add_modal.style.display = "none";
                        event_add_title_input.value = "";
                        event_background_color.value = "#0d6efd";
                    })
                },
                select: function (arg) {

                    // 이벤트 추가 버튼 컨테이너
                    document.querySelector(".event_add").style.display = "block";
                    // 이벤트 수정 버튼 컨테이너
                    document.querySelector(".event_change").style.display = "none";
                    // 이벤트 삭제 버튼 컨테이너
                    document.querySelector(".event_remove").style.display = "none";

                    event_add_container.style.display = "block";
                    event_add_container.style.transition = "all 1s";
                    event_add_container.style.transform = "rotateX(0deg)";
                    event_add_modal.style.display = "block";


                    // 이벤트 추가 버튼
                    const event_add_btn = document.querySelector("#event_add_btn");
                    // 이벤트 추가 타이틀 입력
                    const event_add_title_input = document.querySelector("#event_add_title");
                    // 이벤트 추가 시작 시간 입력 input
                    const month_calendar_start_datetime = document.querySelector(".month_calendar_start_time");
                    // 이벤트 추가 종료 시간 입력 input
                    const month_calendar_end_datetime = document.querySelector(".month_calendar_end_time");
                    // 이벤트 추가 배경 색상
                    const event_background_color = document.querySelector("#event_background_color");
                    // 이벤트 추가 메모
                    const event_content = document.querySelector(".arrow_memo > textarea");

                    // 이벤트 선택 시 시간 기본 설정
                    // 클릭한 날짜 00시 00분 ~ 다음 날짜 00시 00분
                    // ex) 10일 클릭 시
                    //     2022-08-10T00:00 ~ 2022-08-11T00:00
                    month_calendar_start_datetime.value = arg.startStr + "T00:00";
                    month_calendar_end_datetime.value = arg.endStr + "T00:00";

                    let user_start_select = month_calendar_start_datetime.value;
                    let user_end_select = month_calendar_end_datetime.value;

                    // 이벤트 시작 월
                    const user_start_selet_month = user_start_select.slice(5, 7);
                    // 이벤트 시작 일
                    const user_start_selet_day = user_start_select.slice(8, 10);
                    // 이벤트 시작 시간
                    const user_start_selet_hour = user_start_select.slice(11, 13);
                    // 이벤트 시작 분
                    const user_start_selet_min = user_start_select.slice(14, 16);


                    const user_end_select_month = user_end_select.slice(5, 7);
                    // 이벤트 종료 일
                    const user_end_select_day = user_end_select.slice(8, 10);
                    // 이벤트 종료 시간
                    const user_end_select_hour = user_end_select.slice(11, 13);
                    // 이벤트 종류 분
                    const user_end_select_min = user_end_select.slice(14, 16);

                    event_add_datetime_container.childNodes[2].textContent = user_start_selet_month + "월 " + user_start_selet_day + "일 " + user_start_selet_hour + ":" + user_start_selet_min +
                        " ~ " + user_end_select_month + "월 " + user_end_select_day + "일 " + user_end_select_hour + ":" + user_end_select_min;

                    // 이벤트 추가 버튼 클릭 시
                    event_add_btn.addEventListener("click", function () {

                        // 이벤트의 제목이 없을 경우
                        if (event_add_title_input.value == "" || event_add_title_input.value == null) {
                            calendar.unselect();
                            return;
                            // 이벤트의 시작일시가 없을 경우
                        } else if (month_calendar_start_datetime.value == "" || month_calendar_start_datetime.value == null) {
                            calendar.unselect();
                            return;
                        }

                        // 메모
                        let obj_content = new Object();
                        obj_content.contant = event_content.value;
                        // 입력한 값을 obj에 할당
                        let obj = new Object();
                        obj.title = event_add_title_input.value;
                        obj.start = month_calendar_start_datetime.value;
                        obj.end = month_calendar_end_datetime.value;
                        obj.backgroundColor = event_background_color.value;
                        obj.extendedProps = obj_content;

                        // 사용자가 이벤트 추가 시 바로 화면을 볼수 있도록
                        calendar.addEvent({
                            title: obj.title,
                            start: obj.start,
                            end: obj.end,
                            backgroundColor: obj.backgroundColor,
                            extendedProps: obj.extendedProps
                        });

                        $.ajax({
                            url: "/calendarAdd",
                            method: "POST",
                            dataType: "text",
                            data: {
                                "calendar_title": obj.title,
                                "calendar_start_date": obj.start,
                                "calendar_end_date": obj.end,
                                "calendar_color": obj.backgroundColor,
                                "calendar_memo": obj.extendedProps.contant
                            },
                            success: function (){
                                window.location.reload();
                            }
                        });
                        event_add_container.style.display = "none";
                        event_add_container.style.transform = "rotateX(90deg)";
                        event_add_container.style.transition = "all 1s";
                        event_add_modal.style.display = "none";
                        event_add_title_input.value = "";
                        event_background_color.value = "#0d6efd";
                        calendar.unselect();
                    });
                },
                events: data
            });
            calendar.render();
        });
    });
});


// ================이벤트 팝업 컨테이너 관련 선언===================
const event_add_container = document.querySelector(".arrow_arrow");
const event_add_modal = document.querySelector(".event_add_container");

// ================이벤트 일시 관련 선언===================
// 이벤트 기간 및 시간 박스
const event_add_datetime_container = document.querySelector(".arrow_datetime_container");
// 이벤트 시간 설정 박스
const event_add_datetime_box = document.querySelector(".arrow_datetime_container > div");

// 이벤트 추가 모달 창 바깥 클릭시 모달 내리기
event_add_modal.addEventListener("click", function (e) {
    if (e.target.classList.contains("event_add_container")) {
        event_add_container.style.display = "none";
        // event_add_container.style.animation = "event_add_container_hide 1s";
        event_add_container.style.transform = "rotateX(90deg)";
        event_add_container.style.transition = "all 1s";
        event_add_modal.style.display = "none";
    } else if (!e.target.classList.contains("arrow_datetime_container") && !e.target.classList.contains("event_datetime_box") &&
        !e.target.classList.contains("start_text") && !e.target.classList.contains("end_text") &&
        !e.target.classList.contains("month_calendar_start_time") && !e.target.classList.contains("month_calendar_end_time")) {

        // 이벤트 추가 시작 시간 입력 input
        const month_calendar_start_datetime = document.querySelector(".month_calendar_start_time").value;
        // 이벤트 추가 종료 시간 입력 input
        const month_calendar_end_datetime = document.querySelector(".month_calendar_end_time").value;

        // 이벤트 시작 월
        const user_start_selet_month = month_calendar_start_datetime.slice(5, 7);
        // 이벤트 시작 일
        const user_start_selet_day = month_calendar_start_datetime.slice(8, 10);
        // 이벤트 시작 시간
        const user_start_selet_hour = month_calendar_start_datetime.slice(11, 13);
        // 이벤트 시작 분
        const user_start_selet_min = month_calendar_start_datetime.slice(14, 16);

        const user_end_select_month = month_calendar_end_datetime.slice(5, 7);
        // 이벤트 종료 일
        const user_end_select_day = month_calendar_end_datetime.slice(8, 10);
        // 이벤트 종료 시간
        const user_end_select_hour = month_calendar_end_datetime.slice(11, 13);
        // 이벤트 종류 분
        const user_end_select_min = month_calendar_end_datetime.slice(14, 16);

        event_add_datetime_box.style.height = "0px";
        event_add_datetime_box.style.borderTop = "";
        event_add_datetime_box.style.borderBottom = "";
        event_add_datetime_box.style.padding = "0";

        event_add_datetime_container.style.margin = "15px 0";
        event_add_datetime_container.style.padding = "10px 0";
        event_add_datetime_container.style.width = "auto";

        event_add_container.style.transform = "translateY(0px)";

        event_add_datetime_container.style.transform = "translateX(0px)";


        event_add_datetime_container.childNodes[2].textContent = user_start_selet_month + "월 " + user_start_selet_day + "일 " + user_start_selet_hour + ":" + user_start_selet_min +
            " ~ " + user_end_select_month + "월 " + user_end_select_day + "일 " + user_end_select_hour + ":" + user_end_select_min;
    }

})

// 시간 선택 버튼 클릭 시
event_add_datetime_container.addEventListener("click", function () {
    event_add_datetime_container.childNodes[2].textContent = "";
    event_add_datetime_box.style.height = "90px";
    event_add_datetime_box.style.borderTop = "1px solid gray";
    event_add_datetime_box.style.borderBottom = "1px solid gray";
    event_add_datetime_box.style.padding = "10px";

    event_add_datetime_container.style.margin = "15px 0";
    event_add_datetime_container.style.padding = "0";
    event_add_datetime_container.style.width = "298px";
    event_add_datetime_container.style.transform = "translateX(-14.7px)";
    event_add_container.style.transform = "translateY(-30px)";
})