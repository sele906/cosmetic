<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>회원가입 화면</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">


<link rel="stylesheet" href="/resources/assets/css/fonticons.css">
<link rel="stylesheet" href="/resources/assets/css/slider-pro.css">
<link rel="stylesheet" href="/resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">


<!--For Plugins external css-->
<link rel="stylesheet" href="/resources/assets/css/plugins.css" />

<!--Theme custom css -->
<link rel="stylesheet" href="/resources/assets/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet" href="/resources/assets/css/responsive.css" />

<script
   src="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
   
	   function join() {
		      let form1 = $("#form1");
		      let userid = $("#userid").val();
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

		      if (userid == "") {
		         alert("아이디를 입력하세요.");
		         $("#userid").focus();
		         return;
		      }

		      else if (userid.length<4 || userid.length>13) {
		         alert("아이디는 4자에서 13자 사이여야 합니다");
		         $("#userid").focus();
		         return;
		      } else if (passwd == "") {
		         alert("비밀번호를 입력하세요.");
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
		      
		      alert("회원가입이 완료되었습니다.");
		      document.form1.action = "/member/join";
		      document.form1.submit();
		   }
   
   
   function check() {
      let userid = document.getElementById("userid").value;
      $.ajax({
         url : "/member/id_check",
         type : "POST",
         data : {
            userid : userid
         },
         dataType : "json",
         success : function(response) {
            console.log(response);
            if(response.count === "false"){
               $("#join_btn").prop("disabled", true);
               alert("아이디를 입력해주세요");
            }
            else if(userid.length<4 || userid.length>12){
               alert("아이디는 4자에서 12자 사이여야 합니다");
            }
            else if (response.count === userid) {
               // 중복된 아이디가 있으면 로그인 버튼 비활성화
               $("#join_btn").prop("disabled", true);
               alert("이미 사용 중인 아이디입니다.");
            } else if(response.count === "true"){
               // 사용 가능한 아이디일 때
               $("#join_btn").prop("disabled", false);
               alert("사용 가능한 아이디입니다.");
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
</script>

<style>
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
   width: 130px;
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
<body data-spy="scroll" data-target=".navbar-collapse">
   <div class='preloader'>
      <div class='loaded'>&nbsp;</div>
   </div>
   <!-- 상단 메뉴 -->
   <%@ include file="../include/menu/menu.jsp"%>



   <!-- 회원가입 폼 섹션 -->
   <section id="contact" class="contactus margin-top-120">
      <div class="container">
         <div class="row">
            <div class="col-sm-12">
               <div class="main_contact sections">
                  <div class="head_title text-center">
                     <h1 style="line-height: 2.1;">회원가입</h1>
                  </div>
                  <form id="form1" name="form1" method="post" action="/member/join">
                     <!-- 회원가입 폼 -->
                     <section class="contents">
                        <article>
                           <!-- 이름, 생년월일, 휴대폰번호 이메일 -->
                           <div class="title_area">
                              <strong class="strong_title">회원정보 입력</strong>
                           </div>
                           <ul class="ul_join">
                              <li class="li_join"><strong class="strong_name">이름</strong>
                                 <span><input name="name" id="name" type="text" placeholder="이름을 입력하세요"></span>
                              </li>
                              <li class="li_join"><strong class="strong_name">생년월일</strong>
                                 <span><input name="birth" id="birth" type="text" placeholder="생년월일을 입력하세요 ( ex: 970813 )"></span>
                              </li>
                              <li class="li_join"><strong class="strong_name">전화번호</strong>
                                 <span><input name="phone" id="phone" type="text" placeholder="전화번호를 입력하세요"></span>
                              </li>
                              <li class="li_join"><strong class="strong_name">이메일</strong>
                                 <span><input name="email" id="email" type="text" placeholder="이메일을 입력하세요"></span>
                              </li>
                           </ul>
                        </article>
                        <br>
                        <article>
                           <!-- 아이디 및 비밀번호, 닉네임 -->
                           <div class="title_area">
                              <strong class="strong_title">아이디 생성</strong>
                           </div>
                           <ul class="ul_join">
                              <li class="li_join"><strong class="strong_name">아이디</strong>
                                 <span><input type="text" name="userid" id="userid"
                                    placeholder="아이디 (4~13자 영문, 숫자)">
                                    <button type="button" class="btn_check" onclick="check()">중복확인</button><br>
                                    </span></li>
                              <li class="li_join"><strong class="strong_name">닉네임</strong>
                                 <span><input type="text" name="nickname" id="nickname"
                                    placeholder="닉네임 (4~13자 영문, 한글)"></span></li>
                              <li class="li_join"><strong class="strong_name">비밀번호</strong>
                                 <span><input name="passwd" id="passwd" type="password" placeholder="비밀번호 (8~16자)"></span>
                              </li>
                              <li class="li_join"><strong class="strong_name">비밀번호 확인
                                    </strong> <span><input  name="passwd2" id="passwd2" type="password" placeholder="비밀번호 확인" oninput="checkpwd()"></span>
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
                                 <span> <input type="text" placeholder=""
                                    name="zipcode" id="post_code" readonly>&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn_check"
                                       onclick="showPostcode()">우편번호 찾기</button>
                              </span></li>
                              <li class="li_join"><strong class="strong_name">주소</strong>
                                 <span> <input type="text" placeholder="주소"
                                    name="address1" id="address1" size="60"> <br>
                              </span></li>
                              <li class="li_join"><strong class="strong_name">상세주소</strong>
                                 <span> <input type="text" placeholder="상세주소"
                                    name="address2" id="address2">
                              </span></li>
                        </article>
                     </section>

                     <section class="contents">
                        <!-- 회원가입 완료 버튼 -->
                        <article>
                           <div class="">
                              <input type="button" value="회원가입 완료" id="join_btn" class="btn" onclick="join()"
                                 style="min-width: 600px; height: 55px;" disable>
                           </div>
                        </article>
                     </section>
                  </form>
               </div>
               <!-- End of messsage contant -->
            </div>
         </div>
      </div>
      </div>
      <!-- End of row -->
      </div>
      <!-- End of container -->


   </section>
   <!-- End of contact Section -->



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



   <script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
   <script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
   <script src="/resources/assets/js/jquery.easing.1.3.js"></script>


   <script src="/resources/assets/js/plugins.js"></script>
   <script src="/resources/assets/js/main.js"></script>

</body>
</html>
