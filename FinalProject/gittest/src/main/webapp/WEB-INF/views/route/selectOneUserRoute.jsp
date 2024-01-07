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
<script type="text/javascript" src="resources/js/route/selectOneUserRoute.js?ver=7"></script>
<style>
#act_container > div > a > img{
	height:150px;
}
</style>

<title>루트 정보</title>
<script type="text/javascript">
	const user_id = '${user.user_id}'; 
	console.log("로그인?",user_id);
</script>

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="padding-left: 2rem; padding-right: 2rem;">
	<div class="jumbotron" style="background-color:inherit; padding:2rem 0rem 0rem 0rem; margin-top:30px; margin-bottom: 0px;">
	  <p id="추천수" style="float:right">
	  </p>
	  <h4 class="display-5" style="font-size:20px; font-weight:bold;"></h4>
	  <p class="lead" style="font-size:16px"></p>
	  <hr class="my-2">
	</div>
	
	<div id="act_container" class="card-group" style="margin: 0rem -1rem;">
	</div>
	
	<div id="route_content">
	</div>
	
	<div style="margin-top:20px;">
		<div style="float: right; margin-right: 176px;">
			<button class="myButton" onclick="showRoadRoute()">도로경로 표시하기</button><br>
			<button class="myButton" onclick="hideRoadRoute()">원래대로 표시하기</button>
		</div> 
		<div id="map" style="width:600px;height:400px;"></div>	
	</div>
	
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
<script type="text/javascript" src="resources/js/Maps.js?ver=4"></script>
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