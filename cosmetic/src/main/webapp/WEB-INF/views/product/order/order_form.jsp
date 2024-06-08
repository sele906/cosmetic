<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">

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

<!-- 결제 라이브러리 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- 카카오주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>

<style>

* {
	font-family: "Montserrat", sans-serif;
	font-optical-sizing: auto;
	font-weight: <weight>;
	font-style: normal;
}

/* input css */
input {
	border: 1px solid #ccc;
	padding: 10px;
	font-size: 12px;
	height: 28px;
	border-radius: 5px;
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

/* 소제목 */
h3 {
	width: 100%;
	color: black;
	margin: 40px 0 0 0;
	border-bottom: 2px solid gray; 
	font-size: 1em;
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

/* 배송정보 */
#deliveryInfo {
}

#delTable {
	height: 300px;
	width: 100%;
}
#delTable td {
	padding: 0 15px;
	border-bottom: 1px solid gray; 
}
#delTable td:nth-child(2n-1) {
	background-color: #fafafa;
}
#nameBox {
	display: flex;
	flex-direction: row;
}
#getInfo {
	display: flex;
	flex-direction: row;
	align-items: center;
	font-size: 0.8em;
	margin: 0 0 0 10px
}
#getInfo input, label {
	margin: 0;
}
#getInfo input[type="checkbox"] {
    width: 15px; 
    height: 15px; 
}
#getInfo label {
	padding: 5px;
}
#tel {
	width: 40%;
}
#delAddrBox div {
	margin: 10px 0;
}
#address1, #address2 {
	width: 70%;
}

#findZip {
	display: flex;
	flex-direction: row;
	align-items: center;
}
.btn_check {
	border: 1px solid #9bce26;
	background: hsl(0 0 0/0);
	font-size: 0.8em;
	padding: 3px 10px;
	margin: 0 0 0 10px; 
	color: #9bce26;
	border-radius: 0.5em;
	transition: 0.2s;
}
.btn_check:hover, .btn_check:focus, .btn_check:active {
	border: 1px solid #9bce26;
	background: #9bce26;
	color: #fff;
}

/* 상품정보부분 */
#info_transfer {
	display: none;
}

#productBox {
	border-bottom: 1px solid gray;
	width: 100%;
}
#p_info {
	width: 100%;
	min-width: 800px;
}
#p_info tr:nth-child(1) {
	border-bottom: 1px solid gray; 
	height: 40px;
}
#p_info tr {
	border-bottom: 1px solid #d7d7d9; 
}
#p_info th {
	text-align: center;
	color: gray;
	font-size: 0.9em;
}

#p_info td {
	border-right: 1px solid #d7d7d9; 
	padding: 10px 20px;
}
#p_info td:last-child {
	border: none;
}
#p_info td:nth-child(1) {
	width: 20%;
}
#p_info .img {
	width: 100%;
	height: 100%;
	display: flex;
	align-content: center;
	justify-content: center;
}
#p_info .img div {
	width: 85px;
	height: 85px;
}
#p_info td:nth-child(2) {
	width: 50%;
	text-align: left;
}
#p_info td:nth-child(3) {
	width: 15%;
	text-align: center;
}
#p_info td:nth-child(4) {
	width: 15%;
	text-align: center;
}

/* 결제부분 */
#payBox {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

/* 결제-왼쪽 부분 */
#choosePay {
	min-width: 250px;
	margin: 0 30px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	width: 100%;
}

/* 포인트/적립 */
#pointBox {
	width: 100%;
}
#hasPoint, #usePoint {
	display: flex;
	flex-direction: row;
	border-bottom: 1px solid gray;
}
#pointinfo .c, #pointinfo .d {
	display: flex;
	align-items: center;
	height: 60px;
}
#pointinfo .c {
	background-color: #fafafa;
	width: 125px;
}
#pointinfo .d {
	flex-basis: 70%;
	padding: 0 20px;
	width: 100%;
}
#usePoint .d {
	display: flex;
	flex-direction: row;
	width: 100%;
}
#usedPoint {
	width: 150px;
	margin: 0 5px;
}
#allPoint {
 	min-width: 85px;
	border: 1px solid #9bce26;
	background: hsl(0 0 0/0);
	font-size: 0.8em;
	padding: 3px 10px;
	margin: 0 0 0 3px; 
	color: #9bce26;
	border-radius: 0.5em;
	transition: 0.2s;
} 
#allPoint:hover, #allPoint:focus, #allPoint:active {
	border: 1px solid #9bce26;
	background: #9bce26;
	color: #fff;
}

/* 결제수단 */
#methodBox {
	width: 100%;
	border-bottom: 1px solid gray;
}
#methodBtn {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin: 10px;
	padding: 10px 0;
}
#methodBtn div {
	display: flex;
	flex-direction: row;
}
#methodBtn .m {
	display: flex;
	flex-direction: row;
	align-items: center;
	font-size: 0.9em;
}
.m input[type="radio"], label {
	margin: 0;
}
.m input[type="radio"] {
    width: 15px; 
    height: 15px; 
}
.m label {
	padding: 0 0 0 5px;
}


/* 결제-오른쪽 부분 */
/* 최종결제정보 */
#priceBox {
	margin: 0 0 0 50px;
	width: 400px;
}
#priceBox #priceInfo {
	display: flex;
	flex-direction: column;
}

#priceInfo .priceInfo_content {
	display: flex;
	flex-direction: row;
	align-content: center;
	justify-content: space-between;
}
#priceBox .c, #priceBox .d {
	display: flex;
	align-items: center;
	height: 60px;
}
#priceBox .c {
	min-width: 90px;
	margin: 0 20px 0 0;
}
#priceBox .d input {
	width: 100%;
	text-align: right;
}
#Tprice .c, #Tprice .d {
	font-size: 1.1em;
	font-weight: bold;
}
#totalPrice {
	color: red;
}
#pay {
	display: flex;
	justify-content: center;
}
#payment {
	width: 100%;
	height: 50px;
	margin: 10px 0;
	border: 1px solid #ff7878;
	background: hsl(0 0 0/0);
	font-weight: bold;
	font-size: 1.3em;
	padding: 3px 10px; 
	color: #ff7878;
	border-radius: 0.5em;
	transition: 0.2s;
}
#payment:hover, #payment:hover, #payment:hover {
	border: 1px solid #ff7878;
	background: #ff7878;
	color: #fff;
}

/* 읽기 전용 input 태그 */
.read {
	border: none;
	font-size: 1em;
}
.read:hover {
	cursor: default;
}
.read:focus {
	outline: none;
	border: none;
}

</style>

<body>

<%@ include file="../../include/menu/menu.jsp"%>

<div id="pageWrap">

<div id ="infoHeader">
	<h1>주문/결제</h1>
	<div id="process">
		<ul class="step_list">
			<li class="li">1 장바구니 ></li>
			<li class="li">2 주문/결제 ></li>
			<li class="li">3 결제완료</li>
		</ul>
	</div>
</div>

<div id="info">
	<form action="/order/order.do" method="post" id="form_order">

	<!-- 숨기기 -->
	<div id="p_info" style="display: none;">
		<c:forEach var="o" items="${options}">
			${o}<input type="hidden" name="option_name" value="${o}">
		</c:forEach>
	</div>
	
	<!-- 배송정보 -->
	<div id="deliveryInfo">
		<div>
			<h3>배송정보</h3>
		</div>
		<table id="delTable">
			<tr>
				<td>수령인</td>
				<td>
					<div id="nameBox">
						<input id="name" name="username">
						<div id="getInfo">
							<input type="checkbox" onclick="getInfo()" id="cusInfo">
							<label for="cusInfo">주문자정보와 동일</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input id="tel" name="tel"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<div id="delAddrBox">
						<div id="findZip">
							<input id="zipcode" name="zipcode">
							<button type="button" class="btn_check" onclick="showPostcode()">우편번호 찾기</button>
						</div>
						<div>
							<input id="address1" name="address1">
						</div>
						<div>
							<input id="address2" name="address2">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 상품정보 -->
	<div id="productBox">
	
	<div id="info_transfer">
		<c:forEach var="row" items="${list}">
			<input type="hidden" name="p_id" value="${row.p_id}">
			<input type="hidden" name="amount" value="${row.amount}">
			<input type="hidden" name="c_id" value="${row.c_id}">
		</c:forEach>
	</div>
	
	<div>
		<h3>상품정보</h3>
	</div>
	
	<table id="p_info">
		<tr>
			<th colspan="2">상품정보</th>
			<th>판매가</th>
			<th>수량</th>
		</tr>
	<c:forEach var="row" items="${list}">
		<tr>
			<td><div class="img"><div><img src="${row.file_name}"/></div></div></td>
			<td>
			${row.p_name}
			<c:if test="${not empty row.option}">
				| ${row.option}
			</c:if>
			</td>
			<td><fmt:formatNumber pattern="#,###" value="${row.p_price}"></fmt:formatNumber>원</td>
			<td>${row.amount}개</td>
		</tr>
	</c:forEach>
	</table>
	</div>
	
	<!-- 결제 -->
	<div id="payBox">
	
		<div id="choosePay">
		
			<!-- 포인트 -->
			<div id="pointBox">
				<div><h3>포인트/적립</h3></div>
				<div id="pointinfo">
					<div id="hasPoint">
						<div class="c"><p>보유 포인트</p></div>
						<div class="d"><input class="read" id="currentPoint" name="currentPoint" value="${currentPoint}" readonly></div>
					</div>
					<div id="usePoint">
						<div class="c"><p>사용할 포인트</p></div>
						<div class="d">
							<input id="usedPoint" name="usedPoint" value="0">
							<button type="button" id="allPoint" onclick="useAllPoint()">전액사용</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 결제수단 -->
			<div id="methodBox">
				<div><h3>결제수단 선택</h3></div>
				<div id="methodBtn">
					<div class="m">
						<input type="radio" id="kakao" class="method" name="method" value="kakaopay">
						<label for="kakao">카카오페이</label>
					</div>
					<div class="m">
						<input type="radio" id="toss" class="method" name="method" value="tosspay">
						<label for="toss">토스페이</label>
					</div>
					<div class="m">
						<input type="radio" id="kg" class="method" name="method" value="html5_inicis">
						<label for="kg">KG이니시스</label>
					</div>
				</div>
			</div>
			
		</div>
	
		<!-- 상품금액 -->
		<div id="priceBox">
			<div><h3>최종 결제 정보</h3></div>
			<div id="priceInfo">
				<div id="Pprice" class="priceInfo_content">
				<div class="c">총 상품금액</div>
				<div class="d">
					<span class="read" id="price" ><fmt:formatNumber pattern="#,###" value="${price}"></fmt:formatNumber></span>
					<input type="hidden" name="price" value="${price}" readonly>
				</div>
				</div>
				<div id="Point" class="priceInfo_content">
					<div class="c">적립 포인트</div>
					<div class="d">
						<span class="read" id="addPoint" >${addPoint}</span>
						<input type="hidden" name="addPoint" value="${addPoint}" readonly>
					</div>
				</div>
				<div id="Dprice" class="priceInfo_content">
					<div class="c">배송비</div>
					<div class="d">
						<span class="read" id="deliverCost" ><fmt:formatNumber pattern="#,###" value="${delfee}"></fmt:formatNumber></span>
						<input type="hidden" name="deliverCost" value="${delfee}" readonly>
					</div>
				</div>
				<div id="Tprice" class="priceInfo_content">
					<div class="c">총 합계</div>
					<div class="d">
						<span class="read" id="totalPrice" ><fmt:formatNumber pattern="#,###" value="${totalPrice}"></fmt:formatNumber></span>
						<input type="hidden" name="totalPrice" value="${totalPrice}" readonly>
					</div>
				</div>
				<div id="pay">
					
					<!-- 결제하기 버튼 생성 -->
					<button type="button" id="payment" onclick="Payment()">구매하기</button>
					
					<!-- 테스트 -->
					<!-- <button type="button" onclick="testpay()">테스트버튼</button> -->
				</div>
			</div>
		</div>
		
	</div>
	
	</form>
</div>
</div>

<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script>

//포인트 전액 사용
function useAllPoint() {
	
	var pointAll = parseInt(document.getElementById('currentPoint').value);
	var totalPrice = "${totalPrice}";
	
	if (pointAll == 0 || pointAll == null) {
		alert('보유한 포인트가 없습니다.');
		document.getElementById('usedPoint').value = 0;
	} else if (totalPrice < pointAll) {
		document.getElementById('usedPoint').value = totalPrice;
	} else if (totalPrice >= pointAll) {
		document.getElementById('usedPoint').value = pointAll;
	} 
}

//주문자 정보 불러오기
function getInfo() {
	var isChecked = document.getElementById('cusInfo').checked;
	
	if (isChecked) {
		
		$.ajax({
			type: 'GET',
			url: '/order/memberInfo.do',
			data: { userid: "${sessionScope.userid}" },
			success: function(response) {
				if (response != undefined && response != null) {
					document.getElementById('name').value = response.NAME ? response.NAME : '';
		            document.getElementById('tel').value = response.phone ? response.phone : ''; 
		            document.getElementById('zipcode').value = response.zipcode ? response.zipcode : '';
		            document.getElementById('address1').value = response.address1 ? response.address1 : '';
		            document.getElementById('address2').value = response.address2 ? response.address2 : '';
				} else {
					document.getElementById('name').value = '';
		            document.getElementById('tel').value = ''; 
		            document.getElementById('zipcode').value = '';
		            document.getElementById('address1').value = '';
		            document.getElementById('address2').value = '';
				}
			}
		});
		
	} else {
        // 체크되어 있지 않다면 값을 비웁니다.
        document.getElementById('name').value = '';
        document.getElementById('tel').value = '';
        document.getElementById('zipcode').value = '';
        document.getElementById('address1').value = '';
        document.getElementById('address2').value = '';
    }
	
}

//주소api
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
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address1").value = fullAddr;
                document.getElementById("address2").focus();
             }
          }).open();
}

//주문번호 생성
function formatID(date) {
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const randomNumber = Math.floor(1000 + Math.random() * 9000);
    const id = year + month + day + randomNumber;
	return id; 
    
}
 
//테스트결제
function testpay() {
	var date = new Date();
	const id = formatID(date);
	
	var input = document.createElement("input");
    input.setAttribute("type", "hidden");
    input.setAttribute("name", "IMPCode");
    input.setAttribute("value", id);
	
    document.getElementById('form_order').method = "post";
	document.getElementById('form_order').appendChild(input);
    document.getElementById('form_order').submit();
}

//결제
var IMP = window.IMP;

function Payment() {
	
	var c = valueCheck();
	if (c != null) {
		
		//포인트 값 검사
		var pointAll = parseInt(document.getElementById('currentPoint').value);
		var usedPoint = parseInt(document.getElementById('usedPoint').value);
		
		var p = parseInt("${totalPrice}") - usedPoint;
		if ( p <= 0) {
			p = 1;
		}
		
 		if (pointAll < usedPoint) {
			alert('보유한 포인트보다 더 높은 값을 작성할 수 없습니다.');
			$("#usedPoint").focus();
			return;
		} else {
			var userid = "${sessionScope.userid}";
			var totalPrice = p;
			var tel = document.getElementById('tel').value;
			var name = document.getElementById('name').value;
			var zipcode = document.getElementById('zipcode').value;
			var address1 = document.getElementById('address1').value;
			
			const methodList = document.getElementsByName("method");
			var method;
			
			var date = new Date();
			const id = formatID(date);

			if (confirm("구매 하시겠습니까?")) { // 구매 클릭시 한번 더 확인하기
				
				//구매방식 확인
				methodList.forEach((node) => {
					if(node.checked)  {
						method = node.value;
					}
				})
				
				// 회원만 결제 가능
		        if (userid != null) { 
		            
		            IMP.init("imp42661322"); // 가맹점 식별코드
		            IMP.request_pay({
		                pg: method, // PG사 코드표에서 선택
		                pay_method: 'card', // 결제 방식
		                merchant_uid: id, // 결제 고유 번호
		                name: 'EDEN', // 제품명
		                amount: totalPrice, // 가격
		                
		                //구매자 정보 ↓
		                buyer_name: name,
		                buyer_tel : tel,
		                buyer_addr : address1,
		                buyer_postcode : zipcode
		                
		            }, async function (rsp) { // callback
		                if (rsp.success) { //결제 성공시
		                
							alert('결제가 완료되었습니다.');
		                	
							var input = document.createElement("input");
						    input.setAttribute("type", "hidden");
						    input.setAttribute("name", "IMPCode");
						    input.setAttribute("value", id);
							
						    document.getElementById('form_order').method = "post";
							document.getElementById('form_order').appendChild(input);
						    document.getElementById('form_order').submit();
		                    
		                } else if (rsp.success == false) { // 결제 실패시
		                    alert(rsp.error_msg)
		                }
		            }); 
		            
		         } else { // 비회원 결제 불가
		            alert('로그인이 필요합니다!')
		        } 
			
		    } else { // 구매 확인 알림창 취소 클릭시 돌아가기
		        return false;
		    }
		} 
	}
}

//입력값 검사
function valueCheck() {
	
	var name = document.getElementById('name').value;
	var tel = document.getElementById('tel').value;
	var zipcode = document.getElementById('zipcode').value;
	var address1 = document.getElementById('address1').value;
	var address2 = document.getElementById('address2').value;
	
	const methodList = document.querySelectorAll('input[name="method"]:checked');
	var setPoint = document.getElementById('usedPoint').value;

	if (name == null || name === '') {
		alert('수령인을 입력하세요');
		$("#name").focus();
		return;
	} else if (tel == null || tel === '') {
		alert('전화번호를 입력하세요');
		$("#tel").focus();
		return;
	} else if (zipcode == null || zipcode === '') {
		alert('우편번호를 입력하세요');
		$("#zipcode").focus();
		return;
	} else if (address1 == null || address1 === '') {
		alert('주소를 입력하세요');
		$("#address1").focus();
		return;
	} else if (address2 == null || address2 === '') {
		alert('상세주소를 입력하세요');
		$("#address2").focus();
		return;
	} else if (methodList.length === 0) {
		alert('결제수단을 선택하세요');
		return;
	} else if (setPoint == null || setPoint === '') {
		alert('사용할 표인트를 입력하세요');
		$("#usedPoint").focus();
		return;
	} 
	
	return 'success';
	
}

</script>
</body>
</html>