<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${mapProperty.clientID}&submodules=geocoder"></script>
<script type="text/javascript" src="resources/js/activity/selectOneUserAct.js?ver=7"></script>

<style>
.carousel {
   width:600px;
   height:360px;
   margin: auto;
 }
 .carousel-inner > .item > img {
   width:600px;
   height:360px;
 }
 .carousel > .carousel-inner > .carousel-item > img{
    width:600px;
    height:360px;
}
</style>

<title>상품 정보</title>
<!-- 네이버 지도 API JS -->
<script type="text/javascript">
	let result = '${vo2.add}';
	const user_id = '${user.user_id}';
</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section>
	<h1 style="margin-top:40px;">  </h1>
    <div id="carouselControls" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
 	  </ol>	
	  <div class="carousel-inner">
	  </div>
	 <button class="carousel-control-prev" type="button" data-target="#carouselControls" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">이전</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-target="#carouselControls" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">다음</span>
	  </button>
	</div>
	<div class="card" style="float:right;
						width:350px;
						align-items: center;
						margin-top: 50px;">
		<form action='#' id='Reservation' method='POST' style="text-align-last: center; margin:20px">
			<p>예약 날짜 선택</p>
			<input type="date" name="res_date" id="datePicker" min="" style="margin-bottom: 25px;" required>
			<p>수량 선택</p>
			<input type='button' value='-' class='qtyminus minus' onclick='decrementQuantity()' />
			<input type='text' name='quantity' value='1' id='quantity' class='qty' required/>
			<input type='button' value='+' class='qtyplus plus' onclick='incrementQuantity()' />
			<br><br>
			<input type='hidden' name='act_id' value='${vo2.id}'/>
			<input type='hidden' name='price' id='price' value='${vo2.price}'/>
			<input type='hidden' name='user_id' value='${user.user_id}'/>
			<input class="btn btn-primary" type="submit" form="Reservation" formaction="insertOneReservation.do" value="바로구매"  style="background-color: #0000c9; color: white; font-weight:bold;">
			<button class="btn btn-primary" type="button" onclick="insertOneCart()"  style="background-color: #0000c9; color: white; font-weight:bold;">장바구니</button>
		</form>
	</div>
	<div
	style="background-color:inherit;
			padding:1rem 1rem;
			width:600px;
			margin-top:30px;">
		<div>
	  	<h2 style="display: inline-flex; width: 440px; font-size:20px;">${vo2.act_name}</h2>
	  	<button class="myButton" onclick="copyLink()"  style="font-size: medium;">공유</button>
		<button id="wish" class="${vo2.id} btn btn-outline-danger" onclick="addWish('${user.user_id}','${vo2.id}')" style="font-size: large; padding: 2.5px 7px 4.5px 6px; margin-top:-2px; margin-left:-2px">♡</button>
		</div>
	  <p class="lead">${vo2.content}</p>
	</div>
	<div class="card-body">
		<div class="isCommented" style="font-size:19px;">평균별점</div><div><span class="stars" style="float:left; margin-top:-20px; margin-left:90px;"> ${vo2.rate}</span></div>
		<a href="selectOneComments.do?act_id=${vo2.id}" class="btn btn-primary isCommented" style="background-color: #0000c9; color: white; margin-top: -30px; float: left; margin-left: 469px; font-size: 15px; font-weight: bold;">모든 이용후기</a>
	</div>
	<div class="card" style="width: 600px; margin-left: 10px;">
		<div class="card-body">
			<div id="OneComment" class="card-text">
			</div>
		</div>
	</div>
	<br>
	<br>
	<div style="margin: 0 10px 10px;">
		<p>주소: ${vo2.add}</p>
		<div id="map" style="width:600px;height:400px;"></div>
	</div>
	<button class="myButton loginCheckContact" data-act_id="${vo2.id}" data-seller_id="${vo2.seller_id}">문의하기</button>
</section>


<jsp:include page="../footer.jsp"></jsp:include>
<!-- 로그인 안할시 띄울 모달창 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">경고!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        로그인 해주세요
      </div>
      <div class="modal-footer">
        <a href="login.do" type="button" class="btn btn-primary">로그인하러가기</a>
      </div>
    </div>
  </div>
</div>

<!-- 지도 구현 js -->
<script type="text/javascript" src="resources/js/Maps.js"></script>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script type="text/javascript">
var bootstrapButton = $.fn.button.noConflict() // return $.fn.button to previously assigned value
$.fn.bootstrapBtn = bootstrapButton   
</script>
<!-- https://fontawesome.com/search 아이콘들 주소 -->
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
</body>
</html>