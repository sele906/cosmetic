<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>주문 상세</title>

<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
//전화번호 형식 변환 함수
function formatPhoneNumber(phoneNumber) {
    const cleaned = ('' + phoneNumber).replace(/\D/g, '');
    const match = cleaned.match(/^(\d{3})(\d{3,4})(\d{4})$/);
    if (match) {
        return match[1] + '-' + match[2] + '-' + match[3];
    } else {
        return phoneNumber;
    }
}

// 페이지가 로드된 후 실행되는 함수
window.onload = function() {
    // 전화번호를 포함하는 요소들을 선택하고 형식을 변경
    const phoneElements = document.querySelectorAll('.phone-number');
    phoneElements.forEach(element => {
        const phoneNumber = element.innerText;
        element.innerText = formatPhoneNumber(phoneNumber);
    });
};

</script>
<style type="text/css">
/* 주문목록 테이블 */
#orderTable {
	width: 100%;
	border-bottom: 1px solid gray;
	color: #353839; /* 추가된 부분: 텍스트 색상 설정 */
}

#orderTable .p_info {
	display: flex;
	flex-direction: row;
	width: 100%;
	align-items: center;
	justify-content: flex-start;
}

#orderTable .imgBox {
	width: 100px;
	height: 100px;
}

#orderTable .Pname {
	width: 100%;
	padding: 5px;
}

#orderTable .imgBox img {
	width: 100%;
	height: 100%;
}

#orderTable th {
	border-top: 2px solid gray;
	padding: 10px;
	border-bottom: 1px solid gray;
	background-color: #fafafa;
	text-align: center;
}

#orderTable td {
	border-bottom: 1px solid gray;
	padding: 10px;
}

#orderTable td:nth-child(1) p {
	margin: 0;
	padding: 0;
}

#orderTable td:nth-child(1) .i {
	font-weight: bold;
}

#orderTable td:not(:nth-child(2)) {
	text-align: center;
}

#orderTable td:nth-child(2) {
	min-width: 250px;
}

#orderTable td:nth-child(2) a {
	color: #353839; /* 수정된 부분 */
}

#orderTable td:nth-child(2) a:hover {
	color: #337ab7;
}

#orderTable td:nth-child(3) {
	min-width: 140px;
}

#orderTable td:nth-child(3) .p {
	color: red;
	padding: 0;
	margin: 0;
	font-size: 1.1em;
	display: inline-block;
}

#orderTable td:nth-child(3) .a {
	color: gray;
	padding: 0;
	margin: 0;
	font-size: 0.9em;
	display: inline-block;
}

#orderTable td:nth-child(4) {
	min-width: 110px;
}

#orderTable td:nth-child(4) p {
	margin: 5px;
}

#orderTable td:nth-child(4) button {
	border: 1px solid #999;
	background-color: white;
	padding: 5px 10px;
	width: 95px;
	color: #353839; /* 추가된 부분 */
}

#orderTable td:nth-child(4) button:active, #orderTable td:nth-child(4) button:hover,
	#orderTable td:nth-child(4) button:focus {
	background-color: #555;
	color: white;
}

.detail-container {
	width: 100%;
	max-width: 800px;
	margin: 0 auto;
}

.detail {
	border-collapse: collapse;
	width: 100%;
}

.detail td, .detail th {
	color: #353839;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 8px;
}

.detail td:last-child, .detail th:last-child {
	border-right: none;
}

.detail .detail-label {
	font-weight: bold;
	text-align: left;
	width: 150px;
}

.detail .detail-value {
	text-align: left;
}

h3 {
	text-align: center;
}
</style>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar" style="background-color: white;">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/admin/order_list">
				<div class="sidebar-brand-icon rotate-n-15"></div>
				<div class="sidebar-brand-text mx-3">EDEN 뷰티</div>
			</a>

			<!-- Divider -->


			<!-- Heading -->
			<!--  <div class="sidebar-heading">
                Interface
            </div> -->

			<!-- Nav Item - Pages Collapse Menu -->

			<li class="nav-item"><a class="nav-link" href="/admin/user_list">
					<i></i> <span>👤 고객관리</span>
			</a></li>


			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i></i> <span>🛍︎
						상품관리</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/admin/write_product">상품등록</a> <a
							class="collapse-item" href="/admin/list_product">상품목록</a>
						<div class="collapse-divider"></div>

					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link"
				href="/admin/order_list"> <i></i> <span>📋 주문목록</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="/"> <i></i> <span>🖱️
						사이트로 바로가기</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- ------------------------------------Tob Bar 시작!------------------------------------ -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">EDEN
									관리자</span> <img class="img-profile rounded-circle"
								src="/resources/admin/img/undraw_profile.svg">
						</a></li>
					</ul>
				</nav>
				<!---------------------------------------------Tob Bar 끝! ----------------------------------->

				<!-- ----------------------------------------- 내용 시작 --------------------------------->
				<div class="container-fluid">
					<h4 style="color: #212121;">주문 상세 내역</h4>
					<br>
					<dt
						style="display: inline-block; margin-right: 10px; color: #353839;">주문번호</dt>
					<dd
						style="display: inline-block; margin-right: 20px; font-weight: bold; color: #212121;">${list[0].orderid}</dd>
					<dt
						style="display: inline-block; margin-right: 10px; color: #353839;">주문일자</dt>
					<dd
						style="display: inline-block; font-weight: bold; color: #212121;">
						<fmt:formatDate value="${list[0].orderDate}"
							pattern="yyyy.MM.dd HH:mm" />
					</dd>


					<%-- <h4>구매자: ${list[0].userid}</h4> --%>

					<table id="orderTable">
						<thead>
							<tr>
								<th>상품번호</th>
								<th></th>
								<th>상품정보</th>
								<th>옵션</th>
								<th>금액/수량</th>
								<th>주문상태</th>
								<th></th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="row" items="${list}">
							
								<tr>
									<td>
										<p class="i">${row.p_id}</p>
										<%--  <c:out value="p_price: ${row.p_price}" /><br> --%>
									</td>
									<td style="width: 80px;"><img
										style="width: 80px; height: 80px; margin-left: 7.5rem;"
										src="${fn:replace(row.file_name, 'src/main/webapp', '')}">
									</td>
									<td style="text-align: left; width: 20%;">${row.p_name}<br>
									</td>
									<td>
										<p class="i">${row.o_name}</p>
									</td>
									<c:choose>
										<c:when test="${row.o_name == null || row.o_name == ''||row.o_name=='없음'}">
											<td>
												<div class="p">
													<c:choose>
														<c:when
															test="${row.orderStatus eq '결제취소' || row.orderStatus eq '반품완료'}">
															<span style="color: red; text-decoration: line-through;">
															
																<fmt:formatNumber value="${row.p_price}" pattern="#,###" />원
															</span>
														</c:when>
														<c:otherwise>
															<fmt:formatNumber value="${row.p_price}" pattern="#,###" />원
                                </c:otherwise>
													</c:choose>
												</div>
												<div class="a"
													style="color: ${row.orderStatus eq '결제취소' || row.orderStatus eq '반품완료' ? 'red' : 'inherit'}; text-decoration: ${row.orderStatus eq '결제취소' || row.orderStatus eq '반품완료' ? 'line-through' : 'none'};">
													${row.option_amount}개</div>
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<div class="p">
													<c:choose>
														<c:when
															test="${row.orderStatus eq '결제취소' || row.orderStatus eq '반품완료' }">
															<span style="color: red; text-decoration: line-through;">
																<fmt:formatNumber value="${row.p_price}" pattern="#,###" />원
															</span>
														</c:when>
														<c:otherwise>
															<fmt:formatNumber value="${row.o_price}" pattern="#,###" />원
           												 </c:otherwise>
													</c:choose>
												</div>
												<div class="a">
													<c:choose>
														<c:when
															test="${row.orderStatus eq '결제취소' || row.orderStatus eq '반품완료'}">
															<span
																style="color: ${row.orderStatus eq '결제취소' || row.orderStatus eq '반품완료' ? 'red' : 'inherit'}; text-decoration: line-through;">
																${row.option_amount}개 </span>

														</c:when>
														<c:otherwise>
              												  ${row.option_amount}개
            								</c:otherwise>
													</c:choose>
												</div>
											</td>

										</c:otherwise>
									</c:choose>
									<td>
    <c:choose>
    <c:when test="${row.orderStatus eq '결제취소'}">
        <p class="i" style="color: red;">${row.orderStatus}</p>
    </c:when>
    <c:when test="${row.orderStatus eq '반품완료'}">
        <p class="i" style="color: blue;">${row.orderStatus}</p>
    </c:when>
    <c:when test="${row.orderStatus eq '반품요청'}">
        <p class="i" style="color: red;">${row.orderStatus}</p> 
        <p style="font-weight: bold;">${row.cancelreason}</p>
        <!-- 반품완료 버튼 -->
        <form action="/admin/refund_status" method="post">
            <input type="hidden" name="orderid" value="${row.orderid}" />
            <input type="hidden" name="p_id" value="${row.p_id}" />
            <button type="submit">반품완료</button>
        </form>
       
    </c:when>
    <c:otherwise>
        <p>${row.orderStatus}</p>
    </c:otherwise>
</c:choose>

</td>
									
								</tr>
							</c:forEach>
						</tbody>

					</table>
					<br>
					<h4 style="color: #212121;">배송지 정보</h4>

					<table class="detail">
						<tbody>
							<tr>
								<td style="border-top-color: black;" class="detail-label">아이디</td>
								<td style="border-top-color: black;" class="detail-value">${list[0].userid}</td>
							</tr>
							<tr>
								<td class="detail-label">연락처</td>
								<td class="phone-number">${list[0].phone}</td>
							</tr>
							<tr>
								<td class="detail-label">배송지 주소</td>
								<td class="detail-value">${list[0].address1}</td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<h4 style="color: #212121;">최종 결제 정보</h4>
					<table class="detail">
						<tbody>

							<tr>
								<td style="border-top-color: black;" class="detail-label">총
									상품금액</td>
								<td style="border-top-color: black;" class="detail-value"><fmt:formatNumber
										value="${list[0].price}" pattern="#,###" />원</td>
							</tr>
							<tr>
								<td class="detail-label">배송비 합계</td>
								<td class="detail-value"><fmt:formatNumber
										value="${list[0].deliverCost}" pattern="#,###" />원</td>
							</tr>
							<tr>
								<td class="detail-label">결제 방식</td>
								<td class="detail-value">${list[0].method}</td>
							</tr>
							<tr>
								<td class="detail-label" style="font-weight: bold;">최종 결제금액</td>
								<td class="detail-value"
									style="font-weight: bold; font-size: 18px;"><fmt:formatNumber
										value="${list[0].totalPrice}" pattern="#,###" />원 <span
									style="color: #888; font-weight: normal; font-size: medium;"><br>┖point&nbsp;<fmt:formatNumber
											value="${list[0].userPoint}" pattern="#,###" /></span></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
			<!-- /.container-fluid -->
		</div>

	</div>


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript-->
	<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/admin/js/sb-admin-2.min.js"></script>

</body>

</html>