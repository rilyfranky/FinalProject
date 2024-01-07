<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루트 업데이트</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<link rel="stylesheet" href="resources/css/multi-select2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/multi-select2.js"></script>
<script>
	const user_id = '${user.user_id}';
	const dest_id = ${vo2.dest_id};
</script>
<script type="text/javascript" src="resources/js/route/updateRoute.js?ver=2"></script>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px">루트수정</h5>

	<form action="updateRouteOk.do" method="POST"
		enctype="multipart/form-data">
		<table id="routeList">
			<tr>
				<td style="width: 120px"><label for="route_name">루트 이름</label></td>
				<td><input type="text" id="route_name" name="route_name"
					value="${vo2.route_name}" size="50"></td>
			</tr>
			<tr>
				<td><label for="summary">루트 설명</label></td>
				<td><textarea rows="2" cols="52" name="summary">${vo2.summary}</textarea></td>
			</tr>
			<tr>
				<td>루트 옵션 선택</td>
				<td id="rts"></td>
			</tr>
			<tr>
				<td><label for="content">루트 소개</label></td>
				<td><textarea rows="10" cols="52" name="content">${vo2.content}</textarea></td>
			</tr>
			<tr id="file">
				<td>배너 사진</td>
				<td><input type="file" name="file" id="file"></td>
			</tr>
			<tr>
				<td>판매자
					<input type="hidden" name="seller_id" value="${user.user_id}">
					<input type="hidden" name="id" value="${param.id}">
					<input type="hidden" name="dest_id" value="${vo2.dest_id}">
				</td>
				<td>	
					${user.user_id} 
				</td>
			</tr>
			<tr>
				<td colspan="2"><input style="margin-left:230px" type="submit" class="myButton" value="수정완료"></td>
			</tr>
		</table>
	</form>
	</section>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
</html>