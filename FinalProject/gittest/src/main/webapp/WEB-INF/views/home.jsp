<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>발길7ㅏ는대로 ~P를 위한 여행~</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<jsp:include page="./css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/cardAndStar.css?ver=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/home.js?ver=2"></script>
</head>
<body>
<%@include file="top_menu.jsp" %>

<section>
	<section>
<!-- 		<h4 style="margin-bottom:40px; font-weight:bold; font-size:25px; color:#0000c8">발길7ㅏ는대로</h4> -->
		<div><img src="resources/uploadimg/main.png" width="400px" style="margin-bottom:40px;"></div>
		<label for="searchWord"></label>
		<input type="hidden" name="searchKey" id="searchKey" value="act_name">
		<div style="width:350px; height:60px; border:5px solid #0000c8; border-radius:30px; padding-top:5px; padding-left: 8px; margin-bottom:50px; margin-left:320px;">
		<input type="text" name="searchWord" id="searchWord"  placeholder="상품을 검색해보세요!">
		<button class="myButton" onclick="searchAct()" >검색</button>
		</div>
	</section>

	<section id="recommended">
	</section>
	
	<section id="allAct" style=" margin-top:50px;">
	</section>
</section>
<jsp:include page="./footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script>
function searchAct(){
	window.location.href = "searchActHome.do?searchWord=" + $('#searchWord').val();
}
</script>
</body>
</html>