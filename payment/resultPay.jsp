<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>  
    
     <!-- 결제완료 페이지 : 이재준 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cb00d9c2ad81ceb60ba592db49ca89f8&libraries=services,clusterer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<jsp:include page="../include/nav.jsp"></jsp:include>
<script>

</script>
</head>
<body>
	<header style="background: white;">
		<div class="container">
			<div class="slider-container">
				<div class="intro-text">
					<h1>
						<span style="color: gray; font-size: 38px"><spring:message code="resultPay.complete" /></span> 
					</h1>
					<div class="panel-heading">
						<div class="panel panel-default"> </div>
						
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<h1 class="page-header" >
					<!-- <span style="font-size:13px; color:black">다음 페이지에 안내되는 계좌번호로 입급합니다.</span> -->
				</h1>
				
			</div>
		</div>
	</div>


<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>