<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>

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

<style>
#pageWrap {
	/* margin: 230px auto 200px auto;
	width: 60%;
	height: 100%;
	font-size: 0.9em;
	min-width: 610px; */
}
#content_box {
width: 100%;
}
#content {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>

</head>
<body>

<%@ include file="../include/menu/menu.jsp"%>

<div id="pageWrap">

<!-- Contact Section -->
<section id="contact" class="contactus margin-top-120">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="main_contact sections">
					<div class="head_title text-center">
						<h2 style="line-height: 2.1;">회원탈퇴</h2>
						<p style="font-size: 0.8em;">가입된 회원정보가 모두 삭제됩니다.<br>회원탈퇴시 보유한 포인트는 반환되지 않습니다.</p>
					</div>

					<div class="col-sm-6 col-xs-12" id="content_box">
						<div class="single_contant_left margin-top-30" id="content">

							<form>

								<div class="form-group">
									<label style="text-align: left;">아이디</label> <input
										type="text" class="form-control" id="userid" name="userid" value="${sessionScope.userid}" placeholder="아이디를 입력해주세요.">
								</div>

								<div class="form-group">
									<label>비밀번호</label> <input type="password"
										class="form-control" id="passwd" name="passwd" required=""
										placeholder="비밀번호를 입력해주세요.">
								</div>
								<div></div>
								<div style="font-size:15px; font-weight: bold;" id="result"></div>
								&nbsp;
								<div class="">
									<input type="button" value="회원탈퇴" class="btn" id="deleteBtn"
										style="min-width: 342px; height: 74px;">
								</div>
								
							</form>
						</div>
					</div>

				</div>
				<!-- End of messsage contant-->
			</div>
		</div>
	</div>
	<!-- End of row -->
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
</footer>

</div>



<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">

$(document).ready(function() {
    $("#deleteBtn").click(function() {
    	
    	
            var userid = $("#userid").val();
            var passwd = $("#passwd").val();
            
            if (!userid || !passwd) {
            	$("#result").css("color","#EF8B47");
            	$("#result").text("아이디와 비밀번호를 입력하세요.");
                return; // 함수 종료
            }
            if (confirm('탈퇴하시겠습니까?')) {
            	
            var data = {
                userid: userid,
                passwd: passwd
            };
            
            $.ajax({
                type: "POST",
                url: "/member/member_delete.do",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(response) {
                	// 서버에서 성공 응답을 받았을 때
                    if (response.status == "success") {
                    	$("#result").text("");
                        alert('탈퇴되었습니다.');
                        window.location.href = "/";
                    } else if (response.status == "error") {
                    	// 탙퇴 실패 시 처리
                        $("#result").css("color","#F07878");
                    	 $("#result").text('비밀번호가 일치하지 않습니다.');
                    }
                }
            });
    	}
    });
});
</script>

</body>
</html>










