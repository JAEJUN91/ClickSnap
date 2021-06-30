<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<style type="text/css">
#topMenu {
	text-align: center;
	display: flex;
	justify-content: center;
	margin: auto 0;
	margin-top: 30px;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: white;
	float: left;
	line-height: 10px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	margin-right: 20px;
	text-decoration: none;
	color: black;
	width: 150px;
	font-size: 20px;
	font-weight: bold;
}

#topMenu .menuLink:hover {
	color: blue;
}

div {
	display: block;
}

#showFilter {
	color: red;
}

.imgg {
	width: 25px;
	height: auto;
}

.card-body {
	align-items: center;
}

.display-3 {
	text-align: center;
	color: white;
	text-shadow: olive;
}

.jumbotron {
	margin-top: 20px;
}

.jumbotron img {
	width: 100px;
	height: 130px;
	margin-left: 10px;
}

.star-rating {
	width: 113px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 20px;
	overflow: hidden;
	background: url(../resources/images/star.png) no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}

.btn-info {
	float: right;
	margin-top: 30px;
}

[data-v-68da9ab6]:export {
	yellow100: #fffef2;
	yellow200: #fffad1;
	yellow300: #fff4ab;
	yellow400: #fae57c;
	yellow500: #ffd400;
	yellow600: #f5c126;
	yellow700: #b88a03;
	yellow800: #523d00;
	yellow900: #34290a;
	orange100: #fff8f3;
	orange200: #ffecdd;
	orange300: #ffd0ad;
	orange400: #ffa15c;
	orange500: #fb842d;
	orange600: #e15f00;
	orange700: #8b3c01;
	orange800: #4a1f00;
	orange900: #301400;
	skyblue100: #f7f9fa;
	skyblue200: #edf2f7;
	skyblue300: #dbe2e9;
	skyblue400: #9bb3ca;
	skyblue500: #4ed0fa;
	skyblue600: #06aee4;
	skyblue700: #426689;
	skyblue800: #1c324f;
	skyblue900: #172332;
	blue100: #f7fbff;
	blue200: #d6e9ff;
	blue300: #a2ceff;
	blue400: #6ab0ff;
	blue500: #4c9df8;
	blue600: #2f72bd;
	blue700: #18508f;
	blue800: #0a335f;
	blue900: #071e36;
	gray100: #fafafc;
	gray200: #f2f3f7;
	gray300: #e4e5ed;
	gray400: #c8cad2;
	gray500: #9a9ba7;
	gray600: #727585;
	gray700: #555969;
	gray800: #303441;
	gray900: #212224;
	denim100: #f7fbff;
	denim200: #ebf4ff;
	denim300: #add3ff;
	denim400: #4c91e2;
	denim500: #116ad4;
	denim600: #0752ab;
	denim700: #053874;
	denim800: #032349;
	denim900: #051222;
	green100: #f7fff5;
	green200: #edfee0;
	green300: #c8ffb2;
	green400: #6ee756;
	green500: #11ca2d;
	green600: #0f9801;
	green700: #005f22;
	green800: #023500;
	green900: #001509;
	red100: #fff8f7;
	red200: #ffedeb;
	red300: #ffbab2;
	red400: #ff7262;
	red500: #ff402b;
	red600: #d52713;
	red700: #9c1101;
	red800: #470700;
	red900: #160200
}

.ProfileDescriptionSection__desctiption[data-v-68da9ab6] {
	font-size: 14px;
	color: #303441;
	line-height: 1.7;
	overflow: hidden
}

.ProfileDescriptionSection__more-button[data-v-68da9ab6] {
	margin-top: 16px;
	color: #116ad4;
	font-size: 14px;
	font-weight: 700;
	cursor: pointer
}

.ProfileDescriptionSection__empty[data-v-68da9ab6] {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	padding-top: 30px
}

.ProfileDescriptionSection__empty div[data-v-68da9ab6] {
	margin-top: 16px;
	font-size: 15px;
	color: #727585
}



</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
	
</head>
<body>
	<jsp:include page="../includes/nav.jsp"></jsp:include>
	<header style="background-image: url(../resources/images/artist_bg1.jpg)">
		<div class="container">
			<div class="slider-container">
				<div class="intro-text"></div>
			</div>
		</div>
	</header>

	<div class="row">
		<div class="col-lg-12">
			<nav id="topMenu">
				<ul>
					<li><a class="menuLink" href="/artPage/artistList">INTRODUCTION</a></li>
					<li><a class="menuLink" href="/artPage/portfolio">PORTFOLIO</a></li>
					<li><a class="menuLink" href="/artPage/serviceList">POSTING LIST</a></li>
					<li><a class="menuLink" href="#">SCHEDULE</a></li>
					<li><a class="menuLink" href="/artPage/register">POSTING REGISTER</a></li>

				</ul>
			</nav>
		</div>
	</div>
	
	<!-- <img alt="" class='img-fluid' src="../resources/images/wedding.jpg"> -->
	<!-- 작가 페이지 상단 프로필 사진부분 -->
	<div class="container">
		<div class="jumbotron">
			<div class='row'>
				<div class="col-lg-2">
					<img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/mykmong-profile-default@3x.png" title="젠지키덜트6761" class="profile-image img-responsive" style="width: 127px;">
				</div>
				<div class="col-lg-10">
				<span class="badge bg-secondary">일반 회원</span> <span
						class="badge bg-success">우수 회원</span> <span
						class="badge bg-danger">최우수 회원</span>
					
					<h2>Customer</h2>  
					
					
					<button type="button" class="btn btn-warning pull-right">프로필 등록/수정</button>
				</div>
			</div>
		</div>
		<!-- 작가 페이지 상단 프로필 사진부분 끝-->
		<!-- 작가 약력 및 텍스트 프로필 -->
		<div class="row" >
			<div class="col-lg-10" >
				
				<label for="exampleFormControlInput"><a href="#" onclick="fnMove('1')" style="color:black;">소개</a></label>&ensp;&ensp;&ensp;&ensp;&ensp;
				<label for="exampleFormControlInput"><a href="#" onclick="fnMove('2')" style="color:black;">예약 리스트</a></label>
				
				
			</div>

		</div>
		<hr/>
		<div class="row">
			<div class="col-md-8">
				<h4>
				<label for="exampleFormControlInput" id="div1">소개</label>
				</h4>
				<div data-v-68da9ab6 class="ProfileDescriptionSection__empty">
					<img data-v-68da9ab6 width="114px"
						src="https://d2v80xjmx68n4w.cloudfront.net/assets/user-profile/img_user_profile_empty.png"
						alt="인증아이콘">
				</div>
				<div data-v-68da9ab6 class="ProfileDescriptionSection__empty">
				
				자기소개를 준비 중입니다.
				</div>
			</div>


			<div class="col-md-4" style="border: 1px groove;">
				<div>
					<h3>활동정보</h3>
					<br>
					<p>
						총 작업수<span style="float: right;">0개</span>
					</p>
					<p>
						고객만족도<span style="float: right;">0%</span>
					</p>
					<p>
						평균응답시간<span style="float: right;">아직몰라요</span>
					</p>
					<br>
				</div>
				<div>
					<h3>고객 정보</h3>
					<br>
					<p>
						회원 구분<span style="float: right;">개인 회원 &ensp;<span class="badge bg-secondary">1</span></span>
					</p>
					<p>
						지역<span style="float: right;">서울특별시 관악구</span>
					</p>
					<p>
						이용 횟수<span style="float: right;">0개</span>
					</p>
					<br>
				</div>
				
			</div>
		</div>
		<!-- 고객 약력 및 텍스트 프로필 끝 -->
		<hr>
		<div class="row">
			<h4>
			<label for="exampleFormControlInput" id="div2">예약 리스트</label>
			</h4>
			<div class="col-md-12">
				<div class="card mb-4">
					<img class="card-img-top" src="../resources/images/travel.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"
							style="font-size: large; font-weight: bold;">웨딩 촬영 가성비 넘치게
							촬영해 드립니다. (서울 경기권)</h5>
						<p class="card-text">ARTIST_ID 작가님의 상품 <a href="#" class="btn btn-primary pull-right">보러가기</a></p>
						
					</div>
				</div>
				<!-- /.card md-4 -->
			</div>
			<!-- /.col-md-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	
	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>


<script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>



</body>
</html>