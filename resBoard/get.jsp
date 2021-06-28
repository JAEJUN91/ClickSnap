<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 예약 게시판 : 이재준 -->
<!DOCTYPE html>
<html>
<head>
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

#noBorder {
	outline:none;
	border: none;
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
	border-bottom: 1px solid lightgray;
	border-radius: 0px;
	font-size:20px;
	box-shadow:none;
}

#noBorder1 {
	outline:none;
	border: none;
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
	border-bottom: 0px;
	border-radius: 0px;
	font-size:15px;
	box-shadow:none;
	text-align:right;
}
.uploadResult {
	width: 100%;
	background-color: #ddd;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 300px;
}

.uploadResult ul li span {
	color: white;
}
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 400px;
}
</style>
<jsp:include page="../includes/nav.jsp"></jsp:include>
<meta charset="UTF-8">
<title>예약 게시판</title>
<script type="text/javascript" src="../resources/js/reply.js"></script>
<script>
function showImage(fileCallPath) {
	alert(fileCallPath);
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html(
			"<img src='/reserv/display?fileName="+fileCallPath+"'>").animate({
		width : '100%',
		height : '100%'
	}, 1000);
}
	$(document).ready(function() {
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width:'0%', height:'0%'},1000);
			setTimeout(function(){
				$(".bigPictureWrapper").hide();
			},1000);
		});
		//bigPictureWrapper click
		var operForm = $("#operForm");
		$('button[data-oper="modify"]').on("click", function(e) {
			operForm.attr("action", "/resBoard/modify").submit();
		});
		$('button[data-oper="list"]').on("click", function(e) {
			operForm.find("#resBno").remove();
			operForm.attr("action", "/resBoard/resList");
			operForm.submit();
		});
		$('button[data-oper="remove"]').on("click", function(e){
			operForm.attr("action","/resBoard/remove");
			operForm.attr("method","POST");
			operForm.submit();
		});
var resBno = '<c:out value="${resBoard.resBno}"/>';
$.getJSON("/resBoard/getAttachList",{resBno:resBno},function(arr){
	console.log(arr);
	
var str="";
$(arr).each(function(i,obj){
	//if(!obj.fileType){
		/* var fileCallPath= encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
		str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";

		str +="<img src='/resources/images/attach.png'></a>"
		str +="</div></li>";
		console.log("파일이 아닌 타입:"+ fileCallPath); */
	//}else{
		var fileCallPath= encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
		str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
		
		str +="<img src='/reserv/display?fileName="+fileCallPath+"'>"; 
		str +="</div></li>";
		console.log("파일인 타입:"+ fileCallPath);
	//}
});
$(".uploadResult ul").html(str);
	
});
// getJSON 끝

// reply part
console.log(replyService);

// 댓글 리스트 불러오는 부분
var resBnoValue = '<c:out value="${resBoard.resBno}"/>';
var reply = $("#reply"); 
var inputReply = reply.find("textarea[name='reply']");
var inputReplyer = reply.find("input[name='replyer']");
var inputReplyDate = reply.find("input[name='replyDate']");

var replyUL = $(".chat");	// showList(페이지번호)는 해당 게시글의 댓글을 가져온 후 <li>태그를 만들어서 
showList(1);				// 화면에 보여준다.
function showList(page){
	replyService.getList({
		resBno:resBnoValue,
		page:page||1
	},function(replyCnt, list){
		console.log("resBno : " + resBno);
		console.log("list : "+ list);
		
		var str="";
		if(list==null||list.length==0){
			replyUL.html("");
			return;
		}
		for (var i = 0, len = list.length||0; i < len; i++) {
			/* str+="<li class='left clearfix' id='rno2' data-resrno='"+list[i].resRno+"'>";
			str+="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
			str+="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].updateDate)+"</small></div>";
			str+="<p>"+list[i].reply+"</p></div></li>"; */
            str +="<li class='left clearfix' id='"+list[i].resRno+"'  >";
            str +="<div class='rpy'><div class='header' id='reply'><strong class='primary-font'>"
                  +list[i].replyer+"</strong>";
            str +="<small class='pull-right text-muted'>"
            str +="<button type='button' class='btn btn-outline-dark' data-resrno='"+list[i].resRno+"' data-res-reply='"+list[i].reply+"' data-res-replyer='"+list[i].replyer+"' id='replyMod' data-count='"+i+"' style='padding: 5px 2px;'>수정</button>"
            str +="<button type='button' class='btn btn-outline-dark' data-resrno='"+list[i].resRno+"' data-res-reply='"+list[i].reply+"' data-res-replyer='"+list[i].replyer+"' id='replyRem' style='padding: 5px 2px;'>삭제</button>"
            str +="</small></div>"
            str +="<p id='replyer'>"+list[i].reply+"</p>";
            str +="<small class='pull-right text-muted'>"
                +replyService.displayTime(list[i].replyDate)+"</small></div></div></li>";
		}
		replyUL.html(str);
	});
	//function call
}
//showList

// 댓글 추가 하는 부분 

	var ReplyModBtn = $("#replyMod");  //수정버튼
      var ReplyRemBtn = $("#replyRem");  //삭제버튼
      var ReplyRegBtn = $("#replyReg");  //등록버튼
      
   
     
      ReplyRegBtn.on("click", function(e) {
           e.stopImmediatePropagation();
         var reply ={
               reply: inputReply.val(),
               replyer: inputReplyer.val(),   
               resBno: resBnoValue
                
         };
         console.log("1"+inputReply.val());
         console.log("2"+inputReplyer.val());
         console.log("3"+inputReplyDate.val());
         replyService.add(reply, function(result){
            alert("댓글이 성공적으로 등록 되었습니다.");
            console.log(reply);
            /* reply.find("input").val(""); */
            showList(1);
         });
      });
      
      // 댓글 추가하는 부분 끝
      
      
      $(document).on("click", '#replyRem', function(e){
         
    	  
    	 console.log("삭제하는 부분 : "+resRno);
         console.log($(this).data('resrno'))
       var resRno = $(this).data('resrno'); 
          /* var reqRno = $(this).attr("reqRno"); */
         /*  var reqRno = $('.left').attr('reqRno'); */
         console.log("rno123"+$(this));   
          console.log("resrno"+resRno);   
         replyService.remove(resRno, function(result){
             alert("댓글이 성공적으로 삭제 되었습니다.");
             location.reload();
             showList(1);
         });
      });
    
      var ReplyModBtn = $("#replyMod");
      $(document).on("click", '#replyMod', function(e){
          console.log("수정");
         var resRno = $(this).data('resrno'); 
         var resReply = $(this).data('resReply'); 
         var resReplyer = $(this).data('resReplyer'); 
         var str = "";
         
          str +="<li class='left clearfix' id='rno2'  data-resrno='"+resRno+"'>";
          str +="<div class='rpy'><div class='header'><strong class='primary-font'>"
                +resReplyer+"</strong>";
          str +="<small class='pull-right text-muted'>"
          str +="<button type='button' class='btn btn-outline-dark' id='replyMod2' style='padding: 5px 2px;'>수정</button>"
          str +="<button type='button' class='btn btn-outline-dark' id='replyDel' style='padding: 5px 2px;'>취소</button>"
          str +="</small></div>"
          str +="<textarea rows='3' name='reply' id='replyInput' class='form-control'  value='"+resReply+"'>";
         
          replyUL.html(str); 
  /*         var reqRno = $('#'+$(this).data('reqRno')));
          console.log($('#'+$(this).data('reqRno')+" div div p").text());
          var target = $('#'+$(this).data('reqRno')+" div div p");
          
          if(target!=reqRno))
           */
          
          
      });  
      
      $(document).on("click", '#replyMod2', function(e){
         console.log("수정하기");
         var resRno = $('#rno2').data('resrno'); 
         var reply = $('#replyInput').val(); 
         
     
      var reply={resRno:resRno, reply:reply};
         replyService.update(reply, function(result){
            alert("댓글이 성공적으로 수정 되었습니다.");
            location.reload();
             showList(1);
         }); 
         
      });  
    

      $(document).on("click", '#replyDel', function(e){
         console.log("취소");
         location.reload();
         
      });  

     var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    function showReplyPage(replyCnt) {
       console.log("showReplyPage:"+replyCnt);
       var endNum = Math.ceil(pageNum / 10.0) * 10;
       var startNum = endNum - 9;
       
       var prev = startNum != 1;
       var next = false;
       
       
       if(endNum * 10 >= replyCnt) {
          endNum = Math.ceil(replyCnt/10.0);
       }
       
       if(endNum * 10 < replyCnt) {
          next = true;
       }
       
       var str = "<ul class='pagination pull-right'>";
       if(prev) {
          str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
       }
       
       for(var i=startNum ; i<=endNum; i++){
          var active = pageNum == i? "active":"";
          str+="<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
       }
       
       if(next) {
    	   
          str+= "<li class='page-item'><a class='page-link' href='"+(endNum+1) + "'>Next</a></li>";
       }

       str += "</ul></div>";
       console.log(str);
       replyPageFooter.html(str);
       
       replyUL.html(str);
       showReplyPage(replyCnt);
    }
     
    replyPageFooter.on("click", "li a", function(e) {
       e.preventDefault();
       console.log("page click");
       var targetPageNum = $(this).attr("href");
       console.log("targetPageNum : " + targetPageNum);
       pageNum = targetPageNum;
       showList(pageNum);
    });
    

});
// document ready function 끝
</script>
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


					<div class="form-group">
						<div class="col-lg-2">
							<input type="text" name="status" class="form-control"
								value='<c:out value="${resBoard.status }"/>' readonly>
						</div>
						<div class="col-lg-8">
							<input class="form-control" type="text" id="noBorder" readonly
								value='<c:out value="${resBoard.title }"/>'>
						</div>
						<div class="col-lg-2">
							<input class="form-control" name="writer" id="noBorder"
								value='<c:out value="${resBoard.writer }"/>' readonly="readonly">
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-10">
							<input type="text" name="regDate" class="form-control"
								id="noBorder1"
								value='<fmt:formatDate
									pattern="yyyy-MM-dd" value="${resBoard.regDate }"/>'
								readonly>
						</div>

						<div class="col-lg-2">
							<div class="btn-group btn-group-sm" role="group">
								<button data-oper='modify' type="button"
									class="btn btn-outline-dark" name="modify">수정</button>
								<button data-oper='remove' type="button"
									class="btn btn-outline-dark" name="remove">삭제</button>

							</div>
						</div>
					</div>


					<div class="form-group" style="padding-top: 20px;">
						<textarea class="form-control" rows="10" name="contents"
							id="noBorder" readonly>'<c:out
								value="${resBoard.content }" />'</textarea>
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
										<!-- 	<input type="file" name='uploadFiles' multiple> -->
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
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<button data-oper='list' type="submit"
						class="btn btn-dark pull-right">목록</button>


					<form id="operForm" action="/resBoard/modify" method="get">
						<input type="hidden" id="resBno" name="resBno"
							value='<c:out value="${resBoard.resBno }"/>'> <input
							type="hidden" name="pageNum"
							value='<c:out value="${cri.pageNum }"/>'> <input
							type="hidden" name="amount"
							value='<c:out value="${cri.amount }"/>'> <input
							type="hidden" name="keyword"
							value='<c:out value="${cri.keyword }"/>'> <input
							type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
					</form>
					<!-- /.table-responsive -->

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- reply -->
		<div id ="reply" class="panel-heading">
			<i class="fa fa-comments fa-fw"></i>Reply
			<div class="row">
				
				<div class="col-sm-10">
				
					<textarea name="reply" id="content" class="form-control" rows="3"
						placeholder="댓글을 입력해 주세요."></textarea>
				</div>
				<div class="col-sm-2">
					
					<input name="replyer" class="form-control" id="replyer"
						placeholder="댓글 작성자">
					<button type="button" data-oper="replyReg" class="btn btn-sm btn-primary" id="replyReg" style="width: 100%; margin-top: 10px"> 등록 </button>

				</div>

			</div>

		</div>
		<div class="panel-body">
			<ul class="chat">

			</ul>
		</div>

		<div class="panel-footer">

			<!-- Reply Form {s} -->

		</div>

		<!-- reply part end -->
		

		
	</div>
	<!-- /.container -->


	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>