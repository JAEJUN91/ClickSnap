<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>  
    
    <!-- 결제페이지 : 이재준 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
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


p { font: normal normal 12px/1.6 "Gulim"; color: #111111; margin: 8px 0px 8px 0px; }

</style>
</head>
<jsp:include page="../include/nav.jsp"></jsp:include>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cb00d9c2ad81ceb60ba592db49ca89f8&libraries=services,clusterer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>


<script type="text/javascript">
$(document).ready(function(){
	  var csrfName = "${_csrf.headerName}";
      var csrfToken = "${_csrf.token}";
  
	$("#check_module").click(function() {
		 var sno = ${sVO.sno};
	 	 var restitle = '${sVO.title}';
	      var resPrice = ${sVO.resPrice}; 
	      var resLocation = $('#content').text();
	      var userId = '${prin.principal.username}';
	      var artist_Id = '${sVO.artist_Id}';
	      var addPrice = ${preDTO.addPrice};
	      var location = "${preDTO.location}";
	      var resDate = '<fmt:formatDate pattern="yyyy-MM-dd" value="${preDTO.hopeDate}"/>';
	      var resTime = "${sVO.startTime }";
			
	   
		
		var IMP = window.IMP; 
		IMP.init('imp31076817');
	
		IMP.request_pay({
			pg : 'inicis', 
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '${sVO.title}',
			amount : ${sVO.resPrice+preDTO.addPrice},
			buyer_email : '${mVO.email}',
			buyer_name :  '${mVO.userName}',
			buyer_tel : '${mVO.phoneNum}',
		
		}, function(result) {
			
			if (result.success) {
			
				console.log(result);
		    	$.ajax({	
		    		url: "/payment/payAction",
		    		type: 'POST',
		    		//headers: { "Content-Type:" : "application/json"},
		    		beforeSend : function(xhr){
		                xhr.setRequestHeader(csrfName, csrfToken);
		             },
		    		contentType : "application/json",
		    		data : JSON.stringify(
		    				{

		    				'resTitle':restitle, 
		    				'resDate':resDate,
		    				'resTime':resTime,
		    				'resPrice':resPrice, 
		    				'resLocation':resLocation, 
		    				'userId':userId, 
		    				'artist_Id':artist_Id,
		    				'sno':sno,
		    				'addPrice':addPrice
		    				}
		    		),

		    	}).done(function(data) {
		    		if (data!=null ) {
		    			
		    			var msg = '결제가 완료되었습니다.';  // 결제 완료 메세지

		    			alert(msg);
		    			window.location.href = 'http://localhost:8085/payment/resultPay';  // 결제 완료가 되면 결제 완료 페이지로 이동 
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		} 
		    		alert(data);
		    	});
			
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + result.error_msg;
			}
			//alert(msg);
		
		});
	});
	// cheak module end
	

var geocoder = new kakao.maps.services.Geocoder(); // 카카오맵 api의 좌표 -> 주소 변환기

var coord = new kakao.maps.LatLng(${sVO.latStart}, ${sVO.lngStart}); // kakao map의 위도 경도 
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        console.log( result[0].address.address_name);
        $("#content").text(result[0].address.address_name);
    }
};
	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	
	//geocoder 끝
	
	
});
//document ready function

</script>
<body>
<c:set var="sVO" value="${sVO}"></c:set>
	<c:set var="iVO" value="${iVO}"></c:set>
	<c:set var="tVO" value="${tVO}"></c:set>
	<c:set var="prin" value="${prin}"></c:set>
	<c:set var="mVO" value="${mVO }"></c:set>
	<c:set var="preDTO" value="${preDTO }"></c:set>
<header style="background-image: url(../resources/images/artist_bg1.jpg)">
		<div class="container">
			<div class="slider-container">
				<div class="intro-text"></div>
			</div>
		</div>
	</header>
 
	<div class="row">
		<div class="col-lg-12">
			
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<h3 class="page-header" ><spring:message code="pay.check" /> &ensp;&ensp;&ensp;&ensp;
					<!-- <span style="font-size:13px; color:black">다음 페이지에 안내되는 계좌번호로 입급합니다.</span> -->
				</h3>
				
			</div>
		</div>
	</div>

	<div class="container">

		<div class="row">
			<div class="col-md-7" style="height:511px; overflow:hidden">

			<c:forEach var="image" items="${iVO}" varStatus="status" begin="0" end="0">
					<div class="carousel-item" id="car${status.count}">
						<img
							src='/artPage/display?fileName=${image.uploadPath}/${image.uuid}_${image.fileName}'
							class="d-block w-100" width="80%" height="511" alt="...">
					</div>
				</c:forEach>

			</div>
			
			<div class="col-md-5" >
				<div>
					<h3> </h3>
					<p style="font-size:22px; line-height:3em">
						<spring:message code="pay.artist" /> : <span style="float: right;  font-size:17px; line-height:3.5em">${sVO.artist_Id }</span>
					</p>
					
					<p style="font-size:22px; line-height:3em">
						<spring:message code="pay.product" /> : <span id="title" style="float: right;  font-size:17px; line-height:3.5em">${sVO.title }</span>
					</p>
					<p style="font-size:22px; line-height:3em">
						<spring:message code="pay.time" /> : <span style="float: right; font-size:17px"><fmt:formatDate pattern="yyyy-MM-dd" value="${preDTO.hopeDate}"/> - ${sVO.startTime } ~ ${sVO.endTime }</span>
					</p>
					<p style="font-size:22px; line-height:3em">
						<spring:message code="pay.location" /> : <span style="float: right; font-size:17px" id="content">${sVO.latStart }, ${sVO.lngStart }, ${sVO.latTarget }, ${sVO.lngTarget } </span>
					</p>
					<p style="font-size:22px; line-height:3em">
						<spring:message code="pay.addPrice" /> : <span style="float: right; font-size:17px"> ${preDTO.addPrice }<spring:message code="pay.won" /></span>
					</p>
					<p style="font-size:22px; line-height:3em">
						<spring:message code="pay.totalPrice" /> : <span style="float: right; font-size:17px"><fmt:formatNumber
								type="number" maxFractionDigits="3" value="${sVO.resPrice}" /> <spring:message code="pay.won" /></span>
					</p>
						<button type="button" class="btn btn-warning pull-right " id="check_module"><spring:message code="pay.paying" /></button>
				</div>
			
			</div>
			<!-- /.col-lg-5 -->
			
		</div>
		<!-- /.row -->
		<!-- 작가 약력 및 텍스트 프로필 끝 -->
		<hr>
				

	
</div>
<!-- /.container -->


	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>