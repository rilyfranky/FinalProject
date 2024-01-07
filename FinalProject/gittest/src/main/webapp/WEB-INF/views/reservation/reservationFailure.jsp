<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제실패</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="complete">
	<h3>예약 실패했습니다...</h3>
	<a href="selectAllReservation.do?user_id=${user.user_id}" class="myButton">예약내역으로</a>
	<a href="selectAllcart.do?user_id=${user.user_id}" class="myButton">장바구니로</a>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
