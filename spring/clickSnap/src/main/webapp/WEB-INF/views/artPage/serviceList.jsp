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
	margin-top:30px;
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

#showFilter{
	color:red;
}
.imgg{
width:25px;
height:auto;
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
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
	
</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>
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
	<hr>
	<div class="container">
	
	<div class="row">
			<br>
			<h2>상품리스트</h2>
			<div class="col-md-6">
				<div class="card mb-4">
					<img class="card-img-top" src="../resources/images/s1.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"
							style="font-size: large; font-weight: bold;">웨딩 촬영 가성비 넘치게
							촬영해 드립니다. (서울 경기권)</h5>
						<p class="card-text">artist_id작가님의 상품</p>
						<a href="#" class="btn btn-primary">보러가기</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-4">
					<img class="card-img-top" src="../resources/images/s2.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"
							style="font-size: large; font-weight: bold;">가족사진 스튜디오 촬영해
							드립니다.</h5>
						<p class="card-text">artist_id작가님의 상품</p>
						<a href="#" class="btn btn-primary">보러가기</a>
					</div>
				</div>
			</div>

		</div>
	
	</div>

</body>
</html>