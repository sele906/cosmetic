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

<title>주문목록</title>

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
/* 날짜 선택 */
#dateBox {
	border: none;
}

#dateInfo {
	padding: 40px 0 10px 0;
	font-weight: bold;
}

#dateChooseBox {
	display: flex;
	flex-direction: row;
	width: 100%;
	padding: 5px;
	font-size: 0.9em;
}

#dateChooseBox button {
	padding: 0 10px;
	height: 30px;
	background-color: white;
	border: 1px solid #999;
}

#dateChooseBox input {
	height: 30px;
}

#chooseDateBtn {
	display: flex;
	flex-direction: row;
	min-width: 240px;
}

#dateChooseBox button {
	margin: 5px 2px;
}

#dateChooseBox button:active, #dateChooseBox button:hover,
	#dateChooseBox button:focus {
	background-color: #555;
	color: white;
}

#chooseDate {
	margin: 0 0 0 10px;
	display: flex;
	flex-direction: row;
	min-width: 325px;
}

#chooseDate #inputD {
	display: flex;
	flex-direction: row;
	align-items: center;
}

#inputD input[type="date"]::-webkit-datetime-edit {
	padding: 0 0 2px 5px;
}

#chooseDate #inputD div, #chooseDate button {
	margin: 5px 2px;
}
</style>

<script type="text/javascript">
	var urlParams = new URLSearchParams(window.location.search);

	if (urlParams != null) {
		var f_date = urlParams.get('f_date') || "";
		var l_date = urlParams.get('l_date') || "";

		function list(page) {
			var urlS = "curPage=" + page;

			if (f_date !== "" && l_date !== "") {
				urlS += "&f_date=" + f_date + "&l_date=" + l_date;
			}

			location.href = "/admin/order_list?" + urlS;
		}
	}
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
			<hr class="sidebar-divider">
 -->
			<!-- Heading -->
			<!--  <div class="sidebar-heading">
                Interface
            </div> -->

			<!-- Nav Item - Pages Collapse Menu -->
			
				<li class="nav-item"><a class="nav-link"
				href="/admin/user_list"> <i></i> <span>👤 고객관리</span>
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
					<h1 class="h3 mb-2 text-gray-800">주문 목록</h1>

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

										<form name="dateform" method="get" action="/admin/order_list">
											<div id="dateChooseBox" style="padding-left: 2%;">
												<div id="chooseDateBtn">
													<button type="button" id="1month"
														onclick="setToday();confirmDate();" style="width: 66px;">오늘</button>
													<button type="button" id="1month"
														onclick="setDate(1);confirmDate();" style="width: 66px;">1개월</button>
													<button type="button" id="3month"
														onclick="setDate(3);confirmDate();" style="width: 66px;">3개월</button>
													<button type="button" id="6month"
														onclick="setDate(6);confirmDate();" style="width: 66px;">6개월</button>
													<button type="button" id="12month"
														onclick="setDate(12);confirmDate();" style="width: 70px;">12개월</button>
												</div>
												<div id="chooseDate">
													<div id="inputD">
														<div id="f">
															<input type="date" name="f_date" id="date1">
														</div>
														<div>~</div>
														<div id="l">
															<input type="date" name="l_date" id="date2">
														</div>
													</div>
													<button type="button" onclick="confirmDate()"
														style="width: 66px;" id="confirmButton">조회</button>
												</div>
											</div>
											<div class="col-md-8">
												<div class="input-group" style="width: 50%;">
													<input type="text" class="form-control search-input"
														placeholder="Search..." id="search" name="searchKeyword">
													<div class="input-group-append">
														<button class="btn btn-outline-secondary search-icon"
															type="button" id="keyword">
															<i class="fa fa-search"></i>
														</button>
													</div>
												</div>
											</div>

										</form>

									</div>
									<br>
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="Name: activate to sort column descending"
															style="width: 50px; text-align: center;">주문번호</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 50px; text-align: center;">주문일자</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 31px; text-align: center;">구매자</th>
														<!-- <th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 50px; text-align: center;">결제수단</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 50px; text-align: center;">주문 갯수</th> -->
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 31px; text-align: center;">총금액</th>

													</tr>
												</thead>
												<c:choose>
													<c:when test="${count eq 0}">
														<tbody>
															<tr>
																<td colspan="6" id="emptyB">
																	<p id="Emessage">기간내 주문내역이 없습니다.</p>
																</td>
															</tr>
														</tbody>
													</c:when>
													<c:otherwise>
														<tbody>
															<c:forEach var="row" items="${list}">
																<tr class="odd">
																	<td style="text-align: center;" class="sorting_1">
																		<c:choose>
																			<c:when test="${not empty row.cancelreason}">
																				<a href="/admin/admin_order_detail/${row.orderid}"
																					style="color: red;">${row.orderid}</a>
																				<br>
																			</c:when>
																			<c:otherwise>
																				<a href="/admin/admin_order_detail/${row.orderid}">${row.orderid}</a>
																				<br>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<%-- <td style="text-align: center;"> ${orderstatus[row.orderid]}</td> --%>
																	<td style="text-align: center;"><fmt:formatDate
																			value="${row.orderDate}" type="date" /></td>
																	<td style="text-align: center;">${row.userid}</td>
																	<%-- <td style="text-align: center;">${row.method}</td> --%>
																	<%-- <td style="text-align: center;">${ordercount[row.orderid]}</td> --%>
																	<td class="long-text" style="text-align: center;"><fmt:formatNumber
																			value="${row.totalPrice}" pattern="##,###" /></td>
																</tr>
															</c:forEach>
														</tbody>
													</c:otherwise>
												</c:choose>
											</table>
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
		<script type="text/javascript">
			// 여기에 JavaScript 코드 추가
			var urlParams = new URLSearchParams(window.location.search);

			if (urlParams != null) {
				var defaultStartDate = new Date();
				defaultStartDate.setMonth(defaultStartDate.getMonth() - 3);
				var defaultEndDate = new Date();

				var f_date = urlParams.get('f_date')
						|| defaultStartDate.toISOString().split('T')[0];
				var l_date = urlParams.get('l_date')
						|| defaultEndDate.toISOString().split('T')[0];

				function list(page) {
					var urlS = "curPage=" + page;

					if (f_date !== "" && l_date !== "") {
						urlS += "&f_date=" + f_date + "&l_date=" + l_date;
					}

					location.href = "/admin/order_list?" + urlS;
				}

				// Set default start and end dates in the date inputs
				document.getElementById('date1').value = f_date;
				document.getElementById('date2').value = l_date;
			}

			// Function to set date range based on months
			function setDate(months) {
				var date = new Date();
				var startDate = new Date(date.setMonth(date.getMonth() - months));
				document.getElementById('date1').value = startDate.toISOString().split('T')[0];
				document.getElementById('date2').value = new Date().toISOString().split('T')[0];
			}
			
			// 오늘 날짜
			function setToday() {
			    var today = new Date().toISOString().split('T')[0];
			    document.getElementById('date1').value = today;
			    document.getElementById('date2').value = today;
			}

			function confirmDate() {
				var f_date = document.getElementById('date1').value;
				var l_date = document.getElementById('date2').value;
				var searchKeyword = document.getElementById('search').value;

				var url = "/admin/order_list?curPage=1";

				if (f_date) {
					url += "&f_date=" + f_date;
				}
				if (l_date) {
					url += "&l_date=" + l_date;
				}
				if (searchKeyword) {
					url += "&searchKeyword=" + searchKeyword;
				}

				location.href = url;
			}

			// Event listeners for buttons
			$(document).ready(
					function() {
						document.getElementById("1month").addEventListener(
								"click", function() {
									setDate(1);
								});
						document.getElementById("3month").addEventListener(
								"click", function() {
									setDate(3);
								});
						document.getElementById("6month").addEventListener(
								"click", function() {
									setDate(6);
								});
						document.getElementById("12month").addEventListener(
								"click", function() {
									setDate(12);
								});
						document.getElementById("confirmButton")
								.addEventListener("click", function() {
									confirmDate();
								});
						document.getElementById("keyword").addEventListener(
								"click", function() {
									confirmDate();
								});

						// Add background color to rows with cancel reason
						/*   $("tbody tr").each(function() {
						      var cancelReason = $(this).find("td:eq(2)").text(); // Assuming cancel reason is in the third column (index 2)
						      if (cancelReason.trim() !== "") {
						          $(this).css("background-color", "red");
						      }
						  }); */
					});
		</script>
</body>
</html>