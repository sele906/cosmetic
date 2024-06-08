<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.row #top {
	color: red;
	height: 20px; 
	/* min-width: 620px; */
}
.main_menu_bg .nave_menu {
	margin: 0;
}
.main_menu_bg .navbar-default{
	margin: 10px;
}
.menu-scroll .main_menu_bg .nave_menu{
	margin: 0;
}
.menu-scroll #recent, .menu-scroll #ctg_btn {
	padding: 5px 15px 20px 15px;
}
.navbar-brand-logo {
	/* position: absolute;
	bottom: 1px;
	left: 1px; */
	
	position: fixed;
	left: 1px;
	top: 30px;
}

/* 최근 본 목록박스 토글 */
#recent_box {
	display: none;
}

#recent_box .show {
	display: flex;
}

/* 목록박스 레이아웃 */
#recent_content {
	position: fixed;
	
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 50px 1fr;
	
	border: 1px solid #ccc;
	width: 600px; 
	height: 310px;
	background-color: #fff;
	right: 5%;
	z-index: 1000;
}

/* 전체 삭제 */
#delete_all {
	grid-column: 1 / 4;
	grid-row: 1 / 2;
	display: flex;
	justify-content: flex-end;
	border-bottom: 1px solid #ccc;
	padding: 10px 5px 5px 0;
	margin: 0 20px ;
}
#delete_all button {
	margin: 2px;
	font-size: 0.8em;
	background-color: #fff;
	border: 1px solid  #656565;
	color:  #656565;
	padding: 3px 7px;
	font-weight: bold;
}
#delete_all button:active {
	background-color: #656565;
	color: white;
}

/* 최근 본 상품 레이아웃 */
.dropdown-menu_recent {
	height: 260px;

	grid-column: 1 / 4;
	grid-row: 2/3;
	
	display: flex;
	flex-direction: row;
	
	align-items: center;
	justify-content: flex-start;
	
	overflow-x: scroll; 
	overflow-y: hidden;
	scroll-margin-inline-start: 20px;
}

@media ( min-width : 768px) {

}
</style>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
	$('.dropdown-toggle1').click(function() { //최근 본 상품 클릭 시
		$('#recent_box').toggleClass('show'); //recent box 토글
		R_list(); //리스트 불러오기
	});
	
	$("#recent_content").mouseleave(function() {
        $('#recent_box').removeClass('show');
	});
});

function cookie_delete(id) {
	$.ajax({
        url: '/product/cookie_delete?p_id=' + id, 
        method: 'GET',
        success: function(data) {
            if (data == "success") {
            	R_list();
            }
        },
    });
}

function cookie_all_delete() {
	$.ajax({
        url: '/product/cookie_all_delete', 
        success: function(data) {
            if (data == "success") {
            	R_list();
            }
        },
    });
}

//최근 본 상품목록 조회
function R_list() {
	//최근 본 상품 목록
    var dropdownMenu = $('.dropdown-toggle1').closest('.dropdown1').find('.dropdown-menu_recent');
	
    $.ajax({
        url: '/product/recent_cookie', // 최근 본 상품을 조회하는 엔드포인트
        method: 'GET',
        success: function(data) {
            var htmlContent = '';
         
            if (data !== undefined && data !== null && data.length > 0) { //데이터가 있다면
            	data.forEach(function(product) {
            		
            		//최근 본 상품 아이템 css
            		htmlContent += '<div class="recent_wrap" ' +
                	'style="display: flex; ' + 
                	'flex-direction: column; ' + 
                	'position:relative; ' + 
                	'width: 200px; ' + 
                	'height: 210px; ' + 
                	'padding: 0 10px; ' + 
                	'margin: 20px 0; ' + 
                	'border-right: 1px solid #ccc; ' + 
                	'align-items: center; ' + 
                	'justify-content: center; ' + 
                	'font-size: 0.8em;"> ';
                	
                	//상품 이미지
                	htmlContent += '<div style="width: 140px; ' +  
                	'height: 140px; margin: 0 10px 10px 10px;"> ' + 
                	'<img src="' + product.file_name + '" style="width: 100%; height: 100%;">' + 
                	'</div>';
                	
                	//상품 이름
                	htmlContent += '<div style="width: 155px; height: 40px; ' + 
                	'text-align: center; word-break: normal; overflow:hidden;">' + 
                	'<a href="/product/detail_before?p_id=' + product.p_id + '">' +
                	product.p_name + 
                	'</a></div>';
                	
                	//상품 가격
                	htmlContent += '<div style="padding: 0 5px; font-weight: bold">' + product.p_price + '</div>';
                	
                	//삭제버튼
                	htmlContent += '<button type="button" ' + 
                	'id="delete' + product.p_id + '" ' +  
                	'onclick="cookie_delete(' + product.p_id + ')" ' + 
                	'style="position:absolute; ' + 
                	'border-radius: 50%; ' + 
                	'border: 3px solid #fff; ' + 
                	'background-color: transparent; ' + 
                	'color: white; ' + 
                	'top:10px; right: 30px;"> ' +
                	'<i class="fa fa-remove"></i> ' +
                	'</button>';
                	
                	htmlContent += '</div>';
                });
                
            } else { //데이터가 없다면
            	htmlContent += '<div style="width: 100%; text-align: center;">최근 본 상품이 없습니다.</div>';
            }
            
            dropdownMenu.html(htmlContent); // 변환된 HTML을 dropdown-menu_recent에 삽입
        },
    });
}

</script>

<header id="main_menu" class="header navbar-fixed-top">
	

	<div class="main_menu_bg">
		<div class="container">
			<br>
			<div class="row">
				<div id="top">
					<c:choose>
						<c:when test="${sessionScope.userid != null}">
						<c:if test="${sessionScope.userid =='admin'}">
						<a href="/admin/order_list" style="float: right; font-size: small; color: gray;">|&nbsp;관리자 화면
								&nbsp;</a>
						</c:if>
							<!-- <a href="#" style="float: right; font-size: small; color: gray;">&nbsp;고객센터
								&nbsp;</a> -->
							<a href="/order/orderlist.do" style="float: right; font-size: small; color: gray;">&nbsp;주문배송&nbsp;
								</a>
							<a onclick="location.href='/cart/list?userid=${sessionScope.userid}'" style="float: right; font-size: small; color: gray; cursor: pointer;">&nbsp;장바구니
								|&nbsp;</a>
							<a href="/mypage/" style="float: right; font-size: small; color: gray;">&nbsp;마이페이지
								|&nbsp;</a>
							<a href="/member/logout"
								style="float: right; font-size: small; color: gray;">&nbsp;로그아웃
								|&nbsp;</a>
							<!--여기가 첫번째  -->
							<span style="float: right; font-size: small; color: black;">${sessionScope.userid}님
								환영합니다&nbsp;</span>
						</c:when>
						<c:otherwise>
							<!-- <a href="#" style="float: right; font-size: small; color: gray;">&nbsp;고객센터&nbsp;</a> -->
							<a href="/member/page_login" style="float: right; font-size: small; color: gray;">&nbsp;주문배송
								</a>
							<a href="/member/page_login" style="float: right; font-size: small; color: gray;">&nbsp;장바구니
								|&nbsp;</a>
							<a href="/member/page_join"
								style="float: right; font-size: small; color: gray;">&nbsp;회원가입
								|&nbsp;</a>
							<a href="/member/page_login"
								style="float: right; font-size: small; color: gray;">&nbsp;로그인
								|&nbsp;</a>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="nave_menu">
					<nav class="navbar navbar-default" id="navmenu">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1"
									aria-expanded="false" id="small_btn">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand-logo" href="/"> <img
									src="/resources/assets/images/logo_eden.png"
									style="max-width: 150px; max-height: 150px;" />
								</a>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->



							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right" id="menu1">
        <li><a href="#" id="ctg_btn">카테고리</a></li>
<!--         <li><a href="aboutus.html" id="aboutus">about us</a></li>
        <li class="dropdown" id="services">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">services</a>
            <ul class="dropdown-menu">
                <li><a href="/product/detail">service page</a></li>
                <li><a href="service1.html">service page two</a></li>
            </ul>
        </li>
        <li class="dropdown" id="works">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true">works</a>
            <ul class="dropdown-menu">
                <li><a href="work.html">work page</a></li>
                <li><a href="work1.html">work page Two</a></li>
            </ul>
        </li> -->
        <c:choose>
            <c:when test="${sessionScope.userid != null}">
                <li class="dropdown1" id="recent_list">
                
                    <a href="#" class="dropdown-toggle1" data-toggle="dropdown1" role="button" aria-haspopup="true" id="recent">최근 본 상품</a>
                    
                    <div id="recent_box"> 
                    <div id="recent_content">
                    	
                    	<div id="delete_all">
                    		<button type="button" onclick="cookie_all_delete()">전체 삭제</button>
                    	</div>
                    
	                    <ul class="dropdown-menu_recent"></ul>
                    </div>
                    </div>
                </li>
                
            </c:when>
            <c:otherwise>
                <li class="dropdown" id="recent_btn">
                    <a href="#" class="dropdown-toggle" style="display: none;" data-toggle="dropdown" role="button" aria-haspopup="true">최근 본 상품</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>


						</div>
					</nav>
				</div>
			</div>
			<%@ include file="category.jsp"%>
		</div>

	</div>

</header>