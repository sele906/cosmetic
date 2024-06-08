<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>최근 본 상품 목록</title>
</head>
<body>
    <h2>최근 본 상품 목록</h2>
    <c:if test="${not empty r_list}">
        <ul>
            <c:forEach var="product" items="${r_list}">
                <li>${product.p_name} - 가격: ${product.p_price}</li>
                <%-- <li><img src="${fn:replace(product.file_name, 'src/main/webapp', '')}"></li> --%>
                <li>${product.file_name}</li>
                
                <button type="button" onclick="cookie_delete(${product.p_id})">쿠키 하나 삭제</button>
                <button type="button" onclick="cookie_all_delete()">쿠키 전체 삭제</button>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty r_list}">
        <p>최근 본 상품이 없습니다.</p>
    </c:if>
    <script type="text/javascript">
    function cookie_delete(p_id) {
       location.href="/product/cookie_delete?p_id="+p_id;
    }
    
    function cookie_all_delete() {
       location.href="/product/cookie_all_delete";
    }
    </script>
</body>
</html>