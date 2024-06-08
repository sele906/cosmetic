<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="/resources/assets/css/fonticons.css">
<link rel="stylesheet" href="/resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="/resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/plugins.css" />
<link rel="stylesheet" href="/resources/assets/css/style.css">
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />
<script
   src="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
   
<!-- 다음지도 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
#pageWrap {
/* 	margin: 230px auto 200px auto;
	width: 60%;
	height: 100%;
	font-size: 0.9em;
	min-width: 610px; */
}
.btn_check {
   width: 50px;
   background-color: #0a0a23;
   color: #fff;
   border: none;
   border-radius: 10px;
   padding: 15px;
   min-height: 30px;
   min-width: 120px;
}

input[type="text"],
input[type="password"] {
   border: none;
   width: 400px;
   padding-right: 5px;
}

input[type="text"]::placeholder,
input[type="password"]::placeholder {
   color: #A6A6A6;
}

.title_area { /* 각 아티클의 상단 제목 */
   display: flex;
   align-items: center;
   margin-bottom: 30px;
   padding: 0 10px;
}

.contents {
   box-sizing: border-box;
   word-break: keep-all;
   word-wrap: break-word;
   font-family: "Pretendard", sans-serif;
   letter-spacing: -0.01em;
   max-width: 640px;
   height: 100%;
   margin: 0 auto;
   padding: 0 20px 0;
}

article {
   margin-bottom: 50px;
}

.strong_title {
   font-size: 20px;
   font-weight: 800;
   line-height: 150%;
   letter-spacing: -0.48px;
   color: #454545;
   font-family: 'FontAwesome', sans-serif;
}

.strong_name {
   display: unset;
   width: 150px;
   flex: none;
   color: #A6A6A6;
}

span {
   font-size: 14px;
   font-weight: 500;
   line-height: 150%;
   letter-spacing: -0.42px;
   color: #A6A6A6;
}

.ul_join {
   list-style: none;
}

.li_join {
   display: flex;
   height: 54px;
   align-items: center;
   border-bottom: 1px solid #f5f5f5;
}

.li_join span {
    display: flex;
    align-items: center; /* 세로 가운데 정렬 */
}
</style>


</head>
<body>

<%@ include file="../include/menu/menu.jsp"%>

<div id="pageWrap">

<!-- 수정후 완료 메세지 -->
<c:if test="${msg == 'success'}">
	<script type="text/javascript">
		alert("회원정보가 수정되었습니다.");
	</script>
</c:if>

<!-- 회원가입 폼 섹션 -->
<section id="contact" class="contactus margin-top-120">
   <div class="container">
      <div class="row">
         <div class="col-sm-12">
            <div class="main_contact sections">
               <div class="head_title text-center">
                  <h2 style="line-height: 2.1;">회원정보 수정</h2>
               </div>
               
               <form id="form1" name="form1" method="post">
                  
                  <!-- 회원가입 폼 -->
                  <section class="contents">
                     
                     <article>
                        <!-- 이름, 생년월일, 휴대폰번호 이메일 -->
                        <div class="title_area">
                           <strong class="strong_title">회원정보</strong>
                        </div>
                        <ul class="ul_join">
                        	<li class="li_join"><strong class="strong_name">아이디</strong>
                              <span><input type="text" name="userid" id="userid" value="${dto.userid}" readonly="readonly"></span>
                           </li>
                           <li class="li_join"><strong class="strong_name">이름</strong>
                              <span><input name="name" id="name" type="text" value="${dto.name}"></span>
                           </li>
                           <li class="li_join"><strong class="strong_name">닉네임</strong>
                              <span><input type="text" name="nickname" id="nickname" value="${dto.nickname}"></span></li>
                           <li class="li_join"><strong class="strong_name">생년월일</strong>
                              <span><input name="birth" id="birth" type="text" value="${dto.birth}"></span>
                           </li>
                           <li class="li_join"><strong class="strong_name">전화번호</strong>
                              <span><input name="phone" id="phone" type="text" value="${dto.phone}"></span>
                           </li>
                           <li class="li_join"><strong class="strong_name">이메일</strong>
                              <span><input name="email" id="email" type="text" value="${dto.email}"></span>
                           </li>
                        </ul>
                     </article>
                     
                     <br>
                     
                     <article>
                        <!-- 아이디 및 비밀번호, 닉네임 -->
                        <div class="title_area">
                           <strong class="strong_title">비밀번호 변경</strong>
                        </div>
                        <ul class="ul_join">
                            
                            <li class="li_join"><strong class="strong_name">기존 비밀번호</strong>
                              <span><input name="f_passwd" id="f_passwd" type="password"></span>
                           </li>    
                           
                           <li class="li_join"><strong class="strong_name">새 비밀번호</strong>
                              <span><input id="passwd" name="passwd" type="password"></span>
                           </li>
                           <li class="li_join"><strong class="strong_name" id="new_passwd_label">새 비밀번호 확인
                                 </strong> <span><input  name="passwd2" id="passwd2" type="password" oninput="checkpwd()"></span>
                           </li>
                           <br>
                           <div id="password_result" style="font-weight: bold; font-size: 15px;"></div>
                        </ul>
                     </article>
                     
                     <br>
                     
                     <article>
                        <!-- 주소 및 상세주소 -->
                        <div class="title_area">
                           <strong class="strong_title">주소</strong>
                        </div>
                        <ul class="ul_join">
                           <li class="li_join"><strong class="strong_name">우편번호</strong>
                              <span> <input type="text" value="${dto.zipcode}" name="zipcode" id="post_code" readonly>&nbsp;&nbsp;&nbsp;
                                 <button type="button" class="btn_check"
                                    onclick="showPostcode()">우편번호 찾기</button>
                           </span></li>
                           <li class="li_join"><strong class="strong_name">주소</strong>
                              <span> <input type="text" value="${dto.address1}" name="address1" id="address1" size="60"> <br>
                           </span></li>
                           <li class="li_join"><strong class="strong_name">상세주소</strong>
                              <span> <input type="text" value="${dto.address2}" name="address2" id="address2">
                           </span></li>
                     </article>
                     
                  </section>

                  <section class="contents">
                     <!-- 회원가입 완료 버튼 -->
                     <article>
                        <div class="">
                           <input type="button" value="회원정보 수정" id="join_btn" class="btn" onclick="edit()"
                              style="min-width: 600px; height: 55px;" disable>
                        </div>
                     </article>
                  </section>
               </form>
               
            </div>
            
         </div>
      </div>
   </div>
</section>


<!-- footer section -->
<footer id="footer" class="footer">
   <div class="container">
      <div class="main_footer">
         <div class="row">
            <div class="col-sm-12">
               <div class="copyright_text text-center">
                  <p class=" wow fadeInRight" data-wow-duration="1s">
                     Made with <i class="fa fa-heart"></i> by <a target="_blank"
                        href="http://bootstrapthemes.co">Bootstrap Themes</a>2016. All
                     Rights Reserved
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- End of container -->
</footer>
<!-- End of footer Section-->



<!-- START SCROLL TO TOP  -->

<div class="scrollup">
   <a href="#"><i class="fa fa-chevron-up"></i></a>
</div>


</div>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">
function edit() {
	
	//값 확인
     let form1 = $("#form1");
     let f_passwd = $("#f_passwd").val();
     let passwd = $("#passwd").val();
     let passwd2 = $("#passwd2").val();
     let name = $("#name").val();
     let nickname = $("#nickname").val();
     let birth = $("#birth").val();
     let phone = $("#phone").val();
     let email = $("#email").val();
     let post_code = $("#post_code").val();
     let address1 = $("#address1").val();
     let address2 = $("#address2").val();

     if (f_passwd == "") {
         alert("기존 비밀번호를 입력하세요.");
         $("#f_passwd").focus();
         return;
      } else if (passwd == "") {
        alert("새 비밀번호를 입력하세요.");
        $("#passwd").focus();
        return;
     } else if (passwd.length<8 || passwd.length>16) {
        alert("비밀번호는 8자에서 16자 사이여야 합니다");
        $("#passwd").focus();
        return;
     } else if (passwd2 == "") {
        alert("비밀번호를 확인해주세요");
        $("#passwd2").focus();
        return;
     }

     else if (name == "") {
        alert("이름을 입력하세요.");
        $("#name").focus();
        return;
     } else if (nickname == "") {
        alert("닉네임을 입력하세요.");
        $("#nickname").focus();
        return;
     } else if (birth == "") {
        alert("생년월일을 입력하세요.");
        $("#birth").focus();
        return;
     } else if (birth.length != 6) {
        alert("생년월일은 6개의 숫자로 입력해주세요");
        $("#birth").focus();
        return;
     }

     else if (phone == "") {
        alert("핸드폰 번호를 입력하세요.");
        $("#phone").focus();
        return;
     }

     else if (email == "") {
        alert("이메일을 입력하세요.");
        $("#email").focus();
        return;
     } else if (post_code == "") {
        alert("주소를 입력하세요.");
        $("#post_code").focus();
        return;
     } else if (address1 == "") {
        alert("주소를 입력하세요.");
        $("#address1").focus();
        return;
     } else if (address2 == "") {
        alert("상세주소를 입력하세요.");
        $("#address2").focus();
        return;
     }
	
	//기존 비밀번호 확인
	var f_userid = "${sessionScope.userid}"; 
	$.ajax({
        url : "/member/check_pw.do",
        type : "POST",
        data : {
           userid : f_userid,
           f_passwd : f_passwd
        },
        dataType : "json",
        success : function(response) {
           if (response.status === "success") {
        	 	document.form1.action = "/member/member_update.do";
 		      document.form1.submit();
           } else {
        	   alert("기존 비밀번호가 일치하지 않습니다.");
        	   $("#f_passwd").focus();
           }
        },
        error : function(xhr, status, error) {
           console.error("Error:", error);
        }
     });
}

function checkpwd() {
    let password1 = document.getElementById("passwd").value;
    let password2 = document.getElementById("passwd2").value;
    let passwordresult = document.getElementById("password_result");
    if (password1 != password2) {
       $("#password_result").css("color","#F07878")
       passwordresult.innerHTML = "비밀번호가 일치하지 않습니다";
    } else {
       $("#password_result").css("color","#F07878")
       passwordresult.innerHTML = "비밀번호가 일치합니다.";
    }
 }
 
/* 다음지도 */
function showPostcode() {
   new daum.Postcode(
         {
            oncomplete : function(data) {
               let fullAddr = "";
               let extraAddr = "";
               if (data.userSelectedType === "R") {
                  fullAddr = data.roadAddress;
               } else {
                  fullAddr = data.jibunAddress;
               }
               if (data.userSelectedType === "R") {
                  if (data.bname !== "") {
                     extraAddr += data.bname;
                  }
                  if (data.buildingName !== "") {
                     extraAddr += (extraAddr !== "" ? ", "
                           + data.buildingName : data.buildingName);
                  }
                  fullAddr += (extraAddr !== "" ? " (" + extraAddr
                        + ")" : "");
               }
               document.getElementById("post_code").value = data.zonecode;
               document.getElementById("address1").value = fullAddr;
               document.getElementById("address2").focus();
            }
         }).open();
}
</script>


</body>
</html>