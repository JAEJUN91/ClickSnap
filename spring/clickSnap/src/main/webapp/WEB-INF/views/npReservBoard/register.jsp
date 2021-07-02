<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 게시글 등록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

div {
	display: block;
}

#showFilter {
	color: red;
}

.table {
	border-top: 1px solid;
}

#write{
font-size:20px; 
margin-bottom:10px;
float: right;
}

</style>

<jsp:include page="../include/nav.jsp"></jsp:include>
</head>
<body>
<header
		style="background-image: url(../resources/images/photographer1.jpg)">
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
					<li><a class="menuLink" href="/">INTRODUCTION</a></li>
					<li><a class="menuLink" href="/">PORTFOLIO</a></li>
					<li><a class="menuLink" href="/">POSTING LIST</a></li>
					<li><a class="menuLink" href="/">SCHEDULE</a></li>
					<li><a class="menuLink" href="/">POSTING REGISTER</a></li>

				</ul>
			</nav>
		</div>
	</div>

	<div class="row">
		<div class="container">
			<div class="col-lg-12">
				<h3 class="page-header" style="font-family: 'Cafe24Oneprettynight'">예약 게시판	</h3>
				
			</div>
			
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-body">
					<form role="form" action="/npReservBoard/register" method="post">
						<div class="form-group">
							<label for="exampleFormControlSelect1">문의사항</label> <select
								class="form-control" id="exampleFormControlSelect1">
								<option>예약문의</option>

							</select>
						</div>
						<div class="form-group">
							<label>제목</label><input class="form-control" name="title">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name="content"></textarea>
						</div>
						<div class="form-group">
							<label>글쓴이</label> <input class="form-control" name="writer"
								value='이재준' readonly="readonly">
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">
										<strong>이미지 파일</strong>
									</div>
									<!-- /.panel-heading -->
									<div class="panel-body">

										<div class="form-group uploadDiv">
											<input type="file" name='uploadFile' multiple>
										</div>
										<div class="uploadResult">
											<ul></ul>
										</div>

									</div>
									<!-- /.panel-body -->
								</div>
								<!-- /.panel -->
							</div>
							<!-- /.col-lg-12 -->
						</div>
						<button type="submit" class="btn btn-info pull-right">Submit</button>
						<button type="reset" class="btn btn-danger pull-right">Reset</button>

					</form>
					<!-- /.table-responsive -->

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	

	</div>
	<!-- /.container -->


	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>