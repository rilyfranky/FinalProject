<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자정보</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../admin_top.jsp"></jsp:include>
	<div id="adminform">
	<h3 style="margin-bottom:30px">판매자정보</h3>

	<table id="adminlisttable">
		<thead>
			<tr>
				<th style="text-align:center">회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>영문이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>승인여부</th>
				<th style="text-align:center">프로필</th>
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
				<td>${vo2.type}</td>
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
	
	<c:if test="${vo2.type==2}">
	<form action="sellerTypeUpdate.do">
		<table style="margin-top:30px; margin-left:60px">
			<tr>
				<th>승인여부</th>
				<td>
					<select name="type" id="type">
						<option value="1">승인</option>
						<option value="2">미승인</option>
					</select>
						<input type="hidden" name="user_id" value="${vo2.user_id}">
						<input type="submit" value="완료" class="myButton">
				</td>
			</tr>
		</table>
	</form>
	</c:if>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>