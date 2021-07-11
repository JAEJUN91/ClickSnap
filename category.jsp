<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 유선영 - 카테고리 -->
<jsp:include page="../include/nav.jsp"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" /> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
body{
	overflow:scroll;
	}
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h2{
font-family: 'IBMPlexSansKR-Regular';
}
@font-face {
    font-family: 'Cafe24Oneprettynight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

a{text-decoration:none;}
.artist{display:flex;justify-content:center;margin:auto 0; padding:50px;}
.col-sm-3 .col-sm-3 .col-lg-3{text-align:center;margin-left:5px; margin-right:5px;}
/* .col-sm-3 {text-align:center; margin-left:-25px; margin-right:-25px;}  */
.row{padding:20px;}
.rounded-3{border-raidus:3px; position:realative;} 
.border{ position:relative; float:none; margin:0 auto; width:200px;height:40px; margin-top:-20px; z-index:10; background-color:white;}
.rounded-circle{position:relative; z-index:-10;}
.row1{text-align:center;}
.img-thumbnail{width:220px;}



#topMenu{text-align:center; display:flex;justify-content:center;margin:auto 0; padding-bottom:10px; padding-top:15px;}
#topMenu ul li{list-style: none;color: white;background-color: white;float: left;line-height: 10px;vertical-align: middle;text-align: center;}
#topMenu .menuLink{margin-right:20px;text-decoration:none;color: black;width: 150px;font-size: 20px;font-weight: bold;}
#topMenu .menuLink:hover{color: blue;}
 
 
.swiper-container {
      width: 80%;
      height: 80vh;
    }
.swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

    
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }

.swiper-container-vertical>.swiper-pagination-bullets{
    top: unset !important;
    bottom: 10px;
    left: 0;
    width: 100%;
}

.swiper-container-vertical>.swiper-pagination-bullets .swiper-pagination-bullet{
  display : inline-block !important;
  margin: 6px 2px !important;
} 
.swiper-slide img{   width: 100%;
      height: 80vh;}
.search{text-align:center; margin:auto 0;}
.r-artist{border:2px solid gray; border-radius:5px; position:relative; float:none; margin:0 auto; width:200px;height:40px; margin-top:-20px; z-index:10; background-color:white;}
.banner{width: 100%;}
#cn{
	font-size:20px;	
	font-weight:bold;
	color:black;
	text-align:center;
}
#cn a{color:black; padding:10px;}
#cn a:hover{color:blue;}

     #caption a {                         /*a 태그의 디자인*/
        color: #white;   
        text-decoration: none;
      }
      #items {                    /*item요소를 감싸는 부모요소*/
        border: 1px solid while;
        text-align: center;       /*내부 글자 배치를 중앙정렬*/
      }

      #item {                     /*내용을 담는 item요소*/
        display: inline-block;    /*여러 요소들을 일렬로 나열 */
        width: 300px;
        height: 200px;
        position: relative;       /*내부 요소의 고정 위치 설정(1)*/
      }
     #caption {
        width: 300px;
        height: 200px;
        background-color: #000;
        position: absolute;       /*내부 요소의 고정 위치 설정(2)*/
        top: 0;
        left: 0;
        color: #fff;
        padding: 20px;
        box-sizing: border-box;  /* 300x300 안에 padding이 적용되도록 함 */
        padding-top: 40px;
        opacity: 0;              /* 투명도가 처음에는 0이었지만 어떤 이벤트가 발생하면 0.5초뒤에 발생함*/
        transition: 0.5s;        /*caption에 이벤트가 발생하여 0.5초 딜레이 후 발생시킴*/
      }
 
      #item:hover #caption {    
        opacity: 1;
      }
      #caption a {
        color: #white;
        background-color: teal;
        padding: 7px;
        border-radius: 3px;
      }
      #caption a:hover {
        background-color: #fff;
        color: #000;
      }
      #banner:hover{
      mix-blend-mode: normal;
      }
</style>

<!-- <img alt="" id="banner" class="banner active" src="../resources/images/couple.jpg" style=" mix-blend-mode: luminosity;"> -->


<header id="banner"
		style="background-image: url(../resources/images/couple.jpg) " >
		<div class="container">
			<div class="slider-container">
				<div class="intro-text"></div>
			</div>
		</div>
	</header>



<!-- <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../resources/images/1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../resources/images/1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="../resources/images/1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div> -->
<!-- <div class="swiper-container">
  보여지는 영역
  <div class="swiper-wrapper">
    
    <div class="swiper-slide"><img src="../resources/images/1.jpg" class="d-block w-100" alt="..."></div>
    <div class="swiper-slide"><img src="../resources/images/2.jpg" class="d-block w-100" alt="..."></div>
    <div class="swiper-slide"><img src="../resources/images/3.jpg" class="d-block w-100" alt="..."></div>
  </div>
  페이징 버튼 처리
  <div class="swiper-pagination"></div>

  방향 버튼 상황에 따라 추가 삭제가능
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
</div>
 -->

<div class="container" style="padding-top:10px;">
	<nav class="nav" id="cn">
		<a class="nav-link" href="#" onclick="searchByCat('friend')">FRIENDSHIP</a>
		<a class="nav-link" href="#" onclick="searchByCat('family')">FAMILY</a>
		<a class="nav-link" href="#" onclick="searchByCat('travel')">TRAVEL</a>
		<a class="nav-link" href="#" onclick="searchByCat('couple')">COUPLE</a>
		<a class="nav-link" href="#" onclick="searchByCat('marriage')">WEDDING</a>
	</nav>
</div>
 <hr class="featurette-divider">
 	
      <div class="container marketing" style="text-align:center;">
			<h2 class="artist">추천 작가</h2>
        <div class="row">
        	<c:forEach items="${rec}" var="rec">
				 <div class="col-sm-6 col-md-3">
		            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200">
		            <a href="/artPage/artistList?artistId=${rec.artistId}"><div class="r-artist"><h4><c:out value="${rec.nickName}"/></h4></div></a>
		           
		          </div><!-- /.col-lg-4 -->
		     </c:forEach>
        </div><!-- /.row -->
	

	
 	<hr class="featurette-divider">	

        <!-- 검색창 -->


	<form>
		<div class="form-group row">
			<div class="search">
				<div class="col-sm-2 col-lg-2" class="form-control">
				<!-- 지역 -->
					<select class="form-control" aria-label=".form-select-sm example" name="location" id="type">
						  <option value="" selected >지역</option>
						  <option value="2001">서울</option>
						  <option value="2002">인천</option>
						  <option value="2003">부산</option>
						</select>
				</div>
				<div class="col-sm-2 col-lg-2" class="form-control">
					<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
					  해시태그
					</button>	 -->
					<input type="checkbox" name="tag" value="1001" onchange="makeFilter(this);" /> 싱그러운 
					<input type="checkbox" name="tag" value="1002" onchange="makeFilter(this);" /> 밝은 
					<input type="checkbox" name="tag" value="1003" onchange="makeFilter(this);" /> 행복한 
					<input type="checkbox" name="tag" value="1004" onchange="makeFilter(this);" /> 다크한 
				</div>
				
				<div class="col-sm-3 col-lg-3" class="form-control">	
					<input class="form-control" name="hashTag" id="showFilter" placeholder="분위기" aria-label="Search" readOnly>
				<!-- 타입 -->
				</div>
				<div class="col-sm-2 col-lg-2" class="form-control">
					<select class="form-control" aria-label=".form-select-sm example" name="type" id="type">
						  <option selected value="">==</option>
						  <option value="T">제목</option>
						  <option value="C">내용</option>
						  <option value="TC">제목/내용</option>
						</select>
				</div>
				<div class="col-sm-2 col-lg-2" class="form-control">
					<input class="form-control sm-2" type="text" placeholder="키워드" aria-label="keyword" name='keyword'>
				</div>
				<div class="col-sm-1 col-lg-1" class="form-control">
					<button class="btn btn-outline-success sm-1" id="btn-search" type="button">검색</button>
				</div>
			</div>
		</div>
	</form>


		<!-- Modal -->
		<div class="modal fade bd-example-modal-lg" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">해시태그</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		      </div>
				<div class="modal-body">
					<!-- onchange="makeFilter(this);" -->
					<!-- <input type="checkbox" name="tag" value="1001" onchange="makeFilter(this);" /> 싱그러운 
					<input type="checkbox"name="tag" value="1002" onchange="makeFilter(this);" /> 밝은 
					<input type="checkbox" name="tag" value="1003" onchange="makeFilter(this);" /> 행복한 
					<input type="checkbox" name="tag" value="1004" onchange="makeFilter(this);" /> 다크한 <br> -->
					
					<table style="width: 100%">
						<tr>
							<td><input type="checkbox" name="tag" value="1001" onchange="makeFilter(this);" /> # 싱그러운</td>
							<td><input type="checkbox" name="tag" value="1002" onchange="makeFilter(this);" /> # 밝은</td>
							<td><input type="checkbox" name="tag" value="1003" onchange="makeFilter(this);" /> # 행복한</td>
							<td><input type="checkbox" name="tag" value="1004" onchange="makeFilter(this);" /> # 로맨틱한</td>
							<td><input type="checkbox" name="tag" value="1005" onchange="makeFilter(this);" /> # 환상적인</td>
							<td><input type="checkbox" name="tag" value="1006" onchange="makeFilter(this);" /> # 신나는</td>
							<td><input type="checkbox" name="tag" value="1007" onchange="makeFilter(this);" /> # 익살맞은</td>
							<td><input type="checkbox" name="tag" value="1008" onchange="makeFilter(this);" /> # 비극적인</td>
													
						</tr>
						<tr>
							<td><input type="checkbox" name="tag" value="1009" onchange="makeFilter(this);" /> # 기쁜</td>
							<td><input type="checkbox" name="tag" value="1010" onchange="makeFilter(this);" /> # 낭만적인</td>
							<td><input type="checkbox" name="tag" value="1011" onchange="makeFilter(this);" /> # 풍자적인</td>
							<td><input type="checkbox" name="tag" value="1012" onchange="makeFilter(this);" /> # 분위기 있는</td>
							<td><input type="checkbox" name="tag" value="1013" onchange="makeFilter(this);" /> # 화목한</td>
							<td><input type="checkbox" name="tag" value="1014" onchange="makeFilter(this);" /> # 멋진</td>
							<td><input type="checkbox" name="tag" value="1015" onchange="makeFilter(this);" /> # 신선한</td>
							<td><input type="checkbox" name="tag" value="1016" onchange="makeFilter(this);" /> # 우스꽝스러운</td>
						
						</tr>
						<tr>
							<td><input type="checkbox" name="tag" value="1017" onchange="makeFilter(this);" /> # 정의로운</td>
							<td><input type="checkbox" name="tag" value="1018" onchange="makeFilter(this);" /> # 정열적인</td>
							<td><input type="checkbox" name="tag" value="1019" onchange="makeFilter(this);" /> # 온화한</td>
							<td><input type="checkbox" name="tag" value="1020" onchange="makeFilter(this);" /> # 가냘픈</td>
							<td><input type="checkbox" name="tag" value="1021" onchange="makeFilter(this);" /> # 거친</td>
							<td><input type="checkbox" name="tag" value="1022" onchange="makeFilter(this);" /> # 리드미컬한</td>
							<td><input type="checkbox" name="tag" value="1023" onchange="makeFilter(this);" /> # 서글픈</td>
							<td><input type="checkbox" name="tag" value="1024" onchange="makeFilter(this);" /> # 능청스러운</td>
							
						</tr>
						<tr>
							<td><input type="checkbox" name="tag" value="1025" onchange="makeFilter(this);" /> # 재미있는</td>
							<td><input type="checkbox" name="tag" value="1026" onchange="makeFilter(this);" /> # 활기찬</td>
							<td><input type="checkbox" name="tag" value="1027" onchange="makeFilter(this);" /> # 귀여운</td>
							<td><input type="checkbox" name="tag" value="1028" onchange="makeFilter(this);" /> # 부드러운</td>
							<td><input type="checkbox" name="tag" value="1029" onchange="makeFilter(this);" /> # 수줍은</td>
							<td><input type="checkbox" name="tag" value="1030" onchange="makeFilter(this);" /> # 깨끗한</td>
							<td><input type="checkbox" name="tag" value="1031" onchange="makeFilter(this);" /> # 변화무쌍한</td>
							<td><input type="checkbox" name="tag" value="1032" onchange="makeFilter(this);" /> # 다정다감한</td>
						</tr>
					</table>
					필터입력값 : <input type="text" id="showFilter" />
				</div>
				<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">등록</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	 <hr class="featurette-divider">
		

	<!-- 이미지 -->

	 <div class="row"  id="search">
	 	
	 	
	</div><!-- 카테고리 무한스크롤 END -->
     
	<table>
			<tr>
         		<th>
         			<div class="pull-right">
		      
	            	</div><!-- pagination -->
	            	<form id="actionForm" action="/category/category" method="get">
					<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum }'> 
					<input type="hidden" name="amount" value='${pageMaker.cri.amount }'>
					<input type="hidden" name="totalPageNum" value='${pageMaker.totalPageNum }'>
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"/>
					<input type="hidden" name="type" value="${pageMaker.cri.type }"/> 
					</form>
	            	
				
         		</th>
         	</tr>
	</table> 
	     
</div>

	
<jsp:include page="../include/footer.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/search.js"></script>
<!-- <script src="https://unpkg.com/swiper/swiper-bundle.js"></script> 
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
<script>
console.log(service);

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
	var tagArr1 = tagArr.join(" ");
	showFilterValue.value = tagArr1; // textBox에 필터 배열 추가 
	console.log("필터입력값 출력 : "+tagArr); } 

	var str ="";
	var target = $('#prod');

	function searchByCat(category){
		
		$('#banner').attr("style", "background-image:url(../resources/images/"+category+".jpg)");
		
		$.ajax({
			url: '/category/getByCategory/'+category,
			type: 'get',
			dataType: 'json',
			success: function(result){
				if(str == ''){
					addProd(result);
				}else{
					target.empty().append("<br><h2>상품리스트</h2>");
					str = '';
					addProd(result);
				}	
			}
		});
	}
	
	$("#btn-search").on("click",function(e){
		
		$("#search").empty();
		
		var location= $(".search").find("select[name='location']").val();
		var keyword= $(".search").find("input[name='keyword']").val().replace(/\s/gi, "");
		var type= $(".search").find("select[name='type']").val();
		var tag = $(".search").find("input:checkbox[name='tag']:checked").val();
		var tagArr = [];
		
		
		keyword.replace(/\s/gi, "");
		
		console.log("trim"+keyword);
		
		$('input:checkbox[name="tag"]').each(function(){
			if(this.checked){	
				tagArr.push($(this).val());
			}
		})
	
		console.log("location"+location+"keyword"+keyword+"type"+type+"tagArr"+tagArr);
		
		
		
		 if(keyword!=null && type!=null && tagArr=='' && location==''){
				service.findByKeyword1({keyword: keyword, type:type}, 
				function(list){
				console.log(list);
				var str = "";
				var sResult = $("#search")
				$(list).each(function(i,obj){
					
					str += "<div class='col-sm-6 col-md-4' id='items'>"
						str += "<div id='item'><div>"
				        str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
				        str += "</div>"
				        str += "<div id='caption'>"
				        str += "<h2>"+obj.sno+"</h2>"
				        str += "<p>"+obj.title+"</p>"
				        str += "<p>id: "+obj.category+"</p>"
				        str += "</div>"
				        str += "</div>"	
				        str += "</div>"
				});
				sResult.append(str);
			})
		 }  //키워드랑 타입이 널이 아니라면
		else if(keyword=='' && type=='' && tagArr!=null && location==''){
		 	service.findByKeyword2({tagArr:tagArr},
				function(list){
				console.log(list);
				var str = "";
				var sResult = $("#search")
				$(list).each(function(i,obj){
					str += "<div class='col-sm-6 col-md-4' id='items'>"
						str += "<div id='item'><div>"
				        str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
				        str += "</div>"
				        str += "<div id='caption'>"
				        str += "<h2>"+obj.sno+"</h2>"
				        str += "<p>"+obj.title+"</p>"
				        str += "<p>id: "+obj.category+"</p>"
				        str += "</div>"
				        str += "</div>"	
				        str += "</div>"
				});
				sResult.append(str);
			})
			
		}//tagArr이 널이 아니라면
		else if(keyword=='' && type=='' && tagArr=='' && location!=null) {
			service.findByKeyword3({location:location},
				function(list){
				console.log(list);
				var str ="";
				var sResult = $("#search")
				$(list).each(function(i,obj){
					str += "<div class='col-sm-6 col-md-4' id='items'>"
						str += "<div id='item'><div>"
				        str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
				        str += "</div>"
				        str += "<div id='caption'>"
				        str += "<h2>"+obj.sno+"</h2>"
				        str += "<p>"+obj.title+"</p>"
				        str += "<p>id: "+obj.category+"</p>"
				        str += "</div>"
				        str += "</div>"	
				        str += "</div>"
				});
				sResult.append(str);
			})
			
		}else if(keyword=='' && type=='' && tagArr!=null && location!=null) {
			service.findByKeyword4({location:location, tagArr:tagArr},
					function(list){
					console.log(list);
					var str ="";
					var sResult = $("#search")
					$(list).each(function(i,obj){
						str += "<div class='col-sm-6 col-md-4' id='items'>"
							str += "<div class='col-sm-6 col-md-4' id='items'>"
								str += "<div id='item'><div>"
						        str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
						        str += "</div>"
						        str += "<div id='caption'>"
						        str += "<h2>"+obj.sno+"</h2>"
						        str += "<p>"+obj.title+"</p>"
						        str += "<p>id: "+obj.category+"</p>"
						        str += "</div>"
						        str += "</div>"	
						        str += "</div>"
					});
					sResult.append(str);
				})
		}//tag랑 location
		else if(keyword!=null && type!=null && tagArr!=null && location=='') {
			service.findByKeyword5({keyword: keyword, type:type, tagArr:tagArr},
					function(list){
					console.log(list);
					var str ="";
					var sResult = $("#search")
					$(list).each(function(i,obj){
						str += "<div class='col-sm-6 col-md-4' id='items'>"
							str += "<div id='item'><div>"
					        str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
					        str += "</div>"
					        str += "<div id='caption'>"
					        str += "<h2>"+obj.sno+"</h2>"
					        str += "<p>"+obj.title+"</p>"
					        str += "<p>id: "+obj.category+"</p>"
					        str += "</div>"
					        str += "</div>"	
					        str += "</div>"
					});
					sResult.append(str);
				})
		}
		else if(keyword!=null && type!=null && tagArr=='' && location!=null) {
			service.findByKeyword6({keyword: keyword, type:type, location:location},
					function(list){
					console.log(list);
					var str ="";
					var sResult = $("#search")
					$(list).each(function(i,obj){
						str += "<div class='col-sm-6 col-md-4' id='items'>"
							str += "<div id='item'><div>"
					        str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
					        str += "</div>"
					        str += "<div id='caption'>"
					        str += "<h2>"+obj.sno+"</h2>"
					        str += "<p>"+obj.title+"</p>"
					        str += "<p>id: "+obj.category+"</p>"
					        str += "</div>"
					        str += "</div>"	
					        str += "</div>"
					});
					sResult.append(str);
				})
		}
		else if(keyword!=null && type!=null && tagArr!=null && location!=null) {
			service.findByKeyword7({type:type, keyword: keyword, location:location, tagArr:tagArr},
					function(list){
					console.log(list);
					var str ="";
					var sResult = $("#search")
					$(list).each(function(i,obj){
						str += "<div class='col-sm-6 col-md-4' id='items'>"
							str += "<div id='item'><div>"
					        str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
					        str += "</div>"
					        str += "<div id='caption'>"
					        str += "<h2>"+obj.sno+"</h2>"
					        str += "<p>"+obj.title+"</p>"
					        str += "<p>id: "+obj.category+"</p>"
					        str += "</div>"
					        str += "</div>"	
					        str += "</div>"
					});
					sResult.append(str);
				})
		}
		else if(keyword!=null && type=='' && tagArr!=null && location!=null){
			alert("검색할 단어를 입력해주세요");
		}
		else if(keyword!=null && type=='' && tagArr=='' && location!=null){
			alert("검색할 단어를 입력해주세요");
		}
		else if(keyword!=null && type=='' && tagArr!=null && location==''){
			alert("검색할 단어를 입력해주세요");
		}
		else if(keyword!=null && type=='' && tagArr=='' && location==''){
			alert("검색할 단어를 입력해주세요");
		}
		else if(keyword=='' && type=='' && tagArr=='' && location==''){
			alert("정보를 입력해주세요");
		}
		
	});

	
	
 /* const swiper = new Swiper('.swiper-container', {
	  //기본 셋팅
	  //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
	  direction: 'horizontal',
	  //한번에 보여지는 페이지 숫자
	  slidesPerView: 1,
	  //페이지와 페이지 사이의 간격
	  spaceBetween: 30,
	  //드레그 기능 true 사용가능 false 사용불가
	  debugger: true,
	  //마우스 휠기능 true 사용가능 false 사용불가
	  mousewheel: false,
	  //반복 기능 true 사용가능 false 사용불가
	  loop: true,
	  //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
	  centeredSlides: true,
	  // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
	  // effect: 'fade',
	  
	  
	  //자동 스크를링
	  autoplay: {
	    //시간 1000 이 1초
	    delay: 7000,
	    disableOnInteraction: false,
	   },
	  
	  //페이징
	  pagination: {
	    //페이지 기능
	    el: '.swiper-pagination',
	    //클릭 가능여부
	    clickable: true,
	  },

	  //방향표
	  navigation: {
	    //다음페이지 설정
	    nextEl: '.swiper-button-next',
	    //이전페이지 설정
	    prevEl: '.swiper-button-prev',
	  },
	  
	}); */
	
	
	
	$(document).ready(function(){
		
	var actionForm = $("#actionForm");
		
	var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
	
	var search2 = $("#search"); 

	showList(1);
	
	function showList(page){ 
		console.log("showlist");
		service.getList({page: page || 1 },function(list){
			
			if(page==-1) {
				pageNum=Math.ceil(totalPageNum/10.0)
				showList(pageNum)
				return
	        } 
			var str ="";
			if(list == null || list.length == 0){
				search2.html("");
				return;
			}
			for(var i = 0, len = list.length || 0 ; i< len ; i++){
				str += "<div class='col-sm-6 col-md-4' id='items'>"
				str += "<div id='item'><div>"
			    str += "<img class='img-thumbnail' src='data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==' style='width:300px; height:200px;'alt='Generic placeholder image' >"
			    str += "</div>"
			    str += "<div id='caption'>"
			    str += "<h2>"+list[i].sno+"</h2>"
			    str += "<p>"+list[i].title+"</p>"
			    str += "<a href='/artPage/serviceView?sno="+list[i].sno+"' class='btn btn-primary'>보러가기</a>"
			    str += "</div>"
			    str += "</div>"	
			    str += "</div>"
			}
			
			search2.append(str);
			
		})//end func
		
	 }//end showlist 
	      
  	 $(window).scroll(function(){
	
 		
		  var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
			var totalPageNum = parseInt(actionForm.find("input[name='totalPageNum']").val());
	
	
	  if($(window).scrollTop()+1 >= $(document).height() - $(window).height()){
			
			if(currentPageNum +1 <= totalPageNum){	
				
				actionForm.find("input[name='pageNum']").val(currentPageNum +1);
				
				var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
				
				showList(currentPageNum)
         
       		}
	  
 		}
  	})
      
    
  
	
	     

	

	
	 $(".paginate_button a").on("click",function(e) {
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val( // actioForm의 href태그를 누루면 pageNum을 같이 넘겨줘라
						$(this).attr("href"));
				actionForm.submit();
		}); 
	 $(".move").on("click",function(e){
		e.preventDefault();
		console.log('click');
		actionForm.append("<input type='hidden' name='sno' value='"+$(this).attr("href")+"'/>");
		actionForm.attr("action","/category/category");
		actionForm.submit();
	}); 
	
	var actionForm = $("#actionForm");
	
	var currentPageNum = parseInt(actionForm.find("input[name='pageNum']").val());
	
	

	
});
	//document ready function
</script>