<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/faq/insertFaq.js"></script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>자주 묻는 질문</h1>
	
	<form action="insertFaqOK.do" method="get">
		<table id="boardList">
			<tr>
				<td><label for="title">제목</label></td>
				<td><input type="text" id="title" name="title" placeholder="제목을 입력해주세요">
				</td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><textarea rows="100" cols="2000" name="content" placeholder="내용을 입력해주세요"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>