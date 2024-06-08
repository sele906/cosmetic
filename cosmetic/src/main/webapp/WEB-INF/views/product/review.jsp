<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script> 

<script type="text/javascript">
function formatDate(dateString) {
    let date = new Date(dateString);
    let formattedDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2)
        + ' ' + ('0' + date.getHours()).slice(-2) + ':' + ('0' + date.getMinutes()).slice(-2) + ':' + ('0' + date.getSeconds()).slice(-2);
    return formattedDate;
}

$(document).ready(function() {
    var p_id = '${dto.p_id}';

    $.ajax({
        url: '/review/list',
        method: 'GET',
        data: { p_id: p_id },
        success: function(data) {
        	var reviewList = ''; 

            data.forEach(function(review) {
            	console.log(review);
                reviewList += 
                    '<div class="review_list">' +
                    '<ul class="inner_list">' +
                    '<li>' +
                    '<div class="info">' +
                    '<div class="user">' +
                    /* '<div class="imgB">' + */
                    /* '<a href="#">' +
                    '<div class="thum">' +
                    '<span class="bg"></span>' +
                    '<img src="https://static.oliveyoung.co.kr/pc-static-root/image/comm/my_picture_base.jpg">' + 
                    '</div>' +
                    '</a>' + */
                    
                    '<div class="u_info">' +
                    
                    '<p class="info_user"><a>' + review.nickname + '</a></p>' +
                    '<span>' + review.userid + '</span>' +
                    
                    '</div>' +
                    
                    /* '</div>' + */
                    '</div>' +
                    '</div>' +
                    '<div class="review_contents">' +
                    '<div class="score_area">' +
                    '<span class="review_point">' +
                    '<span class="point" style="width: 100%" value="' + review.r_rate + '">' +
                    
                    '<i class="fa fa-star"></i>' + 
                    '<i class="fa fa-star"></i>' + 
                    '<i class="fa fa-star"></i>' + 
                    '<i class="fa fa-star"></i>' + 
                    '<i class="fa fa-star"></i>' + 
                    
                    '</span>' +
                    '</span>' +
                    '<span class="date">' + formatDate(review.r_date) + '</span>' +
                    '</div>' +
                    '<div class="txt_inner">' +
                    '<div class="contents">' + review.r_contents +
                    '</div>' +
                    '</div>' +
                    '<div class="review_thum">' +
                    '<ul class="inner" id="review_thum_' + review.r_id + '">' +  // ID를 추가하여 각 리뷰의 썸네일 리스트에 고유 ID 부여
                    '</ul>' +
                    '</div>' +
                    '</div>' +
                    '</li>' +
                    '</ul>' +
                    '</div>';

                // 각 리뷰에 대한 사진 데이터를 가져오기 위한 AJAX 요청
                $.ajax({
                    url: '/review/list_attach/' + review.r_id,
                    method: 'GET',
                    success: function(images) {
                        var thumList = '';
                        images.forEach(function(image) {
                        	image=image.replace("src/main/webapp","");
                        	console.log('image:'+image);
                            thumList += '<li><a href="#"><span><img src="' + image + '" alt="Review Image"></a></span></li>';
                        });
                        $('#review_thum_' + review.r_id).append(thumList);
                    },
                    error: function(xhr, status, error) {
                        console.error('이미지를 불러오는 중 오류 발생:', error);
                    }
                });
            });

            $('#review_list').html(reviewList); 
            setRatingStars();
        },
        error: function(xhr, status, error) {
            console.error('리뷰를 불러오는 중 오류 발생:', error);
        }
    });
});

function setRatingStars() {
	$('.point').each(function() {
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
}
</script>

<style>
body {
	margin: 0;
	 
}

a {
    color: #666;
    text-decoration: none;
}

a, address, blockquote, body, dd, div, dl, dt, em, fieldset, form, h1, h2, h3, h4, h5, h6, img, input, label, li, ol, p, pre, select, span, strong, textarea, ul {
    margin: 0;
    padding: 0;
    border: 0;
}

* {
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}
.head_title {
	display: flex;
	flex-direction: column;
	align-items: center;
}
#r_header {
	display: flex;
	flex-direction: row;
	border-bottom: 1px solid #ccc;
	padding: 10px 0;
	justify-content: space-between;
	width: 80%;
	align-items: flex-end;
}
#r_header h2 {
	font-size: 2.5em;
}
#r_header p {
	display: inline-block;
	margin: 0;
	padding: 0 3px;
	font-size: 1.2em;
}
.review_container {
	margin: 0 10%;
}

.review_list {
 	width: 100%;
 	min-width: 650px;
	margin: 0;
    padding: 0;
    border: 0;
    border-bottom: 1px solid #e5e5e5;
}

ol, ul{
	list-style: none;
}

.review_list .inner_list>li {
	display: flex;
	flex-direction: row;
    padding: 10px 20px 10px 10px;
    margin: 30px 0;
    border: 1px solid #ccc;
    border-radius: 20px;
}

/* 리뷰 유저쪽 */
.review_list .inner_list>li.info{
	float: left;
    width: 255px;
    padding: 30px 0;
}

.info{
	flex: 0 0 150px;
	margin: 30px 0;
}
.review_list .info .user {
	width: 100%;
	height: 100%;
}

.review_contents {
    flex: 1;
    padding-left: 30px;
}
.inner_list .u_info {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 100%;
}
.inner_list .u_info p {
	margin: 0;
	padding: 5px 0;
	font-size: 1.3em;
	width: 100%;
	font-weight: bold;
}
.inner_list .u_info span {
	font-size: 0.9em;
	color: gray;
	width: 100%;
}

.review_list .inner_list .info .user .tag span, .review_list .inner_list .info .user .topreview_N2 span {
    display: inline-block;
    vertical-align: top;
    font-weight: 400;
    font-size: 12px;
    line-height: 14px;
    color: #757d86;
    float: left;
}

/* 리뷰 컨텐츠쪽 */
.review_list .inner_list>li>.review_contents{
	position: relative;
    margin-left: 10px;
    padding: 30px 0;
    bottom: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.review_list .inner_list>li>.review_contents .txt_inner {
    color: #555;
    line-height: px;
     margin-bottom: 20px;
    border-top: 1px solid #ccc;
    width: 100%;
    padding: 10px;
}
.review_list .inner_list>li>.review_contents .txt_inner .subject {
    color: #555;
    font-weight: 600;
}
.review_list .inner_list>li>.review_contents .txt_inner .contents {
    color: #555;
    text-align: left;
}

.score_area {
    min-height: 20px;
    margin: 0 0 10px 0;
    padding: 0 10px;
    display: flex;
    justify-content: space-between;
    width: 100%;
}

.inner_list .review_point {
    float: left;
    width: 125px;
    height: 20px;
}

.score_area .date {
    margin-left: 15px;
    font-size: 16px;
    line-height: 24px;
    letter-spacing: 0;
}

.inner_list .review_thum {
    padding: 10px ;
    border-bottom: 1px solid #ccc;
    width: 100%;
    overflow-x: scroll;
    overflow-y: 0;
} 
.review_thum::-webkit-scrollbar-track
{
	background-color: #F5F5F5;
}
.review_thum::-webkit-scrollbar
{
	height: 7px;
	background-color: #656565;
}
.review_thum::-webkit-scrollbar-thumb
{
	border-radius: 8px;
	background-color: #a8a8a8;
}

.like_area {
    margin-top: 20px;
    float: left;
    padding-left: 0;
    background: 0 0;
    color: #333;
    font-size: 15px;
    line-height: 28px;
    letter-spacing: 0;
    font-weight: 700;
}

.like_area .btn_like {
    padding-left: 0;
    background: 0 0;
    color: #333;
    font-size: 15px;
    line-height: 28px;
    letter-spacing: 0;
    font-weight: 700;
}

.like_area .btn_like {
    height: 32px;
    padding-left: 39px;
    border: none;
    font-size: 14px;
    color: #333;
}

.like_area .btn_like span {
    position: relative;
    display: inline-block;
    margin-left: -34px;
    height: 28px;
    line-height: 26px;
    padding: 0 36px 0 24px;
    color: #888;
    border: 1px solid #ddd;
    border-radius: 14px;
    vertical-align: top;
    font-weight: 400;
     background: url("https://static.oliveyoung.co.kr/pc-static-root/image/product/icon_recom_new.png") 0 1px/17px auto no-repeat;
}

.inner_list .review_point .point {
    height: 20px;
    width: 100%;
}

.review_point .point i {
	color: #e5e5e5;
    font-size: 1.1em;
    padding: 0 3px;
}

.inner_list .review_thum ul.inner {
    display: flex;
    width: 100%;
    align-items: center;
    justify-content: flex-start;
}

.inner_list .review_thum ul.inner li a>span {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    width: 110px;
    height: 110px;
    border: 1px solid #e5e5e5;
    margin: 0 2px;
    padding: 7px;
}
.review_thum ul.inner li a>span img {
	width: 100%;
    height: 100%;
}

#emptyB {
	border-bottom: 1px solid gray;
	padding: 80px 80px 100px 80px;
}
#Emessage {
	text-align: center;
	font-size: 1.2em;
}
</style>

</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	
	<div class="head_title text-center">
		<div id="r_header">
			<h2>상품리뷰</h2> 
			<p>${count_review}개</p>
		</div>
		
		<!-- 리뷰 리스트 -->
		<div class="review_container">
			<div id="review_list">
			
			<div id="emptyB">
				<p id="Emessage">작성한 리뷰가 없습니다.</p>
			</div>
			
			</div>
		</div>

   </div>



</body>
</html>