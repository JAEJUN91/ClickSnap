<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 예약 게시판 : 이재준 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


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

a{
color : black;
}

.table {
	border-top: 1px solid;
}



</style>
<meta charset="UTF-8">
<title>예약 게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
$(document).ready(function(){
	var result='<c:out value="${result}"/>'; 
	checkModal(result);
	history.replaceState({},null,null);	 //뒤로가기 버튼 클릭 시 모달이 여러번 뜨는 것을 방지
	function checkModal(result){
		if(result===''||history.state){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("게시글"+parseInt(result)+"번이 등록되었습니다.");
		}
		$("#myModal").modal("show");
	}
	$("#regBtn").on("click",function(){
		self.location ="/resBoard/register"; // 글쓰기 버튼 글 작성폼으로 보내주는 기능
	});
	
	var actionForm = $("#actionForm");
				$(".paginate_button a").on(
						"click",
						function(e) {
							e.preventDefault();
							console.log('click');
							actionForm.find("input[name='pageNum']").val( // actioForm의 href태그를 누루면 pageNum을 같이 넘겨줘라
									$(this).attr("href"));
							actionForm.submit();
					});
				$(".move").on("click",function(e){
					e.preventDefault();
					console.log('click');
					actionForm.append("<input type='hidden' name='resBno' value='"+$(this).attr("href")+"'/>");
					actionForm.attr("action","/resBoard/get");
					actionForm.submit();
				});
});
//document ready function
</script>

<jsp:include page="../includes/nav.jsp"></jsp:include>
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
					<li><a class="menuLink" href="/resBoard/register">INTRODUCTION</a></li>
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
	
		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="width:10%">#</th>
					<th scope="col" style="width:15%">제목</th>
					<th scope="col" style="width:40%">내용</th>
					<th scope="col" style="width:15%">작성자</th>
					<th scope="col" style="width:10%">등록일자</th>
					<th scope="col" style="width:10%">상태</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${list }">
				<tr>
					<td>${item.resBno }</td>
					<td><a class='move' href='<c:out value="${item.resBno }"/>'><c:out value="${item.title }"/>  <b> [ <c:out value="${item.replyCnt }" /> ]</b></a></td>
					<td>${item.content }</td>
					<td>${item.writer }</td>
					<td><span class="badge bg-primary"> <fmt:formatDate
									pattern="yyyy-MM-dd" value="${item.regDate }" /></span></td>
					<td><span class="badge bg-success">${item.status }</span></td>
				</tr>
				</c:forEach>
				
			</tbody>
			    <tfoot>
  
            <tr>
               <th colspan="3">
               <div class="pull-left">
                     <ul class="pagination">
                        <c:if test="${pageMaker.prev}">
                        <li class="paginate_button previous">
                        <a href="${pageMaker.startPage-1}">Previous</a></li>
                        </c:if>
                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                           <li class="paginate_button ${pageMaker.cri.pageNum==num?"active" : ""}">
                           <a href="${num}">${num}</a></li>
                        </c:forEach>
                        <c:if test="${pageMaker.next}">
                           <li class="paginate_button next">
                           <a href="${pageMaker.endPage+1}">Next</a></li>
                        </c:if>
                     </ul>
                  </div>
                  <!-- pagination -->   
               </th>
               <th></th>
               <th></th>
               <th>
                  	<button type="submit" class="btn btn-dark" id="regBtn">등록</button>
               </th>
            </tr>
         </tfoot>
		</table>
	
				<form id="actionForm" action="/resBoard/resList" method="get">
					<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum }'> 
					<input type="hidden" name="amount" value='${pageMaker.cri.amount }'>
						 <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
						<input type="hidden" name="type" value="${pageMaker.cri.type }"/> 
				</form>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModellabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Save Changes</button>
							</div>
						</div>
						<!-- /.model-content -->
					</div>
					<!-- /.model-dialog -->
				</div>
				<!-- /.model-fade -->
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>