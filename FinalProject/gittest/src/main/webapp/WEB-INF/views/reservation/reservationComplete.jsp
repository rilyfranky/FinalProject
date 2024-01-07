<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="complete">
	<h3>결제가 완료되었습니다!</h3>
	<a href="balgil.com" class="myButton">메인페이지로</a>
	<a href="selectAllReservation.do?user_id=${user.user_id}" class="myButton">예약내역보기</a>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>