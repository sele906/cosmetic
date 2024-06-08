<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 목록</title>

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
	margin: 190px auto 0 auto;
	width: 65%;
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
}

/* 테이블 */

#content {
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   margin: 40px 0 0 0;
}

#info {
   width: 90%;
   text-align: left;
   padding: 10px 0;
   border-bottom: 1px solid gray;
}

.grid {
   width:1020px;
   display: grid;
   grid-gap: 1px;
   border-bottom: 1px solid #d4d4d4;
   grid-template-columns: repeat(3, 1fr); /* 열개수 */
   /* grid-template-rows: repeat(4, 1fr); */ /* 행개수 */
}
.grid .block {
   border-bottom: inherit;
    width: 255px;
   height: 400px;
   display: flex;
   flex-direction: column;
   align-content: center;
   justify-content: center;
   padding: 30px 20px;
}

.block .picture {
   position: relative;
   width: 215px;
   height: 215px;
   margin: 0 0 5px 0;
   border: 1px solid #fafafa;
}

.block .picture img {
	width: 100%;
	height: 100%;
}

.picture .delete {
	position: absolute;
	right: 0;
	top: -8px;
	font-size: 1.7em;
	color: #c3c3c3;
	margin: 10px;
}
.picture .delete:hover {
	color: #656565;
	cursor: pointer;
}

.button-img {
  background-color: transparent;
  cursor: pointer;
}

.desc {
   width: 215px;
   height: 125px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   text-align: left;
}
.desc .p_name {
   width: 215px;
   margin: 5px 0 0 0;
   word-break: break-all; 
}
.p_name a {
   color: black;
}
.p_name a:hover {
   color: #337ab7;
}
.desc .p_price {
 font-size: 1.2em;
   height:30px;
   line-height: 30px;
   margin: 5px 0;
   color: red;
}
.desc .p_delivery {
    font-size: 0.7em;
    width: 70px;
   height: 20px;
   margin: 5px 0;
   background-color: #6eb853;
   color: white;
   border-radius: 7px;
   text-align: center;
   line-height: 20px;
}

#emptyB {
	width: 100%;
	border-bottom: 1px solid gray;
	padding: 80px 80px 110px 80px;
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

/* 반응형 */

@media (max-width: 1567px) {
   .grid {
   width:765px;
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   }
}
@media (max-width: 1172px) {
   .grid {
   width:510px;
   display: grid;
   grid-template-columns: repeat(2, 1fr);
   }
}
@media (max-width: 786px) {
   .grid {
   width:255px;
   display: grid;
   grid-template-columns: repeat(1, 1fr);
   }
   #sub_menu {
   width: 50%;
   height: 100%;
   margin: 40px auto 30px auto;
   border-bottom: 1px solid #e0e0e0;
   list-style: none;
   line-height: 40px;
   }
   #sub_menu ul {
   
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   }
   #sub_menu ul li {
   width: 100%;
   text-align: center;
   border: none;
   }
}

</style>

<script type="text/javascript">
var urlParams = new URLSearchParams(window.location.search);

function list(page) {
    location.href = "/zzim/list.do?curPage=" + page;
}
</script>

<body>

<%@ include file="../include/menu/menu.jsp"%>

<div id="pageWrap">
<%-- ${list} --%>

<div id="wrap">

<div id="header">
   <h3>찜한 목록</h3>
</div>

<div id="content">

<c:choose>

	<c:when test="${!empty list}">
	
	<c:if test="${!empty list}">
		<div id="info">
		   총 ${count} 개의 상품이 있습니다.
		</div>
	</c:if>
	
	<!-- 상품리스트 -->
	<div class="grid">

	<c:forEach var="row" items="${list}">
         <article class="block" data-product-id="${row.p_id}">
            <div class="picture">
            	<div class="img" id="img">
                  <img src="${fn:replace(row.file_name, 'src/main/webapp', '')}" alt="상품 이미지">
                  <div class="delete" onclick="delete_btn(${row.idx})">
						<i style="color: #333; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);" class="fa fa-remove"></i>

					</div>
               </div>
           </div>
            
            <div class="desc">
               <div class="p_name">
                  <a href="/product/detail_before?p_id=${row.p_id}">${row.p_name}</a>
               </div>
               <div class="p_price">
                  <b><fmt:formatNumber type="number" value="${row.p_price}" pattern="#,###" />원</b>
               </div>
               <div class="p_delivery">${row.d_info}배송</div>
            </div>
         </article>
      </c:forEach>
	
	</div>
	</c:when>
	
	<c:otherwise>
	<div id="emptyB">
		<p id="Emessage">찜한 상품이 없습니다.</p>
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
function delete_btn(idx) {
	console.log(idx);
	
	if (confirm("찜한 상품을 삭제하시겠습니까?")) {
		$.ajax({
			"url": "/zzim/zzim_list_delete/" + idx,
	        "type": "GET",
	        success: function(response) {
	        	if (response == "success") {
	        		window.location.href = "/zzim/list.do";
	        		alert('찜한 상품이 삭제되었습니다.');
	        	}
	        }
		});
	}
}
</script>

</body>
</html>