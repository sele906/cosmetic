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

<title>상품등록</title>

<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- 에디터 -->
    <!-- <script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script> -->
	<script src="/resources/ckeditor/ckeditor.js"></script>


<style>
body {
    height: 100%;
}

        .container-fluid {
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: left;
            color: #4e73df;
            margin-bottom: 20px;
        }

        .form_section {
            margin: 0 auto;
            text-align: center;
        }

        #imagePreview {
            width: 220px;
            height: 220px;
            background-size: cover;
            background-position: center;
            border: 2px solid #ddd;
            border-radius: 10px;
            margin: 10px auto;
        }

        .form-section-title {
            margin-bottom: 10px;
        }


        input[type="text"],
        input[type="number"],
        select {
            width: 200px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            height: 40px
        }

        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group input {
            flex: 1;
            margin-right: 10px;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
        }

        .checkbox-group input[type="checkbox"] {
            margin-right: 5px;
        }

        .preview {
            display: flex;
            justify-content: center;
            align-items: center;
            border-top: 1px solid gray;
            margin-top: -12px;
   			padding-top: 17px;
        }
.span_bold{
	font-weight: bold;
    color: #5a5c69;

}        
        
.ul_inner{
	list-style: none;
}

.li_inner {
	margin: 20px;
}  

.write_area {
	padding: 5px 0 0;
}

.write_area .left_area {
	float: left;
	width: 710px;
	margin-top: 5px;
}

.write_area .right_area {
	float: right;
	width: 425px;
}

.label_inner{
	margin-right: 20px;
}

</style>
<script>
 //한 개의 체크박스만 선택할 수 있도록 하는 함수 
function checkOnlyOne(element) {
    const checkboxes = document.getElementsByName("yes_no");
    checkboxes.forEach((cb) => {
        cb.checked = false;
    });
    element.checked = true;
}

 
function save_form() {
	document.form1.submit();
}


function look() {
    const noOptionCheckbox = document.getElementById("no_option");
    const yesOptionCheckbox = document.getElementById("yes_option");
    const stockInput = document.getElementById("p_stock");
    const amountInput = document.getElementById("o_amount");
    const insertBtn = document.getElementById("optionAdd_btn");
    const optionContainer = document.getElementById("optionIndex");
	
    let isChecked = false; // "있음" 체크박스가 선택되었는지 여부를 확인하는 변수

    if (yesOptionCheckbox.checked) {
        isChecked = true; // "있음" 체크박스가 선택되었다면 isChecked 값을 true로 설정
        stockInput.value = null;
    }
    
    // "있음" 체크박스가 선택되었다면 재고 입력 필드를 비활성화하고, 그렇지 않다면 활성화합니다.
    insertBtn.disabled = !isChecked;
    stockInput.disabled = isChecked;
    if (amountInput) {
        amountInput.disabled = !isChecked;
    }
    
    if (!isChecked) {
        clearOptionFields(optionContainer);
    }
}

function clearOptionFields(optionContainer) {
    while (optionContainer.firstChild) {
        optionContainer.removeChild(optionContainer.firstChild);
    }
}


function save(){
	const savebtn = document.getxElementById("save");
	savebtn.onclick
}



</script>

</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		 <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: white;">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/">
                <div class="sidebar-brand-icon rotate-n-15">
                </div>
                <div class="sidebar-brand-text mx-3">EDEN 뷰티 </div>
            </a>

            <!-- Divider -->
            

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
				aria-expanded="true" aria-controls="collapsePages"> <i
				></i> <span>🛍︎ 상품관리</span>
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
			<li class="nav-item"><a class="nav-link" href="/admin/order_list">
					<i ></i> <span>📋 주문목록</span>
			</a></li>
			
			<li class="nav-item"><a class="nav-link" href="/">
					<i ></i> <span>🖱️ 사이트로 바로가기</span>
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
<h1 class="h3 mb-2 text-gray-800">상품 등록</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3"></div>
						
<form method="post" name="form1" action="/admin/insert" enctype="multipart/form-data" >
	<div class="write_area">
		<div class="left_area">
			<ul class="ul_inner">
				<li class="li_inner">
					<span class="span_bold"><label for="product-name">상품코드</label></span>
					<span style="color: gray;">자동생성</span>
				</li>
				<li class="li_inner">
					<span class="span_bold"><label for="product-name">상품명</label></span>
					<span v="span_bold"><input type="text" id="p_name" name="p_name" ></span>
				</li>
				<li class="li_inner">
					<span class="span_bold"><label for="product-name">대표이미지</label></span>
                    <span class="span_bold"> <input type="file" name="files" multiple="multiple" id="fileInput"></span>
                    <div id="file_box"></div>
				</li>
				<li class="li_inner">
					<select id="category" name="ctg_big" >
                  		<option value="" selected disabled hidden>대분류</option>
   							<c:forEach var="row" items="${list}">
       				 			<option value="${row}">${row}</option>
    						</c:forEach>
					</select>

                    <select id="subcategory" name="ctg_small">
                        <option value="" selected disabled hidden>소분류</option>
                        <option value="small"></option>
                    </select>
				</li>
				<li class="li_inner">
					<span class="span_bold"><label>상품설명</label></span>
					<span class="td1">
                   	<textarea rows="20" cols="80" placeholder="상품설명을 입력하세요." name="p_detail" id="p_detail"></textarea>
                    <script>
        				CKEDITOR.replace("p_detail", {
        					filebrowserUploadUrl : "/imageUpload.do"
        				});
					</script>
                    </span>
				</li>
				<li class="li_inner">
					<span class="span_bold"><label for="price">판매가</label></span>
					<span><input type="number" id="p_price" name="p_price"></span>
					&nbsp;
					<span class="span_bold"><label for="amount">수량</label></span>
					<span><input type="number" id="p_stock" name="p_stock"></span>
				</li>
				<li class="li_inner">
					<span class="span_bold"><label for="option">옵션</label></span>&nbsp;
					<!-- <input type="text" placeholder="색상" name="O_name" id="O_name" >
                	<input type="number" placeholder="수량" name="O_amount" id="O_amount"> -->
             <!--   <input type="hidden" id="o_id" name="o_id"> -->
             		<input type="checkbox" value="0" name="yes_no" id="no_option" onclick="checkOnlyOne(this); look();" checked >없음
                	<input type="checkbox" value="1" name="yes_no" id="yes_option" onclick="checkOnlyOne(this); look();" >있음
              		<button type="button" id="optionAdd_btn" name="optionAdd_btn" disabled="disabled">추가</button>
              		<!-- <button type="button" onclick="Delete()" id="delete" disabled="disabled">삭제</button> -->
              		<div id="optionIndex"></div>
				</li>
							
				<li class="li_inner">
					<div id="preview" class="preview"></div>
				</li>
								
				<div>
        			<button type="button" id="save" name="save" onclick="save_form()">확인</button>
        			<button type="button">취소</button>
        		</div>
			</ul>
		</div>
						
		<div class="right_area">
						
		</div>
	</div>
							
										 
</form>
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
		
	
<style>
#file_box {
        margin: 10px; /* 파일 이름 표시 영역과 상단 간격 조정 */
    }

    #file_box a {
        display: inline-block;
        margin-right: 10px; /* 파일 이름과 다음 파일 이름 사이의 간격 조정 */
        color: #333; /* 파일 이름 색상 설정 */
        text-decoration: none; /* 밑줄 제거 */
         width: 100px;
    background-color: #f5f5f5;
    color: #aaa;
    font-size: 24px;
    }

    #file_box a:hover {
        color: #555; /* 마우스를 올렸을 때 파일 이름 색상 변경 */
    }

    /* 파일 이름이 표시되는 영역 안의 input 태그 스타일링 */
    #file_box input[type="hidden"] {
        display: none; /* 숨김 처리 */
        background-color: #f5f5f5;
    color: #aaa;
    font-size: 24px;
    }
    
    #file_box img{
    width: 100px;
    height: 100px;
    border: 2px dashed #ccc;
    display: inline-block;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    position: relative;
    margin: 5px; /* 업로드 상자 사이의 간격 조정 */
    }
    
    .form-group {
    	display: flex;
    }
</style>
</body>

<script>

document.getElementById('category').addEventListener('change', function() {
    var Big = this.value;
    // 선택된 대분류 값이 콘솔에 로그로 출력됩니다.
    // 대분류 선택 값 로그 확인
    // 만약 선택된 대분류 값이 비어 있지 않다면 아래 코드를 실행합니다.
    if (Big !== '') {
        fetch('/admin/Small?ctg_big=' + Big) // 대분류 값 전달
            .then(response => response.json())
            .then(data => { // 서버에서 받은 소분류 데이터 처리
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

$(document).ready(function() {
	console.log('ready');

	optionAdd();
});

function optionAdd() {
	console.log('optionadd');
	var optionIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$("#optionAdd_btn")
			.on(
					"click",
					function() {
						console.log('옵션추가');
						$("#optionIndex")
								.append(
										"  <div class='form-group'><input placeholder='옵션' class='form-control input-lg' type='text' style='float:left;' name='o_name"
												
												+ "' id='o_name'>&nbsp;&nbsp;"
												+ "<input type='number' name='o_amount' id='o_amount' placeholder='수량'>"
												+ "<button type='button' style='float:right;' id='optionDelBtn' class='btn-btn dark'>"
												+ "삭제" + "</button></div>"

								);

					});

	$(document).on("click", "#optionDelBtn", function() {
		$(this).parent().remove();

	});

};

/* function Preview() {
    // 입력된 색상과 수량을 가져옵니다.
    let colorInput = document.getElementById("O_name");
    let amountInput = document.getElementById("O_amount");
    // 색상과 수량을 가져옵니다.
    let color = colorInput.value.trim();
    let amount = amountInput.value.trim(); // 공백만 제거하고 쉼표는 그대로 유지
    console.log('amount:' + amount);
    
    // 입력 필드가 비워져 있으면 0으로 설정
    
    
    // 미리보기에 색상과 수량을 추가합니다.
    let previewDiv = document.getElementById("preview");
    let newItem = document.createElement("div");
    newItem.classList.add("preview-item");
    
    let colorSpan = document.createElement("span");
    colorSpan.textContent = color;
    console.log(color);
    colorSpan.classList.add("color-span");
    
    let amountSpan = document.createElement("span");
    amountSpan.textContent = amount + '개';
    console.log(amount);
    amountSpan.classList.add("amount-span");
    
    // 색상과 수량을 하나의 div 안에 추가합니다.
    newItem.appendChild(colorSpan);
    newItem.appendChild(amountSpan);

    let hiddenColor = document.createElement("input");
    hiddenColor.type = "hidden";
    hiddenColor.name = "o_name";
    hiddenColor.value = color;
    
    let hiddenAmount = document.createElement("input");
    hiddenAmount.type = "hidden";
    hiddenAmount.name = "o_amount";
    hiddenAmount.value = amount;
    newItem.appendChild(hiddenColor);
    newItem.appendChild(hiddenAmount);
    console.log('hiddenAmount:' + JSON.stringify(hiddenAmount));
    
    // 미리보기에 새로운 항목을 추가합니다.
    previewDiv.appendChild(newItem);

    // 입력 필드를 비웁니다.
    colorInput.value = "0"; // 빈 문자열("")로 설정
    amountInput.value = "0"; // 빈 문자열("")로 설정
    
} 


function Delete() {
    // 삭제할 대상인 프리뷰 아이템을 선택합니다.
    const previewItem = document.querySelector(".preview-item");
    // 선택된 아이템이 있다면 삭제합니다.
    if (previewItem) {
        previewItem.remove();
    }
} */

document.getElementById('save').addEventListener('click', function() {
    var small = document.getElementById('subcategory').value;
    
    // 선택된 소분류 값을 서버로 전송
    fetch('/admin/insert'+small, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ ctg_small: small }) // 'small' 대신 'ctg_small'로 변경
    })
    .then(response => {
        // 서버 응답에 대한 처리
        if (response.ok) {
            return response.text(); // 텍스트 형태로 반환
        } else {
            throw new Error('서버 응답이 실패했습니다.');
        }
    })
    .then(data => {
        // 서버 응답을 받아 처리
        console.log('서버 응답:', data);
        // 여기서 추가적인 클라이언트 측 처리를 수행할 수 있습니다.
    })
    .catch(error => {
        // 오류 처리
        console.error('Error:', error);
    });
});

$("#fileInput").on("change", function(e) {
    e.preventDefault();
    const files = e.target.files;
    console.log(files);
    const form_data = new FormData();
    
    for (let i = 0; i < files.length; i++) {
        form_data.append("file", files[i]);
        // 이미지 파일인 경우 미리보기 생성
        if (files[i].type.startsWith("image/")) {
            const reader = new FileReader();
            reader.onload = function(event) {
                const img = $("<img>").attr("src", event.target.result).css("max-width", "70px"); // 이미지 미리보기 크기 조정
                $("#file_box").append(img);
            };
            reader.readAsDataURL(files[i]);
        }
    }
    console.log(form_data);

    $.ajax({
        url: "/upload/ajax_upload",
        data: form_data,
        processData: false,
        contentType: false,
        type: "post",
        success: function(data) {
            if (Array.isArray(data)) {
                data.forEach(file_name => {
                    const fileInfo = getFileInfo(file_name);
                    // let html = "<a href='" + fileInfo.get_link + "'>" + fileInfo.original_name + "</a>";
                    const html = "<input type='hidden' name='file' style='margin: 5px;' value='" + fileInfo.file_name + "'>";
                    $("#file_box").append(html);
                });
            } else {
                console.error('Expected an array but got:', data);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error:', textStatus, errorThrown);
        }
    });
});

function getFileInfo(file_name) {
    const get_link = "/upload/display_file?file_name=" + file_name;
    const original_name = file_name.substr(file_name.indexOf("_") + 1);
    return { original_name: original_name, get_link: get_link, file_name: file_name };
}


</script>

</html>