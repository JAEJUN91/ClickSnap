<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 유선영 - 카테고리 -->
<jsp:include page="../include/nav.jsp"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" /> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
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
.col-lg-3{text-align:center;}
.col-md-3 {text-align:center; margin-left:-25px; margin-right:-25px;} 
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

</style>

<img alt="" id="banner" class="banner active" src="../resources/images/couple.jpg">

<div class="row"> 
    <nav id="topMenu" >
                <ul>
                        <li><a class="menuLink" href="#" onclick="searchByCat('family')">FAMILY</a></li>
                        <li><a class="menuLink" href="#" onclick="searchByCat('travel')">TRAVEL</a></li>
                        <li><a class="menuLink" href="#" onclick="searchByCat('couple')">COUPLE</a></li>
                        <li><a class="menuLink" href="#" onclick="searchByCat('friend')">FRIENDSHIP</a></li>
                        <li><a class="menuLink" href="#" onclick="searchByCat('marriage')">WEDDING</a></li>
                        
                </ul>
        </nav>
</div>
	



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
<div class="swiper-container">
<!--   보여지는 영역 -->
  <div class="swiper-wrapper">
    
    <div class="swiper-slide"><img src="../resources/images/1.jpg" class="d-block w-100" alt="..."></div>
    <div class="swiper-slide"><img src="../resources/images/2.jpg" class="d-block w-100" alt="..."></div>
    <div class="swiper-slide"><img src="../resources/images/3.jpg" class="d-block w-100" alt="..."></div>
  </div>
  <!-- 페이징 버튼 처리 -->
  <div class="swiper-pagination"></div>

  <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
</div>



 <hr class="featurette-divider">
 	
      <div class="container marketing">
			<h2 class="artist">추천 작가</h2>
        <div class="row">
          <div class="col-lg-3 arti">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200">
            <div class="r-artist"><h4>Hading</h4></div>
          </div><!-- /.col-lg-4 -->
          
          <div class="col-lg-3 arti">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200"><br>
                <div class="r-artist"><h4>Hading</h4></div>
          </div><!-- /.col-lg-4 -->
          
          <div class="col-lg-3 arti">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200">
            <div class="r-artist"><h4>Hading</h4></div>
          </div><!-- /.col-lg-4 -->
          
           <div class="col-lg-3">
            <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200">
              <div class="r-artist"><h4>Hading</h4></div>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
	

	
 	<hr class="featurette-divider">	

        <!-- 검색창 -->


	<form>
		<div class="form-group row">
			<div class="search">
			<div class="col-md-2 col-lg-2">
			<!-- 지역 -->
				<select class="form-control" aria-label=".form-select-sm example" name="" id="">
					  <option selected>지역</option>
					  <option value="S">서울</option>
					  <option value="I">인천</option>
					  <option value="B">부산</option>
					</select>
			</div>
			<div class="col-md-2 col-lg-2">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
				  해시태그
				</button>	
			</div>
			
			<div class="col-md-2 col-lg-2">	
				<input class="form-control" name="hashTag" placeholder="분위기" aria-label="Search" readOnly>
			<!-- 타입 -->
			</div>
			<div class="col-md-2 col-lg-2">
				<select class="form-control" aria-label=".form-select-sm example" name="" id="">
					  <option selected>타입</option>
					  <option value="T">title</option>
					  <option value="C">content</option>
					  <option value="TC">title/content</option>
					</select>
			</div>
			<div class="col-md-2 col-lg-2">
				<input class="form-control sm-2" type="search" placeholder="Search" aria-label="Search">
				<!-- <form class="form-inline my-2 my-lg-0">
			      <input class="form-control md-2" type="search" placeholder="Search" aria-label="Search">
			    </form>	 -->
			</div>
			<div class="col-md-2 col-lg-2">
			<button class="btn btn-outline-success sm-1" type="submit">Search</button>
				</div>
			</div>
		</div>
	</form>


		<!-- Modal -->
		<div class="modal fade bd-example-modal-lg" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Understood</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	 <hr class="featurette-divider">
		

	<!-- 이미지 -->

	 <div class="row">
          <div class="col-lg-3 arti">
            <img class="img-thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200">
            
          </div><!-- /.col-lg-4 -->
          
          <div class="col-lg-3 arti">
            <img class="img-thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200"><br>
            
          </div><!-- /.col-lg-4 -->
          
          <div class="col-lg-3 arti">
            <img class="img-thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200">
            
          </div><!-- /.col-lg-4 -->
          
           <div class="col-lg-3">
            <img class="img-thumbnail" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="200" height="200">

          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->
        
       <div class="row" id="prod">
			<br>
			<h2>상품리스트</h2>
			<!-- <div class="col-md-6">
				<div class="card mb-4">
					<img class="card-img-top" src="../resources/images/s1.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"
							style="font-size: large; font-weight: bold;">웨딩 촬영 가성비 넘치게
							촬영해 드립니다. (서울 경기권)</h5>
						<p class="card-text">artist_id작가님의 상품</p>
						<a href="#" class="btn btn-primary">보러가기</a>
					</div>
				</div>
			</div> -->
		</div>
	
	<div class="row1">
		<button type="button" class="btn btn-secondary btn-lg" disabled>↓</button>
	</div>
</div>

	
<jsp:include page="../include/footer.jsp"/>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script> 
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>

var str ="";
var target = $('#prod');

	function searchByCat(category){
		
		$('#banner').attr("src", "../resources/images/"+category+'.jpg');
		
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
	
	function addProd(list){

		//console.log(list.list[0].title);
		
		$(list.list).each(function(i, obj){
		
			str += "<div class='col-md-6'>"
			str += "<div class='card mb-4'><img class='card-img-top' src=''../resources/images/s1.jpg' alt='Card image cap'>";
			str += "<div class='card-body'>";
			str += "<h5 class='card-title' style='font-size: large; font-weight: bold;'>"+obj.title+"</h5>";
			str += "<p class='card-text'>"+ obj.artist_id +"작가님의 상품</p>";
			str += "<a href=''#' class='btn btn-primary'>보러가기</a></div></div></div>";
			target.append(str);
			console.log(str);
		});
	}

 const swiper = new Swiper('.swiper-container', {
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
	  
	});
</script>