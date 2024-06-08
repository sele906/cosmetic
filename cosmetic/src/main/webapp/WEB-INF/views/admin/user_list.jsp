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

<title>사용자 목록</title>

<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
#emptyB {
	background-image:
		url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_nodata104x104.png);
	background-repeat: no-repeat;
	background-position: 50% 30%;
	height: 230px;
}

#emptyB #Emessage {
	text-align: center;
	margin: 150px 0 50px 0;
}

table thead th {
	font-size: 1rem;
	font-weight: bold;
	text-align: center;
}

table tbody td {
	font-size: 0.875rem;
	text-align: center;
}

table tbody tr {
	font-weight: normal;
}

.truncate {
	max-width: 150px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
}
</style>
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
</head>



<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/admin/order_list">
				<div class="sidebar-brand-icon rotate-n-15"></div>
				<div class="sidebar-brand-text mx-3">EDEN 뷰티</div>
			</a>

			<!-- Divider -->
			<!-- <hr class="sidebar-divider my-0">

			Nav Item - Dashboard
			<li class="nav-item"><a class="nav-link" href="index.html">
					<i></i> <span>📈 대쉬보드</span>
			</a></li>

			Divider
			<hr class="sidebar-divider"> -->

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

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">고객 목록</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<!-- <h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6> -->
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12 col-md-6">
											<div class="dataTables_length" id="dataTable_length"></div>
											<div style="padding-left: 15.5em;">고객수 : ${count}명</div>
										</div>
										<form name="dateform" method="get" action="/admin/user_list">
											<div class="col-sm-12 col-md-6" style="margin-left: 14.5em;">
												<div class="input-group mb-3" style="width: 300px;">
													<input type="search" class="form-control form-control-sm"
														placeholder="이름, 아이디를 검색하세요..." id="search"
														name="searchKeyword"> &nbsp;&nbsp;&nbsp;
													<div class="input-group-append">
														<button style="height: 32px;" class="btn btn-facebook"
															type="button" id="keyword">검색</button>
													</div>
												</div>
											</div>
										</form>

									</div>
									<div class="container">
										<div class="row">
											<div class="col-sm-12" style="width: 100%;">
												<table class="table table-striped">
													<thead>
														<tr>
															<th scope="col">이름</th>
															<th scope="col">아이디</th>
															<th scope="col">닉네임</th>
															<th scope="col">이메일</th>
															<th scope="col">생년월일</th>
															<th scope="col">휴대폰</th>
															<th scope="col">주소</th>
															<th scope="col">Point</th>
															<th scope="col">가입일</th>
														</tr>
													</thead>
													<c:choose>
														<c:when test="${empty list}">
															<tbody>
																<tr>
																	<td colspan="9" id="emptyB" style="text-align: center;">
																		<p id="Emessage">해당하는 고객이 없습니다.</p>
																	</td>
																</tr>
															</tbody>
														</c:when>
														<c:otherwise>
															<tbody>
																<c:forEach var="row" items="${list}">
																	<tr>
																		<td>${row.name}<br>[${row.level}]</td>
																		<td>${row.userid}</td>
																		<td>${row.nickname}</td>
																		<td>${row.email}</td>
																		<td>${row.birth}</td>
																		<td class="phone-number">${row.phone}</td>
																		<td>${row.address1}</td>
																		<td><fmt:formatNumber value="${row.point}" pattern="#,###"/></td>
																		<td><fmt:formatDate value="${row.date}"
																				pattern="yy.M.d" /></td>
																	</tr>
																</c:forEach>
															</tbody>
														</c:otherwise>
													</c:choose>
												</table>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-5">
											<div class="dataTables_info" id="dataTable_info"
												role="status" aria-live="polite"></div>
										</div>
										<div class="col-sm-12 col-md-7">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTable_paginate">
												<ul class="pagination">
													<c:if test="${page_info.curPage > 1 }">
														<li class="paginate_button page-item previous"
															id="dataTable_previous"><a href='#'
															onclick="list('${page_info.curPage-1}')"
															aria-controls="dataTable" data-dt-idx="0" tabindex="0"
															class="page-link">Previous</a></li>
													</c:if>
													<!-- 페이지 숫자 -->
													<c:forEach var="num" begin="${page_info.blockStart}"
														end="${page_info.blockEnd}">
														<c:choose>
															<c:when test="${num == page_info.curPage}">
																<li class="paginate_button page-item active"><a
																	href="#" aria-controls="dataTable" data-dt-idx="1"
																	tabindex="0" class="page-link">${num}</a></li>
															</c:when>
															<c:otherwise>
																<li class="paginate_button page-item"><a href="#"
																	onclick="list('${num}')" aria-controls="dataTable"
																	data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
																</li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<c:if test="${page_info.curPage  <=  page_info.totPage}">
														<li class="paginate_button page-item next"
															id="dataTable_next"><a href="#"
															aria-controls="dataTable" data-dt-idx="7" tabindex="0"
															onclick="list('${page_info.totPage}')" class="page-link">Next</a></li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- End of Main Content -->

				<!-- Footer 시작 -->
				<!-- <footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2020</span>
						</div>
					</div>
				</footer> -->
				<!-- Footer 끝 -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

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

		<!--선택 옵션에 따른 리스트-->
</body>
<script>
function list(page) {
    var urlS = "curPage=" + page;
    var searchKeyword = document.getElementById("search").value;
    console.log(searchKeyword);
    if (searchKeyword) {
        urlS += "&searchKeyword=" + encodeURIComponent(searchKeyword); // 검색어를 URL 인코딩
    }
    location.href = "/admin/user_list?" + urlS;
}

document.getElementById("keyword").addEventListener("click", function() {
    list(1); // 페이지를 1로 설정하여 검색 실행
});

	
</script>
</html>