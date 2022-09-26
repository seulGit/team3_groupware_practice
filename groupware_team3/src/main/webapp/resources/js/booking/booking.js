document.addEventListener('DOMContentLoaded', function () {
    $(function () {
        var request = $.ajax({
            url: "/bookingList",
            method: "get",
            contentType: "application/json; charset=utf-8",
            dataType: "JSON",
            success: function (data) {
                console.log(data)
            },
            error: function (data) {
                console.log("에러");
            }
        });

        var calendarEl = document.getElementById('calendar');

        request.done(function (data) {

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
                        url: "/bookingDateChange",
                        method: "POST",
                        dateType: "text",
                        data: {
                            "booking_num": info.event.id,
                            "booking_start_date": info.event.startStr.slice(0, -6),
                            "booking_end_date": info.event.endStr.slice(0, -6)
                        },
                        success: function () {

                        }
                    })
                },
                eventClick: function (info) {

                    if (info.event.extendedProps.meetingroom != null) {
                        booking_event_meetingroom.value = info.event.extendedProps.meetingroom;
                        booking_event_fixtures_box.style.height = "0px";
                        booking_event_fixtures_box.style.opacity = "0";
                        booking_event_fixtures_box.style.visibility = "hidden";
                    } else if (info.event.extendedProps.fixtures != null) {
                        booking_event_fixtures.value = info.event.extendedProps.fixtures;
                        booking_event_meetingroom_box.style.height = "0px";
                        booking_event_meetingroom_box.style.opacity = "0";
                        booking_event_meetingroom_box.style.visibility = "hidden";
                    }

                    // 추가 버튼
                    const booking_add_event = document.querySelector(".booking_add_event");
                    // 수정 버튼
                    const booking_change_event = document.querySelector(".booking_change_event");
                    // 삭제 버튼
                    const booking_remove_event = document.querySelector(".booking_remove_event");
                    // 이벤트 제목
                    const booking_title = document.querySelector(".booking_event_title");
                    // 이벤트 시작 input
                    const booking_start_date = document.querySelector(".booking_start_date");
                    // 이벤트 종료 input
                    const booking_end_date = document.querySelector(".booking_end_date");
                    // 이벤트 메모
                    const booking_memo = document.querySelector(".booking_memo");

                    booking_modal.style.display = "block";
                    booking_add_event.style.display = "none";
                    booking_change_event.style.display = "block";
                    booking_remove_event.style.display = "block";

                    defualt_date(info.event.startStr.slice(0, -6), info.event.endStr.slice(0, -6));

                    let user_start_select = info.event.startStr.slice(0, -6);
                    let user_end_select = info.event.endStr.slice(0, -6);

                    booking_title.value = info.event.title;
                    booking_start_date.value = user_start_select;
                    booking_end_date.value = user_end_select;
                    booking_memo.value = info.event.extendedProps.content;

                    const user_check_box = document.querySelectorAll("input[id *= user]");
                    for (let i = 0; i< user_check_box.length; i++){
                        user_check_box[i].checked = false;
                    }

                    // 참석자 리스트 삭제
                    const attendees_all = document.querySelectorAll(".attendees");
                    for (let i = 0; i < attendees_all.length; i++) {
                        attendees_all[i].remove();
                    }

                    // 참석자 리스트 만들기
                    let attendees = info.event.extendedProps.attendees.split(",");
                    for (let i = 0; i < user_check_box.length; i++) {
                        for (let j = 0; j < attendees.length; j++) {
                            if (attendees[j] == user_check_box[i].id.slice(4)) {
                                if (user_check_box[i].checked == false) {
                                    user_check_box[i].checked = true;
                                    console.log(user_check_box[i].labels[0].innerHTML)
                                    // =============== 요소 만들기 ===============
                                    const attendees = document.createElement("div"); // 최상단 div 생성
                                    const attendees_name_box = document.createElement("div"); // 이름 div 생성
                                    const attendees_name = document.createElement("span"); // 이름 들어가는 span 생성
                                    attendees.setAttribute("class", `attendees user_${user_check_box[i].id.slice(4)}`); // 최상단 div에 클래스 주입
                                    attendees_name.innerHTML = user_check_box[i].labels[0].innerHTML; // 이름 들어가는 div에 이름넣기
                                    attendees_name_box.append(attendees_name); // 자식요소로 추가
                                    attendees.append(attendees_name_box); // 자식요소로 추가
                                    booking_attendees_list_box.append(attendees); // 자식요소로 추가

                                    booking_attendees_list_box.childNodes[0].textContent = "";
                                }
                            }
                        }
                    }

                    // 수정버튼 클릭 시
                    booking_change_event.addEventListener("click", function(){

                        // 참석자 데이터를 숫자만 뽑아서 배열로 저장
                        let attendees_List = new Array;
                        for (let i = 0; i < user_check_box.length; i++) {
                            if (user_check_box[i].checked == true) {
                                attendees_List.push(user_check_box[i].id.slice(4) + ",");
                            }
                        }

                        // 참석자 데이터를 배열에서 문자열로 변환
                        let attendees_emp_code_list = "";
                        for (let i = 0; i < attendees_List.length; i++) {
                            attendees_emp_code_list += attendees_List[i];
                        }


                        info.event.setProp("title", booking_title.value);
                        info.event.setDates(booking_start_date.value, booking_end_date.value)
                        info.event.setExtendedProp("content", booking_memo.value);
                        info.event.setExtendedProp("meetingroom", booking_event_meetingroom.value);
                        info.event.setExtendedProp("fixtures", booking_event_fixtures.value);
                        info.event.setExtendedProp("attendees", attendees_emp_code_list);


                        $.ajax({
                            url: "/booking_event_change",
                            method: "POST",
                            dataType: "text",
                            data: {
                                "booking_num" : info.event.id,
                                "booking_title" : booking_title.value,
                                "booking_start_date" : booking_start_date.value,
                                "booking_end_date" : booking_end_date.value,
                                "booking_memo" : booking_memo.value,
                                "meetingroom_num" : booking_event_meetingroom.value,
                                "fixtures_num" : booking_event_fixtures.value,
                                "booking_attendees" : attendees_emp_code_list
                            }
                        })
                        booking_modal.style.display = "none";
                        booking_event_datetime_container.childNodes[0].data = "";
                        booking_event_datetime_box.style.height = "0px";
                        booking_event_title.classList.remove("empty_booking_event_title_color");
                    })

                    // 삭제 버튼 클릭 시
                    booking_remove_event.addEventListener("click", function () {

                        $.ajax({
                            url: "/booking_delete",
                            method: "POST",
                            dateType: "text",
                            data: {
                                "booking_num": info.event.id
                            }
                        })

                        // 이벤트 삭제
                        info.event.remove();

                        booking_modal.style.display = "none";
                        booking_event_datetime_container.childNodes[0].data = "";
                        booking_event_datetime_box.style.height = "0px";
                        booking_event_title.classList.remove("empty_booking_event_title_color");
                    })

                },
                select: function (arg) {
                    // 추가 버튼
                    const booking_add_event = document.querySelector(".booking_add_event");
                    // 수정 버튼
                    const booking_change_event = document.querySelector(".booking_change_event");
                    // 삭제 버튼
                    const booking_remove_event = document.querySelector(".booking_remove_event");
                    // 이벤트 타이틀
                    const booking_event_title = document.querySelector(".booking_event_title");
                    // 이벤트 시작 input
                    const booking_start_date = document.querySelector(".booking_start_date");
                    // 이벤트 종료 input
                    const booking_end_date = document.querySelector(".booking_end_date");
                    // 이벤트 메모
                    const booking_memo = document.querySelector(".booking_memo");

                    defualt_date(arg.startStr + "T00:00", arg.endStr + "T00:00");

                    // 모달창 띄우기
                    booking_modal.style.display = "block";
                    // 이벤트 추가 버튼 띄우기
                    booking_add_event.style.display = "block";
                    // 이벤트 수정 버튼 숨기기
                    booking_change_event.style.display = "none";
                    // 이벤트 삭제 버튼 숨기기
                    booking_remove_event.style.display = "none";

                    // 이벤트 타이틀 빈값으로
                    booking_event_title.value = "";
                    // 이벤트 참석자 색상 기본값으로 변경
                    booking_attendees_list.style.color = "black";
                    // 이벤트 메모 빈값으로 변경
                    booking_memo.value = "";
                    // 이벤트 일시 기본값 설정
                    booking_start_date.value = arg.startStr + "T00:00";
                    booking_end_date.value = arg.endStr + "T00:00";

                    booking_event_meetingroom.value = null;
                    booking_event_fixtures_box.style.height = "30px";
                    booking_event_fixtures_box.style.opacity = "1";
                    booking_event_fixtures_box.style.visibility = "visible";
                    booking_event_fixtures.value = null;
                    booking_event_meetingroom_box.style.height = "30px";
                    booking_event_meetingroom_box.style.opacity = "1";
                    booking_event_meetingroom_box.style.visibility = "visible";

                    // 참석자 리스트 삭제
                    const attendees_all = document.querySelectorAll(".attendees");
                    for (let i = 0; i < attendees_all.length; i++) {
                        attendees_all[i].remove();
                    }
                    booking_attendees_list_box.childNodes[0].textContent = "참석자및 사용자를 선택해주세요"

                    // 참석자 체크박스 해제
                    const user_check_box = document.querySelectorAll("input[id *= user]");
                    for (let i = 0; i < user_check_box.length; i++) {
                        user_check_box[i].checked = false;
                    }

                    // 이벤트 등록 버튼 클릭 시
                    booking_add_event.addEventListener("click", function () {
                        // 이벤트 제목이 없을 시
                        if (booking_event_title.value == "" || booking_event_title.value == null) {
                            console.dir(booking_event_title)
                            booking_event_title.style.animation = "empty_booking_event_title 0.5s";
                            booking_event_title.classList.add("empty_booking_event_title_color");
                            setTimeout(function () {
                                booking_event_title.style.animation = "";
                            }, 300);
                            calendar.unselect();
                            return;
                            // 회의실 및 비품을 아무것도 선택하지 않을 시
                        } else if (booking_event_meetingroom.value == "null" && booking_event_fixtures.value == "null") {
                            booking_event_meetingroom.style.color = "red";
                            booking_event_meetingroom_box.style.animation = "empty_booking_event_title 0.5s";
                            setTimeout(function () {
                                booking_event_meetingroom_box.style.animation = "";
                                booking_event_fixtures.style.color = "red";
                                booking_event_fixtures_box.style.animation = "empty_booking_event_title 0.5s";
                                setTimeout(function () {
                                    booking_event_fixtures_box.style.animation = "";
                                }, 300)
                            }, 500);
                            calendar.unselect();
                            return;
                            // 참석자 및 사용자를 아무도 선택하지 않을 시
                        } else if (booking_attendees_list_box.childNodes[3] == null) {
                            console.dir(booking_attendees_list_box);
                            booking_attendees_list.style.color = "red";
                            booking_attendees_list.style.animation = "empty_booking_event_title 0.3s";
                            setTimeout(function () {
                                booking_attendees_list.style.animation = "";
                            }, 300);
                            calendar.unselect();
                            return;
                        } else if (booking_modal.style.display == "none") {
                            calendar.unselect();
                            return;
                        }

                        // 참석자 데이터를 숫자만 뽑아서 배열로 저장
                        let attendees_List = new Array;
                        for (let i = 0; i < user_check_box.length; i++) {
                            if (user_check_box[i].checked == true) {
                                attendees_List.push(user_check_box[i].id.slice(4) + ",");
                            }
                        }

                        // 참석자 데이터를 배열에서 문자열로 변환
                        let attendees_emp_code_list = "";
                        for (let i = 0; i < attendees_List.length; i++) {
                            attendees_emp_code_list += attendees_List[i];
                        }

                        let obj_content = new Object();
                        obj_content.content = booking_memo.value;
                        let obj_attendees = new Object();
                        obj_attendees.attendees = attendees_emp_code_list;
                        let obj_meetingroom = new Object();
                        obj_meetingroom.meetingroom = booking_event_meetingroom.value;
                        let obj_fixtures = new Object();
                        obj_fixtures.fixtures = booking_event_fixtures.value;


                        // 입력한 값을 obj에 할당
                        let obj = new Object();
                        obj.title = booking_event_title.value;
                        obj.start = booking_start_date.value;
                        obj.end = booking_end_date.value;
                        obj.extendedProps = obj_content;
                        obj.extendedProps = obj_attendees;
                        obj.extendedProps = obj_meetingroom;
                        obj.extendedProps = obj_fixtures;

                        console.log(obj)

                        calendar.addEvent({
                            title: booking_event_title.value,
                            start: booking_start_date.value,
                            end: booking_end_date.value,
                            extendedProps: {
                                content: booking_memo.value,
                                attendees: attendees_emp_code_list,
                                meetingroom: booking_event_meetingroom.value,
                                fixtures: booking_event_fixtures.value
                            }
                        });
                        $.ajax({
                            url: "/booking_add",
                            method: "POST",
                            dataType: "text",
                            data: {
                                "booking_title": booking_event_title.value,
                                "booking_start_date": booking_start_date.value,
                                "booking_end_date": booking_end_date.value,
                                "booking_memo": booking_memo.value,
                                "booking_attendees": attendees_emp_code_list,
                                "meetingroom_num": booking_event_meetingroom.value,
                                "fixtures_num": booking_event_fixtures.value
                            }
                        })
                        booking_modal.style.display = "none";
                        booking_event_datetime_container.childNodes[0].data = "";
                        booking_event_datetime_box.style.height = "0px";
                        booking_event_title.classList.remove("empty_booking_event_title_color");
                        calendar.render();
                    })


                },
                events: data
                // [{
                //     title: "프로젝트",
                //     start: "2022-09-20T00:00",
                //     end: "2022-09-30T00:00",
                //     extendedProps: {
                //         content: "빠르게",
                //         attendees: "990810,931005",
                //         meetingroom: "meetingroom_1",
                //         fixtures: "null"
                //     }
                // }]
            });
            calendar.render();
        });
    });
});

// 모달창
const booking_modal = document.querySelector(".booking_modal");
// 시간선택 버튼
const booking_event_datetime_container = document.querySelector(".booking_event_datetime_container");

const booking_event_datetime_box = document.querySelector(".booking_event_datetime_box");

const booking_event_container = document.querySelector(".booking_event_container");

const booking_event_title = document.querySelector(".booking_event_title");

function defualt_date(start, end) {
    // 이벤트 시작 월
    const user_start_selet_month = start.slice(5, 7);
    // 이벤트 시작 일
    const user_start_selet_day = start.slice(8, 10);
    // 이벤트 시작 시간
    const user_start_selet_hour = start.slice(11, 13);
    // 이벤트 시작 분
    const user_start_selet_min = start.slice(14, 16);


    const user_end_select_month = end.slice(5, 7);
    // 이벤트 종료 일
    const user_end_select_day = end.slice(8, 10);
    // 이벤트 종료 시간
    const user_end_select_hour = end.slice(11, 13);
    // 이벤트 종류 분
    const user_end_select_min = end.slice(14, 16);

    booking_event_datetime_container.childNodes[0].data = user_start_selet_month + "월 " + user_start_selet_day + "일 " + user_start_selet_hour + ":" + user_start_selet_min +
        " ~ " + user_end_select_month + "월 " + user_end_select_day + "일 " + user_end_select_hour + ":" + user_end_select_min;
}

booking_event_datetime_container.addEventListener("click", function () {
    booking_event_datetime_container.childNodes[0].data = "";
    booking_event_datetime_box.style.height = "50px";
});

booking_event_container.addEventListener("click", function (e) {
    if (e.target.classList != "booking_event_datetime_container" && e.target.classList != "booking_event_datetime_box" &&
        e.target.classList != "booking_start_datetime" && e.target.classList != "booking_end_datetime" &&
        e.target.classList != "booking_start_text" && e.target.classList != "booking_end_text" &&
        e.target.classList != "booking_start_date" && e.target.classList != "booking_end_date") {

        // 이벤트 시작 input
        const booking_start_date = document.querySelector(".booking_start_date");
        // 이벤트 종료 input
        const booking_end_date = document.querySelector(".booking_end_date");

        defualt_date(booking_start_date.value, booking_end_date.value);

        booking_event_datetime_box.style.height = "0px";
    }
})


const booking_attendees_list_box = document.querySelector(".booking_attendees_list > div");
const booking_attendees_list = document.querySelector(".booking_attendees_list");
const booking_attendees_check = document.querySelector(".booking_attendees_check");
booking_attendees_check.addEventListener("click", function (e) {
    // 체크박스를 선택하는지 확인
    if (e.target.id.indexOf("user") !== -1) {
        // 선택한 체크박스가 체크되어 있는지 확인
        if (e.target.checked == true) {
            // =============== 요소 만들기 ===============
            const attendees = document.createElement("div"); // 최상단 div 생성
            const attendees_name_box = document.createElement("div"); // 이름 div 생성
            const attendees_name = document.createElement("span"); // 이름 들어가는 span 생성
            attendees.setAttribute("class", `attendees user_${e.target.id.slice(4)}`); // 최상단 div에 클래스 주입
            attendees_name.innerHTML = e.target.labels[0].innerHTML; // 이름 들어가는 div에 이름넣기
            attendees_name_box.append(attendees_name); // 자식요소로 추가
            attendees.append(attendees_name_box); // 자식요소로 추가
            booking_attendees_list_box.append(attendees); // 자식요소로 추가

            booking_attendees_list_box.childNodes[0].textContent = "";

            // 선택한 체크박스가 체크되어 있는 상태에서 클릭 시 해당 이름 삭제
        } else if (e.target.checked == false) {
            const user = document.querySelector(`.user_${e.target.id.slice(4)}`);
            user.remove();
            // 참석자를 선택하지 않았을때
            if (booking_attendees_list_box.childNodes[3] == null) {
                booking_attendees_list_box.childNodes[0].textContent = "참석자 및 사용자를 선택해주세요"
            }
        }
    }
})

booking_modal.addEventListener("click", function (event) {
    if (event.target.classList == "booking_modal") {
        booking_modal.style.display = "none";
        booking_event_datetime_container.childNodes[0].data = "";
        booking_event_datetime_box.style.height = "0px";
        booking_event_title.classList.remove("empty_booking_event_title_color");
    }
});

const booking_event_use_select = document.querySelector(".booking_event_use_select");

const booking_event_meetingroom_box = document.querySelector(".booking_event_meetingroom");
const booking_event_fixtures_box = document.querySelector(".booking_event_fixtures");

const booking_event_meetingroom = document.querySelector("#booking_event_meetingroom");
const booking_event_fixtures = document.querySelector("#booking_event_fixtures");

booking_event_meetingroom.addEventListener("change", function () {
    // 회의실을 선택하지 않았을 때
    if (booking_event_meetingroom.value == "null") {
        booking_event_fixtures_box.style.height = "30px";
        booking_event_fixtures_box.style.opacity = "1";
        booking_event_fixtures_box.style.visibility = "visible";
        // 회의실을 선택했을 때
    } else if (booking_event_meetingroom.value != "null") {
        booking_event_fixtures_box.style.height = "0px";
        booking_event_fixtures_box.style.opacity = "0";
        booking_event_fixtures_box.style.visibility = "hidden";
    }
});

booking_event_fixtures.addEventListener("click", function () {
    // 비품을 선택하지 않았을 때
    if (booking_event_fixtures.value == "null") {
        booking_event_meetingroom_box.style.height = "30px";
        booking_event_meetingroom_box.style.opacity = "1";
        booking_event_meetingroom_box.style.visibility = "visible";
        // 비품을 선택했을 때
    } else if (booking_event_fixtures.value != "null") {
        booking_event_meetingroom_box.style.height = "0px";
        booking_event_meetingroom_box.style.opacity = "0";
        booking_event_meetingroom_box.style.visibility = "hidden";
    }
})
// 아무것도 선택하지 않아 글자 색상이 변한 이후 선택하기 위해 클릭 시
booking_event_fixtures.addEventListener("click", function () {
    booking_event_fixtures.style.color = "black";
    booking_event_meetingroom.style.color = "black";
})
booking_event_meetingroom.addEventListener("click", function () {
    booking_event_meetingroom.style.color = "black";
    booking_event_fixtures.style.color = "black";
})