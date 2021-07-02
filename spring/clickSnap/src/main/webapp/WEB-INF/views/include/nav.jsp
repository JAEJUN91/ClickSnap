<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>Lattes - Onepage Multipurpose Bootstrap HTML</title>
<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
<!-- Custom styles for this template -->
<link href="../resources/css/owl.carousel.css" rel="stylesheet">
<link href="../resources/css/owl.theme.default.min.css" rel="stylesheet">
<link href="../resources/css/style.css" rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../resources/js/ie-emulation-modes-warning.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
<script src="../resources/js/main.js" defer="defer"></script>
</head>
<c:set var="prin" value="${prin}"></c:set>
<!-- Navigation -->
<nav class="navbar">
	<div class="navbar_logo">
		<i class="fab fa-accusoft"></i> <a href="/">Click Snap</a>
	</div>
	<form action="/customLogout" method="post" role="form">
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
	</form>
	<ul class="navbar_menu">
		<li><a href="">의뢰게시판</a></li>
		<li><a href="">커뮤니티</a></li>
		<li><a href="/category/serviceView">카테고리</a></li>
		<li><a href="/customerService/cs">고객센터</a></li>
		<c:if test="${prin.principal.username == null}">
			<li><a href="#" type="button" data-target="#myModal"
				data-toggle="modal">로그인</a></li>
		</c:if>
		<c:if test='${prin.principal.authorities == "[ROLE_ARTIST]"}'>
			<li><a href="/artPage/artistList?artistId=${prin.principal.username}">아티스트페이지</a></li>
		</c:if>
		<c:if test='${prin.principal.authorities == "[ROLE_CUST]"}'>
			<li><a href="/myPage">마이페이지</a></li>
		</c:if>
		<c:if test="${prin.principal.username != null}">
			<li><a href="#" onclick="logOut();">로그아웃</a></li>
		</c:if>
	</ul>

	<ul class="navbar_icons">
		<li><i class="fab fa-twitter"></i></li>
		<li><i class="fab fa-facebook-f"></i></li>
		<c:if test="${prin.principal.username != null}">
			<li><a>${prin.principal.username}님</a></li>
		</c:if>
	</ul>
	<a href="#" class='navbar_toggleBtn'> <i class="fas fa-bars"></i>
	</a>
</nav>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<form action="/login" method="post">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">로그인</h4>
					<div class="btn-group btn-group-justified" role="group"
						aria-label="...">
						<div class="btn-group" role="group">
							<button type="button" id="custLogin" class="btn btn-default">일반회원 로그인</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="artistLogin" class="btn btn-default">아티스트 로그인</button>
						</div>
					</div>
				</div>
				<!-- <div class="modal-body">

					<div class="row" style="margin-right: 0; margin-left: 0;">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<label>ID</label>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">ID&nbsp;
								</span> <input type="text" name="username" class="form-control"
									placeholder="계정을 입력해 주세요" aria-describedby="basic-addon1">
							</div>
							<label>Password</label>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">PW</span> <input
									type="password" name="password" class="form-control"
									placeholder="비밀번호를 입력해 주세요" aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>

				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">Close</button>
					<button class="btn btn-success" type="submit">submit</button>
				</div> -->
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }">
	</form>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var form = $("form[role='form']");
	function logOut() {
		form.submit();
	}
	
	var str = "";
	var modal = $('.modal-content');
	
	console.log($('#targetModal')=='undefined');
	
	$("#custLogin").on("click", function(){
		$('div').remove("#targetBody");
		$('div').remove("#targetFooter");
		str += '<div class="modal-body" id="targetBody">';
		str +=	'<div class="row" style="margin-right: 0; margin-left: 0;">';
		str +=	'<div class="col-md-1"></div>';
		str +=  '<div class="col-md-10">';
		str +=  '<label>ID</label>';
		str +=  '<div class="input-group">';
		str +=  '<span class="input-group-addon" id="basic-addon1">ID&nbsp;';
		str +=  '</span> <input type="text" name="username" class="form-control" placeholder="계정을 입력해 주세요" aria-describedby="basic-addon1"></div>';
		str +=  '<label>Password</label>';
		str +=  '<div class="input-group">';
		str +=  '<span class="input-group-addon" id="basic-addon1">PW</span> <input type="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요" aria-describedby="basic-addon1"></div></div>';
		str +=  '<div class="col-md-1"></div></div></div>';
		str +=  '<div class="modal-footer" id="targetFooter">';
		str +=  '<button class="btn btn-default" data-dismiss="modal">Close</button>';
		str +=  '<button class="btn btn-success" type="submit">submit</button>';
		str +=  '</div>';
		modal.append(str);
		str = "";
	});
	
	$('#artistLogin').on('click', function(){
		$('div').remove("#targetBody");
		$('div').remove("#targetFooter");
		str += '<div class="modal-body" id="targetBody">';
		str +=	'<div class="row" style="margin-right: 0; margin-left: 0;">'
		str +=	'<div class="col-md-1"></div>'
		str +=  '<div class="col-md-10">'
		str +=  '<label>ID</label>'
		str +=  '<div class="input-group">'
		str +=  '<span class="input-group-addon" id="basic-addon1">ID&nbsp;'
		str +=  '</span> <input type="text" name="username" class="form-control" placeholder="계정을 입력해 주세요" aria-describedby="basic-addon1"></div>'
		str +=  '<label>Password</label>'
		str +=  '<div class="input-group">'
		str +=  '<span class="input-group-addon" id="basic-addon1">PW</span> <input type="password" name="password" class="form-control" placeholder="비밀번호를 입력해 주세요" aria-describedby="basic-addon1"></div></div>'
		str +=  '<div class="col-md-1"></div></div></div>'
		str +=  '<div class="modal-footer" id="targetFooter">'
		str +=  '<button class="btn btn-default" data-dismiss="modal">Close</button>'
		str +=  '<button class="btn btn-success" type="submit">submit</button>'
		str +=  '</div>'
		modal.append(str);
		str = "";
	})
	
	/* function logOut(){
			console.log("aaaa");
			var form = new FormData();
			
			//var str =  '<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">'
			//form.append(str);
			form.method('post');
			console.log(form);
			form.append("${_csrf.parameterName}","${_csrf.token}");
			form.action("/logout");
			
		} */

	/* $(document).ready(function(){
			function logOut(){
				var form = new formData();
				var str =  '<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">'
				form.append(str);
				console.log(form);
			};
		}); */
</script>
</html>