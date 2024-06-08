<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>

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
	margin: 230px auto 200px auto;
	width: 60%;
	height: 100%;
	
	display: grid;
	grid-template-rows: 140px 1fr;
	
	font-size: 0.9em;
}


/* 헤더 */
#infoHeader {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	background-color: whitesmoke;
	align-items: center;
}
#infoHeader h1 {
	text-align: center;
	width: 160px;
	font-size: 2em;
	margin: 0 0 0 15px;
	font-weight: bold;
}
.step_list {
	font-size: 1.3em;
	font-weight: 300;
}
.step_list li {
	padding: 0 20px;
}
.step_list li:nth-child(2) {
	font-weight: bold;
	color: limegreen;
}
#process ul {
	display: flex;
	flex-direction: row;
}

/* 주문결과 영역 */

#resultBox {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-content: center;
	border-bottom: 1px solid gray;
	padding: 0 20px 50px 20px;
}

/* 주문정보 */

#orderInfo {
	 /* border: 1px solid black;  */
	 min-width: 350px;
	width: 100%;
	margin: 0 5% 0 0;
	display: flex;
	flex-direction: column;
	align-content: center;
}
#msg {
	width: 100%;
	text-align: center;
	font-weight: bold;
	font-size: 1.5em;
	margin: 60px auto;
	word-break: break-word;
}

#orderedTable {
	width: 100%;
	height: 300px;
	border-top: 2px solid gray; 
	font-size: 1em;
}
#orderedTable td:nth-child(2n-1) {
	background-color: #fafafa;
	text-align: center;
	width: 100px;
}
#orderedTable td {
	padding: 0 15px;
    border-bottom: 1px solid gray;
}



/* 우측화면 */
#rightBox {
	/* border: 1px solid black;  */
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100%;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}


/* 주문 아이템 정보 */

#itemInfo {
	/* border: 1px solid black; */
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-around;
	width: 100%;
	padding: 0;
	max-height: 300px;
	overflow-y: scroll;
	overflow-x: none; 
	
}
#itemInfo::-webkit-scrollbar-track
{
	border-radius: 8px;
	background-color: #F5F5F5;
}

#itemInfo::-webkit-scrollbar
{
	width: 8px;
	background-color: #656565;
}

#itemInfo::-webkit-scrollbar-thumb
{
	border-radius: 8px;
	background-color: #a8a8a8;
}

.rowBox {
	display: flex;
	flex-direction: row;
	border-bottom: 1px solid gray;
	width: 300px;
	align-items: center;
	padding: 10px 0;
	margin: 0 0 0 10px;
}
.img {
	width: 100px;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.img img {
	width: 100%;
	height: 100%;
}
.rowInfo {
	display: flex;
	flex-direction: column;
	/* border: 1px solid black; */
	width: 180px;
	padding: 10px;
	font-size: 0.8em;
}
.rowInfo div {
	padding: 2px 0 0 0;
	color: gray;
}
.rowInfo div:nth-child(1) {
	word-break: break-all;
	height: 42px;
	overflow: hidden; 
	color: black;
}
#priceBox {
	flex-grow: 1;
	width: 100%;
	display: flex;
	align-content: center;
	justify-content: center;
}
#priceCal {
	border-top: 1px solid black;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 0 10px 10px 10px;
}
#priceCal .p {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	margin: 2px 30px;
	
}
#priceCal .p:nth-child(3) {
	margin: 2px 30px 10px 30px;
}
#priceCal .p:last-child {
	font-weight: bold;
	font-size: 1.2em;
	border-top: 1px solid gray;
	margin: 0 30px;
	padding: 10px 0;
	
}
#priceCal .p:last-child .d {
	color: red;
}

#priceCal .p:not(:last-child) {
	font-size: 0.9em;
}

/* 다른 화면 돌아가기 */

#footerarea {
	margin: 15px 0;
	display: flex;
	flex-direction: row;
	justify-content: center;
}
.btn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	border-radius: 5px;
	border: 1px solid #9bce26;
	background-color: white;
	color: #9bce26;
	margin: 30px 2px 0 2px;
}
.btn:hover, .btn:focus, .btn:active {
	border: 1px solid #9bce26;
	background: #9bce26;
	color: #fff;
}

</style>

<body>
<%@ include file="../../include/menu/menu.jsp"%>

<div id="pageWrap">
<div id ="infoHeader">
	<h1>결제완료</h1>
	<div id="process">
		<ul class="step_list">
			<li class="li">1 장바구니 ></li>
			<li class="li">2 주문/결제 ></li>
			<li class="li">3 결제완료</li>
		</ul>
	</div>
</div>

<div id="resultBox">

<div id ="orderInfo">

<div id = "msg">
	주문이 정상적으로 완료되었습니다.
</div>
 
<table id="orderedTable">
	<tr>
		<td>주문번호</td>
		<td>${order.orderid}</td>
	</tr>
	
	<tr>
		<td>배송정보</td>
		<td>
			<div id="delInfo">
				<div>${order.username}</div>
				<div>${order.zipcode}</div>
				<div>${order.address1}</div>
				<div>${order.address2}</div>
			</div>
		</td>
	</tr>
	
	<tr>
		<td>보유한<br>포인트</td>
		<td>${userPoint}</td>
	</tr>
</table>



</div>

<div id="rightBox">

<div id ="itemInfo">

<c:forEach var="row" items="${orderitems}">
<div class="rowBox">
	<div class="img">
		<div>
			<img src="${row.file_name}">
		</div>
	</div>
	<div class="rowInfo">
		<div>
			${row.p_name}
			<c:if test="${not empty row.o_name}">
				| ${row.o_name}
			</c:if>
		</div>
		<div>
			상품 금액: <fmt:formatNumber pattern="#,###" value="${row.p_price}"/>원
		</div>
		<div>
			상품 수량: ${row.amount}개
		</div>
		<div>
			${row.orderStatus}
		</div>
	</div>
</div>
</c:forEach>

</div>

<div id="priceBox">
<div id="priceCal">

	<div class="p">
		<div class="c">상품금액</div>
		<div class="d"><fmt:formatNumber pattern="#,###" value="${order.price}"/></div>
	</div>
	<div class="p">
		<div class="c">배송비</div>
		<div class="d"><fmt:formatNumber pattern="#,###" value="${order.deliverCost}"/></div>
	</div>
	<div class="p">
		<div class="c">사용한 포인트</div>
		<div class="d">-${usedPoint}</div>
	</div>
	<div class="p">
		<div class="c">주문금액</div>
		<div class="d"><fmt:formatNumber pattern="#,###" value="${order.totalPrice}"/></div>
	</div>
	
</div>
</div>

</div>

</div>

<div id="footerarea">
	<button class="btn" id="toList" onclick="
		location.href = '/order/orderlist.do';
	">주문배송목록</button>
	<!-- <button class="btn" id="toReview" onclick="
		location.href = '/review/index.do'; 
	">리뷰작성</button> -->
</div>

</div>

</body>
</html>