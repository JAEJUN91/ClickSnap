<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
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
	width : 100%;
	background-color : gray;
}

.uploadResult ul{
	display : flex;
	flex-flow : row;
	justify-content : center;
	align-items : center;
}

.uploadResult ul li{
	list-style : none;
	padding : 10px;
	align-content : center;
	text-align : center;
}

.uploadResult ul li img {
	width : 100px;
}

.uploadResult ul li span {
	color : white;
}

.bigPictureWrapper{
	position : absolute;
	display : none;
	justify-content : center;
	align-items : center;
	top : 0%;
	width : 100%;
	height : 100%;
	background-color : gray;
	z-index : 100;
	background : rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position : relative;
	display : flex;
	justify-content : center;
	align-items : center;
}

.bigPicture img {
	width : 600px;
}
</style>

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
					<form role="form" action="/resBoard/modify" method="post">
						<div class="form-group">
							<div class="col-lg-2">
								<input type="text" name="status" class="form-control"
									value="${resBoard.status }">
									
							</div>
							<div class="col-lg-8">
								<input class="form-control" name="title" type="text" id="noBorder"
									value="${resBoard.title}">
							</div>
								<div class="col-lg-2">
								 <input class="form-control" name="writer"  id="noBorder"
								value="${resBoard.writer}" readonly="readonly">
								</div>
						</div>
						
						
						<div class="form-group" style="padding-top:20px;">
							<textarea class="form-control" rows="10" name="content" id="noBorder">${resBoard.content}</textarea>
						</div>
						
					</div>
					<div class="container">
						
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
											<div class="bigPicture">
												
											</div>
										</div>

									</div>
									<!-- /.panel-body -->
								</div>
								<!-- /.panel -->
							</div>
							<!-- /.col-lg-12 -->
						</div>
						<input type='hidden' name='resBno' value='${resBoard.resBno}'> 
						<input type='hidden' name='pageNum' value='${cri.pageNum}'> 
						<input type='hidden' name='amount' value='${cri.amount}'>
						<input type="hidden" name="type" value="${cri.type }" /> 
						<input type='hidden' name='keyword' value="${cri.keyword }" />

						<button type="submit" data-oper="modify" class="btn btn-dark pull-right">수정</button>
					

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form");
	 $('button').on("click", function(e){
		 e.preventDefault();
		 var operation = $(this).data("oper");
		 console.log(operation);
		 if(operation === "list"){
			 //move to list
			 formObj.attr("action", "/resBoard/resList").attr("method", "get");
			 var pageNumTag = $("input[name='pageNum']").clone();
			 var amountTag = $("input[name='amount']").clone();
			 //var keywordTag = $("input[name='keyword']").clone();
			 //var typeTag = $("input[name='type']").clone();
			 formObj.empty();
			 formObj.append(pageNumTag);
			 formObj.append(amountTag);
			 //formObj.append(keywordTag);
			 //formObj.append(typeTag);
		 }else if(operation === 'modify'){
			 console.log('submit clicked');
			 var str="";
				 $(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileName' value = '" + jobj.data("filename")+"'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value = '" + jobj.data("type") + "'>";
				 });
			 formObj.append(str);
		 }
		 formObj.submit();
	 });
	 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	 	var maxSize = 5242880; // 5MB
	 	
	 	function checkExtension(fileName, fileSize){
	 		if(fileSize >= maxSize){
	 			alert("파일 사이즈 초과");
	 			return false;
	 		}
	 		
	 		if(regex.test(fileName)){
	 			alert("해당 종류의 파일은 업로드할 수 없습니다.");
	 			return false;
	 		}
	 		return true;
	 	}//파일 크기
	 	

		$("input[type = 'file']").change(function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFiles']");
			var files = inputFile[0].files;
			
			for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFiles", files[i]);
			}
			
			$.ajax({
				url : '/reserv/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
					success:function(result){
						console.log(result);
						 showUploadResult(result);
					}
			});
		});//input type = file
		
		
		var resBno="${resBoard.resBno}";
		
	    $.getJSON("/resBoard/getAttachList", {resBno:resBno}, function(arr){
	       console.log(arr);
	       
	       var str = "";
	           $(arr).each(function(i, obj) {
	             // if (!obj.fileType) {
	                 //이미지가 아닌경우                  
	            /*   var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);
	              str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
	              str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	              str +="<img src='/resources/images/attach.png'>"
	              str +="</div></li>"; */
	            //  } else {
	                 //이미지인 경우
	                 var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);
	                 str +="<li  data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
	                 str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	                 str +="<img src='/reserv/display?fileName="+fileCallPath+"'>";
	                 str +="</div></li>";
	           //   }
	           });
	           $(".uploadResult ul").html(str);
	 		}); //end getjson
	  		
	    function showUploadResult(uploadResultArr){
			  if(!uploadResultArr || uploadResultArr.length == 0){return ;}
			  var uploadUL = $(".uploadResult ul");
			  var str = "";
			  
			  $(uploadResultArr).each(function(i, obj){
				  
				   //image type
			        if(obj){
			          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			        /*   str += "<li data-path ='"+obj.uploadPath+"'";
			          str += "<data-uuid = '"+obj.uuid+"' data-filename='"+obj.fileName+ "' data-type = '"+obj.image+"'";
			          str += "><div>"; */
			          str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
			          str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "<img src='/reserv/display?fileName="+fileCallPath+"'>";
			          str += "</div>";
			          str +"</li>";
			        }
			      /*   else{
			          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
			            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			              
			           str += "<li ";
				    //  str += " data-path ='"+obj.uploadPath+"'"+"'<data-uuid = '"+obj.uuid+"'data-filename='"+obj.fileName+ "'data-type ='"+obj.image+"'></div>"; 
				     // str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
			          str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "<img src='/resources/images/attach.png'></a>";
			          str += "</div>";
			          str +"</li>";
			        }  */
			  });
				uploadUL.append(str);
		  }//showUploadedFile
		  
		  $(".uploadResult").on("click","button",function(e){
				var targetFile = $(this).data("file");
			  	var type = $(this).data("type");
			  	var targetLi = $(this).closest("li");//서버와 화면에서 제거
		  		console.log("delete"+targetFile); 
		  		
		  		$.ajax({
		  			url :'/deleteFile',
		  			data : {fileName : targetFile, type : type},
		  			dataType : 'text',
		  			type : 'post',
		  				success : function(result){
		  					alert(result);
		  					targetLi.remove();
		  				}
		  		}); // $ajax
		  });//uploadResult
		  
		 
});
</script>
	<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>