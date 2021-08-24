<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cb00d9c2ad81ceb60ba592db49ca89f8&libraries=services,clusterer"></script>
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

.btn-info{
	float: right;
	margin-top: 30px;
}

.btn-warning{
	float: right;
	margin-top: 30px;
}

.btn-success{
	float: right;
	margin-top: 30px;
}
.btn-primary{
	float: right;
	margin-right: 5px;
	margin-top: 30px;
}
.col-lg-12 .btn-danger{
	float: right;
	margin-top: 30px;
}
#servContent{
 height:auto;
}
.btn_pointColor {background:#090 !important; color:#fff !important; float:right;}
.btn_round {display:inline-block; padding:0 20px; margin:0 1px; border-radius:10px; text-align:center; box-sizing:border-box;}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
	
</head>
<body>
	<c:set var="sVO" value="${sVO}"></c:set>
	<c:set var="iVO" value="${iVO}"></c:set>
	<c:set var="tVO" value="${tVO}"></c:set>
	<c:set var="prin" value="${prin}"></c:set>
	<c:set var="reviewSNO" value="${reviewSNO}"></c:set>
	<c:set var="cnt" value="${cnt}"></c:set>
	<c:set var="avg" value="${avg}"></c:set>
	<c:set var="comp" value="${comp}"></c:set>
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
	<hr>
	<div class="container">
		
	
	<!-- <img alt="" class='img-fluid' src="../resources/images/wedding.jpg"> -->
	<!-- 작가 페이지 상단 프로필 사진부분 -->
	
		<div class="jumbotron">
			<div class='row'>
				<!-- <div class="col-lg-2">
					<img src="../resources/images/basic.jpg" class="rounded float-left"
						alt="...">
				</div> -->
				<div class="col-lg-12">
					<form action="/artPage/modify" method="post">
					<c:forEach var="tVO" items="${tVO}">
						<span class="badge bg-primary">${tVO.tag }</span>
						<%-- <input type="hidden" name="tList" value="${tVO.tag}"> --%>
					</c:forEach>
						<%-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input type="submit" value="dd"> --%>
					</form>
					</br>
					<h2>${sVO.title}</h2>

					<span class='star-rating'> <span style="width: ${avg}0%"></span>
					</span> <span class="badge bg-primary">${avg }/10</span> | <span
						class="badge bg-warning">${cnt }<spring:message code="serviceView.sv6" /></span>

					<br>
					<c:if test="${sVO.artist_Id != prin.principal.username}">
					<button type="button" class="btn btn-info" id="askService"><spring:message code="serviceView.sv7" /></button>
					<button type="button" class="btn btn-primary" id="buyService"><spring:message code="serviceView.sv8" /></button>
					</c:if>
					<c:if test="${sVO.artist_Id == prin.principal.username}">
					<button type="button" class="btn btn-success" id="serviceModify"><spring:message code="serviceView.sv9" /></button>
					<button type="button" class="btn btn-danger" data-target="#certModal" data-toggle="modal"><spring:message code="serviceView.sv10" /></button>
					</c:if>
					
				</div>
			</div>
		</div>
		<!-- 작가 페이지 상단 프로필 사진부분 끝-->
		<!-- 작가 약력 및 텍스트 프로필 -->
		<hr>
		<div class="row">
			<div class="col-md-7">
				<h2><spring:message code="serviceView.sv11" /></h2>
				<br>
				<div id="map" style="width:100%;height:450px;"></div>
			</div>
			<div class="col-md-5" style="border: 1px groove;">
				<div>
					<h3><spring:message code="serviceView.sv12" /></h3>
					<br>
					<p>
						<spring:message code="serviceView.sv13" /><span style="float: right;"> ${sVO.artist_Id}</span>
					</p>
					<p>
						<spring:message code="serviceView.sv14" /><span style="float: right;"> ${sVO.registerDate}</span>
					</p>
					<p>
						<spring:message code="serviceView.sv15" /><span style="float: right;">${sVO.startTime}~${sVO.endTime }</span>
					</p>
					<br>
				</div>
				<div>
					<h3>
						<spring:message code="serviceView.sv22" /> 
						<span style="float: right; font-size: 30px;">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${sVO.resPrice}" /><spring:message code="serviceView.sv23" /> </span>
					</h3>
					<br/>
					
				</div>
				<div id="servContent">
					<h3><spring:message code="serviceView.sv16" /> </h3>
					<!-- <br> -->
					<p>
						<br>
						<span id="content">${sVO.content}</span>
						<br>
					</p>
					<br>
				</div>
				
				
			</div>
		</div>
		<!-- 작가 약력 및 텍스트 프로필 끝 -->
		<hr>
		<div class="row">
			<br>
			<h2><spring:message code="serviceView.sv17" /></h2>
			<div id="carouselExampleControls" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach var="image" items="${iVO}" varStatus="status">
					<div class="carousel-item" id="car${status.count}">
						<img src='/artPage/display?fileName=${image.uploadPath}/${image.uuid}_${image.fileName}' class="d-block w-100" alt="...">
					</div>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden"><spring:message code="serviceView.sv18" /></span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden"><spring:message code="serviceView.sv19" /></span>
				</button>
			</div>

		</div>
		
		<hr>
		<div class="row">
			<br>
			<h2><spring:message code="serviceView.sv20" />
				<c:if test="${comp != 0}"> 
				<a href="#" type="button" data-target="#myModal2" class="btn_pointColor btn_round"
					data-toggle="modal"><spring:message code="serviceView.sv27" /></a>
				 </c:if> 
			</h2>
			<table class="table">
				<tr>
					<th><spring:message code="serviceView.sv24" /> </th>
					<th><spring:message code="serviceView.sv25" /></th>
					<th><spring:message code="serviceView.sv26" /></th>
				</tr>
				<c:forEach var="s" items="${reviewSNO}">
					<tr>
						<td>
						<span class='star-rating'> 
                     		<span class="start-rating" style="width: ${s.grade_star}0%">
                     		</span>
                  		</span>
								  	
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
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
		<form action="/artPage/reviewAdd" method="post">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="justify-content:center;">
						
						<h4 class="modal-title"><spring:message code="serviceView.sv27" /></h4> 
					</div>
						<div class="modal-body" id="targetBody">
							<div class="row" style="margin-right: 0; margin-left: 0; margin-bottom: 10px;">
								<div class="col-md-1"></div>
								<div class="col-md-10">
									<label><spring:message code="serviceView.sv24" /></label>
									<div class="input-group">
										<input type="number" name="grade_star" min="1" max="10" class="form-control" placeholder="<spring:message code='serviceView.sv28' />" value="10" aria-describedby="basic-addon1">
									</div>
									<label><spring:message code="serviceView.sv25" /></label>
									<div class="input-group">
										<textarea name="coment" class="form-control" aria-describedby="basic-addon1"></textarea>
									</div>
									<label><spring:message code="serviceView.sv26" /></label>
									<div class="input-group">
										<input type="text" name="userId" class="form-control" value="${prin.principal.username }" readonly="readonly" aria-describedby="basic-addon1">
									</div>
								</div>
							</div>
								
								<div class="col-md-1"></div>
								
								
								<div class="modal-footer" id="targetFooter">
								<button class="btn btn-default" data-dismiss="modal"><spring:message code="serviceView.sv30" /></button>
								<button class="btn btn-success" type="submit"><spring:message code="serviceView.sv29" /></button>
								</div></div>
					</div>
				
			</div>
		
			 
	
	
		<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }">
		<input type="hidden" name="artistId" value="${sVO.artist_Id }">
		<input type="hidden" name="sno" value="${sVO.sno}">
		<input type="hidden" name="title" value="${sVO.title }">
		</form>
	</div>
	
	<div class="modal fade" id="certModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<form action="/login" method="post">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				
				<h4 class="modal-title"><spring:message code="serviceView.sv21" /></h4>
					
					<br>
					
					<div class="btn-group btn-group-justified" role="group"
						aria-label="...">
						<!-- <div class="btn-group" role="group">
							<button type="button" id="custLogin" class="btn btn-default"><spring:message code="label.userlogin" /></button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="artistLogin" class="btn btn-default"><spring:message code="label.artlogin" /></button>
						</div> -->
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-info" id="delete"><spring:message code="serviceView.sv31" /></button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-warning" data-dismiss="modal"><spring:message code="serviceView.sv30" /></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }">
	</form>
</div>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var carousel = $('#car1');
	console.log(carousel);
	carousel.addClass("active");
	
	$(document).ready(function(){

		var address = document.getElementById('address');
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(${sVO.latStart}, ${sVO.lngStart}), //지도의 중심좌표.
			level: 7 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		//지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		});
		
		var drawingCircle;
		var drawingLine;
		var drawingOverlay;
		var startLatLng = new kakao.maps.LatLng(${sVO.latStart}, ${sVO.lngStart});
		var targetLatLng = new kakao.maps.LatLng(${sVO.latTarget}, ${sVO.lngTarget});
		console.log(startLatLng);
		console.log(targetLatLng);
		
		/* var radius = Math.round(drawingCircle.getRadius()),   
        content = '<div class="info" style="background-color: white;">반경 <span class="number">'
        + radius + '</span>m</div>'; */
		
		drawingCircle = new kakao.maps.Circle({ 
            strokeWeight: 1, // 선의 두께입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid', // 선의 스타일입니다
            fillColor: '#00a0e9', // 채우기 색깔입니다
            fillOpacity: 0.2 // 채우기 불투명도입니다 
        });  
		
		drawingLine = new kakao.maps.Polyline({
            strokeWeight: 3, // 선의 두께입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        }); 
		
		drawingOverlay = new kakao.maps.CustomOverlay({
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 1
        });  
		
		var polyline = new kakao.maps.Polyline({
            path: [startLatLng, targetLatLng], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
            strokeWeight: 3, // 선의 두께 입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
		
		var circle = new kakao.maps.Circle({ 
            center : startLatLng, // 원의 중심좌표입니다
            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
            strokeWeight: 1, // 선의 두께입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid', // 선의 스타일입니다
            fillColor: '#00a0e9', // 채우기 색깔입니다
            fillOpacity: 0.4  // 채우기 불투명도입니다 
        });
		
		/* var radius = Math.round(drawingCircle.getRadius()),   
        content = '<div class="info" style="background-color: white;">반경 <span class="number">'
        + radius + '</span>m</div>'; */
		
		var radiusOverlay = new kakao.maps.CustomOverlay({
            //content: content, // 표시할 내용입니다
            position: targetLatLng, // 표시할 위치입니다. 클릭한 위치로 설정합니다
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 1 
        });  
		
		
		
		// 원을 지도에 표시합니다
        circle.setMap(map); 
        
        // 선을 지도에 표시합니다
        //polyline.setMap(map);
        
        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
        radiusOverlay.setMap(map);
        var sno = ${sVO.sno};
        var token = '${_csrf.token }';
        var artistId = '${sVO.artist_Id}';
        $('#delete').on('click', function(){
        	sno = parseInt(sno);
        	$.ajax({
    			type: 'delete',
    			url: '/artPage/'+sno+'/?${_csrf.parameterName }='+token,
    			contentType : "application/json; charset=utf-8",
    			success:function(deleteResult, status, xhr){
    				alert('삭제가 완료되었습니다.');
    				location.href="/artPage/serviceList?artistId="+artistId;
    			},
    			error:function(xhr, status, er){
    				alert(er);
    			}
    		});
        	
        });
        
        $('#serviceModify').on('click', function(){
        	location.href='/artPage/modify?sno='+${sVO.sno};
        });
        
        var content = $('#content').text();
        var brcontent = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
        console.log(brcontent);
        $('#content').html(brcontent);
        
        console.log(brcontent.split('<br/><br/>'||'<br/> <br/>'));
        
        $('#askService').on('click', function(){
        	location.href='/resBoard/resList?sno='+${sVO.sno}+"&&artist_Id="+'${sVO.artist_Id}';
        });
        
        $('#buyService').on('click',function(){
        	location.href='/payment/pay?sno='+${sVO.sno}+'&writer='+'${prin.principal.username}';
        });
        
	});
</script>
</html>