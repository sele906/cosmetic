# SpringBoot Project EDEN

올리브영을 참고하여 만든 화장품 플랫폼 사이트 입니다.<br/>
개발 기간: 2024.04.24. ~ 2024.06.11.

## 프로젝트 설계

### 개발환경

**BackEnd**

<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/java 17-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/jsp-F7DF1E?style=for-the-badge&logo=jsp&logoColor=black"> 
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-02303A?style=for-the-badge&logo=mybatis&logoColor=white"> <img src="https://img.shields.io/badge/apache tomcat 10.0-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> <img src="https://img.shields.io/badge/gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white"> <img src="https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=black">
  
**FrontEnd**

<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">

**Tool**

<img src="https://img.shields.io/badge/intellijidea-181717?style=for-the-badge&logo=intellijidea&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

<details>
<summary><b>유스케이스 다이어그램</b></summary>
<div markdown="1">
  
![usecase_cos](https://github.com/sele906/cinema/assets/81071162/cff9b2e2-92b5-4d28-bf68-e1a6d34c2e0d)

</div>
</details>

<details>
<summary><b>ER 다이어그램</b></summary>
<div markdown="1">
  
![ER_cos](https://github.com/sele906/cinema/assets/81071162/2d07a93e-d5f0-463c-abfb-d6accbcbc45a)

</div>
</details>


## 구현기능


**로그인/회원가입**

- 로그인 시 세션 생성
- ID/PW 찾기
- ID 중복체크
- 주소 api 연동

**헤더**

- 로그인/로그아웃
- 마이페이지
- 장바구니
- 주문배송
- 관리자 화면
- 카테고리
- 최근 본 상품

**메인페이지**

- 대표 이미지 슬라이드
- 인기상품
- 주목받는 상품

**상품목록**

- 대분류
  - 소분류 카테고리
  - 인기상품
  - 주목받는상품
    
- 소분류
  - 소분류 카테고리
  - 인기순, 신상품순, 판매순, 낮은가격순 정렬
  - 찜 기능

- 상품 상세
  - 이미지 슬라이드
  - 수량 선택
  - 장바구니
  - 바로구매
  - 찜 기능
  - 상세설명
  - 리뷰 목록
    
**주문**

- 장바구니
  - 옵션 및 수량 선택
  - 개별 구매 및 삭제
  - 전체 구매 및 삭제

- 주문
  - 배송정보
  - 포인트/적립
  - 결제수단(카카오페이, 토스페이, KG이니시스)

- 주문내역
  - 주문상태(결제완료, 배송중, 배송완료, 반품요청, 취소/반품)
  - 날짜별 조회
  - 결제 취소 및 반품요청
  - 반품 요청시 반품 취소 가능
  - 배송 완료시 리뷰등록 가능
  
**마이페이지**

- 회원정보 수정
- 회원 탈퇴
- 주문/배송조회
- 장바구니
- 찜목록 조회 및 삭제
- 리뷰 목록 조회 및 삭제

**관리자**

- 고객관리
  - 고객목록 조회
  - 고객 검색

- 상품관리
  - 상품 등록
  - 상품 목록 조회
  - 상품 분류별 조회

- 주문 관리
  - 날짜별 조회
  - 주문 검색
  - 반품 요청시 환불처리

























