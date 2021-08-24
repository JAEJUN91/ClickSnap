<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>  
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

#calendar a{
	color:black;
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

<title><spring:message code="calMain.t1" /></title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.parallax-1.1.3.js"></script>
<script type="text/javascript" src="/resources/js/jquery.localscroll-1.2.7-min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.scrollTo-1.4.2-min.js"></script>

<script type="text/javascript">

$(document).ready(function() {

  var calendarEl = document.getElementById('calendar');
  var all_events =null;
  var csrfName = "${_csrf.headerName}";
  var csrfToken = "${_csrf.token}";

  all_events = loadingEvents();   // all_events 변수에 function loadingEvent() 기능 저장

	calendar = new FullCalendar.Calendar(calendarEl, {
    displayEventTime: false,
    initialDate: '2021-06-01',  		// 기준 날짜 기입
  			
    /*headerToolbar: {   				// header view 형태 조정
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,listYear'
    },*/ 
    events: all_events   // 저장된 데이터 표시
    
  });
 calendar.render();
  

	function loadingEvents(){    


		$.ajax({
			type:'get',
			url:'/artPage/NpCalendarAction/'+'${prin.principal.username}',   // ajax 방식으로 controller 접근
			data: {},
			beforeSend : function(xhr){
                xhr.setRequestHeader(csrfName, csrfToken);
             },
			dataType:'json',
			contentType:"application/json",
			async:false,
			
			success: function(result){

				var list = result;    // list 에 result 값 저장
    			
    			
     			var calendarEl = document.getElementById('calendar');
    			var events = list.map(function(item) {  // map 형태로 생성
    				console.log(typeof(item.resDate));
    				return {
						title : item.resTitle,  					//title에 db값 resTitle저장
						start : item.resDate + "T" + item.resTime,   // start에 resDate + resTime 저장
						end : item.resDate
					}
    				
    			});
    			/*
					※ fullCalender 이벤트 캑체가 갖는 필드

var calendar = new Calendar(calendarEl, {
  events: [
    {
      title  : 'event1',
      start  : '2010-01-01'
    },
    {
      title  : 'event2',
      start  : '2010-01-05',
      end    : '2010-01-07'
    },
    {
      title  : 'event3',
      start  : '2010-01-09T12:30:00',
      allDay : false // will make the time show
    }
  ]
});
title : 캘린더에 표시되는 일정의 이름

start : 캘린더에 표시되는 일정 시작 일

end : 캘린더에 표시되는 일정 마지막 일

allDay : 일정이 하루 전체인지 여부(True, false)

			
    			*/
    			
				var calendar = new FullCalendar.Calendar(calendarEl, {
					events : events,
					locales :'ko',
					eventTimeFormat: { // like '14:30:00'
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					  }
				});
console.log(events);
				setTimeout(() => {
					calendar.render();
				}, 500);
			},
			error: function(xhr, status, er){
				alert("에러발생 했어용"+ er);
			}
			
		});
		// \.ajax
}
  
  //   \.function loadingEvent() 
  
});
//document ready function 끝



</script>


</head>
<body>
<!-- Header -->
<c:set var="prin" value="${prin}"></c:set>
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
				<li><a class="menuLink" href="/artPage/artistList?artist_Id=${prin.principal.username}"><spring:message code="calMain.c1" /></a></li>
				<li><a class="menuLink" href="/artPage/portfolio?artist_Id=${prin.principal.username}"><spring:message code="calMain.c2" /></a></li>
				<li><a class="menuLink" href="/artPage/serviceList?artist_Id=${prin.principal.username}"><spring:message code="calMain.c3" /></a></li>
				<li><a class="menuLink" href="/artPage/calMain?artist_Id=${prin.principal.username}"><spring:message code="calMain.c4" /></a></li>
				<li><a class="menuLink" href="/artPage/register?artist_Id=${prin.principal.username}"><spring:message code="calMain.c5" /></a></li>
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