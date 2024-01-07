<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
/* table { */
/* 	border-collapse: collapse; */
/* } */

/* th, td { */
/* /* 	border: 1px solid #dddddd; */ */
/* 	text-align: left; */
/* 	padding: 8px; */
/* } */
</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="wishform">
	<h3>위시리스트</h3>
		<c:if test="${not empty vos1}">
	<table id="wishtable">
			<c:forEach var="vo" items="${vos1}">
				<tr>
					<td class="image-cell"><img src="resources/uploadimg/thumb_${vo.img_name}" /></td>
					<td style="width:350px"><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a> </td>
					<td colspan="2"><a href="deleteOK.do?act_id=${vo.act_id}&user_id=${vo.user_id}"> 삭제 </a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
		
	<table id="emptywish">
		<c:if test="${empty vos1}">
			<tr>
				<td colspan="2">위시리스트에 담긴 상품이 없습니다.</td>
			</tr>
			<tr>
				<td>
					<form action="${pageContext.request.contextPath}/selectAllUserAct.do" method="GET">
						<input type="submit" value="상품 보러가기" id="actbtn" class="myButton"/>
					</form>
				</td>
			</tr>
		</c:if>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
