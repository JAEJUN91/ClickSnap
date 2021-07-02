<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 스케쥴 관리 페이지 : 이재준 -->  
<!DOCTYPE html>
<html>
<jsp:include page="../include/nav.jsp"></jsp:include> 	
<style>
@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'Cafe24Oneprettynight';
}

<style>

  body {
    margin: 0;
    padding: 0;

    font-size: 14px;
  }

  #script-warning {
    display: none;
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    text-align: center;
    font-weight: bold;
    font-size: 12px;
    color: red;
  }

  #loading {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
  }

  #calendar {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 10px;
  }

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

</style>
<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="styleSheet" type="text/css" href="../resources/css/fullcalendar/main.css"/>
	


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

<script type="text/javascript" src="<c:url value='../resources/js/fullcalendar/main.js'/>"></script>
<script src="<c:url value='/resources/js/fullcalendar/locales/ko.js'/>"></script>
<script src="<c:url value='/resources/js/fullcalendar/locales/it.js'/>"></script>

<title>Calendar</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.parallax-1.1.3.js"></script>
<script type="text/javascript" src="/resources/js/jquery.localscroll-1.2.7-min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.scrollTo-1.4.2-min.js"></script>

<script type="text/javascript">
var calendar = null;

$(document).ready(function() {
  var calendarEl = document.getElementById('calendar');
  var all_events =null;
  all_events = loadingEvents();

	calendar = new FullCalendar.Calendar(calendarEl, {
    displayEventTime: false,
    initialDate: '1991-06-17',
    locales: 'ko',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,listYear'
    }, 
    events: all_events
    
  });
	

  calendar.render();
  
});
//document ready function 끝

// 1. 전체 이벤트 데이터를 추출 2. ajax로 서버에 전송하여 db에 저장

	function loadingEvents(){
	var return_value = null;
	
		$.ajax({
			type:'POST',
			url:'/artPage/NpCalendarAction',
			data: {},
			dataType:'json',
			contentType:"application/json;charset=utf-8",
			async:false,
			
			success: function(result){
				
				alert(result);
			},
			error: function(xhr, status, er){
				alert("에러발생"+ er);
			}
			
		});
}

</script>


</head>
<body>
<!-- Header -->
		<header style="background-image: url(../resources/images/artist_bg1.jpg);">
			<div class="container" >
				<div class="intro">
					<div class="intro-text">
						
					</div>
				</div>
			</div>
		</header>
	<div class="row">
		<nav id="topMenu">
			<ul>
				<li><a class="menuLink" href="#">INTRODUCTION</a></li>
				<li><a class="menuLink" href="#">PORTFOLIO</a></li>
				<li><a class="menuLink" href="#">POSTING LIST</a></li>
				<li><a class="menuLink" href="#">SCHEDULE</a></li>
				<li><a class="menuLink" href="#">POSTING REGISTER</a></li>

			</ul>
		</nav>
		</div>
		
		<!-- #스케쥴 달력  -->
		<div>
		
		<div>
			<div id='calendar'></div>
		</div>

	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>

	

</body>
</html>