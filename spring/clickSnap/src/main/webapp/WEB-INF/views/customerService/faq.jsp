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
	background: url('../../resources/images/arrow.png') 0 0 no-repeat;
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
					<li><a class="menuLink" href="/customerService/cs">주의사항</a></li>
					<li><a class="menuLink" href="/customerService/faq">자주묻는질문</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="accordion">
				<input type="checkbox" id="answer00"> 
				<label for="answer00">[구매]촬영예약 확정이 되었는데 제가 취소를 해야합니다. 어떻게 해야할까요?<em></em>
				</label>
				<div>
					<p>우선 해당 작가님에게 신속히 통보해 주시기 바라며, 예약확인페이지에서 취소버튼을 클릭하여 취소내용을
						접수해주시기 바랍니다. 예약접수회원에 의한 촬영 취소시 아래와 같이 환불되며, 미환불된 패널티 금액은
						포토그래퍼회원(촬영작가) 및 클릭스냅서비스 에 보상됩니다. 최종 확정된 시점으로 부터 24시간내 취소시 100% 환불
						촬영일 기준 45일전 취소시 100% 환불 촬영일 기준 44일~40일전 취소시 80% 환불, 예약원금(예약기본금액)의
						20% 패널티 금액 미환불 촬영일 기준 39일~30일전 취소시 60% 환불, 예약원금(예약기본금액)의 40% 패널티
						금액 미환불 촬영일 기준 29일~25일전 취소시 50% 환불, 예약원금(예약기본금액)의 50% 패널티 금액 미환불
						촬영일 기준 24일~20일전 취소시 40% 환불, 예약원금(예약기본금액)의 60% 패널티 금액 미환불 촬영일 기준
						19일~15일전 취소시 20% 환불, 예약원금(예약기본금액)의 80% 패널티 금액 미환불 촬영일 기준 14일~10일전
						취소시 10% 환불, 예약원금(예약기본금액)의 90% 패널티 금액 미환불 촬영일 기준 9일~0일전 취소시 0% 환불,
						예약원금(예약기본금액)의 100% 패널티 금액 미환불 단 예약접수회원의 신체손상 또는 사망으로 인한 촬영취소시에는
						미환불 패널티는 적용되지 않습니다.</p>
				</div>
				<input type="checkbox" id="answer01"> 
				<label for="answer01">[구매]예약금을 입금했습니다. 언제 확정처리가 되나요?<em></em>
				</label>
				<div>
					<p>예약금 입금 확인 시 해당 포토그래퍼회원님을 통해 "예약확정"여부가 2영업일 내에 안내 됩니다.
						포토그래퍼회원(촬영작가)의 스케쥴 미반영으로 해당일에 개인적인 별도의 촬영스케쥴이 있을 수 있습니다. 이 경우
						포토그래퍼회원(촬영작가)의 "예약거절" 로 예약이 취소 될 수 있으며, 예약금은 전액 환불해드립니다.
						포토그래퍼회원(촬영작가)의 최종예약승인(디파짓/촬영보증금)이 확인되면 촬영예약접수가 최종확정되며,최종확정시 양 상호간
						연락처가 공개되며, 예약확인페이지에서 확인할 수 있습니다. 최종확정이 된 경우 공개된 연락처를 통하여 촬영 시간과
						장소를 재확인 하시고, 별도의 요청사항이 있는 경우 추가협의하시기 바랍니다.</p>
				</div>
				<input type="checkbox" id="answer02"> 
				<label for="answer02">[댓글]댓글에서 연락처를 주고 받을 수는 없나요?<em></em>
				</label>
				<div>
					<p>개인정보 및 연락처제공은 촬영예약접수 과정을 통해서만 서로 공유되고 있으며, 채팅에서 개인정보등을 바로 주고
						받는 경우의 행위는 원칙적으로 금지하고 있습니다. 한편 변칙적 이용을 통해 개인정보 등을 주고받는 경우 서비스이용을
						제한하고 있으니 유의해 주시기 바랍니다.</p>
				</div>
				<input type="checkbox" id="answer03"> <label for="answer03">촬영비용은 얼마인가요?<em></em></label>
				<div>
					<p>스냅퍼에서 활동하시는 포토그래퍼회원마다 등록한 비용이 다릅니다. 촬영이 필요한 지역과 예산에 따라 검색하신
						후 포토그래퍼회원들이 등록한 촬영갤러리 상품페이지를 클릭하세요. 해당 페이지에서 촬영비용, 촬영시간 및 제공상품,
						제공기한, 추가출장비등의 설명을 살펴보시기 바랍니다. 추가로 궁금한 사항은 채팅문의를 통해 해당 포토그래퍼회원에게
						문의해 주세요.</p>
				</div>
				<input type="checkbox" id="answer04"> <label for="answer04">[구매]촬영예약 확정 후, 작가님과 연락이 닿지 않습니다.<em></em></label>
				<div>
					<p>클릭스냅에서는 유사한 클레임이 발생하지 않도록 노력하고 있으며, 아래와 유사한 클레임이 발생하는 경우
						후기시스템과 더불어 아래와 같은 패널티장치를 마련하여 중재조치를 취하고 있으니, 참고하여 이용해 주시기 바랍니다.
						스냅퍼의 중재역할 및 중재 프로세스 촬영예약의 확정이후 별도 고지 없이 포토그래퍼회원(촬영작가)에게 연락이 닿지 않을시
						1차 중재 클릭스냅 고객지원팀에서 모든 연락채널을 동원하여 연락을 2차례 이상 시도하여, 예약접수 회원에게 연락할 것을
						요청합니다. 지속적으로 연락이 닿지 않는 경우의 조치사항을 함께 통보합니다. 2차 중재(최종) 연락을 시도한 후
						"5영업일 이상" 지속적으로 연락이 되지 않을시 포토그래퍼회원(촬영작가)에 의한 촬영취소를 처리한 후
						예약금(실입금금액) 100% 환불 및 촬영일 기준에 따라 추가 환불됩니다. 촬영일 기준 "D-3 영업일" 이상
						지속적으로 연락이 되지 않을시 포토그래퍼회원(촬영작가)에 의한 촬영취소를 처리한 후 예약금(실입금금액) 100% 환불
						및 예약원금(예약기본금액)의 200% 추가 환불됩니다. 해당 포토그래퍼회원(촬영작가)의 촬영상품갤러리는 임의 폐쇄조치
						되며 일정기간 계정에 부여된 특정 기능들을 이용할 수 없습니다. 필요시 예약접수 회원에게 새로운
						포토그래퍼회원(촬영작가)를 섭외할 수 있도록 지원할 수 있으며, 이 경우 스피드촬영의뢰 게시판에 글쓰기 권한을 부여한
						후 답변을 한 포토그래퍼회원들에 대하여 최대 5명까지 연락처 전달을 스냅퍼 고객지원팀에 요청할 수 있습니다. 이 외
						스냅퍼 고객지원팀에서 포토그래퍼의 직접섭외 및 제공의무는 없으며 주장 할 수 없습니다.</p>
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