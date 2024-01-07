<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../admin_top.jsp"></jsp:include>
	<div id="adminform">
	<h3>회원정보</h3>

	<table id="adminlisttable">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>영문이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>포인트</th>
				<th>프로필</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.user_id}</td>
				<td>${vo2.pw}</td>
				<td>${vo2.name}</td>
				<td>${vo2.eng_name}</td>
				<td>${vo2.tel}</td>
				<td>${vo2.email}</td>
				<td>${vo2.point}</td>
				<td><img width="50px" src="resources/uploadimg/${vo2.img}"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="9"><a href="u_update.do?user_id=${vo2.user_id}" class="myButton">회원수정</a>
					<a href="u_deleteOK.do?user_id=${vo2.user_id}" class="myButton">회원삭제</a></th>
			</tr>
		</tfoot>
	</table>
	<c:if test="${vo2.type==3}">
	<form action="pointPlus.do">
		<table style="margin-top:30px; margin-left:60px">
			<tr>
				<th>포인트</th>
				<td>
					<input type="hidden" name="user_id" value="${vo2.user_id}">
					<input type="text" name="history" value="" placeholder="적립내역" style="width:70px">
					<input type="number" name="point" value="" placeholder="포인트" style="width:70px">
					<input type="submit" value="적립" class="myButton">
				</td>
			</tr>
		</table>
	</form>
	</c:if>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>