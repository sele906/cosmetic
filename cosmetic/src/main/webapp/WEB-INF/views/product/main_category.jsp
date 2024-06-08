<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>대분류 화면</title>
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
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="/resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<style>

#wrap-container {
	margin: 230px auto 200px auto;
	width: 70%;
	height: 100%;
	font-size: 0.9em;
	display: flex;
	flex-direction: column;
}

.container_img {
	display: flex;
	flex-direction: row;
	margin: 0 0 30px 0; 
}
.container_img .row {
	height: 100%;
	width: 100%;
}

.head_title {
	margin: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
}
.head_title img {
	width: 100%;
	height: 100%;
}

#work {
	padding: 0;
}

.left-menu {
	min-width: 170px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 0 40px 0 0;
}
#right-content {
	width: 100%;
}

.left-menu a {
    display: block;
    font-size: 16px;
    color: #333;
    text-decoration: none;
    margin-bottom: 5px;
    width: 100%; /* 요소를 가로폭의 100%로 설정합니다. */
    text-align: right; /* 텍스트를 오른쪽으로 정렬합니다. */
    padding: 0px 0px; /* 위아래 여백을 추가합니다. */
}

.left-menu a:hover {
    color: #007bff; /* 하이퍼링크에 마우스를 올렸을 때의 색상 */
}

.section-container {
    margin-left: 286px; /* left-menu 너비만큼 section을 이동 */
}

.ct-product {
    display: flex;
    justify-content: center; /* 가운데 정렬 */
    overflow-x: auto;
    margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
}

/* .product-item {
    flex: 0 0 auto;
    margin-right: 10px;
    padding: 7px;
} */



#sell_products tbody tr, #hit_products tbody tr {
    display: flex;
    flex-direction: row;
    align-items: center;
	justify-content: center;
    margin: 0 10px;
}
#sell_products tbody tr:nth-child(2) {
	margin: 20px 0 3px 0;
}
#sell_products tbody tr td, #hit_products tbody tr td {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 0 10px;
}

.product-item p {
	margin: 0;
	padding: 0;
}

.product-item .txt {
	width: 140px;
	height: 80px;
	text-align: center;
	font-size: 0.8em;
	word-break: keep-all; 
	display: flex;
	align-items: center;
	justify-content: center;
}
.product-item  a {
	color: #656565;
}
.product-item a:hover {
	color: #337ab7;
}
.product-item .p_price {
	color: red;
}

/* .product-item:last-child {
    margin-right: 0;
} */

</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">

	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>
	<div>
		<%@ include file="../include/menu/menu.jsp"%>
	</div>
	
	
	<div id="wrap-container">
	
	
    
    <div id="right-content">
        <!-- Work Section -->
	<section id="work" class="work sections">

		<div class="container_img">
		
			<div class="left-menu">
				<a style="font-weight: bold; font-size: 30px">${name}</a><br>
				<c:forEach items="${items}" var="var">
				        <a href="/product/sub_view.do?no=${var.ctg_s_no}">${var.ctg_small}</a><br> 
				</c:forEach>
		
		    </div>
		<c:if test="${name eq '립' }">
        <div class="row">
            <div class="main_mix_content text-center">
                <div class="head_title">
                    <img style="width: 800px; height: 300px; padding-right: 80px;" src="https://image.oliveyoung.co.kr/uploads/images/display/10000010002/158/7387007812925151231.jpg">
                </div>
            </div>
        </div>
    </c:if>

    <br>

    <c:if test="${name eq '아이' }">
        <div class="row">
            <div class="main_mix_content text-center">
                <div class="head_title">
                    <img style="width: 700px; height: 300px; padding-right: 77px;" src="https://image.oliveyoung.co.kr/uploads/images/display/90000021775/263/550184189645124596.jpg">
                </div>
            </div>
        </div>
    </c:if>

    <br>
</div>
		
		
		<p style="text-align: center; font-weight: bold; font-size: 25px">${name}의 BEST만 모아봤어요</p>
		<div class="ct-product" id="sell_products">
   
	    <table>
	    <tr>
    
	    <c:forEach var="sell_row" items="${sellList}">
	    
	    <c:set var="raw_imgpath" value="${sell_row.file_name}"></c:set>
	    <c:set var="imgpath" value="${fn:replace(raw_imgpath, 'src/main/webapp', '')}"></c:set>
	    
	    <td class="product-item">
	           <a href="/product/detail_before?p_id=${sell_row.p_id}">
	               <img class="img goodsList" width="135" height="135" src="${imgpath}">
	           </a>
	           <a href="/product/detail_before?p_id=${sell_row.p_id}">
	               <p class="txt" style="white-space: normal;">${sell_row.p_name}</p>
	           </a>
	           <p class="p_price">
	           <fmt:formatNumber value="${sell_row.p_price}" pattern="#,###"></fmt:formatNumber>원
	           </p>
	       </td> 
	   	</c:forEach>
	   	
	    </tr>
	    <tr align="center"><td colspan="4"><a href="/product/sub_view.do?no=${items[0].ctg_s_no}"><input style="background-color: white; border: medium;" type="button" value="더보기"></a></td></tr>
		</table>
		</div>
		
		<hr style="width: 50%; ">
		<p style="text-align: center; font-weight: bold; font-size: 25px">${name}에서 많이 본 상품이에요</p>
		<div class="ct-product" id="hit_products">
		
		<table>
	    <tr>
	    	<c:forEach var="hit_row" items="${hitList}">
	    	
	    	<c:set var="raw_imgpath" value="${hit_row.file_name}"></c:set>
		    <c:set var="imgpath" value="${fn:replace(raw_imgpath, 'src/main/webapp', '')}"></c:set>
	    	
	    	<td class="product-item">
	            <a href="/product/detail_before?p_id=${hit_row.p_id}">
	                <img class="img goodsList" width="135" height="135" src="${imgpath}">
	            </a>
	            <a href="/product/detail_before?p_id=${hit_row.p_id}">
	                <p class="txt" style="white-space: normal;">${hit_row.p_name}</p>
	            </a>
	            <p class="p_price">
	            <fmt:formatNumber value="${hit_row.p_price}" pattern="#,###"></fmt:formatNumber>원
	            </p>
	        </td>
	    	</c:forEach>
	        
	    </tr>
		</table>
		</div>
		</section>
	
	</div>
	
		</div>

	
	<!-- footer Section -->
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
	<!-- End of footer -->



	<!-- START SCROLL TO TOP  -->

	<div class="scrollup">
		<a href="#"><i class="fa fa-chevron-up"></i></a>
	</div>


	<!-- jQuery -->
	<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>

	<!-- jQuery Bootstrap js  -->
	<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>

	<!-- jQuery easing js  -->
	<script src="/resources/assets/js/jquery.easing.1.3.js"></script>

	<!-- jQuery masonry js  -->
	<script src="/resources/assets/js/masonry/masonry.min.js"></script>
	<script type="text/javascript">
		$('.mixcontent').masonry();
	</script>

	<!-- jQuery Mixitup  -->
	<script src="/resources/assets/js/jquery.mixitup.min.js"></script>
	<script type="text/javascript">
		
	</script>



	<!-- jQuery plugins  -->
	<script src="/resources/assets/js/plugins.js"></script>

	<!-- jQuery Main js  -->
	<script src="/resources/assets/js/main.js"></script>
</body>
</html>
