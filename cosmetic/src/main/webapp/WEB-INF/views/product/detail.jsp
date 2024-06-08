<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>디테일 화면</title>
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
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>


<style>
body {
	margin: 0;
}

* {
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

.prd_detail_box {
	padding: 35px 0 0;
}

.prd_detail_box .left_area {
	float: left;
	width: 550px;
	margin-top: 5px;
}

.prd_detail_box .right_area {
	float: right;
	width: 425px;
}

.p_info {
	background: #fff;
}

.prd_detail_box .right_area .p_price {
	padding: 0px 0px 30px;
}

.p_deli {
	padding: 0px 0px 15px;
}

.p_deli_tit {
	position: relative;
	font-size: 16px;
	line-height: 30px;
	margin-bottom: 5px;
	color: #000;
	font-weight: 700;
}

.p_deli_s_tit {
	position: relative;
	width: 100px; /* 수정된 부분 */
	display: inline-block; /* 수정된 부분 */
	margin-right: 10px; /* 수정된 부분 */
	font-weight: 700;
}

.p_price_color {
	font-size: 28px;
	color: #e02020;
	display: flex;
	align-items: center;
	font-weight: 700;
	border-bottom: 1px solid e5e5e5;
}

.p_name {
	margin-top: 10px;
	font-size: 26px;
	line-height: 34px;
	color: #000;
}

.p_path {
	font-size: 16px;
	line-height: 24px;
	color: #000;
}

.prd_detail_box .right_area .p_total_price {
	overflow: hidden;
	height: 60px;
	margin: 60px 0 0;
	border-bottom: 2px solid #f27370;
	color: #e02020;
	font-weight: 700;
	padding: 15px 0 20px;
}

.prd_detail_box .right_area .p_total_price .total_tit {
	float: left;
	font-size: 18px;
}

.prd_detail_box .right_area .p_total_price .total_won {
	float: right;
}

.prd_detail_box .right_area .p_btn {
	display: flex;
	justify-content: space-between;
	width: 416px; /* 수정된 부분: 버튼 전체 너비 조정 */
	margin-top: 23px; /* 수정된 부분: 버튼과 위쪽 간격 조정 */
	padding: 0; /* 수정된 부분: 외부 여백 제거 */
}

.prd_detail_box .right_area .p_btn button {
	flex-grow: 1;
	margin-left: 10px;
	height: 65px;
	border: 1px solid #ccc;
	font-size: 20px;
	font-weight: 500;
}

.prd_detail_box .right_area .p_dropdown {
	height: 70px;
	line-height: 50px;
	border-color: #ffffff;
	padding: 14px 0 14px 0; /* 좌우 패딩 값 조정 */
	border-top: 1px solid #ccc;
}

.prd_detail_box .right_area .p_dropdown-content {
	display: none;
	position: absolute;
	background-color: #ffffff; /* 드롭다운 배경색 */
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.prd_detail_box .right_area .p_dropdown-content a {
	color: #000;
	position: relative;
	text-decoration: none;
	display: block;
	width: 425px;
	padding: 17px;
	text-align: left;
	box-sizing: border-box;
	border: 1px solid #e5e5e5;
}

.zzim_btn {
	background-color: transparent;
	cursor: pointer;
}

.zzim {
	display: flex;
	width: 80px;
	border: 1px solid #e5e5e5;
	background:
		url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/icon-like-32-line.png)
		50% 50% no-repeat #fff;
}

.zzimon {
	display: flex;
	width: 80px;
	border: 1px solid #e5e5e5;
	background:
		url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/icon-like-32-solid.png)
		50% 50% no-repeat #fff;
}

.prd_detail_box .right_area .p_dropdown-content a:hover {
	background-color: #f9f9f9; /* 마우스 오버 시 배경색 */
}

.prd_detail_box .right_area .p_dropdown:hover .p_dropdown-content {
	display: block; /* 수정된 부분 */
}

.p_dropbtn {
	position: relative;
	width: 100%;
	height: 57px;
	margin: 20px 0 0;
	background: #fff;
}

/* 이미지 슬라이더 스타일 */
#p_img {
	max-width: 510px;
	max-height: 510px;
	min-width: 500px;
	min-height: 500px;
	width: 510px;
	height: 510px;
}

.slider-container {
	position: relative; /* 추가 */
	overflow: hidden;
}

.slider-container img {
	width: 100%;
	height: auto;
	display: none; /* 이미지를 숨깁니다. */
}

.slider-container .slides {
	display: flex;
	transition: transform 0.5s ease;
}

/* .slider-container .slides img {
    width: 100%;
    height: auto;
    
} */
.slider-container .prev, .slider-container .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 2;
	background-color: rgba(255, 255, 255, 0.5);
	padding: 10px;
}

.slider-container .prev {
	left: 0;
}

.slider-container .next {
	right: 40px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    var p_id = '${dto.p_id}';
    // 각 리뷰에 대한 사진 데이터를 가져오기 위한 AJAX 요청
    $.ajax({
        url: '/product/list_p_attach/' + p_id,
        method: 'GET',
        success: function(images) {
            var thumList = '';
            images.forEach(function(image) {
                // 이미지 경로 수정: src/main/webapp 제거
                image = image.replace("src/main/webapp", "");
                console.log('image:' + image);
                thumList += '<img src="' + image + '" alt="Product Image">';
            });
            // 수정된 ID를 사용하여 이미지 추가
            $('#p_img').append(thumList);
            // 이미지를 가져온 후에 이미지 슬라이더를 시작합니다.
            startSlider();
        },
        error: function(xhr, status, error) {
            console.error('이미지를 불러오는 중 오류 발생:', error);
        }
    });

    var slideIndex = 0;

    // 이전 버튼 클릭 시 이벤트 처리
    $('.prev').click(function() {
        plusSlides(-1);
    });

    // 다음 버튼 클릭 시 이벤트 처리
    $('.next').click(function() {
        plusSlides(1);
    });

    // 이미지 슬라이더 시작 함수
    function startSlider() {
        var slides = $(".p_img img");
        slides.hide(); // 모든 이미지를 숨깁니다.
        slides.eq(slideIndex).show(); // 초기 이미지를 표시합니다.
    }

    // 이전 및 다음 이미지로 이동하는 함수
    function plusSlides(n) {
        var slides = $(".p_img img");
        slideIndex += n;
        if (slideIndex < 0) {
            slideIndex = slides.length - 1; // 마지막 이미지로 이동합니다.
        } else if (slideIndex >= slides.length) {
            slideIndex = 0; // 첫 번째 이미지로 이동합니다.
        }
        slides.hide(); // 모든 이미지를 숨깁니다.
        slides.eq(slideIndex).show(); // 다음 이미지를 표시합니다.
    }

    // 이미지 슬라이더 초기화
    startSlider();
});
</script>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<div class='preloader'>
		<div class='loaded'>&nbsp;</div>
	</div>

	<!-- 상단 메뉴 -->
	<%@ include file="../include/menu/menu.jsp"%>

	<section class="service sections margin-top-120">
		<section class="detail_window_side">
			<div class="prd_contents">

				<!-- 상품정보 -->
				<div class="prd_detail_box">
					<input type="hidden" value="${dto.p_id}">

					<!-- 왼쪽에 들어갈 사진
            <div class="left_area">
               <div class="p_img" id="p_img"></div>
            </div> -->

					<!-- 이미지 슬라이더를 표시할 곳 -->
					<div class="left_area">
						<div class="slider-container">
							<div class="slides p_img" id="p_img"></div>
							<!-- 이전 버튼 -->
							<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
							<!-- 다음 버튼 -->
							<a class="next" onclick="plusSlides(1)">&#10095;</a>
						</div>
					</div>

					<!--이미지 슬라이더
            <div class="left_area">
            
               <div class="p_img">
               
               </div>
               <div class="slider__btn">
                      <a href="#" class="prev" role="button" aria-label="왼쪽 이미지">prev</a>
                      <a href="#" class="next" role="button" aria-label="오른쪽 이미지">next</a>
                  </div>
                  <div class="slider__dot"></div>
               </div> -->

					<!-- 오른쪽에 들어갈 정보 -->
					<div class="right_area">
						<div class="p_info" data-product-id="${dto.p_id}">
							<p class="p_path">${dto.ctg_big}> ${dto.ctg_small}</p>
							<!-- ex) 립 > 립스틱 -->
							<p class="p_name">${dto.p_name}</p>
							<!-- 제목 -->
							<div class="p_price">
								<!-- 가격 -->
								<span class="p_price_color"> <strong>가격 
								<fmt:formatNumber type="number" value="${dto.p_price}" pattern="#,###"></fmt:formatNumber>원
								</strong></span>
							</div>

							<!-- 배송 -->
							<div class="p_deli">
								<p class="p_deli_tit">배송정보</p>
								<div class="p_deli_row">
									<!-- 설명란 -->
									<span style="font-size: 14px;" class="p_deli_s_tit">일반배송
										|</span>
									<ul style="list-style: none;">
										<li><span style="font-size: 14px;">2,500원 ( 20,000
												원 이상 무료배송 )</span> <span style="font-size: 14px;">배송 평균 3일
												이내 배송</span></li>
									</ul>
								</div>
							</div>

							<!-- 상품 종류 선택 -->
							<div class="p_dropdown">
								<button class="p_dropbtn">상품을 선택해주세요</button>
								<div class="p_dropdown-content"></div>
							</div>

							<!-- 상품옵션 선택시 보이는 곳 (ajax) -->
							<div id="select_option"></div>

							<!-- 상품 금액 -->
							<div class="p_total_price">
								<span class="total_tit">상품금액 합계</span> <span class="total_won">가격
									<span id="product_price">0</span> 원
								</span>
							</div>

							<!-- 장바구니, 바로구매, 찜 버튼 -->
							<div class="p_btn">
								<button class="btn_Cart" id="btn_Cart" onclick="cart_insert()">장바구니</button>
								<button class="btn_Buy" id="btn_buy">바로구매</button>
								<div style="display: none;">
									<form name="form1" id="form1"></form>
								</div>
								<c:if test="${sessionScope.userid != null}">
									<c:choose>
										<c:when test="${dto.p_like == dto.p_id}">
											<button type="button" class="zzimon zzim_btn"></button>
										</c:when>
										<c:otherwise>
											<button type="button" class="zzim zzim_btn"></button>
										</c:otherwise>
									</c:choose>
								</c:if>
							</div>


						</div>


					</div>
				</div>
			</div>
		</section>
	</section>

	<script>

// 찜 누를때
$(document).on('click', '.zzim_btn', function() {
    var btn_zzim = $(this); // 찜버튼
    console.log(btn_zzim);
    var isLiked = btn_zzim.hasClass('zzimon'); // 현재 좋아요 상태 확인 true면 clear, false면 apply
    console.log(isLiked);
    var product_id = $(this).closest('.p_info').data('product-id'); // 상품 ID 가져오기
    console.log(product_id);
    
    // 좋아요 상태 확인해서
    if (isLiked) {
        // 좋아요 상태를 취소한 경우
        $.ajax({
            type: 'POST',
            url: '/zzim/zzim_clear',
            data: { p_id: product_id }, 
            success: function(response) {
               btn_zzim.removeClass('zzimon').addClass('zzim');
               btn_zzim.find(".zzim").show(); // 좋아요 버튼 표시
               btn_zzim.find(".zzimon").hide(); // 좋아요 취소 버튼 숨김
               
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패: ', status, error);
            }
        });
    } else {
        // 좋아요를 추가한 경우
        $.ajax({
            type: 'POST',
            url: '/zzim/zzim_apply',
            data: { p_id: product_id }, 
            success: function(response) {
               btn_zzim.removeClass('zzim').addClass('zzimon'); 
               btn_zzim.find(".zzim").hide(); // 좋아요 버튼 숨김
               btn_zzim.find(".zzimon").show(); // 좋아요 취소 버튼 표시
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패: ', status, error);
            }
        });
    } 
});  

//바로구매
$(document).ready(function() {
   $(".btn_Buy").click(function() {
      
      var formElement = document.getElementById("form1");
      var amountArray = [];
      var optionArray = [];
      var priceText = $("#product_price").text().trim();
      var price = parseInt(priceText.replace(/,/g, ''));
      var p_id_array = [];
      var delfee = price >= 30000 ? 0 : 2500;
       var totalPrice = price + delfee;
       
       // 선택한 옵션의 정보를 가져와서 배열에 추가
       $(".option_text").each(function() {
          var option = $(this).text().trim();
          console.log(option);
          optionArray.push(option);
       });
       
       $('.quantity-input').each(function() {
          var quantityValue = $(this).val();
          amountArray.push(quantityValue);
          p_id_array.push('${dto.p_id}');
      });
       
       if (amountArray.length === 0) {
          alert('상품을 선택해주세요');
       } else if (amountArray.length != 0) {
          var formData = new FormData();
          
          formData.append('p_o_price', price); 
           formData.append('delfee', delfee);
           formData.append('totalPrice', totalPrice); 
          
          for (i=0; i<amountArray.length; i++) {
             formData.append('p_order_id', p_id_array[i]);
             formData.append('amount', amountArray[i]);
             formData.append('option', optionArray[i]);
          }
             
          formElement.innerHTML = '';
         for (var pair of formData.entries()) {
             var input = document.createElement("input");
             input.setAttribute("type", "hidden");
             input.setAttribute("name", pair[0]);
             input.setAttribute("value", pair[1]);
             formElement.appendChild(input);
         } 
         
         formElement.method = "post";
         formElement.action = "/order/orderform_item.do";
         formElement.submit();    
       }
   });
});

</script>

	<!-- 위의 상품표시와 아래의 상품설명 구분 -->
	<section class="tab_menu_top">
		<section class="detail_window_side">

			<!-- 상품설명, 상품리뷰, Q&A 탭 메뉴 -->
			<div class="ec-base-tab grid3">
				<ul class="menu">

					<!-- 밑 컨텐츠 칸의 id와 일치해야함 -->
					<li class="selected"><a href="#description"
						data-bs-toggle="tab" aria-selected="true">상품 설명</a></li>
					<li><a href="#review" data-bs-toggle="tab">상품 리뷰</a></li>
					<!-- <li><a href="#qna" data-bs-toggle="tab">Q&A</a></li> -->
				</ul>
			</div>

			<!-- 표시될 컨텐츠 -->
			<div class="tab-content" id="myTabContent">

				<div class="tab-pane active" id="description" role="tabpanel">
					<!-- 위의 id와 일치해야함 -->
					<!-- 상품설명 섹션 -->
					<section id="product_infomation"
						class="service sections margin-top-20">
						<div class="head_title text-center">
							<h2>상품설명</h2>
						</div>
						<div class="main_service_area">
							<p>
								${dto.p_detail}
							</p>

						</div>
					</section>
				</div>



				<!-- 상품리뷰 섹션 -->
				<div class="tab-pane" id="review" role="tabpanel">
					<section id="product_infomation"
						class="service sections margin-top-20">
						<!-- 상단 메뉴 -->
						<%@ include file="../product/review.jsp"%>
					</section>
				</div>

				<!-- Q&A 섹션 -->
				<div class="tab-pane" id="qna" role="tabpanel">
					<section id="product_infomation"
						class="service sections margin-top-20">
						<div class="head_title text-center">
							<h2>Q&A</h2>
						</div>
						<div class="main_service_area">
							<p>이곳에 Q&A 내용을 입력하세요.</p>
						</div>
					</section>
				</div>
			</div>

		</section>
	</section>

	<script>


$(document).ready(function() {
    let p_id = '${dto.p_id}';
    loadProductOptions(p_id);
});

function loadProductOptions(p_id) {
    $.ajax({
        type: "GET",
        url: "/product/detail_option/" + p_id,
        success: function(data) {
            var dropdownContent = $(".p_dropdown-content");
            dropdownContent.empty();

            var hasOption = false;
            for (var i = 0; i < data.length; i++) {
                var optionPrice = data[i].p_price;               
                var optionName = data[i].o_name;
                var optionAmount = data[i].o_amount;
                if (optionName) {
                    hasOption = true;
                    var optionText = optionName;
                    if (optionAmount == 0) {
                        optionText += "(품절)";
                        dropdownContent.append("<a href='#' class='disabled' style='color: #808080; pointer-events: none;'>" + optionText + "</a>");
                    } else {
                        dropdownContent.append("<a href='#'>" + optionText + "</a>");
                    }
                }
            }

            if (!hasOption) {
                $(".p_dropdown").hide();
                var selectedOptionText = $(this).text();
                console.log(selectedOptionText);
                
                // 초기 합계금액 설정
                $("#product_price").text(optionPrice);
                
                var row = '<div class="p_select_option">';
                row += '<div class="prd_select_box"> 구매수량';
                row += '<div class="amount_select">'; 
                row += '<button class="quantity-button minus" type="button">-</button>';
                row += '<input class="quantity-input" type="text" value="1">';
                row += '<button class="quantity-button plus" type="button">+</button>';
                row += '</div>';
                row += '<div style="display:none;">';
                row += '<div class="option_text">' + selectedOptionText + '</div>';
                row += '<div class="option_price">' + optionPrice + ' 원</div>';
                row += '</div>';
                row += '</div>';
                $("#select_option").append(row);
            } else {
                $(".p_dropdown").show();
            }

            
            dropdownContent.on("click", "a", function() {
                var selectedOptionText = $(this).text();
                var existingOption = $("#select_option").find(".p_select_option:contains('" + selectedOptionText + "')");
                if (existingOption.length > 0) {
                    var $input = existingOption.find(".quantity-input");
                    var oldValue = parseInt($input.val());
                    var newVal = oldValue + 1;
                    $input.val(newVal);
                } else {
                    var row = '<div class="p_select_option">';
                    row += '<div class="prd_select_box">';
                    row += '<button class="delete-button"></button>';
                    row += '<div class="option_text">' + selectedOptionText;
                    row += '</div>';
                    row += '<div class="option_flex">'
                    row += '<div class="amount_select">'; 
                    row += '<button class="quantity-button minus" type="button">-</button>';
                    row += '<input class="quantity-input" type="text" value="1">';
                    row += '<button class="quantity-button plus" type="button">+</button>';
                    row += '</div>';
                    row += '<div class="option_price">' + optionPrice +' 원';
                    row += '</div>';
                    row += '</div>';                    
                    row += '</div>';
                    row += '</div>';
                    $("#select_option").append(row);
                }
                
                // 이벤트 다시 바인딩
                bindEventHandlers();
                
                 // 가격 업데이트
                updateTotalPrice();
            });
            
            

            // 이벤트 핸들러 바인딩
            bindEventHandlers();
        },
        error: function() {
            alert("상품 옵션을 불러오는 데 실패했습니다.");
        }
    });
}

// 이벤트 핸들러 바인딩 함수
function bindEventHandlers() {
    // 삭제 버튼 클릭 이벤트
    $(".delete-button").off("click").on("click", function() {
        // 삭제되는 상품의 가격 가져오기
        var $deletedOption = $(this).closest(".p_select_option");
        var priceToRemove = parseFloat($deletedOption.find(".prd_select_box").text().match(/(\d+)/)[0]);

        // 현재 총 가격에서 삭제되는 상품의 가격 빼기
        var currentTotalPrice = parseFloat($("#product_price").text().replace(/,/g, ''));
        var quantity = parseInt($deletedOption.find(".quantity-input").val());
        var newTotalPrice = currentTotalPrice - priceToRemove * quantity;
        $("#product_price").text(newTotalPrice.toLocaleString());

        // 삭제되는 상품 옵션 삭제
        $deletedOption.remove();
    });

    // 수량 버튼 클릭 이벤트
    $(".quantity-button").off("click").on("click", function() {
        var $input = $(this).parent().find(".quantity-input");
        var oldValue = parseInt($input.val());
        var newVal = oldValue;
        if ($(this).hasClass("plus")) {
            newVal = oldValue + 1;
        } else if ($(this).hasClass("minus")) {
            newVal = oldValue > 1 ? oldValue - 1 : 1;
        }
        $input.val(newVal);
        
        // 가격 업데이트
        updateTotalPrice();
    });
}

function updateTotalPrice() {
    var totalPrice = 0;
    $("#select_option .p_select_option").each(function() {
        var priceText = $(this).find('.option_price').text();
        var priceMatch = /(\d+) 원/.exec(priceText); // 정규식을 사용하여 가격 정보 찾기
        if (priceMatch) {
            var price = parseFloat(priceMatch[1]); // 찾은 가격 정보 사용
            var quantity = parseInt($(this).find(".quantity-input").val());
            totalPrice += price * quantity;
            console.log(quantity);
            console.log(price);
            console.log(totalPrice);
        }
    });
    $("#product_price").text(totalPrice.toLocaleString());
}
</script>


	<style>
.option_flex {
	display: flex;
	align-items: center;
	margin-bottom: 5px;
}

.prd_select_box {
	align-content: center;
	margin-top: 40px;
	min-height: 60px;
	border: 1px solid #e9e9e9;
	background: #f9f9f9;
	padding: 10px; /* 내부 여백 추가 */
	display: block; /* 블록 레벨 요소로 변경 */
	clear: both; /* 요소들이 옆으로 붙는 것을 방지하기 위해 clear 추가 */
	box-sizing: content-box;
	padding-left: 30px;
}

.delete-button {
	overflow: hidden;
	display: inline-block;
	width: 13px;
	height: 13px;
	margin-left: 7px;
	margin-bottom: 2px;
	background:
		url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_close23x23.png)
		50% 50% no-repeat;
	vertical-align: middle;
	text-indent: -9999px;
	border: none;
	float: right;
}

.p_select_option {
	margin-bottom: -23px;
}

.option_text {
	font-size: 15px;
	font-weight: bold;
	margin-top: 3px;
	margin-bottom: 10px;
}

.select_price {
	margin-left: 170px;
	font-weight: bold;
}

/* 수량버튼 스타일 */
.amount_select {
	display: flex;
	margin-right: 10px;
	align-items: center;
}

.quantity-button {
	width: 30px; /* 버튼의 너비 조정 */
	height: 30px; /* 버튼의 높이 조정 */
	background-color: #f0f0f0; /* 버튼 배경색 */
	border: 1px solid #ccc; /* 버튼 테두리 스타일 */
	color: #555; /* 버튼 텍스트 색상 */
	font-size: 16px; /* 버튼 텍스트 크기 */
	cursor: pointer; /* 커서 모양 변경 */
	outline: none; /* 포커스 효과 제거 */
}

.quantity-input {
	width: 50px; /* 입력란의 너비 조정 */
	height: 30px; /* 입력란의 높이 조정 */
	text-align: center; /* 텍스트 가운데 정렬 */
	border: 1px solid #ccc; /* 입력란 테두리 스타일 */
	outline: none; /* 포커스 효과 제거 */
}

.quantity-button:hover {
	background-color: #e0e0e0; /* 마우스 오버 시 배경색 변경 */
}

.quantity-button.plus {
	border-left: none; /* 오른쪽 버튼의 왼쪽 테두리 제거 */
}

.quantity-button.minus {
	border-right: none; /* 왼쪽 버튼의 오른쪽 테두리 제거 */
}

.tab_menu_top {
	margin-top: 20px;
}

.detail_window_side {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
	min-width: 1016px;
}

.main_service_area {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	text-align: center; /* 수정된 부분: 가운데 정렬을 위해 추가 */
}

.ec-base-tab {
	/* 수정된 부분: margin-top 제거 */
	position: relative;
	text-align: center;
}

.ec-base-tab .menu {
	width: 100%;
	margin: 0 0 20px 0;
	border: 1px solid #cbcdce;
	border-bottom-color: #202020;
	border-left: 0;
	background: #f2f2f2;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.ec-base-tab .menu:after {
	content: "";
	display: block;
	clear: both;
}

.ec-base-tab .menu li {
	width: 100%;
	/* border-left: 1px solid #cbcdce; */
	background: #f2f2f2;
}

.ec-base-tab .menu li a {
	display: block;
	min-width: 187px;
	margin: 0 0 0 -1px;
	padding: 12px 5px 11px;
	border-right: 1px solid #cbcdce;
	color: #707070;
	text-decoration: none;
	outline: 0;
	text-align: center;
	background: #f2f2f2;
}

.ec-base-tab .menu li:first-child a {
	margin-left: 0;
}

.ec-base-tab .menu li.selected a {
	position: relative;
	top: -1px;
	left: -2px;
	margin: 0 0 -1px;
	border: 1px solid #202020;
	border-bottom: 0;
	color: #1d1e1f;
	font-weight: bold;
	background: #fff;
}

.ec-base-tab .menu li.selected:first-child a {
	left: -1px;
}

.ec-base-tab>.right {
	position: absolute;
	top: 8px;
	right: 10px;
	line-height: 24px;
	color: #909090;
}

/* typeLight */
.ec-base-tab.typeLight .menu li.selected a {
	margin: 0 0 -2px;
	border-bottom: 1px solid #fff;
	color: #404040;
	background: #fff;
}

.ec-base-tab[class*="grid"] .menu {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.ec-base-tab[class*="grid"] .menu li {
	float: none;
	display: table-cell;
	vertical-align: middle;
}

.ec-base-tab[class*="grid"] .menu li a {
	display: inline-block;
	width: 100%;
	min-width: 0;
	margin: 0;
	padding: 11px 0;
	border: 0;
}

.ec-base-tab[class*="grid"] .menu li.selected {
	position: relative;
	top: 0;
	right: -1px;
	border: 1px solid #cbcdce;
	border-bottom: 0;
	background: #fff;
}

.ec-base-tab[class*="grid"] .menu li:first-child.selected {
	right: 0;
}

.ec-base-tab[class*="grid"] .menu li.selected a {
	position: static;
	background: none;
}

.ec-base-tab.grid3 .menu li {
	
}
</style>


	<!-- 탭메뉴에 대한 JS -->
	<script>
  document.addEventListener("DOMContentLoaded", function() {
    const tabButtons = document.querySelectorAll('.ec-base-tab.grid3 .menu li');

    tabButtons.forEach(function(button) {
      button.addEventListener("click", function(event) {
        // 기본 이벤트 제거
        event.preventDefault();

        // 탭 버튼 활성화 처리
        tabButtons.forEach(function(btn) {
          btn.classList.remove('selected');
        });
        this.classList.add('selected');

        // 탭 패널 활성화 처리
        const targetPaneId = this.querySelector('a').getAttribute("href").replace('#', '');
        document.querySelectorAll('.tab-pane').forEach(function(pane) {
          pane.classList.remove('active');
        });
        document.getElementById(targetPaneId).classList.add('active');
      });
    });
  });
</script>
	<script>
//장바구니 담기 기능
function cart_insert() {
    // 선택한 상품의 정보를 가져오는 부분
    var productId = parseInt('${dto.p_id}'); // 상품 ID
    var selectedOptions = []; // 선택한 옵션 배열 초기화

    // 선택한 옵션의 정보를 가져와서 배열에 추가
    if ($(".p_select_option").length === 0) {
        // 옵션이 없는 경우 기본 상품 정보를 추가
        var productName = $('#product_name').text(); // 상품명 가져오기
        var quantity = parseInt($('#product_quantity').val()); // 수량 가져오기
        selectedOptions.push({ o_name: productName, amount: quantity });
    } else {
        $(".p_select_option").each(function() {
            var optionText = $(this).find(".option_text").text(); // 옵션 텍스트 가져오기
            var optionName = optionText.trim(); // 옵션명 공백 제거
            console.log('옵션이름=' + optionName);

            var quantity = parseInt($(this).find(".quantity-input").val()); // 수량 가져오기
            console.log('수량=' + quantity);

            selectedOptions.push({ o_name: optionName, amount: quantity });
        });
    }


    // 선택한 상품 정보를 서버로 전송
    $.ajax({
        type: "POST",
        url: "/cart/insert",
        data: JSON.stringify({ p_id: productId, options: selectedOptions }),
        contentType: "application/json",
        success: function(response) {
            alert("장바구니에 상품이 추가되었습니다.");
            window.location.href = '/cart/list';
        },
        error: function(xhr, status, error) {
            alert("장바구니에 상품을 추가하는 데 실패했습니다.");
            console.error(xhr.responseText);
        }
    });
}
</script>



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

	<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>

	<script src="/resources/assets/js/jquery.easing.1.3.js"></script>

	<script src="/resources/assets/js/plugins.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
</html>