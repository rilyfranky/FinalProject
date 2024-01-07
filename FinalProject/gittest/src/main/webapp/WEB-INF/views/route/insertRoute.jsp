<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루트 작성</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<link rel="stylesheet" href="resources/css/multi-select2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/multi-select2.js?ver=1"></script>
<script>
	const user_id = '${user.user_id}';
</script>
<script type="text/javascript" src="resources/js/route/insertRoute.js?ver=7"></script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px">루트 등록</h5>

	<form action="insertRouteOk.do" method="POST"
		enctype="multipart/form-data">
		<table id="routeList">
			<tr>
				<td><label for="dest_id">여행지명</label></td>
				<td><select id="dest_id" name="dest_id" onchange="selectDest(value)">
					<c:forEach var="vo" items="${vos}" varStatus="status">
						<option value="${status.count}">${vo.name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td style="width: 120px"><label for="route_name">루트 이름</label></td>
				<td><input type="text" id="route_name" name="route_name"
					placeholder="서울 관광1" size="50"></td>
			</tr>
			<tr>
				<td><label for="summary">루트 설명</label></td>
				<td><textarea rows="2" cols="52" name="summary" placeholder="서울의 멋진 장소를 관광해보세요!"></textarea></td>
			</tr>
			<tr>
				<!-- 여기에 루트 옵션 여러개가 selectAll됨.. -->
				<td>루트 옵션 선택</td>
				<td id="rts"></td>
			</tr>
			<tr>
				<td><label for="content">루트 소개</label></td>
				<td><textarea rows="10" cols="52" name="content" placeholder="서울의 멋진 장소를 관광해보세요! 신촌역 -> K-POP 댄스 원데이클래스 -> 홍대 땡땡거리 -> 경의선 숲길 -> 재즈바 -> 홍대입구"></textarea></td>
			</tr>
			<tr id="file">
				<td>배너 사진</td> 
				<td><input type="file" name="file" id="file"></td>
			</tr>
			<tr>
				<td>판매자<input type="hidden" id="seller_id"
					name="seller_id" value="${user.user_id}">
				</td>
				<td>
					${user.user_id} 
				</td>
			</tr>
			<tr>
				<td colspan="2"><input style="margin-left:230px" type="submit" class="myButton" value="등록완료"></td>
			</tr>
		</table>
	</form>
</section>

<jsp:include page="../footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
</body>
</html>