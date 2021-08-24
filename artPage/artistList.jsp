<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
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
width:30px;
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
	width: 120px;
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

.row a {
	float : right;
}
.btn_pointColor {background:#090 !important; color:#fff !important;}
.btn_round {display:inline-block; padding:0 20px; margin:0 1px; border-radius:10px; text-align:center; box-sizing:border-box;}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
	
</head>
<body>
	<c:set var="artist" value="${artist}"></c:set>
	<c:set var="review" value="${review}"></c:set>
	<c:set var="cnt" value="${cnt}"></c:set>
	<c:set var="avg" value="${avg}"></c:set>
	<c:set var="service" value="${list }"></c:set>
	<c:set var="prin" value="${prin }"></c:set>
	<c:set var="acnt" value="${acnt }"></c:set>
	<c:set var="account" value="${account}"></c:set>
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
					<li><a class="menuLink" href="/artPage/artistList?artistId=${artist.artistId}">INTRODUCTION</a></li>
					<li><a class="menuLink" href="/artPage/portfolio?artistId=${artist.artistId}">PORTFOLIO</a></li>
					<li><a class="menuLink" href="/artPage/serviceList?artistId=${artist.artistId}">POSTING LIST</a></li>
					<li><a class="menuLink" href="/artPage/calMain?artistId=${artist.artistId}">SCHEDULE</a></li>
					<c:if test="${prin.principal.username==artist.artistId}">
					<li><a class="menuLink" href="/artPage/register?artistId=${prin.principal.username}">POSTING REGISTER</a></li>
					</c:if>
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
					<img src="../resources/images/demo/${artist.profileImg}" class="rounded float-left"
						alt="...">
				</div>
				<div class="col-lg-10">
					<h2>${artist.artistId}</h2>

					<span class='star-rating'> <span style="width: ${avg}0%"></span>
					</span> <span class="badge bg-primary">${avg}/10</span> | <span
						class="badge bg-warning">${cnt}<spring:message code="artistList.p" /></span>
					<c:if test="${prin.principal.username!=null}">
					<button type="button" data-toggle="modal" data-target="#chatModal" class="btn btn-info" id="askService"><spring:message code="artistList.re1" /></button>
					</c:if>
				</div>
			</div>
		</div>
		<!-- 작가 페이지 상단 프로필 사진부분 끝-->
		<!-- 작가 약력 및 텍스트 프로필 -->
		<hr>
		<div class="row">
			<div class="col-md-7">
				<h2><spring:message code="artistList.aristIntro" /></h2>
				<br>
				<p>
					${artist.introduce}
				</p>
			</div>
			<div class="col-md-5" style="border: 1px groove;">
				<div>
					<h3><spring:message code="artistList.c" /></h3>
					<br>
					<p>
						<spring:message code="artistList.c1" /><span style="float: right;">${acnt}<spring:message code="artistList.c2" /></span>
					</p>
					<p>
						<spring:message code="artistList.c3" /><span style="float: right;">${avg}0%</span>
					</p>
					<p>
						<spring:message code="artistList.c5" /><span style="float: right;">${artist.penalty}<spring:message code="artistList.c6" /></span>
					</p>
					<br>
				</div>
				<div>
					<h3><spring:message code="artistList.c7" /></h3>
					<br>
					<p>
						<spring:message code="artistList.c8" /><span style="float: right;">${account }<spring:message code="artistList.c8" /></span>
					</p>
					<p>
						<spring:message code="artistList.c10" /><span style="float: right;">${artist.concept}</span>
					</p>
					<br>
				</div>
				<div>
					<h3><spring:message code="artistList.c14" /></h3>
					<br>
					<ul>
						${artist.career}
					</ul>
					<br>
				</div>
			</div>
		</div>
		<!-- 작가 약력 및 텍스트 프로필 끝 -->
		<hr>
				
		<div class="row">
			<br>
			<h2><spring:message code="artistList.c15" />
			</h2>
			<table class="table">
				<tr>
					<th><spring:message code="artistList.c16" /></th>
					<th><spring:message code="artistList.c17" /></th>
					<th><spring:message code="artistList.c18" /></th>
					<th><spring:message code="artistList.c19" /></th>
				</tr>
				<c:forEach var="s" items="${review}">
					<tr>
						<td>
						<span class='star-rating'> 
                     		<span class="start-rating" style="width: ${s.grade_star}0%">
                     		</span>
                  		</span>
								  	
						</td>
						<td>
							${s.title}
						</td>
						<td>
							${s.coment}
						</td>
						<td>
							${s.userId}
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
<script>
$(document).ready(function(){
	
	var count = 0;
	var target;
	
	$('#askService').on('click',function(){
		console.log("aaa");
		
		$('.chat_target').each(function(index, item){
			//전체 div list를 돌면서 해당 작가와의 채팅이 존재하는지 확인
			console.log($(item).data('target'));
			
			if($(item).data('target')=='${artist.artistId}'){
				count += 1; //있다면 count 증가
				target = $(item).data('target'); //해당 작가 아이디 저장
			}
			
		});
		console.log("count : "+count);
		console.log("target : "+target);
		
		if(count==1){//만일 채팅 목록에 해당 작가가 존재하는 경우
			//더 추가할 필요가 없이 작가와 나누던 채팅 화면을 보여줌
			$(".chat_target").attr('class','chat_target chat_list');//active 초기화
			$('div[data-target="'+target+'"]').addClass("active_chat");//선택 됐을 때의 이벤트
			
			$.ajax({
				type: 'get',
				url:'/getChatHistory?sender_id=${prin.principal.username}&&target_id='+target,
				contentType:"application/json; charset=utf-8",
				success: function(result,status,xhr){
					console.log(result);
					$('#chatHistory').empty();
					$.each(result,function(index, item){
						if(item.target_id=="${prin.principal.username}"){
							var chatHistory = '<div class="incoming_msg" id="targetId" data-sender='+item.sender_id+'><div class="incoming_msg_img">';
							chatHistory += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>';
							chatHistory += '<div class="received_msg"><div class="received_withd_msg"><p>'+item.content+'</p>';
							chatHistory += '<span class="time_date">'+item.sendDate+'</span></div></div></div>';
							$("#chatHistory").append(chatHistory);
						}else{
							var chatHistory = '<div class="outgoing_msg"><div class="sent_msg"><p>'+item.content+'</p>';
							chatHistory += '<span class="time_date">'+item.sendDate+'</span></div>';
							$("#chatHistory").append(chatHistory);
						}		
					});		
				}
			});
			
		}else{ //만일 채팅 목록에 해당 작가가 존재하지 않는 경우
			//새롭게 왼쪽$('chat_target') 부분에 추가하고
			//db에 작가의 인사말 집어넣어서 채팅이 가능하게 만들어준다.
			
			$.ajax({ //새로운 채팅방을 만드는 기능
				type: 'get',
				url:'/createChatRoom?user_id=${prin.principal.username}&&artist_id='+'${artist.artistId}',
				contentType:"application/json; charset=utf-8",
				success: function(result,status,xhr){
					console.log(result);
					var str = '<sec:authorize access="hasRole('ROLE_CUST')"><a href="#" onclick="return false"><div class="chat_target chat_list" data-target="'+result.artist_id+'">';
					str += '<div class="chat_people"><div class="chat_img">';
					str += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>';
					str += '<div class="chat_ib"><h5>'+result.artist_id+'<span class="chat_date">Dec 25</span></h5>';
					str += '</div></div></div></a></sec:authorize>';
					str += '<sec:authorize access="hasRole('ROLE_ARTIST')"><a href="#" onclick="return false"><div class="chat_target chat_list" data-target="'+result.user_id+'">';
					str += '<div class="chat_people"><div class="chat_img">';
					str += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>'; 
					str += '<div class="chat_ib"><h5>'+result.user_id+'<span class="chat_date">Dec 25</span></h5>';
					str += '</div></div></div></a></sec:authorize>';
					$("#chatList").append(str);
					$(".chat_target").attr('class','chat_target chat_list');
					$('div[data-target="'+result.artist_id+'"]').addClass("active_chat");
				}
			});
		
			$.ajax({
				type : 'get',
				url : '/createGreetingMsg?target_id=${prin.principal.username}&&sender_id='+'${artist.artistId}'+
						'&&content=안녕하세요 아티스트 ${artist.artistId}입니다. 문의하실 내용을 말씀해 주세요!',
				contentType : "application/json; charset=utf-8",
				success: function(result, status, xhr){
					console.log(result);
					$('#chatHistory').empty();
					if(result[0].target_id=="${prin.principal.username}"){
						var chatHistory = '<div class="incoming_msg" id="targetId" data-sender='+result[0].sender_id+'><div class="incoming_msg_img">';
						chatHistory += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>';
						chatHistory += '<div class="received_msg"><div class="received_withd_msg"><p>'+result[0].content+'</p>';
						chatHistory += '<span class="time_date">'+result[0].sendDate+'</span></div></div></div>';
						$("#chatHistory").append(chatHistory);
					}else{
						var chatHistory = '<div class="outgoing_msg"><div class="sent_msg"><p>'+result[0].content+'</p>';
						chatHistory += '<span class="time_date">'+result[0].sendDate+'</span></div>';
						$("#chatHistory").append(chatHistory);
					}
				}
			})
		
		}
	});	
	
});
//document ready function
</script>
</html>