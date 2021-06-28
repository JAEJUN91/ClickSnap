<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 예약 게시판 : 이재준 -->
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
	width: 100px;
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
	width: 1000px;
}

</style>

<jsp:include page="../includes/nav.jsp"></jsp:include>
</head>

<script type="text/javascript">
function showImage(fileCallPath) {
	alert(fileCallPath);
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html(
			"<img src='/reserv/display?fileName="+fileCallPath+"'>").animate({
		width :'100%',
		height :'100%'
	}, 1000);
}

$(document).ready(function(){
	$(".bigPictureWrapper").on("click",function(e){
		$(".bigPicture").animate({width:'0%', height:'0%'},1000);
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		},1000);
	});
	//bigPictureWrapper click
	
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
      url: '/reserv/uploadAjaxAction',
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
         "\' data-type='image' class='btn btn-warning btn-sm'><i class='fa fa-times'></i></button><br>";
         str += "<img src='/reserv/display?fileName="+fileCallPath+"'>";
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
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
   });
   formObj.append(str).submit();
   
   
/*    var str2 ="";
   str2 += "<input type='hidden' name='latStart' value='"+position[0].latStart+"'>";
   str2 += "<input type='hidden' name='lngStart' value='"+position[0].lngStart+"'>";
   str2 += "<input type='hidden' name='latTarget' value='"+position[0].latTarget+"'>";
   str2 += "<input type='hidden' name='lngTarget' value='"+position[0].lngTarget+"'>";
   formObj.append(str2).submit(); */
   
})
// button[type='submit'] 끝

$(".uploadResult").on("click", "button", function(e){
								
								var targetFile= $(this).data("file");
								var type = $(this).data("type");
								var targetLi =$(this).closest("li");
								//console.log(targetFile);
								
								$.ajax({
									url:'/deleteFile',
									data: {fileName: targetFile, type: type},
									dataType: 'text',
									type:'POST',
									success: function(result){
										alert(result);
										targetLi.remove();
									}
								});
								// \.ajax
		});
		//uploadResult 

});

//document ready funtion 끝
</script>
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
				<h3 class="page-header" style="font-family: 'Cafe24Oneprettynight';">예약 게시판	</h3>
				
			</div>
			
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-body">
					<form role="form" action="/resBoard/register" method="post">
						<div class="form-group">
							<div class="col-lg-2">
								<input type="text" name="status" class="form-control" value="예약 문의" readonly>
							</div>
							<div class="col-lg-8">
								<input class="form-control" type="text" id="noBorder" name="title"
									placeholder="제목">
							</div>
								<div class="col-lg-2">
								 <input class="form-control" type="text" name="writer"  id="noBorder"  value="이재준" readonly>
								</div>
						</div>
						<div class="form-group" style="padding-top:20px;">
							<textarea class="form-control" rows="10" name="content" id="noBorder" placeholder="내용을 입력해주세요."></textarea>
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
							</div>
							<!-- /.col-lg-12 -->
						</div>
						<!-- /. row -->
						<button type="submit" class="btn btn-dark pull-right">등록</button>

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


	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>