<%--
  Created by IntelliJ IDEA.
  User: oseulki
  Date: 2022/09/26
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>JaeHee Group</title>
<%--    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>--%>
    <link href="/resources/css/styles.css" rel="stylesheet"/>
    <link href="/resources/css/admin/admin_personnelCard.css" rel="stylesheet"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<%@ include file="/WEB-INF/views/intro.jsp" %>


<div id="layoutSidenav_content" class="admin_contents_section">
    <div class="content_box">
        <i class="fa-solid fa-id-card"></i>인사기록카드
    </div>


    <!-- 기본정보_본문 -->
    <div class="admin_personnel_container">
        <div class="admin_personnel_sidebar">
            <div><a href="../admin/admin_personnelCard">조회</a></div>
            <div><a href="../admin/admin_personnelCardRegister">등록</a></div>
        </div>
        <div class="admin_personnel_body">
            <div class="contents">
                <div class="search">
                    <span class="office_map_btn"><a href="">조직도 조회</a></span>
                    <span>사원이름</span>
                    <input type="text">
                    <span>부서</span>
                    <select name="department" id="department">
                        <option value="마케팅">마케팅</option>
                        <option value="IT">IT</option>
                    </select>
                    <span>사원번호</span>
                    <input type="text">
                    <span>입사일</span>
                    <input type="date" value="">
                    <span>휴대폰번호</span>
                    <input type="text">
                    <span>메일주소</span>
                    <input type="email">
                    <i class="xi-search"></i>
                </div>
                <div class="tap">
                    <div class="tap_result">검색결과목록</div>
                    <div class="tap_details">상세내용</div>
                </div>
                <div class="result">

                    <div class="list">
                        <table>
                            <tr>
                                <td>No.</td>
                                <td>이름</td>
                                <td>성별</td>
                                <td>부서</td>
                                <td>사원번호</td>
                                <td>입사일</td>
                                <td>휴대폰번호</td>
                                <td>메일주소</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>남자</td>
                                <td>홍길동</td>
                                <td>IT</td>
                                <td>1234</td>
                                <td>2022-08-22</td>
                                <td>01012345678</td>
                                <td>hgd@naver.com</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>여자</td>
                                <td>김철수</td>
                                <td>마케팅</td>
                                <td>1235</td>
                                <td>2021-08-22</td>
                                <td>01011112222</td>
                                <td>kcs@naver.com</td>
                            </tr>
                        </table>
                    </div>
                    <div class="details">
                        <div class="details_left">
                            <div class="img_box"></div>
                            <div class="modify_box">
                                <input type="file">
                                <button class="btn_delete">삭제</button>
                            </div>
                        </div>
                        <div class="details_right">
                            <div class="details_name box">
                                <div>이름</div>
                                <input type="text">
                            </div>
                            <div class="details_gender box">
                                <div>성별</div>
                                <select>
                                    <option>남</option>
                                    <option>여</option>
                                </select>
                            </div>
                            <div class="details_dept box">
                                <div>부서</div>
                                <input type="text">
                            </div>
                            <div class="details_empcode box">
                                <div>사원번호</div>
                                <input type="text">
                            </div>
                            <div class="details_regdate box">
                                <div>입사일</div>
                                <input type="text">
                            </div>
                            <div class="details_phone box">
                                <div>휴대폰번호</div>
                                <input type="text">
                            </div>
                            <div class="details_email box">
                                <div>메일주소</div>
                                <input type="text">
                            </div>
                            <div class="details_address box">
                                <div>주소</div>
                                <div class="address_body">
                                    <button class="zip_btn">주소검색</button>
                                    <input type="text" class="address_one" placeholder="주소">
                                    <input type="text" class="address_two" placeholder="상세주소">
                                </div>
                            </div>
                            <div class="details_school box">
                                <div>학력사항</div>
                                <input type="text">
                            </div>
                            <div class="details_btn">
                                <button class="btn_modify">수정</button>
                                <button class="btn_delete">삭제</button>
                            </div>
                        </div>
                        <!-- <div class="details_title">
                            <span>이름</span>
                            <span>성별</span>
                            <span>부서</span>
                            <span>사원번호</span>
                            <span>입사일</span>
                            <span>휴대폰번호</span>
                            <span>메일주소</span>
                            <span>주소</span>
                            <span>학력사항</span>
                        </div>
                        <div class="details_details">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/resources/js/admin/admin_personnelCard.js"></script>

</body>
</html>
