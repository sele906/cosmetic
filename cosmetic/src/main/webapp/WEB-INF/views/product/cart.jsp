<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,500;1,500&display=swap" rel="stylesheet">
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
<link rel="stylesheet" href="/resources/assets/fonts/" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script>
/*상품 한개 삭제*/
function zzim_del(c_id) {
    var confirmDelete = window.confirm("해당 상품을 삭제 하시겠습니까?");
    if (confirmDelete) {
        location.href = "/cart/delete/" + c_id;
    } else {
        console.log("삭제가 취소되었습니다.");
    }
}

/*전체 삭제*/
$(function() {
	   $("#chkAll").click(function() {
	      if ($("#chkAll").prop("checked")) {
	         $("input[name=num]").prop("checked",true);
	      } else {
	         $("input[name=num]").prop("checked",false);
	      }
	   });
	   
	   $("#btnDeleteAll").click(function() {
	      let arr = $("input[name=num]"); //체크박스 배열
	      let cnt = 0; //체크된 태그 카운트
	      for(i=0; i<arr.length; i++) {
	         if (arr[i].checked == true) cnt++;
	      }
	      if(cnt == 0) {
	          alert("삭제할 상품을 선택해주세요");
	          return;
	      }
	      if(confirm("전체 상품을 삭제하시겠습니까?")){
	          location.href = "/cart/deleteAll";
	      }
	   });
	   
	   
	 
	   $(function() {
		    $("#btnDelete").click(function() {
		        let selectedItems = [];
		        $("input[name=num]:checked").each(function() {
		            selectedItems.push($(this).val());
		        });

		        if (selectedItems.length === 0) {
		            alert("삭제할 상품을 선택해주세요");
		            return;
		        }
		        console.log(selectedItems);

		        if (confirm("선택한 상품을 삭제하시겠습니까?")) {
		            $.ajax({
		                url: "/cart/select_delete",
		                type: "POST",
		                data: { nums: selectedItems }, // 여기서 c_id 배열을 보냅니다.
		                success: function(response) {
		                    console.log(response);
		                    location.reload(); // 성공 시 페이지 새로고침
		                },
		                error: function(xhr, status, error) {
		                    alert("오류가 발생했습니다. 다시 시도해주세요.");
		                }
		            });
		        }
		    });
		});


	});
</script>
<style>
.montserrat-<uniquifier> {
  font-family: "Montserrat", sans-serif;
  font-optical-sizing: auto;
  font-weight: 500;
  font-style: normal;
}

body {
	margin: 0;
	 
}

* {
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

.cart {
	width: 900px;
	margin: auto;
	padding: 30px;
}

.cart ul {
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :nth-child(3) {
	color: limegreen;
}

table {
	border-top: solid 0.5px lightgrey;
	border-collapse: collapse;
	border-bottom: solid 0.5px lightgrey;
	width: 100%;
	font-size: 14px;
}

thead {
	text-align: center;
	font-weight: bold;
}

td {
	font-weight:bold;
	text-align: center;
	padding: 15px 5px;
	border-bottom: 1px solid lightgrey;
}
.top{

}

.cart__list__option {
	vertical-align: top;
	padding: 20px;
}

.cart__list__option p {
	margin-bottom: 25px;
	position: relative;
}

.cart__list__option p::after {
	content: "";
	width: 90%;
	height: 1px;
	background-color: lightgrey;
	left: 0px;
	top: 25px;
	position: absolute;
}

.cart__list__optionbtn {
	font-size: 10px;
	padding: 7px; 
    border:none; 
    border-radius:10px; 
    min-height:30px; 
    min-width: 120px;
    border: 1px solid #9bce26;
    color: #9bce26;
    background: #fff;
}

.cart__list__optionbtn1 {
    font-size: 10px;
    padding: 7px; 
    border-radius: 10px; 
    min-height: 30px; 
    min-width: 120px;
    border: 1px solid #aaa;
    color: #666;
    background: #fff;
    display: inline-block;
    vertical-align: middle;
}

.cart__list__detail :nth-child(4), 
.cart__list__detail :nth-child(6) {
	border-left: -2px solid whitesmoke;
	text-align: center;
}
.cart__mainbtns {
	width: 420px;
	height: 130px;
	padding-top: 40px;
	display: block;
	margin: auto;
}

.cart__bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}

.cart__bigorderbtn.left {
	background-color: white;
	border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
	background-color: #9bce26;;
	color: white;
	border: none;
}

.icon_flag {
    display: inline-block;
    width: 40px;
    height: 18px;
    border-radius: 9px;
    line-height: 17px !important;
    color: #fff !important;
    font-size: 12px !important;
    text-align: center;
    vertical-align: middle;
    text-decoration: none !important;
    margin: 0 !important;
    background-color: #f65c60;
}

.prd_delivery .ex{
    display: block;
    color: #666;
    font-size: 12px;
    font-weight: 400;
}

h5 {
    font-size: 1.125rem;
    text-align: left;
}

p {
    line-height: 1.375rem;
    margin-bottom: 2px;
    
}
select {
    padding: 7px 8px; /* 내부 여백 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 4px; /* 테두리 둥글게 만들기 */
    background-color: #f8f8f8; /* 배경색 */
    font-size: 14px; /* 폰트 크기 */
    appearance: none; /* 기본 UI 제거 */
    text-align: center;
}
.option{
	background-color: white; /* 배경색 */
	border: none;
	

}

/* 선택된 항목 스타일 */
select:focus {
    outline: none; /* 포커스 효과 제거 */
    border-color: #9bce26; /* 포커스시 테두리 색상 변경 */
    box-shadow: 0 0 5px #9bce26; /* 포커스시 그림자 효과 */
}
.total_price_info {
    margin: 60px 0 0;
    border-top: 2px solid #9bce26;
    border-bottom: 1px solid #e6e6e6;
}
.total_price_info .detail_price {
    position: relative;
    overflow: hidden;
    width: 100%;
    height: 110px;
    font-weight: 700;
}
.p1{
  margin-top:20px;
  margin-right:15px;
  margin-bottom:10px;
  margin-left:15px;
  height: 50px;
}

}
.tx_sign2 {
    display: inline-block;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
    overflow: hidden;
}
.sum_price {
    height: 80px;
    padding: 30px 30px 0;
    text-align: right;
    background: #f6f6f6;
    border-top: 2px solid #d6d6d6;
    font-size: 22px;
    font-weight: 700;
    position: relative;
}
.sum_place{
	font-weight: 500;
	border: solid;
	border-left: none;
	border-right: none;
	background-color: #f6f6f6;
	padding: 0px 20px 0;
	border-top-color: #d3d3d3;
}
.tx_sign2 {
    display: contents;
    width: 50px; /* 너비 조정 */
    height: 50px; /* 높이 조정 */
    background-size: cover; /* 배경 이미지 크기 조정 */
    text-indent: -9999px;
    overflow: hidden;
   /* 위아래 패딩 추가 */
}
.title_box h1 {
    float: left;
    padding: 37px 0 0;
    margin-right: 20px; /* 변경된 부분 */
    font-size: 40px;
    color: #000;
    line-height: 40px;
}

.li1, .li2, .li3 {
    float: right;
    height: 120px;
    padding: 0;
    line-height: 120px;
    text-align: center;
    font-size: 24px;
    color: #8b8176;
    white-space: nowrap;
    margin-right: 20px; /* 변경된 부분 */
}

.li1 {
    margin-left: 1px; /* .li1에 대해서만 왼쪽 여백을 설정합니다. */
}

.li3 {
    float: right;
    margin-right: 20px; /* .li3에 대해서만 오른쪽 여백을 설정합니다. */
    margin-left: 20px; /* .li3에 대해서만 왼쪽 여백을 설정합니다. */
}
.title_box{
    overflow: hidden;
    height: 140px;
    border-radius: 5px;
    z-index: 0;
    background-color:whitesmoke;
}
 tbody td.no_data {
    height: 295px;
    padding: 130px 0 0;
    border-right: 0;
    color: #888;
    font-size: 16px;
    background: url(https://static.oliveyoung.co.kr/pc-static-root/image/comm/ico_nodata104x104.png) 50% 80px no-repeat;
}


</style>
</head>
<body>
	 <%@ include file="../include/menu/menu.jsp"%>
	 
	<section class="service sections margin-top-120">
	<section class="cart">
	<div>
	<div class="title_box">
				
			<h1>&nbsp;장바구니 
			<span class="tx_num">${map.count}</span>
				</h1>
	
				<ul class="step_list">
					<li class="li1" style="font-size: 24px;">3 결제완료 </li><!-- 현재단계 li에 클래스 on과 <span class="hide">현재단계</span> 넣어주세요 -->
					<li class="li2" style="font-size: 24px;">2 주문/결제 ></li>
					<li class="li3"style="font-size: 24px;">1 장바구니 ></li>
				</ul>
			
			</div>
			</div>
			
		<!-- 주문화면으로 보내기 -->
		<form name="form1">	
			
		<c:choose>
		<c:when test="${map.count == 0}">
				<table class="cart__list">
					<tr>
						<td class="top" style="background-color:#fafafa; "><input type="checkbox"></td>
						<td style="background-color:#fafafa; text-align: center; " colspan="2">상품정보</td>
						<td style="background-color:#fafafa;text-align: center; ">판매가</td>
						<td style="background-color:#fafafa;text-align: center; ">수량</td>
						<td style="background-color:#fafafa;text-align: center; ">배송정보</td>
						<td style="background-color:#fafafa;text-align: center; ">선택</td>
					</tr>
					<tr><td colspan="7" class="no_data" style="text-align: center;">장바구니에 저장된 상품이 없습니다.</td></tr>
					</table>
				</c:when>
				<c:otherwise>
		<table class="cart__list">
					<tr>
						<td style="background-color:#fafafa; "><input type="checkbox" id="chkAll" name="num"></td>
						<td style="background-color:#fafafa; text-align: center;" colspan="2">상품정보</td>
						<td style="background-color:#fafafa; text-align: center;">판매가</td>
						<td style="background-color:#fafafa; text-align: center;">수량</td>
						<td style="background-color:#fafafa; text-align: center;">배송정보</td>
						<td style="background-color:#fafafa; text-align: center;">선택</td>
					</tr>
			
					
				<c:forEach var="row" items="${map.list}">
				<tbody>
					<tr class="cart__list__detail">
					
						<td class="get_p_id" style="display: none;" data-p_id="${row.p_id}"><input type="hidden" name="p_id"></td>
						<td>
						<input  type="checkbox" name="num" value="${row.c_id}"  >
						<!-- 주문테이블로 보낼 p_id -->
						<input type="hidden" name="p_order_id" value="${row.p_id}">
						</td>
						<td><img style="width: 85px; height: 85px;"src="${fn:replace(row.file_name, 'src/main/webapp', '')}"></td>
						<td style="font-weight: normal; text-align: left;" > <p style="cursor: pointer;" onclick="window.location.href='/product/detail_before?p_id=${row.p_id}'">${row.p_name}</p>
						
						<input type="hidden" name="option_txt" value="${row.o_name}"> <!-- 주문 테이블로 보낼 옵션 -->
						
						<c:choose>
						<c:when test="${row.o_name eq '없음'}">
						<select style="display: none;" name="o_name" class="o_name_btn">
          					  <option value="">옵션 변경</option>
            <!-- 여기에 옵션 목록 추가 -->
       					 </select>
						</c:when>
						
						<c:otherwise>
    					<form id="updateForm${row.c_id}" method="post" action="/cart/o_name_update">
    					<span>옵션| ${row.o_name}</span>
        				<select name="o_name" class="o_name_btn" style="height: 32px; width:99px; font-size: 13px; ">
          					  <option value="">옵션 변경</option>
            <!-- 여기에 옵션 목록 추가 -->
       					 </select>
       					 
       					  <input type="hidden" class="previous_option" value="${row.o_name}"> <!-- 이전 옵션을 hidden input으로 추가 -->
       				 	<input type="hidden" name="c_id" value="${row.c_id}">
    					</form>
						</c:otherwise>
						</c:choose>
						<!-- <span class="icon_flag sale">세일</span> -->
						</td>
						<td style="text-align: center; font-weight:bolder; border-left:2px solid whitesmoke; "><span><fmt:formatNumber type="number" value="${row.p_price}" pattern="#,###"></fmt:formatNumber>원</span><input type="hidden" name="p_o_price" value="${row.p_price}"></td>
						<br>
						<td style="border-left: 2px solid whitesmoke; text-align: center;">
   								 <input type="hidden" class="get_c_id" data-c_id="${row.c_id}">
   										 <select class="AmountSelect">
									        <option selected>${row.amount}</option>
									        <option value="1">1</option>
									        <option value="2">2</option>
									        <option value="3">3</option>
									        <option value="4">4</option>
									        <option value="5">5</option>
									        <option value="6">6</option>
									        <option value="7">7</option>
									        <option value="8">8</option>
									        <option value="9">9</option>
									        <option value="10">10</option>
									    </select>
									    <input class="amount-hidden" type="hidden" name="amount"> <!-- 주문 테이블로 보낼 amount -->
									    <input type="hidden" name="cart_id" value="${row.c_id}"> <!-- 주문 테이블로 보낼 cart_id -->
									</td>

					
						<!--배송정보-->
						<td style="text-align: center; font-weight:bolder; border-left:2px solid whitesmoke;">
						<p class="prd_delivery">
						<strong id="deliStrongText">${map.fee} <br>
						<span class="ex">도서·산간 제외</span></strong>
						</p> 
						</td>
						


						<!--선택-->
						<td align="center" style="border-left: 2px solid whitesmoke;">
							<form name="form2" id="form2"></form>
    						<input type="button" value="바로구매" class="cart__list__optionbtn1 purchase" style="margin-bottom: 5px;"><br>
    						<button type="button" style="width: 56px" class="cart__list__optionbtn1" style="margin-bottom: 5px;" onclick="zzim_del('${row.c_id}')">✖️삭제</button><br>
						</td>
						
					</tr>
				</tbody>
				</c:forEach>
				<tfoot>

					<tr>
						<td colspan="3">
							<button id="btnDelete" class="cart__list__optionbtn1">선택상품 삭제</button>
							<button id="btnDeleteAll" class="cart__list__optionbtn1" >전체삭제</button></td>
					</tr>
					
					
				</tfoot>
		</table>
		
		<br>
		<br>
		
	<div style="border-top: 2px solid #9bce26; display: flex; justify-content: space-between; border-bottom: 2px solid #d6d6d6; padding: 30px 0; border-right: 2px solid whitesmoke;border-left: 2px solid whitesmoke; ">
    <div style="width: 50%; text-align: center;">
        <p class="p1" style="margin: 0; color: #666; font-weight: bold; font-size: 20px;">
    총 판매가 <br><span style="color: black;"><fmt:formatNumber type="number" value="${map.sumMoney}" pattern="#,###"></fmt:formatNumber></span>원
    <input type="hidden" id="price" name="price" value="${map.sumMoney}"> <!-- 주문 테이블로 보낼 상품금액 -->
</p>

    </div>
   <div style="text-align: center;">
    <div style="display: inline-block;">
        <p style="padding: 15px 0; font-size: 30px; margin: 0;" class="tx_sign2">➕</p>
    </div>
</div>




    <div style="width: 50%; text-align: center; ">
        <p class="p1" style="margin: 0; color: #666; font-weight: bold; font-size: 20px;">
            배송비 <br><span style="color: black;">${map.fee}</span>원
            <input type="hidden" id="delfee" name="delfee" value="${map.fee}"> <!-- 주문 테이블로 보낼 배송비 -->
        </p>
    </div>
</div>


<div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid whitesmoke; padding: 30px 10px; background-color: #F5F5F5;">
    <div style="color: gray; font-size: 15px;">
       &nbsp;&nbsp;❗ 배송비는 결제금액에 따라 변경될 수 있습니다.
    </div>
    <div>
    총 결제예상금액&nbsp; <span style="color: red; font-size: 24px; font-weight: bold;"><fmt:formatNumber type="number" value="${map.sum}" pattern="#,###"></fmt:formatNumber>원</span>
    <input type="hidden" id="totalPrice" name="totalPrice" value="${map.sum}"> <!-- 주문 테이블로 보낼 총 금액 -->
</div>

</div>
</c:otherwise>	
		</c:choose>

		</form>
	
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left" id="menu" onclick="location.href = '/'">쇼핑 계속하기</button>
			<button class="cart__bigorderbtn right" id="orderbtn">주문하기</button>
		</div>

			<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li style="color: #656565;">오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기바랍니다.</li>
			</ul>
		</div>
	</section>
	</section>
<script>
$(document).ready(function() {
    // select 요소 클릭 시 이벤트
    $('.o_name_btn').click(function() {
        // 해당 select 요소의 부모 요소에서 c_id 값을 가져옵니다.
        var p_id = $(this).closest('tr').find('.get_p_id').data('p_id');
        
        // AJAX 요청을 통해 서버에 해당 제품의 옵션 목록을 요청합니다.
        $.ajax({
            url: '/product/o_name/' + p_id, // 서버에서 옵션 목록을 가져올 경로
            type: 'GET',
            success: function(data) {
                // 서버에서 받은 옵션 목록을 select 요소에 추가합니다.
                var select = $('.o_name_btn');
                select.empty(); // 기존 옵션 제거
                select.append('<option value="">옵션 변경</option>'); // 기본 옵션 추가
                $.each(data, function(index, option) {
                    // 옵션의 amount가 0이 아닌 경우에만 추가합니다.
                    if (option.amount !== 0) {
                        select.append('<option value="' + option.o_name + '">' + option.o_name + '</option>'); // 받은 옵션 추가
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error('AJAX 오류: ' + status + ', ' + error); // 오류 발생 시 콘솔에 표시
            }
        });
    });

    // select 요소 변경 시 이벤트
    $(document).on('change', '.o_name_btn', function() {
        var o_name = $(this).val();
        console.log(o_name);
        var c_id = $(this).closest('form').find('input[name="c_id"]').val();
        console.log(c_id);
        var previousOption = $(this).closest('tr').find('.previous_option').val();
        console.log(previousOption);

        // 이전 옵션과 새로운 옵션이 같지 않은 경우에만 서버로 전송
        if (o_name !== previousOption) {
            $.ajax({
                url: '/cart/o_name_update', // 새로운 옵션을 업데이트할 경로
                type: 'POST',
                data: JSON.stringify({ 'o_name': o_name, 'c_id': c_id }),
                contentType: 'application/json',
                success: function(response) {
                	if (response.status == 'success') {
                		alert('옵션이 변경 되었습니다.');
                        location.reload();
                	}
                },
                error: function(xhr, status, error) {
                    console.error('AJAX 오류: ' + status + ', ' + error);
                }
            });
        } else {
            alert('변경된 내용이 없습니다.');
        }
    });

});

$(document).ready(function() {
    // select 요소 변경 시 이벤트
    $('.AmountSelect').change(function() {
        // 선택된 수량을 가져옵니다.
        var selectedQuantity = $(this).val();
        console.log(selectedQuantity);
        // 해당 select 요소의 부모 요소에서 상품 ID 값을 가져옵니다.
        var c_id = $(this).closest('td').find('.get_c_id').data('c_id');
        console.log(c_id);
        // AJAX 요청을 통해 서버에 해당 제품의 수량 정보를 업데이트합니다.
        $.ajax({
            url: '/cart/amount_update', // 서버에서 수량 정보를 업데이트할 경로
            type: 'POST',
            data: {
                amount: selectedQuantity, // 선택된 수량 값
                c_id: c_id // 해당 제품의 ID 값
            },
            success: function(response) {
                console.log('수량 업데이트 성공');
                alert('수량이 변경되었습니다.');
                location.reload();
                // 여기에 성공 시 수행할 작업 추가
            },
            error: function(xhr, status, error) {
                console.error('AJAX 오류: ' + status + ', ' + error); // 오류 발생 시 콘솔에 표시
            }
        });
    });
    
  //주문 버튼 클릭 시
   $("#orderbtn").click(function() {
	   
	   //수량을 input에 담기
	   $(".AmountSelect").each(function () {
           var selectedValue = $(this).val();
           console.log(selectedValue);
           $(this).siblings(".amount-hidden").val(selectedValue);
       });
	   
	  var form = document.forms["form1"];
	   form.method = "post";
	   form.action = "/order/orderform.do";
	   form.submit();
   });
   
// 바로구매 클릭 시
   $(".cart__list__optionbtn1.purchase").click(function() {
	   var formElement = document.getElementById("form2");
	   var $row = $(this).closest("tr");
       
       // 수량을 input에 담기
       $row.find(".AmountSelect").each(function () {
           var selectedValue = $(this).val();
           $(this).siblings(".amount-hidden").val(selectedValue);
       });

       // cart 단품 구매정보 가져오기
       var cart_id = $row.find("input[name='cart_id']").val();
       var p_order_id = $row.find("input[name='p_order_id']").val();
       var amount = $row.find("input[name='amount']").val();
       var p_o_price = parseInt($row.find("input[name='p_o_price']").val());
       var option = $row.find("input[name = 'option_txt']").val().trim();
       if (/\d/.test(option)) { // 숫자가 있는지 확인하는 정규표현식
    	    option = "";
    	} 

       var delfee = p_o_price >= 30000 ? 0 : 2500;
       var totalPrice = p_o_price + delfee;
       
       var formData = new FormData();
       
        // 새로운 데이터 추가
       formData.append('cart_id', cart_id);
       formData.append('p_order_id', p_order_id);
       formData.append('amount', amount);
       formData.append('p_o_price', p_o_price); 
       formData.append('delfee', delfee);
       formData.append('totalPrice', totalPrice); 
    
       
       document.getElementById("form2").innerHTML = '';
       
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
       
       
   });
});
</script>
</body>
</html>