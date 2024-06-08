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

<title>상품목록</title>

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

.select {
	color: #858796;
	border: 1px solid #cccccc;
	border-radius: .35rem;
	width: 160px;
	/*  position: absolute;
 left: 87%;	 */
}

/* 새로운 테이블 스타일 */
.custom-table {
	width: 100%;
	font-size: 14px; /* 적절한 글꼴 크기로 조정하세요 */
}

.custom-table th, .custom-table td {
	padding: 8px; /* 각 셀의 내부 여백 조정 */
	text-align: center; /* 가운데 정렬 */
	width: 150px; /* 기본 너비 */
}

/* 번호, 수량, 판매가 셀의 너비 조정 */
.custom-table .narrow-cell {
	width: 88px; /* 적절한 너비 값으로 조정하세요 */
}

/* 상품 이름 셀의 너비 조정 */
.custom-table .product_name {
	width: 300px; /* 상품 이름 셀에 넓은 너비 값 설정 */
}

</style>
</head>

<script>
function list(page) {
	location.href = "/admin/list_product?curPage=" + page;
}
function load(){
	 location.href = "/admin/list_product?curPage=1";
}

</script>

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
						상품관리</span></a>

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
					<h1 class="h3 mb-2 text-gray-800">상품목록</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"></div>
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12 col-md-6">
											<div class="dataTables_length" id="dataTable_length">
												<!-- 	<form action="/admin/select_user_list" method="Get" name="form1"> -->
												<label> <select id="category" name="ctg_big"
													aria-controls="dataTable"
													class="custom-select custom-select-sm form-control form-control-sm">
														<option value="" selected disabled hidden>대분류</option>
														<c:forEach var="row" items="${Biglist}">
															<option value="${row}">${row}</option>
														</c:forEach>
												</select>
												</label> <label> <select name="ctg_small" id="subcategory"
													style="width: 140px;" aria-controls="dataTable"
													class="custom-select custom-select-sm form-control form-control-sm"
													onchange="changelist(this)">
														<option value="" selected disabled hidden>소분류</option>
														<option value="small"></option>
												</select>
												</label>
												<!-- </form> -->

												<button type="button" class="btn btn-outline-secondary"
													onClick="load()">전체상품</button>
											</div>

										</div>
										<div class="col-sm-12 col-md-6" style="padding-left: 56.5em;">
											<div class="input-group mb-3" style="width: 300px;">
												<input type="search" class="form-control form-control-sm"
													placeholder="상품명, 옵션명을 입력해주세요. . ." id="search"
													name="searchKeyword"> &nbsp;&nbsp;&nbsp;
												<div class="input-group-append">
													<button style="height: 32px;" class="btn btn-facebook"
														type="button" id="keyword">검색</button>
												</div>
											</div>
										</div>

									</div>
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered custom-table"
												id="dataTable">
												<thead>
													<tr>
														<th class="narrow-cell">상품번호</th>
														<th>상품명</th>
														<th class="narrow-cell">수량</th>
														<th class="narrow-cell">판매가</th>
														<th>옵션현황</th>
													</tr>
												</thead>
												<c:choose>
													<c:when test="${empty list}">
														<tbody>
															<tr>
																<td colspan="5" id="emptyB">
																	<p id="Emessage">상품이 없습니다.</p>
																</td>
															</tr>
														</tbody>
													</c:when>
													<c:otherwise>
														<tbody id="tableBody" class="tableBody">
															<c:forEach var="row" items="${list}">
																<tr class="odd">
																<a href="/product/detail_before?p_id=257">
																	<td class="narrow-cell">${row.p_id}</td></a>
																	<td style="width: 30%; text-align: left;">${row.p_name}</td>
																	<td class="narrow-cell">${row.p_stock}</td>
																	<td class="narrow-cell"><fmt:formatNumber
																			value="${row.p_price}" pattern="##,###" /></td>
																	<td style="width: 140px;"><select class="select"
																		style="width: 140px;">
																			<c:forEach var="option"
																				items="${fn:split(row.o_name, '\\\\] ')}">
																				<c:if test="${not empty option}">
																					<c:set var="parts"
																						value="${fn:split(option, '\\\\[')}" />
																					<c:set var="value" value="${fn:trim(parts[0])}" />
																					<c:set var="text"
																						value="${fn:trim(parts[0])} ${fn:trim(parts[1])}" />
																					<option value="${value}">${text}</option>
																				</c:if>
																			</c:forEach>


																	</select></td>












																</tr>
															</c:forEach>
														</tbody>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
									<div class="row" id="other">
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
		<script>
		/* function selectClicked(name){
			$('select[name='+name+'] option:eq(0)').css('display','none');
			
		} */
		
		document.getElementById('category').addEventListener('change', function() {
		    var Big = this.value;
		    if (Big !== '') {
		        fetch('/admin/Small?ctg_big=' + Big) // 대분류 값 전달
		            .then(response => response.json())
		            .then(data => {
		                // 서버에서 받은 소분류 데이터 처리
		                console.log('서버에서 받은 소분류 데이터:', data); // 소분류 데이터 확인
		                const Dropdown = document.getElementById('subcategory');
		                Dropdown.innerHTML = ''; // 기존 옵션을 모두 지움
		                const Option = document.createElement('option');
		                Option.value = '';
		                Option.text = '소분류';
		                Dropdown.add(Option);
		                data.forEach(subcategory => {
		                    const option = document.createElement('option');
		                    option.value = subcategory;
		                    option.text = subcategory;
		                    Dropdown.add(option);
		                });
		            })
		            .catch(error => console.error('Error:', error));
		    } else {
		        // 대분류가 선택되지 않은 경우 소분류를 초기화
		        document.getElementById('subcategory').innerHTML = '<option value="" selected disabled hidden>소분류</option>';
		    }
		});

		function changelist(selectElement) {
		    var otherDiv = document.getElementById('other');
		    otherDiv.style.display = 'none'; // 숨기기
		    var ctg_small = selectElement.value;
		    console.log("소분류명=" + ctg_small);
		    fetch('/admin/small_list/' + ctg_small)
		        .then(response => {
		            if (response.ok) {
		                return response.json(); // JSON 형식으로 응답을 파싱
		            } else {
		                throw new Error('서버 응답이 실패했습니다.');
		            }
		        })
		        .then(data => {
		            var tableBody = document.getElementById('tableBody');
		            tableBody.innerHTML = ''; // 기존 내용 제거
		            
		            // 각 제품에 대한 정보를 그룹화하기 위한 Map 생성
		            var productMap = new Map();

		            // 데이터를 가공하여 Map에 그룹화
		            data.forEach(item => {
		                // 제품이 Map에 존재하지 않으면 새로운 제품 정보를 추가
		                if (!productMap.has(item.p_id)) {
		                    productMap.set(item.p_id, {
		                        p_id: item.p_id,
		                        p_cate: item.p_cate,
		                        p_price: item.p_price,
		                        ctg_small: item.ctg_small,
		                        p_name: item.p_name,
		                        p_stock: item.p_stock,
		                        options: [] // 각 제품에 대한 옵션들을 저장할 배열
		                    });
		                }
		                
		                // 해당 제품의 옵션 정보를 추가
		                productMap.get(item.p_id).options.push({
		                    name: item.o_name,
		                    amount: item.o_amount
		                });
		            });

		            // Map에 저장된 데이터를 이용하여 테이블에 행 추가
		            productMap.forEach(product => {
		                var row = document.createElement('tr');
		                
		                // 제품 ID 셀 추가
		                var cell1 = document.createElement('td');
		                cell1.textContent = product.p_id;
		                row.appendChild(cell1);
		                
		                // 제품 이름 셀 추가
		                var cell2 = document.createElement('td');
		                cell2.classList.add('product_name');
		                cell2.textContent = product.p_name;
		                row.appendChild(cell2);
		                
		                // 제품 재고 셀 추가
		                var cell3 = document.createElement('td');
		                cell3.textContent = product.p_stock;
		                row.appendChild(cell3);
		                
		                // 제품 가격 셀 추가
		                var cell4 = document.createElement('td');
		                cell4.textContent = product.p_price.toLocaleString(); // 숫자를 패턴에 맞게 변환
		                row.appendChild(cell4);
		                
		                // 옵션 선택 셀 추가
		                var cell5 = document.createElement('td');
		                cell5.classList.add('option_name');
		                cell5.classList.add("cell5");
		                var selectElement = document.createElement('select');
		                selectElement.classList.add("select");
		                product.options.forEach(option => {
		                    var optionElement = document.createElement('option');
		                    var optionText = option.name + ' [' + option.amount + ']'; // 옵션 이름과 수량 결합
		                    optionElement.textContent = optionText;
		                    selectElement.appendChild(optionElement);
		                });
		                cell5.appendChild(selectElement);
		                row.appendChild(cell5);
		                
		                tableBody.appendChild(row);
		            });
		        })
		        .catch(error => {
		            console.error('Error:', error);
		        });
		}

		function list(page) {
		    var urlS = "curPage=" + page;
		    var searchKeyword = document.getElementById("search").value;
		    console.log(searchKeyword);
		    if (searchKeyword) {
		        urlS += "&searchKeyword=" + encodeURIComponent(searchKeyword); // 검색어를 URL 인코딩
		    }
		    location.href = "/admin/list_product?" + urlS;
		}

		document.getElementById("keyword").addEventListener("click", function() {
		    list(1); // 페이지를 1로 설정하여 검색 실행
		});

	    </script>
</body>
</html>