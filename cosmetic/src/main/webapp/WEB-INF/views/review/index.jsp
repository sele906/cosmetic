<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>

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

/* 전체 */
#pageWrap {
	margin: 190px auto 200px auto;
	width: 60%;
	height: 100%;
	font-size: 0.9em;
	min-width: 610px;
}

#wrap {
	display: flex;
	flex-direction: column;
}

#header {
	padding: 20px 0 10px 0;
	border-bottom: 2px solid black;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: flex-end;
}
#header h3, #header span {
	display: inline-block;
}
#header span {
	height: 20px;
	font-size: 1.1em;
}

#r_content {
	margin: 20px 0;
	/* border: 1px solid black; */
}

.main {
	border: 1px solid gray;
	padding: 15px;
	margin: 10px 0;
	border-radius: 15px;
	box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
}
.r_info {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	border-bottom: 1px solid gray;
	width: 100%;
	padding: 0 0 5px 0;
}
.p_info {
	/* border: 1px solid black; */
	display: flex;
	flex-direction: row;
}

.p_name {
	/* border: 1px solid black; */
	padding: 0 10px 0 0 ;
	display: inline-block;
}
.p_name b {
	color: #656565;
}
.p_name b:hover {
	color: #337ab7;
}
.p_name b {
	display: flex;
	flex-direction: row;
	align-items: center;
}
.p_name a span {
	display: inline-block;
	max-width: 300px;
	height: 20px;
	overflow: hidden;
}

.p_right {
	display: flex;
	flex-direction: row;
	align-items: center;
}
.delete {
	padding: 0 10px;
	font-size: 1.1em;
	color: #656565;
}
.delete:hover {
	cursor: pointer;
	color: gray;
}
.content {
	/* border: 1px solid black; */
	width: 80%;
	min-width: 500px;
	margin: 0 auto;
	padding: 15px 0 0 0;
	display: flex;
	flex-direction: column;
	align-content: center;
}
.rateB {
	padding: 0 0 15px 0;
	display: flex;
	flex-direction: row;
	align-items: center;
}
.rateB i {
	color: #e5e5e5;
    font-size: 1.3em;
    padding: 0 2px;
}
.review_write {
	padding: 0 0 20px 0;
}
.content_write {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 15px;
}
.c_images {
	display: flex;
	flex-direction: row;
	overflow-x: scroll;
	overflow-y: hidden;
	width: 100%;
}
.imgs {
	padding: 7px;
	border: 1px solid #e5e5e5;
}
.c_images::-webkit-scrollbar-track
{
	background-color: #F5F5F5;
}

.c_images::-webkit-scrollbar
{
	height: 8px;
	background-color: #656565;
}

.c_images::-webkit-scrollbar-thumb
{
	border-radius: 8px;
	background-color: #a8a8a8;
}

/* 별점 */
.on {
	color: #f3cc00;
}

#emptyB {
	border-bottom: 1px solid gray;
	padding: 80px 80px 100px 80px;
}
#Emessage {
	/* border: 1px solid black; */
	text-align: center;
	font-size: 1.2em;
}

/* 페이지 번호 */

#paging {
   margin: 5px 0;
   width: 100%;
   height: 50px;
   display: flex;
   flex-direction: row;
   align-items: center;
   justify-content: center;
}
#arrowsL, #arrowsR {
   display: flex;
   flex-direction: row;
   width: 65px;
}
#arrowsL {
   justify-content:flex-end;
   margin: 0 10px 0 0;
}
#arrowsR {
justify-content:flex-start;
   margin: 0 0 0 10px;
}
#paging .page {
   color: #656565;
   width: 30px;
   height: 30px;
   line-height: 28px;
   margin: 0 2px;
   border: 1px solid #e0e0e0;
   font-size: 0.8em;
}
#paging .page:hover {
   cursor: pointer;
   border: 1px solid #656565;
   font-weight: bold;
}
#paging .page.selected {
   border: 1px solid #656565;
   font-weight: bold;
   cursor: default;
}

</style>

<script type="text/javascript">
var urlParams = new URLSearchParams(window.location.search);

function list(page) {
    location.href = "/review/index.do?curPage=" + page;
}
</script>

<body>

<%@ include file="../include/menu/menu.jsp"%>

<div id="pageWrap">
<%-- hello
${list} --%>

<div id="wrap">

<div id="header">
	<h3>작성한 리뷰</h3>
	<c:if test="${!empty list}">
		<span>${count}개</span>
	</c:if>
</div>

<div id="r_content">

<c:choose>

	<c:when test="${!empty list}">
	<c:forEach var="row" items="${list}">

	<div class="main">
		<div class="r_info">
			<div class="p_info">
				<div class="p_name">
				<a href="/product/detail_before?p_id=${row.p_id}">
					<b>
					<span>${row.p_name}&nbsp;&nbsp;</span>
					|&nbsp;&nbsp;<fmt:formatNumber value="${row.p_price}" pattern="#,###"></fmt:formatNumber>원
					</b>
				</a>
				</div>
			</div>
			<div class="p_right">
				<div class="date">
					${row.f_date}
				</div>
				<div class="delete" onclick="delete_btn(${row.r_id})">
					<i class="fa fa-remove"></i>
				</div>
			</div>
		</div>
		<div class="content">
		
		<span class="rateB" style="width: 100%" value = "${row.r_rate}">
                    
	      <i class="fa fa-star"></i>
	      <i class="fa fa-star"></i> 
	      <i class="fa fa-star"></i>
	      <i class="fa fa-star"></i>
	      <i class="fa fa-star"></i>
	      
	    </span>
		
		<div class="content_write">
			<div class="review_write">${row.contents}</div>
			<div class="c_images" id="${row.r_id}"></div>
		</div>
		
		</div>
	</div>
	
	</c:forEach>
	</c:when>
	
	<c:otherwise>
	<div id="emptyB">
		<p id="Emessage">작성한 리뷰가 없습니다.</p>
	</div>
	</c:otherwise>
</c:choose>



</div>

<!-- 페이지 번호 -->
<div id="paging" align="center">

   <!-- 화살표 -->
   <div id="arrowsL">
      <c:if test="${page_info.curPage > 1 }">
         <div class="page" onclick="list('1')">❮❮</div>
      </c:if>
      <c:if test="${page_info.curBlock > 1}">
         <div class="page" onclick="list('${page_info.prevPage}')">❮</div>
      </c:if>
   </div>
   
   <!-- 페이지 숫자 -->
   <c:forEach  var="num"  begin="${page_info.blockStart}" end="${page_info.blockEnd}">
      <c:choose>
         <c:when  test="${num  ==  page_info.curPage }">
            <div class="page selected">
               <span>${num}</span>
            </div>
         </c:when>
         <c:otherwise>
            <div class="page" onclick="list('${num}')">${num}</div>
         </c:otherwise>
      </c:choose>
   </c:forEach>
   
   <!-- 화살표 -->
   <div id="arrowsR">
      <c:if  test="${page_info.curBlock  <  page_info.totBlock }" >
         <div class="page" onclick="list('${page_info.nextPage}')">❯</div>
      </c:if>
      <c:if  test="${page_info.curPage  <=  page_info.totPage}">
         <div class="page" onclick="list('${page_info.totPage}')">❯❯</div>
      </c:if>
   </div>
</div>

</div>




</div>


<script src="/resources/assets/js/vendor/jquery-1.11.2.min.js"></script>
<script src="/resources/assets/js/vendor/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/resources/assets/js/plugins.js"></script>
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$('.c_images').each(function() {
		var r_id = $(this).attr('id');
		
		$.ajax({
			"url": "/review/get_img/" + r_id,
	        "type": "GET",
	        success: function(response) {
	        	var html = "";
	        	
	        	for (var i = 0; i < response.length; i++) {
	        		
	        		var original_url = response[i];
					var url = original_url.replace("src/main/webapp", "");

	        		html += "<div class='imgs'>";
	        		html += "<img src='" + url + "' width='80px' height='80px' style='" + "margin: 0 3px;" + "'/>";
	        		html += "</div>";
	        	}
	        	
	        	$('#' + r_id).html(html);
	        }
		});
	});
	
	//별점
	$('.rateB').each(function() {
	    var rating = $(this).attr('value'); 
	    $(this).children('i').each(function(index) {
	    	if (index < rating) {
	            $(this).addClass('on'); 
	            $(this).css('color', '#f3cc00'); 
	          } else {
	            $(this).css('color', '');
	          }
	    });
	});
});

function delete_btn(r_id) {
	if (confirm("리뷰를 삭제하시겠습니까?")) {
		$.ajax({
			"url": "/review/review_delete.do",
	        "type": "GET",
	        "data": {"r_id": r_id},
	        success: function(response) {
	        	if (response == "success") {
	        		window.location.href = "/review/index.do";
	        		alert('리뷰가 삭제되었습니다.');
	        	}
	        }
		});
	}
}
</script>

</body>
</html>