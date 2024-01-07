<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../admin_top.jsp"></jsp:include>
	<div id="adminform">
	<h3><a href="selectAllUser.do">회원목록</a></h3>
	
	<div style="padding:5px">
		<form action="searchUserList.do">
			<select name="searchKey" id="searchKey">
				<option value="user_id">아이디</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="" placeholder="검색어 입력">
			<input type="submit" value="검색">
		</form>
	</div>
	<table id="adminlisttable">
	<thead>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td style="text-align:center"><a href="selectOneUser.do?user_id=${vo.user_id}">${vo.id}</a></td>
				<td>${vo.user_id}</td>
				<td>${vo.name}</td>
				<td>${vo.tel}</td>
				<td>${vo.email}</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>