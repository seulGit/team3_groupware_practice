let testbtn = document.querySelector('.dept_ajax');

//$(document).ready(
//    $(testbtn).click(function () {
//        // alert("응답하라");
//        {
//            $.ajax({
//                type: "GET",                // GET 또는 POST
//                data: "",
//                url: 'resources/json/message_address.json',      // 서버측에서 가져올 페이지
//                success: function(result) {
//                    console.log(result);
//                    let output =
//                      "<table><thead><tr><th>부서</th><th>직책</th><th>이름</th><th>사원코드</th></thead><tbody>";
//                    for (let i in result) {
//                      output +=
//                        "<tr><td>" +
//                        result[i].부서 +
//                        "</td><td>" +
//                        result[i].직책 +
//                        "</td><td>" +
//                        result[i].이름 +
//                        "</td><td>" +
//                        result[i].사원코드 +
//                        "</td></tr>";
//                    }
//                    output += "</tbody></table>";
//            
//                    $("#modal_personal_info").html(output);
//                    $("table").addClass("dept_right");
//                  }
//            });
//        }
//    })
//);

// ====== 조직도에서 팀이름 클릭 했을때 ====== //

$(document).ready(function () {
$(testbtn).each(function(){
	$(testbtn).click(function () {
		
		// 검색어 비우기 
	//	 $("input#searchWord").val("");
		
		$.ajax({ 
			type: "GET",
			url:"/message_write/writeAddress",
			// data: {"fk_dept_no" : fk_dept_noVal},
//	        data: {"emp_name" : lee, 
//	            "position_name" : manager,
//	            "dept_name" : 경영, 
//	            "emp_no" : 5, 
//	            "fk_dept_no" : d003
//	        	},
			dataType:"json",
            success: function(data) {
                let output =
                  "<table><thead><tr><th>부서</th><th>직책</th><th>이름</th><th>사원코드</th></thead><tbody>";

	            if(data.length > 0) {
		            $.each(data, function(index, item){
		            output +=
		            "<tr><td>" +
		            item.emp_name +
		            "</td><td>" +
		            item.position_name +
		            "</td><td>" +
		            item.dept_name +
		            "</td><td>" +
		            item.emp_no +
		            "</td></tr>";
		            console.log(item);
		        });
                output += "</tbody></table>";
                $("#modal_personal_info").html(output);
                $("table").addClass("dept_right");
	            }
			},
	        error: function(){
	            alert("실패했어!!");
		    }
			
		});		
		
	});
});	

//$('.dept_ajax').on('click', function(){
//    var form = {
//            "emp_name" : lee, 
//            "position_name" : manager,
//            "dept_name" : 경영, 
//            "emp_no" : 5, 
//            "fk_dept_no" : d003
//    }
//    $.ajax({
//    	type: "GET",
//        url: "/message_write/writeAddress",
//		data: {"fk_dept_no" : map},
//        dataType: "json",
//        contentType: "application/json; charset=utf-8;",
//        success: function(data) {
//          let output =
//            "<table><thead><tr><th>부서</th><th>직책</th><th>이름</th><th>사원코드</th></thead><tbody>";
//          if(data.length > 0) {
//	            $.each(data, function(index, item){
//	            output +=
//              "<tr><td>" +
//              item.emp_name +
//              "</td><td>" +
//              item.position_name +
//              "</td><td>" +
//              item.dept_name +
//              "</td><td>" +
//              item.emp_no +
//              "</td></tr>";
//          });
//          output += "</tbody></table>";
//          $("#modal_personal_info").html(output);
//          $("table").addClass("dept_right");
//          }
//		},
//        error: function(){
//            alert("실패했어!!");
//        }
//    });
//});

});










