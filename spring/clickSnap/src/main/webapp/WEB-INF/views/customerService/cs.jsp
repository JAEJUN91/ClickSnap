<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

.imgg {
	width: 25px;
	height: auto;
}

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
	text-align: center;
	margin-right: 30px;
	text-decoration: none;
	color: black;
	width: 200px;
	font-size: 30px;
	font-weight: bold;
}

#topMenu .menuLink:hover {
	color: blue;
}

#kakao-talk-channel-chat-button {
	position: fixed;
	top: 700px;
	right: 0px;
}

#cs {
	width: auto;
	height: 550px;
}

.accordion {
	position: relative;
	top: 5%;
	left: 50%;
	transform: translateX(-50%);
	width: auto;
}

input[id*="answer"] {
	display: none;
}

input[id*="answer"]+label {
	display: block;
	padding: 20px;
	border: 1px solid #232188;
	border-bottom: 0;
	color: #fff;
	font-weight: 900;
	background: #3634a5;
	cursor: pointer;
	position: relative;
}

input[id*="answer"]+label em {
	position: absolute;
	top: 50%;
	right: 10px;
	width: 30px;
	height: 30px;
	margin-top: -15px;
	display: inline-block;
	background: url('../resources/images/arrow.png') 0 0 no-repeat;
}

input[id*="answer"]+label+div {
	max-height: 0;
	transition: all .35s;
	overflow: hidden;
	background: #ebf8ff;
	font-size: 11px;
}

input[id*="answer"]+label+div p {
	display: inline-block;
	padding: 20px;
}

input[id*="answer"]:checked+label+div {
	max-height: 500px;
}

input[id*="answer"]:checked+label em {
	background-position: 0 -30px;
}
</style>
<jsp:include page="../include/nav.jsp"></jsp:include>

<meta charset="UTF-8">
<title>Register</title>

</head>
<body>
	<header id="cs"
		style="background-image: url(../resources/images/csimg.jpg)">
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
					<li><a class="menuLink" href="/customerService/cs">공지사항</a></li>
					<li><a class="menuLink" href="/customerService/faq">자주묻는질문</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="accordion">
				<input type="checkbox" id="answer05"> <label for="answer05">스튜디오사진관
					방문형 촬영상품 사전등록 안내<em></em>
				</label>
				<div>
					<p>안녕하세요? 커뮤니티 매니저 황세도입니다. "스튜디오/사진관 방문형" 촬영상품을 판매할 수 있는 새로운
						기능이 마련되었으며, 내부작가님에게만 우선공개합니다. 7월 말까지 내부작가님의 사전등록시 추천으로 우선 선정될
						예정입니다. 튜디오/사진관 방문형 촬영이란? 기존 까지는 대부분 "출장" 방식의 촬영이었습니다. 이번 개편으로 작가님이
						운영중이신 스튜디오/사진관을 소비자가 예약하고 직접 찾아갈 수 있도록 기능을 마련하였습니다.</p>
				</div>
				<input type="checkbox" id="answer01"> <label for="answer01">클릭스냅이
					처음이시라면?<em></em>
				</label>
				<div>
					<p>클릭스냅 운영진 일동 드림클릭 스냅은 모든 순간이 특별하다고 생각합니다. 나만의 특별한 순간을 간직해보세요.</p>
				</div>
				<input type="checkbox" id="answer02"> <label for="answer02">작가님
					랭킹 시스템 안내 <em></em>
				</label>
				<div>
					<p>안녕하세요. 클릭스냅입니다. 작가님 랭킹은 평점, 인기수 등에 따라 매일 변동됩니다.</p>
				</div>
				<input type="checkbox" id="answer03"> <label for="answer03">예약가능일
					조정안내<em></em>
				</label>
				<div>
					<p>촬영예약의 접수가 D-90일 부터 가능하여 내년 봄 촬영을 위한 예약문의가 클릭스냅 고객센터로 많이
						이어졌습니다. 약을 미리 하고 싶으나 이와 같은 제한 사항에 예약을 하지 못하시는 분들을 위해해당 서비스 기능을
						변경하였습니다. 예약가능일은 기존 D-90일 에서 D-365일 부터 가능하도록 변경하였습니다. 이제 내년 촬영을
						예약하실 수 있습니다.</p>
				</div>
				<input type="checkbox" id="answer04"> <label for="answer04">클릭스냅이
					오픈하였습니다.<em></em>
				</label>
				<div>
					<p>반갑습니다! 클릭스냅방문을 환영합니다.^^ 저희 클릭스냅사이트는 사진촬영작가님과 사진촬영이 필요한 고객님과의
						만남을 주선해주는 공간입니다. 국내에 계시는 많은 프리랜스 촬영작가님과 사진학도, 아마츄어 사진작가님 에게 촬영의
						기회를 드리고자 마련하였으며, 마찬가지로 촬영이 필요한 고객님들께 일반 스튜디오에서 의뢰시 드는 많은 비용에 50%
						이상의 부담을 덜어드리고자 스냅퍼 사이트를 마련하였습니다. 사진촬영을 할 줄 아는 누구라도 스냅퍼 사이트에 갤러리를
						자유롭게 등록할 수 있으며 보다 쉽게 촬영의 기회를 얻을 수 있습니다. 마케팅을 잘하는 스튜디오에 밀려 촬영의 기회를
						잡기 어려우셨던.. 개인블로그나 개인홈페이지에서 활동하셨던 작가님들 또는 투잡으로 활동하시는 분들이나 무료로 봉사하고
						싶으신 분들에게 좋은 기회라고 생각됩니다. 앞으로 더욱 촬영작가님들에게 도움이 되는 스냅퍼가 되길 노력하겠으며 스냅퍼
						또한 촬영작가님들의 많은 충고와 조언을 부탁드립니다. 감사합니다.</p>
				</div>
			</div>

		</div>
	</div>




	<div id="kakao-talk-channel-chat-button"
		data-channel-public-id="_Upxcxjs" data-title="consult"
		data-size="large" data-color="yellow" data-shape="pc"
		data-support-multiple-densities="true"></div>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script>
		window.kakaoAsyncInit = function() {
			Kakao.Channel.createChatButton({
				container : '#kakao-talk-channel-chat-button',
			});
		};

	
	</script>
</body>
</html>