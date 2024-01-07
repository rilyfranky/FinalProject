	<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/faqt/updateFaq.js"></script>
<style>
.inputtable {
    display: flex;
    justify-content: center;
    align-items: center;
/*         min-height: 100vh; */
	margin-top:50px;
    flex-direction: column; 
}}

#faq_form {
    width: 80%;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}
  .inputtable h1 {
    text-align: center;
    margin-bottom: 20px;
}

</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="inputtable">
	<h3>FAQ 수정</h3>
	
	<form action="updateFaqOK.do" method="post">
		<table>
				<tr>
<!-- 					<td><label for="title">제목</label></td> -->
					<td>
						<input type="hidden" id="id" name="id" value="${vo2.id}">
						<input type="text" id="title" name="title" size="89" value="${vo2.title}">
					</td>
				</tr>
				<tr>
<!-- 					<td><label for="content">내용</label></td> -->
					<td><textarea rows="15" cols="90" name="content" placeholder="내용을 입력해주세요.">${vo2.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="myButton" value="수정완료" style="margin-left:270px"></td>
				</tr>
			</table>
	</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>