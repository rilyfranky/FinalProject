	<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의수정</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/updateContact.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="qform">
	<h3>문의수정</h3>
	
	<form action="updateContactOK.do" method="post">
		<table id="qtable">
			<tr>
				<td><label for="id">상품명</label></td>
				<td>${vo2.act_name}
				<input type="hidden" id="id" name="id" value="${vo2.id}">
				</td>
			</tr>
			<tr>
				<td style="width:200px"><label for="title">제목</label></td>
				<td>
				<input type="text" id="title" name="title" value="${vo2.title}" size="89">
				</td>
			</tr>			
			<tr>
				<td><label for="content">문의내용</label></td>
				<td><textarea rows="15" cols="90" name="content">${vo2.content}</textarea></td>
			</tr>
			<tr>
				<td><label for="user_id">작성자</label></td>
				<td><input type="hidden" id="user_id" name="user_id" value="user_id">${vo2.user_id}</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" style="margin-left:300px" class="myButton" value="수정완료"></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>