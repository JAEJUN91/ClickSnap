<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <!-- 상품 등록 페이지 : 이재준 -->  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>

.uploadResult{
width:100%;
background-color: #ddd;
}
.uploadResult ul{
display: flex;
flex-flow: row;
justify-content: center;
align-items: center;
}
.uploadResult ul li{
list-style: none;
padding: 10px;
}
.uploadResult ul li img{
width:50px;
}

.body > div.container > div:nth-child(3) > div > div > div.panel-body > div.uploadResult > ul > li:nth-child(1) > div > button{
	padding : 0px;
}

@font-face {
	font-family: 'Cafe24Oneprettynight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

 * {
	margin: 0;
	padding: 0;
	font-family: 'Cafe24Oneprettynight';
}

/* html, body {
	margin: 0;
	padding: 0;
	font-size: 14px;
} */
 

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


</style>
<jsp:include page="../include/nav.jsp"></jsp:include>

<meta charset="UTF-8">
<title>Register</title>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cb00d9c2ad81ceb60ba592db49ca89f8&libraries=services,clusterer"></script>
<script>

var tagArr = new Array(); //필터 내용을 저장하는 배열 
var showFilterValue = document.getElementById("showFilter");//필터입력값 보여주기 위한 text 
//필터 내용을 저장하는 
function makeFilter(target){ 
   var tag = target.value; //check value 
   var confirmCheck = target.checked; //check여부 확인 
   console.log("필터 선택값 : "+tag); 
   console.log("선택여부 : "+confirmCheck); // check true 
   if(confirmCheck == true){ 
      console.log("check"); 
      tagArr.push(tag); // check value filter 배열에 입력 // check false 
   }else{ 
      tagArr.splice(tagArr.indexOf(tag), 1); // check value filter 배열내용 삭제 
   } 
 	var addTagArr = tagArr.join(" ");
 	
   showFilter.value = addTagArr;
   
   console.log("필터입력값 출력 : "+tagArr); } 

</script>

</head>
<body>
	<header style="background-image: url(../resources/images/artist_bg2.jpg)">
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
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header" style="font-family: 'Cafe24Oneprettynight';">포스팅 등록</h3>
				<label><img src="/resources/images/exclamation.png" class="imgg">
					스타일 또는 분야별로 나누어 등록해주시기 바랍니다.</label><br> <label><img
					src="/resources/images/exclamation.png" class="imgg"> 샘플 이미지는 최소 세장 이상
					올려주시기 바랍니다.</label>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				
				</div>
				<!-- /.panel-heading -->
					<div class="panel-body">
						<form role="form" id="artist_prod" method="post" action="/artPage/register">
							<div class="form-group">
								<label for="exampleFormControlSelect1">카테고리</label> <select
									class="form-control" id="exampleFormControlSelect1" name="category">
									<option value="travel">여행</option>
									<option value="family">가족</option>
									<option value="friend">우정</option>
									<option value="marriage">결혼</option>
									<option value="couple">연인</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">제 목</label> <input
									type="text" class="form-control" id="exampleFormControlInput1"
									placeholder="이모티콘 사용불가, 특수문자는 일부만 허용됩니다." name="title">
							</div>
							<!-- <div class="form-group">
							<label for="exampleFormControlSelect2">Example multiple
								select</label> <select multiple class="form-control"
								id="exampleFormControlSelect2">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
 -->
							<div class="form-group">
								<label for="exampleFormControlTextarea1">상품 내용</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3" name="content" placeholder="사진을 더즐겁게 감상하기 위한 설명을 적어주세요."
									maxlength="2000"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1"># 포스팅 추천태그</label>
								<table style="width:100%">
								<tr>
								<td><input type="checkbox" name="tList" value="# 싱그러운" onchange="makeFilter(this);"/> # 싱그러운</td>
       							<td><input type="checkbox" name="tList" value="# 밝은" onchange="makeFilter(this);"/> # 밝은</td>
       						    <td><input type="checkbox" name="tList" value="# 행복한" onchange="makeFilter(this);"/> # 행복한</td>
      						    <td><input type="checkbox" name="tList" value="# 로맨틱한" onchange="makeFilter(this);"/> # 로맨틱한</td>
      						    <td><input type="checkbox" name="tList" value="# 환상적인" onchange="makeFilter(this);"/> # 환상적인</td>
      						    <td><input type="checkbox" name="tList" value="# 신나는" onchange="makeFilter(this);"/> # 신나는</td>
      						    <td><input type="checkbox" name="tList" value="# 익살맞은" onchange="makeFilter(this);"/> # 익살맞은</td>
      						    <td><input type="checkbox" name="tList" value="# 비극적인" onchange="makeFilter(this);"/> # 비극적인</td>
      						    <td><input type="checkbox" name="tList" value="# 재미있는" onchange="makeFilter(this);"/> # 재미있는</td>
      						    <td><input type="checkbox" name="tList" value="# 활기찬" onchange="makeFilter(this);"/> # 활기찬</td>
      						    <td><input type="checkbox" name="tList" value="# 희망에 찬" onchange="makeFilter(this);"/> # 희망에 찬</td>
      						    <td><input type="checkbox" name="tList" value="# 정열적인" onchange="makeFilter(this);"/> # 정열적인</td>
      						    </tr>
      						    <tr>
      						    <td><input type="checkbox" name="tList" value="# 기쁜" onchange="makeFilter(this);"/> # 기쁜</td>
      						    <td><input type="checkbox" name="tList" value="# 낭만적인" onchange="makeFilter(this);"/> # 낭만적인</td>
      						    <td><input type="checkbox" name="tList" value="# 풍자적인" onchange="makeFilter(this);"/> # 풍자적인</td>
      						    <td><input type="checkbox" name="tList" value="# 분위기 있는" onchange="makeFilter(this);"/> # 분위기 있는</td>
      						    <td><input type="checkbox" name="tList" value="# 화목한" onchange="makeFilter(this);"/> # 화목한</td>
      						    <td><input type="checkbox" name="tList" value="# 멋진" onchange="makeFilter(this);"/> # 멋진</td>
      						    <td><input type="checkbox" name="tList" value="# 못생긴" onchange="makeFilter(this);"/> # 못생긴</td>
      						    <td><input type="checkbox" name="tList" value="# 신선한" onchange="makeFilter(this);"/> # 신선한</td>
      						    <td><input type="checkbox" name="tList" value="# 우스꽝스러운" onchange="makeFilter(this);"/> # 우스꽝스러운</td>
      						    <td><input type="checkbox" name="tList" value="# 귀여운" onchange="makeFilter(this);"/> # 귀여운</td>
      						    <td><input type="checkbox" name="tList" value="# 부드러운" onchange="makeFilter(this);"/> # 부드러운</td>
      						    <td><input type="checkbox" name="tList" value="# 수줍은" onchange="makeFilter(this);"/> # 수줍은</td>
      						    </tr>
      						    <tr>
      						    <td><input type="checkbox" name="tList" value="# 정의로운" onchange="makeFilter(this);"/> # 정의로운</td>
      						    <td><input type="checkbox" name="tList" value="# 게으른" onchange="makeFilter(this);"/> # 게으른</td>
      						    <td><input type="checkbox" name="tList" value="# 온화한" onchange="makeFilter(this);"/> # 온화한</td>
      						    <td><input type="checkbox" name="tList" value="# 가냘픈" onchange="makeFilter(this);"/> # 가냘픈</td>
      						    <td><input type="checkbox" name="tList" value="# 거친" onchange="makeFilter(this);"/> # 거친</td>
      						    <td><input type="checkbox" name="tList" value="# 잘생긴" onchange="makeFilter(this);"/> # 잘생긴</td>
      						    <td><input type="checkbox" name="tList" value="# 서글픈" onchange="makeFilter(this);"/> # 서글픈</td>
      						    <td><input type="checkbox" name="tList" value="# 더러운" onchange="makeFilter(this);"/> # 더러운</td>
      						    <td><input type="checkbox" name="tList" value="# 깨끗한" onchange="makeFilter(this);"/> # 깨끗한</td>
      						    <td><input type="checkbox" name="tList" value="# 고통스러운" onchange="makeFilter(this);"/> # 고통스러운</td>
      						    <td><input type="checkbox" name="tList" value="# 괴이한" onchange="makeFilter(this);"/> # 괴이한</td>
      						    <td><input type="checkbox" name="tList" value="# 다정다감한" onchange="makeFilter(this);"/> # 다정다감한</td>
      						    </tr>
      						    <tr>
      						    <td><input type="checkbox" name="tList" value="# 능청스러운" onchange="makeFilter(this);"/> # 능청스러운</td>
      						    <td><input type="checkbox" name="tList" value="# 다급한" onchange="makeFilter(this);"/> # 다급한</td>
      						    <td><input type="checkbox" name="tList" value="# 리드미컬한" onchange="makeFilter(this);"/> # 리드미컬한</td>
      						    <td><input type="checkbox" name="tList" value="# 삐까뻔쩍한" onchange="makeFilter(this);"/> # 삐까뻔쩍한</td>
      						    <td><input type="checkbox" name="tList" value="# 변화무쌍한" onchange="makeFilter(this);"/> # 변화무쌍한</td>
      						    </tr>
      						    </table>
        					    <!--   <br> 포스팅 태그&ensp;&ensp;<input type="text" id="showFilter"/> <!--필터확인용, 기능과 무관함 -->
        					     <div class="form-group">
								<label for="exampleFormControlInput1"># 포스팅 태그</label> <input
									type="text" class="form-control" id="showFilter" placeholder="포스팅 추천태그를 체크해주세요." maxlength="20" readonly>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">
										<label for="exampleFormControlTextarea1">상세 옵션</label>
										</div>
										
										
										<div class="panel-body">
											<div class="form-group">
											<label for="exampleFormControlTextarea1">촬영 가능시간</label> 
											&ensp;&ensp;<input type="time" name="startTime" value="12:00"> 부터
														<input type="time" name="endTime" value="21:00"> 까지
											<hr />
											</div>

											<div class="form-group">
												<label for="exampleFormControlInput1">지도</label><br>
												<label>* 촬영이 가능한 지역을 클릭하신 후 가능한 지점까지 마우스를 옮기신 후에 오른쪽 클릭을 하시면 반경 설정이 완료됩니다.</label>
												<div id="map" style="width:100%;height:450px;"></div>
												<input type="button" class="btn btn-warning" id="remove" value="원 반경 삭제하기"/>	
													<hr/>
											</div>
											<div class="form-group">
												<label for="exampleFormControlTextarea1">스튜디오</label>
				
													&ensp;&ensp;<input class="form-check-input" type="radio" name="studio" id="inlineRadio1" value="1"> 
													&ensp;&ensp;<label class="form-check-label" for="inlineRadio1">있음</label>
													<input class="form-check-input" type="radio" name="studio" id="inlineRadio2" value="0"> 
													&ensp;&ensp;<label class="form-check-label" for="inlineRadio2">없음</label>
											</div>
											
												<hr />
												<div class="form-group">
												<label for="exampleFormControlTextarea1">픽업 여부</label>
														&ensp;&ensp;<input class="form-check-input" type="radio" name="pickUp" id="inlineRadio1" value="1"> 
														&ensp;&ensp;<label for="inlineRadio1">가능</label>
														<input class="form-check-input" type="radio" name="pickUp" id="inlineRadio2" value="0"> 
														&ensp;&ensp;<label for="inlineRadio2">불가능</label>
												</div>
										
												<hr />

										</div>
											<!-- 상세옵션 -->
									</div></div></div>
						</form>
					</div>

					<!-- /.table-responsive -->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->

	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">상품 이미지</div>
				<span style="font-size:20px; color:blue">&nbsp; 고객분들에게 컨셉에 관한 어필하고 싶은 사진을 올려주세요!</span><br>
				<br>
				<span style="font-size:15px; color:red">* 권장 사이즈: 가로 4:3비율( 732px x 549px)</span><br>
				<span style="font-size:15px; color:red">* 이미지 사이즈가 큰 경우, 업로드중 에러가 발생할 수 있습니다.</span>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group uploadDiv">
						<input type="file" name='uploadFiles' multiple>
					</div>
					<div class="uploadResult">
						<ul></ul>
					</div>
						<div class="bigPictureWrapper">
							<div class="bigPicture"></div>
						</div>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
			
			<button type="button" onclick="location.href='/'" class="btn btn-danger">취소 및 메인이동</button>
			<button type="submit" name="fitness-form-submit" class="btn btn-success ml-2">작품등록진행</button>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	

<script type="text/javascript">

$(document).ready(function(){

var address = document.getElementById('address');
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(37.49749, 127.02758), //지도의 중심좌표.
	level: 4 //지도의 레벨(확대, 축소 정도)
};
var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

//지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
//marker.setMap(map);

//위도 경도 --> 주소 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();

var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
var centerPosition; // 원의 중심좌표 입니다
var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

var circles = [];
var position = [];

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다

kakao.maps.event.addListener(map, 'click', function(mouseEvent) { 
	
	if(!drawingFlag){
		drawingFlag = true;
		centerPosition = mouseEvent.latLng;
		
		if (!drawingLine) {
	        drawingLine = new kakao.maps.Polyline({
	            strokeWeight: 3, // 선의 두께입니다
	            strokeColor: '#00a0e9', // 선의 색깔입니다
	            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid' // 선의 스타일입니다
	        });    
	    }
		
		if (!drawingCircle) {                    
            drawingCircle = new kakao.maps.Circle({ 
                strokeWeight: 1, // 선의 두께입니다
                strokeColor: '#00a0e9', // 선의 색깔입니다
                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid', // 선의 스타일입니다
                fillColor: '#00a0e9', // 채우기 색깔입니다
                fillOpacity: 0.2 // 채우기 불투명도입니다 
            });     
        }
		
		if (!drawingOverlay) {
            drawingOverlay = new kakao.maps.CustomOverlay({
                xAnchor: 0,
                yAnchor: 0,
                zIndex: 1
            });              
        }
		
	}
	
	/* // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
	
	var coord = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        address.value = result[0].address.address_name;
	    }
	};
	
	console.log(latlng.getLat()+" "+latlng.getLng())
	
	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng); */
    
    
});

kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

    // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
    if (drawingFlag) {

        // 마우스 커서의 현재 위치를 얻어옵니다 
        var mousePosition = mouseEvent.latLng; 
        
        // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
        var linePath = [centerPosition, mousePosition];     
        
        // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
        drawingLine.setPath(linePath);
        
        // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
        var length = drawingLine.getLength();
        
        if(length > 0) {
            
            // 그려지고 있는 원의 중심좌표와 반지름입니다
            var circleOptions = { 
                center : centerPosition, 
            	radius: length,                 
            };
            
            // 그려지고 있는 원의 옵션을 설정합니다
            drawingCircle.setOptions(circleOptions); 
                
            // 반경 정보를 표시할 커스텀오버레이의 내용입니다
            var radius = Math.round(drawingCircle.getRadius()),   
            content = '<div class="info" style="background-color: white;">반경 <span class="number">'
            + radius + '</span>m</div>';
            
            // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
            drawingOverlay.setPosition(mousePosition);
            
            // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
            drawingOverlay.setContent(content);
            
            // 그려지고 있는 원을 지도에 표시합니다
            drawingCircle.setMap(map); 
            
            // 그려지고 있는 선을 지도에 표시합니다
            drawingLine.setMap(map);  
            
            // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
            drawingOverlay.setMap(map);
            
        } else { 
            
            drawingCircle.setMap(null);
            drawingLine.setMap(null);    
            drawingOverlay.setMap(null);
            
        }
    }else{
    	
    }     
});

kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

	
    if (drawingFlag) {

        // 마우스로 오른쪽 클릭한 위치입니다 
        var rClickPosition = mouseEvent.latLng; 

        // 원의 반경을 표시할 선 객체를 생성합니다
        var polyline = new kakao.maps.Polyline({
            path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
            strokeWeight: 3, // 선의 두께 입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
        
        console.log(rClickPosition);	
        
        // 원 객체를 생성합니다
        var circle = new kakao.maps.Circle({ 
            center : centerPosition, // 원의 중심좌표입니다
            radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
            strokeWeight: 1, // 선의 두께입니다
            strokeColor: '#00a0e9', // 선의 색깔입니다
            strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid', // 선의 스타일입니다
            fillColor: '#00a0e9', // 채우기 색깔입니다
            fillOpacity: 0.2  // 채우기 불투명도입니다 
        });
        
        var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
            content = '<div class="info" style="background-color: white;">반경 <span class="number">'
                + radius + '</span>m</div>'; // 커스텀 오버레이에 표시할 반경 정보입니다

        
        // 반경정보를 표시할 커스텀 오버레이를 생성합니다
        var radiusOverlay = new kakao.maps.CustomOverlay({
            content: content, // 표시할 내용입니다
            position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 1 
        });  

        // 원을 지도에 표시합니다
        circle.setMap(map); 
        
        // 선을 지도에 표시합니다
        polyline.setMap(map);
        
        // 반경 정보 커스텀 오버레이를 지도에 표시합니다
        radiusOverlay.setMap(map);
        
        // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
        var radiusObj = {
            'polyline' : polyline,
            'circle' : circle,
            'overlay' : radiusOverlay
        };
        
        // db에 담을 위도 경도 객체입니다. 
        var positionData = {
        		'latStart' : centerPosition.Ma,
        		'lngStart' : centerPosition.La,
        		'latTarget' : rClickPosition.Ma,
        		'lngTarget' : rClickPosition.La
        };
        
        
        
        // 배열에 추가합니다
        // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
        circles.push(radiusObj);   
    	position.push(positionData);
    	console.log(position);
        // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
        drawingFlag = false;
        
        // 중심 좌표를 초기화 합니다  
        centerPosition = null;
        
        // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
        drawingCircle.setMap(null);
        drawingLine.setMap(null);   
        drawingOverlay.setMap(null);
    }
    drawingFlag = true;
});

$('#remove').on("click", function(){
	for (var i = 0; i < circles.length; i++) {
        circles[i].circle.setMap(null);    
        circles[i].polyline.setMap(null);
        circles[i].overlay.setMap(null);
        position[i] = null;
    }         
    circles = [];
    drawingFlag = false;
});


var formObj = $("form[role='form']");	
	
$("input[type='file']").change(function(e){
	var formData = new FormData();
	var inputFile = $("input[name='uploadFiles']");
	var files = inputFile[0].files;
	//파일 다중 업로드로 받았기 떄문에 inputFile[0]으로 하지 않으면 값을 못받아옴
	var cloneObj = $(".uploadDiv").clone();
	console.log(files);
	console.log(inputFile[0]);
	
	for(var i=0; i<files.length; i++){
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		formData.append("uploadFiles", files[i]);
	}
	console.log("files.length"+files.length);
	$.ajax({
		url: '/artPage/uploadAjaxAction',
		processData: false, //전달할 데이터를 query string으로 만들지 말것
		contentType: false,
		data: formData,
		type: 'POST',
		dataType: 'json', //받는 파일 타입
		success: function(result){
			console.log(result);
			showUploadedFile(result);
			$(".form-group uploadDiv").html(cloneObj.html());
		}
	});
	
});

function showUploadedFile(uploadResultArr){
	var str="";
	var uploadUL = $(".uploadResult ul");
	if(!uploadResultArr||uploadResultArr.length==0){return;}
	$(uploadResultArr).each(function(i, obj){
			//str += "<li>"+obj.fileName+"</li>";
			var fileCallPath = 
				encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
			var originPath = obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName;
				originPath = originPath.replace(new RegExp(/\\/g),"/");
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+
				obj.fileName+"' data-type='"+obj.image+"'><div>";
			str += "<span>"+obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+ 
			"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/artPage/display?fileName="+fileCallPath+"'>";
			str += "</div></li>";
	});
	console.log(str);
	uploadUL.append(str);
}

var regEx = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880;
function checkExtension(fileName, fileSize){
	if(fileSize>=maxSize){
		alert("파일 크기 초과");
		return false;
	}
	if(regEx.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없음.")
		return false;
	}
	return true;
}

$("button[type='submit']").on("click", function(e){
	e.preventDefault(); console.log("submit clicked");
	var str="";
	$(".uploadResult ul li").each(function(i,obj){
		var jobj = $(obj); console.log(jobj);
		str += "<input type='hidden' name='iList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		str += "<input type='hidden' name='iList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		str += "<input type='hidden' name='iList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	});
	formObj.append(str);
	
	
	var str2 ="";
	str2 += "<input type='hidden' name='latStart' value='"+position[0].latStart+"'>";
	str2 += "<input type='hidden' name='lngStart' value='"+position[0].lngStart+"'>";
	str2 += "<input type='hidden' name='latTarget' value='"+position[0].latTarget+"'>";
	str2 += "<input type='hidden' name='lngTarget' value='"+position[0].lngTarget+"'>";
	formObj.append(str2).submit();
	
})

});
</script>

</body>
</html>