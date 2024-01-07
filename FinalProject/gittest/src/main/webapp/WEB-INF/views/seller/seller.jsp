<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 페이지</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../seller_top.jsp"></jsp:include>
	<div id="adminmenu1">
		<ul>
			<li><a href="insertAct.do"><img width="110px" height="110px" src="resources/uploadimg/IMG_1604.png"></a></li>
			<li><a href="selectAllAct.do"><img width="110px" height="110px" src="resources/uploadimg/IMG_1605.png"></a></li>
			<li><a href="insertRoute.do"><img width="110px" height="110px" src="resources/uploadimg/IMG_1606.png"></a></li>
			<li><a href="selectAllRoute.do"><img width="110px" height="110px" src="resources/uploadimg/IMG_1607.png"></a></li>
			<li><a href="selectAllContact.do?seller_id=${user.user_id}"><img width="110px" height="110px" src="resources/uploadimg/IMG_1608.png"></a></li>
		</ul>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>