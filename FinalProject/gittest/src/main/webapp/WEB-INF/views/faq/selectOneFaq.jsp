<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의보기</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/faq/selectOneFaq.js"></script>
<script>
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:",user_id);
	
	$(document).ready(function() {
		if (user_id === "admin01") {
            $("#faq_form").show();
		} else {
            $("#faq_form").hide();
		}
	});
</script>
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
 
  #faqtable {
        width: 800px;
        margin: 20px auto;
        padding: 20px;
/*         box-sizing: border-box; */
    }

</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="inputtable">
	<h3>자주 묻는 질문</h3>

	<table id="faqtable">
			<tr>
				<th>제목</th>
				<td style="width:300px; height:30px; border:1px solid gray;">${vo2.title}</td>
			</tr>
			<tr>
				<th style="width:30px;">내용</th>
				<td style="width:300px; height:300px; border:1px solid gray; padding-top:10px; vertical-align : top;">${vo2.content}</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td style="width:300px; height:30px; border:1px solid gray;"><fmt:formatDate value="${vo2.faq_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
		<tfoot id="faq_form">
			<tr>
				<th colspan="5">
					<a href="updateFaq.do?id=${param.id}" class="myButton" style="margin-left:250px">FAQ수정</a>
					<a href="deleteFaqOK.do?id=${param.id}" class="myButton">FAQ삭제</a>
				</th>
			</tr>
		</tfoot>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>