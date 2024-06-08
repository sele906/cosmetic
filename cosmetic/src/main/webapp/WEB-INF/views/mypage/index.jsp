<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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

</head>

<style>
* {
	font-family: "Montserrat", sans-serif;
	font-optical-sizing: auto;
	font-weight: <weight>;
	font-style: normal;
}

/* 전체 */
#pageWrap {
	margin: 190px auto 200px auto;
	width: 50%;
	height: 100%;
	font-size: 0.9em;
	min-width: 610px;
}

h2 {
	margin: 20px 0 0 0;
	padding: 10px 0 0 0;
	border-bottom: 2px solid black;
	font-size: 2em;
}

#profileInfo { 
	border: 1px solid #999;
	width: 100%;
	height: 150px;
	display: flex;
	flex-direction: row;
	margin: 20px 0;
	justify-content: center;
	align-items: center;
} 
#info {
	margin: 20px 30px;
	display: flex;
	width: 400px;
}
#infoL {
	padding: 0 15% 0 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
#infoL span {
	padding: 2px 0;
}
#infoL span:nth-child(1) {
	font-size: 1.4em;
}
#infoL span:nth-child(2) {
	color: gray;
	font-size: 0.9em;
}
#infoL span:nth-child(3) {
	color: gray;
	font-size: 0.9em;
}
#infoR {
	border-left: 1px solid gray;
	min-width: 120px;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 0 0 0 10%;
}
#infoR .p p {
	margin: 0;
	padding: 0;
}
#infoR .p span {
	font-size: 1.6em;
}

#shoppingInfo {
	width: 100%;
	height: 150px;
}
#shoppingInfo ul {
	display: flex;
	width: 100%;
	height: 100%;
}
#shoppingInfo ul li {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 10px;
	outline: 1px solid #999;
}
#shoppingInfo ul li:hover {
	cursor: pointer;
}

#shoppingInfo ul li .icon {
	font-size: 2.7em;
	color: #4f4f4f;
}
#shoppingInfo ul li .label {
	font-size: 1em;
}
#shoppingInfo ul li .label a {
	 color: #4f4f4f; 
	 padding: 10px 0;
}
#shoppingInfo ul li .count {
	font-size: 1.2em;
	padding: 5px 0;
}

#memberInfo {
	width: 100%;
	height: 160px;
}
#memberInfo ul {
	display: flex;
	width: 100%;
	height: 100%;
	flex-direction: column;
	margin: 30px 0 0 0;
	align-items: center;
}
#memberInfo ul li {
	border: 1px solid #999;
	width: 95%;
	height: 100%;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	margin: 5px 0;
	border-radius: 10px;
	box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
}
#memberInfo ul li:hover {
	cursor: pointer;
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}


#memberInfo ul li .label {
	font-size: 1.1em;
	margin: 0 10px;
}
#memberInfo ul li .label a {
	color: #656565;
}
#memberInfo ul li .arrow {
	font-size: 1.3em;
	margin: 0 20px;
}

</style>

<body>

<%@ include file="../include/menu/menu.jsp"%>

<div id="pageWrap">

<h2>마이페이지</h2>

<div id="profileInfo">
	
	
	<div id="info">
		<div id="infoL">
			<span><b>${map.name}</b>님 환영합니다.</span>
			<span>${map.email}</span>
			<span>
				${map.phone}
				<%-- <c:set value="${map.phone}" var="phone"/>
				<c:out value="${fn:substring(phone, 0, 3)}-${fn:substring(phone, 3, 7)}-${fn:substring(phone, 7, fn:length(phone))}"/> --%>
			</span>
		</div>
		<div id="infoR">
			<div class="p">
				<p>포인트</p>
				<span>${map.point}p</span>
			 </div>
		</div>
	</div>
</div>

<div id="shoppingInfo">
	<ul>
		<li onclick="location.href = '/order/orderlist.do'">
			<div class="icon">
				<i class="fa fa-truck"></i>
			</div>
			<div class="label">
				<a href="/order/orderlist.do">주문/배송조회</a>
			</div>
			<div class="count">
				<p>${order_int}</p>
			</div>
		</li>
		<li onclick="location.href = '/cart/list?${sessionScope.userid}'">
			<div class="icon">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="label">
				<a href="/cart/list?${sessionScope.userid}">장바구니</a>
			</div>
			<div class="count">
				<p>${cart_int}</p>
			</div>
		</li>
		<li onclick="location.href = '/zzim/list.do'">
			<div class="icon">
				<i class="fa fa-heart"></i>
			</div>
			<div class="label">
				<a>좋아요</a>
			</div>
			<div class="count">
				<p>${zzim_int}</p>
			</div>
		</li>
		<li onclick="location.href = '/review/index.do'">
			<div class="icon">
				<i class="fa fa-comments-o"></i>
			</div>
			<div class="label">
				<a>리뷰</a>
			</div>
			<div class="count">
				<p>${review_int}</p>
			</div>
		</li>
	</ul>
</div>

<div id="memberInfo">
	<ul>
		<li onclick="location.href = '/member/member_edit.do'">
			<div class="label">
				<a>회원정보수정</a>
			</div>
			<div class="arrow">
				<i class="fa fa-chevron-right"></i>
			</div>
		</li>
		<li onclick="location.href = '/member/member_del.do'">
			<div class="label">
				<a>회원탈퇴</a>
			</div>
			<div class="arrow">
				<i class="fa fa-chevron-right"></i>
			</div>
		</li>
	</ul>
</div>

</div>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#shoppingInfo li").hover(
		function() {
			$(this).css("outline", "1px solid #9bce26");
			$(this).find("i, a, p").css("color", "#9bce26");
		},
		function() {
			$(this).css("outline", "");
			$(this).find("i, a, p").css("color", "");
		}
	);
	
	$("#memberInfo li").hover(
		function() {
			$(this).css("border", "1px solid #9bce26");
			$(this).css("border", "1px solid #9bce26");
			$(this).find("i, a").css("color", "#9bce26");
		},
		function() {
			$(this).css("border", "");
			$(this).find("i, a").css("color", "");
		}
	);
});
</script>



</body>
</html>