<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><html class="no-js" lang=""> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>메인화면</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<style type="text/css">
.overlay {
	width: 100%;
	height: 91%;
	position: absolute;
	left: 0;
	top: 61px;
}

.table {
	display: inline-block;
	position: absolute;
	width: 28.125rem;
	vertical-align: top;
	z-index: 9;
}

.sp-thumbnail {
	transition: transform 0.2s ease;
}

.sp-thumbnail:hover {
	transform: scale(1.05);
}

#team {
	padding: 60px 0;
	background-color: #f8f9fa;
}

.head_title h1 {
	font-size: 36px;
	color: #333;
	margin-bottom: 40px;
	text-transform: uppercase;
	letter-spacing: 1.5px;
}

.main_team_area {
	text-align: center;
}

.team {
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin: 15px;
	padding: 20px;
	transition: all 0.3s ease;
}

.team-img {
	overflow: hidden;
	border-radius: 8px 8px 0 0;
}

.team-img img {
	width: 100%;
	height: auto;
	transition: all 0.3s ease;
}

.team-img img:hover {
	transform: scale(1.05);
}

.team-name {
	font-size: 18px;
	color: #333;
	margin-top: 20px;
	font-weight: 600;
}

.team-price {
	font-size: 16px;
	color: #666;
	margin-top: 10px;
	font-weight: bold;
}

@media ( max-width : 768px) {
	.col-md-4 {
		flex: 0 0 50%;
		max-width: 50%;
	}
}

@media ( max-width : 576px) {
	.col-md-4 {
		flex: 0 0 100%;
		max-width: 100%;
	}
}
</style>
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
</head>


<body data-spy="scroll" data-target=".navbar-collapse">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>

	<%@ include file="../include/menu/menu.jsp"%>


	<!-- Home Section -->
	<section id="home" class="home"
		style="background-color: rgb(236, 236, 236);">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 ">
					<div class="main_home_slider text-center" style="padding: 0px 0px;">


						<div class="single_home_slider">

							<div class="overlay"
								style="background-image: url('/resources/assets/images/img2.jpg');"></div>
							<div class="main_home wow fadeInUp" data-wow-duration="700ms">
								<a href="/product/detail_before?p_id=257">
									<p style="color: #333333; text-align: left; font-size: 36.8px;"
										class="subtitle">어성초와 시카로 더블진정</p>
								</a>
								<p
									style="color: #333333; text-align: left; font-size: 2rem; font-weight: bold; letter-spacing: 7px; margin-top: 0;"
									class="subtitle">민감피부 #화잘먹크림</p>
								<p style="color: #343a40; text-align: left; font-size: 20.8px;"
									class="subtitle">마다가스카르산 고품질 시카를 대용랑으로</p>
								<div class="home_btn">
									<!--  <a href="" class="btn">Learn More</a> -->
								</div>
							</div>
						</div>
						<div class="single_home_slider">
							<div class="overlay"
								style="background-image: url('/resources/assets/images/시카세럼.jpg');"></div>
							<div class="main_home wow fadeInUp" data-wow-duration="700ms">
								<a href="/product/detail_before?p_id=258">
									<p style="color: #333333; text-align: left; font-size: 36.8px;"
										class="subtitle">시카와 세라마이드의 진정력</p>
								</a>
								<p
									style="color: #333333; text-align: left; font-size: 2rem; font-weight: bold; letter-spacing: 7px; margin-top: 0;"
									class="subtitle">2주 장벽개선 시카 세럼</p>
								<p style="color: #343a40; text-align: left; font-size: 20.8px;"
									class="subtitle">장벽+진정+보습+각질 케어 세럼</p>
								<div class="home_btn">
									<!--  <a href="" class="btn">Learn More</a> -->
								</div>
							</div>
						</div>
						<div class="single_home_slider">
							<div class="overlay"
								style="background-image: url('/resources/assets/images/img4.jpg');"></div>
							<div class="main_home wow fadeInUp" data-wow-duration="700ms">
								<a href="/product/detail_before?p_id=271">
									<p style="color: #333333; text-align: left; font-size: 36.8px;"
										class="subtitle">비타민C,다 거기서 거기?</p>
								</a>
								<p
									style="color: #333333; text-align: left; font-size: 2rem; font-weight: bold; letter-spacing: 7px; margin-top: 0;"
									class="subtitle">상식을 깬 1위 * 잡티세럼</p>

								<p style="color: #343a40; text-align: left; font-size: 20.8px;"
									class="subtitle">비타민C 나이아신아마이드 글루타티온 함유</p>
								<div class="home_btn">
									<!--  <a href="" class="btn">Learn More</a> -->
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End of Home Section -->
	<section id="team" class="team colorsbg sections">
		<div class="container">
			<div class="row">
				<div class="main_team_area">
					<div class="head_title text-center">
						<h1 style="font-weight: bold;">Best Item TOP6</h1>
					</div>
					<!-- End of head title -->

					<div class="main_team text-center">

						<div class="single_team">
							<div class="col-sm-10 col-sm-offset-1">
								<div class="row">
									<c:forEach var="row" items="${list}">
										<div class="col-sm-4">
											<div class="team">
												<img class="img"
													src="${fn:replace(row.file_name, 'src/main/webapp', '')}"
													alt="" /> <a
													href="/product/detail_before?p_id=${row.p_id}">${row.p_name}</a>
												<p style="font-weight: bold; color: black;">${row.p_price}
													원</p>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
							<!-- End of col-sm-10 -->
						</div>
						<div class="single_team">
							<div class="col-sm-10 col-sm-offset-1">
								<div class="row">
									<c:forEach var="var" items="${List}">
										<div class="col-sm-4">
											<div class="team">
												<img class="img"
													src="${fn:replace(var.file_name, 'src/main/webapp', '')}"
													alt="" />
												<h6>${var.p_name}</h6>
												<h6 style="font-weight: bold; color: black;">
													<fmt:formatNumber type="number" value="${var.p_price}"
														pattern="#,###"></fmt:formatNumber>
													원
												</h6>

											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- Work Section -->
	<section id="work" class="work sections">
		<div class="container">
			<div class="row">
				<div class="main_mix_content text-center">
					<div class="head_title">
						<h3 style="font-weight: bold;">요즘 주목 받는 상품</h3>
					</div>
					<!-- End of head title -->

					<div id="mixcontent" class="mixcontent text-center">
						<div class="col-sm-4 col-xs-12">
							<div class="single_mixi_portfolio">
								<img src="/resources/assets/images/2.jpg" alt="" />
								<div class="single_work_overlay">
									<h5
										style="font-weight: bold; color: black; margin-bottom: -1.5rem;">
										<a style="color: black;"
											href="/product/detail_before?p_id=286">컬러 앤 네이처 네일 컬러</a>
									</h5>
									<div class="separator"></div>
									<p style="font-weight: bold; color: black;">2,000원</p>
								</div>
							</div>
						</div>
						<div class="col-sm-4 col-xs-12">
							<div class="single_mixi_portfolio">
								<img src="/resources/assets/images/무지개2.jpg" alt="" />
								<div class="single_work_overlay single_work_overlay2">
									<h5
										style="font-weight: bold; color: black; margin-bottom: -1.5rem;">
										<a style="color: black;" href="/product/detail_before?p_id=1">무지개
											멘션</a>
									</h5>
									<div class="separator"></div>
									<p style="font-weight: bold; color: black;">3,900원</p>
								</div>
							</div>
						</div>
						<div class="col-sm-4 col-xs-12">
							<div class="single_mixi_portfolio">
								<img src="/resources/assets/images/오른쪽.png" alt="" />
								<div class="single_work_overlay">
									<h4>glow with eden</h4>
									<div class="separator"></div>
									<p></p>
								</div>
							</div>
						</div>
						<div class="col-sm-4 col-xs-12">
							<div class="single_mixi_portfolio">
								<img src="/resources/assets/images/왼쪽.png" alt="" />
								<div class="single_work_overlay single_work_overlay2">
									<h4>glow with eden</h4>
									<p></p>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-xs-12">
							<div class="single_mixi_portfolio">
								<img src="/resources/assets/images/100.jpg" alt="" />
								<div class="single_work_overlay single_work_overlay2">
									<h5
										style="font-weight: bold; color: black; margin-bottom: -1.5rem;">
										<a style="color: black;"
											href="/product/detail_before?p_id=309">바이플라워 블러셔</a>
									</h5>
									<div class="separator"></div>
									<p style="font-weight: bold; color: black;">5,500원</p>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-xs-12">
							<div class="single_mixi_portfolio">
								<img src="/resources/assets/images/6.jpg" alt="" />
								<div class="single_work_overlay">
									<h5
										style="font-weight: bold; color: black; margin-bottom: -1.5rem;">
										<a style="color: black;"
											href="/product/detail_before?p_id=234">바이플라워 에코 크레용 립 벨벳</a>
									</h5>
									<div class="separator"></div>
									<p style="font-weight: bold; color: black;">3,900원</p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- End of row -->
		</div>
		<!-- End of Contaier -->
	</section>



	<!-- Team Section -->

	<!-- End of portfolio Section -->



	<!-- Clients Section -->
	<section id="clients" class="clients sections">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="main_clients_area text-center">
						<div class="sp-thumbnails"
							style="display: flex; justify-content: center;">
							<div style="margin: 10px; text-align: center;">
								<a href="/product/detail_before?p_id=255"> <img
									style="width: 500px; height: 282px; cursor: pointer;"
									class="sp-thumbnail" src="/resources/assets/images/image1.jpg" /></a>
								<p
									style="font-weight: bold; text-align: left; color: black; margin-bottom: 0.5rem; margin-top: 0.5rem;">장원영
									pick 어뮤즈 듀틴트</p>
								<p style="margin-top: 0; margin-bottom: 1rem; text-align: left;">완벽한
									컬러와 지속력을 자랑하는 틴트</p>
							</div>
							<div style="margin: 10px; text-align: center;">
								<a href="/product/detail_before?p_id=292"> <img
									style="width: 500px; height: 282px; cursor: pointer;"
									class="sp-thumbnail" src="/resources/assets/images/image2.jpg" /></a>
								<p
									style="font-weight: bold; color: black; margin-bottom: 0.5rem; text-align: left; margin-top: 0.5rem;">글로우
									MAX, 듀이 젤 맥시 글로시</p>
								<p style="margin-top: 0; margin-bottom: 1rem; text-align: left;">색감,
									광감, 편안함 3박자 다 갖춘 완성형 글로스</p>
							</div>
						</div>
					</div>
					<!-- End of col-sm-12 -->
				</div>
			</div>
		</div>
	</section>






	<!-- Contact Section -->
	<!-- <section id="contact" class="contact">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="main_contact sections">
						<div class="head_title text-center whitetext">
							<h1>get in touch</h1>
						</div>
						End of head title

						<div class="row">
							<div class="contact_contant">
								<div class="col-sm-6 col-xs-12">
									<div class="single_message_right_info whitetext">
										<ul>
											<li><i class="fa fa-map-marker"></i> <span>23
													Mulholland Drive, Suite 721. Los Angeles 10010 100 S. Main
													Street. Los Angeles 90012</span></li>

											<li><i class="fa fa-mobile-phone"></i> <span>+1-670-567-5590</span></li>

											<li><i class="fa fa-envelope-o"></i> <span>hello@clemocreative.com</span></li>
										</ul>

										<div class="contact_socail transition">
											<a href=""><i class="fa fa-facebook img-circle"></i></a> <a
												href=""><i class="fa fa-twitter img-circle"></i></a> <a
												href=""><i class="fa fa-google-plus img-circle"></i></a> <a
												href=""><i class="fa fa-pinterest img-circle"></i></a> <a
												href=""><i class="fa fa-instagram img-circle"></i></a>
										</div>
									</div>
								</div>
								End of col-sm-6

								<div class="col-sm-6 col-xs-12">
									<div class="single_contant_left margin-top-60">
										<form action="#" id="formid">
											<div class="col-lg-8 col-md-8 col-sm-10 col-lg-offset-2 col-md-offset-2 col-sm-offset-1">

											<div class="form-group">
												<label>name</label> <input type="text" class="form-control"
													name="name" required="">
											</div>

											<div class="form-group">
												<label>e-mail</label> <input type="email"
													class="form-control" name="email" required="">
											</div>

											<div class="form-group">
												<label>your message</label>
												<textarea class="form-control" name="message" rows="8"></textarea>
											</div>

											<div class="">
												<input type="submit" value="submit" class="btn btn-default">
											</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							End of messsage contant
						</div>
					</div>
				</div>
				End of col-sm-12
			</div>
			End of row
		</div>
		End of Contaier
	</section> -->
	<!-- End of portfolio Section -->



	<!-- footer Section -->
	<footer id="footer" class="footer">
    <div class="container">
        <div class="main_footer">
            <div class="row">
                <div class="col-sm-12">
                    <div class="copyright_text text-center">
                        <p  style="padding: 0px 20px;">
                            Glow with <i class="fa fa-heart"></i>
                            <span class="brand">EDEN BEAUTY</span>
                        </p>
                        <p>
                            <span class="business-info">사업자등록번호 : 123-12-12345</span><br>
                            <span class="address">주소 : (04001) 서울특별시 마포구 서교동 447-5 풍성빌딩 2층, A실</span><br>
                            <span class="email">이메일 : eden@beauty.net</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

	<!-- End of footer -->



	<!-- START SCROLL TO TOP  -->

	<div class="scrollup">
		<a href="#"><i class="fa fa-chevron-up"></i></a>
	</div>

	<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>

	<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
	<script src="/resources/assets/js/masonry/masonry.min.js"></script>
	<script type="text/javascript">
		$('.mixcontent').masonry();
	</script>

	<script src="/resources/assets/js/jquery.sliderPro.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function($) {
			$('#example3').sliderPro({
				width : 960,
				height : 200,
				fade : true,
				arrows : false,
				buttons : true,
				fullScreen : false,
				shuffle : true,
				smallSize : 500,
				mediumSize : 1000,
				largeSize : 3000,
				thumbnailArrows : true,
				autoplay : false,
				thumbnailsContainerSize : 960

			});
		});
	</script>
	<script src="/resources/assets/js/plugins.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>
