<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/js/contact/selectAllcontact.js"></script>
<script>
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:", user_id);
</script>
<style>
    /* 스타일 추가 */
    table {
        margin-left: auto;
        margin-right: auto;
    }
     h1 {
        text-align: center;
    }
</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="qnaform">
	<h3>문의 내역</h3>
	<table id="adminlisttable">
		<thead>
			<tr>
				<th style="text-align:center">번호</th>
				<th style="width:350px">제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}" begin="0" step="1" varStatus="i">
				<tr>
					<td style="text-align:center"><a href="selectOneContact.do?id=${vo.id}">${i.count}</a></td>
					<td><a href="selectOneContact.do?id=${vo.id}">${vo.title}</a></td>
					<td>${vo.user_id}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>