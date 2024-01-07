<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 루트</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<%@include file="../top_menu.jsp" %>
<section>
	<section id="destinations">
		<h3 style="font-weight:bold; font-size:19px; margin-top:30px;">현재 이용 가능한 여행지</h3>
		<div class="scrolling-wrapper row flex-row mt-4 pb-4 pt-2">
				<a class="col-3" href="selectOneDestRoute.do?dest_id=1">
					<span class="card card-block" style="margin-bottom:30px">
						<img class="card-img-top" width='150px' height='200px' style="border-radius:15px;" src="https://youimg1.tripcdn.com/target/0101c12000adm19trE691_C_670_770_R5.jpg_.webp">
						<span class="card-act-name" style="font-weight:bold; font-size:17px;">서울</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=2" style="margin-bottom:30px">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' style="border-radius:10px;" src="https://youimg1.tripcdn.com/target/0104h1200083vnxttED9A_C_670_770_R5.jpg_.webp">
						<span class="card-act-name" style="font-weight:bold; font-size:17px;">경기도</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=3" style="margin-bottom:30px">
					<span class="card card-block">
						<img class="card-img-top" width='100px' height='200px' style="border-radius:10px;" src="https://youimg1.tripcdn.com/target/fd/tg/g3/M0A/46/03/CggYG1XK_vuAAbdvAAqr2aJOX-s018_C_670_770_R5.jpg_.webp">
						<span class="card-act-name" style="font-weight:bold; font-size:17px;">부산</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=4" style="margin-bottom:30px">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' style="border-radius:10px;" src="https://youimg1.tripcdn.com/target/0103e120008x0rxdo2CDA_C_670_770_R5.jpg_.webp">
						<span class="card-act-name" style="font-weight:bold; font-size:17px;">인천</span>
					</span>
				</a>
				<a class="col-3" href="selectOneDestRoute.do?dest_id=5" style="margin-bottom:30px">
					<span class="card card-block">
						<img class="card-img-top" width='150px' height='200px' style="border-radius:10px;" src="https://youimg1.tripcdn.com/target/0105a12000adm6wre0977_C_670_770_R5.jpg_.webp">
						<span class="card-act-name" style="font-weight:bold; font-size:17px;">제주도</span>
					</span>
				</a>
				<a class="col-3" style="align-self: center;" style="margin-bottom:30px">
					<span class="card card-block">
						<span class="card-act-name">추후 추가 예정....</span>
					</span>
				</a>
				<a class="col-3" style="align-self: center;" style="margin-bottom:30px">
					<span class="card card-block">
						<span class="card-act-name">추후 추가 예정....</span>
					</span>
				</a>
				<a class="col-3" style="align-self: center;" style="margin-bottom:30px">
					<span class="card card-block">
						<span class="card-act-name">추후 추가 예정....</span>
					</span>
				</a>
			</div>
	</section>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
</body>
</html>