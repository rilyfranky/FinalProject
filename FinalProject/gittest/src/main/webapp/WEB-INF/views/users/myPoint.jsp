<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 포인트</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="coupon">
	<h3 style="margin-top:50px">나의 포인트</h3>
	
	<div><h3 style="color:#0000c9; margin-bottom:50px"><fmt:formatNumber value="${vo.point}" pattern="#,###P" /></h3></div>
	<c:forEach var="vos" items="${vos}">
		<table id="usercoupontable1">
			<tr>
				<th style="width:80px">${vos.history}</th>
				<td></td>
				<td><p style="font-size:13px; color:#c2c2b1">${vos.point_date}<p></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<td style="text-align:right; font-weight:bold"><fmt:formatNumber value="${vos.point}" pattern="#,###P" /></td>
			</tr>
		</table>
	</c:forEach>
</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>