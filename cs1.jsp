<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 상품 등록 페이지 : 이재준 -->
<!DOCTYPE html>
<html>
<style>
#cs {
	width: auto;
	height: 550px;
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

#kakao-talk-channel-chat-button {
	position: fixed;
	top: 700px;
	right: 0px;
}
dl {
  position: relative;
  width: 300px;
  height: 100px;
}
dt {
  height: 30px;
  float: left;
  width: 150px;
  z-index: 9;
  position: relative;
  text-align: center;
  background: #ddd;
}
dd {
  position: absolute;
  padding-top: 30px;
  background-color: #f3f3f3;
  width: 300px;
  height: 100px;
  margin: 0;
}
dd.hidden {
   display: none;
}

</style>
<head>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<jsp:include page="include/nav.jsp"></jsp:include>

<meta charset="UTF-8">
<title>CS</title>

</head>
<body>
	<header id="cs"
		style="background-image: url(../resources/images/csimg.JPG)">
		<div class="container">
			<div class="slider-container">
				<div class="intro-text"></div>
			</div>
		</div>
	</header>

	<div class="row">
		<div class="col-lg-12">
			<nav id="topMenu">
					<!-- 탭메뉴 만들기 -->
					<dl>
						<dt>주의사항</dt>
						<dd>환불은 최소 3일, 최대 14일까지 소요됩니다.</dd>
						<dt>자주묻는질문</dt>
						<dd class="hidden">두번째 탭메뉴 내용은 여기</dd>
					</dl>
			</nav>
		</div>
	</div>

	<div id="kakao-talk-channel-chat-button"
		data-channel-public-id="_Upxcxjs" data-title="consult"
		data-size="large" data-color="yellow" data-shape="pc"
		data-support-multiple-densities="true"></div>


	<jsp:include page="include/footer.jsp"></jsp:include>

	<script>
		window.kakaoAsyncInit = function() {
			Kakao.Channel.createChatButton({
				container : '#kakao-talk-channel-chat-button',
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
			fjs.parentNode.insertBefore(js, fjs);
		})(document, 'script', 'kakao-js-sdk');
	
		var $menuEle = $('dt'); // 탭메뉴를 변수에 지정
		$menuEle.click(function() { // 탭메뉴 클릭 이벤트
		    $('dd').addClass('hidden');
		    $(this).next().removeClass('hidden');
		})
		
		</script>


</body>
</html>