<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의보기</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/selectOneContact.js"></script>
<script>
	let user_id = '${user.user_id}';
	let type = '${user.type}';

	console.log("현재 로그인 되어있는 아이디:", user_id);
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="qnaform">
	<h3>문의보기</h3>

	<table>
			<tr>
				<th style="width:40px; text-align:left">제목</th>
				<td style="width:300px; height:30px; border:1px solid gray;">${vo2.title}</td>
			</tr>
			<tr>
				<th style="width:40px; text-align:left">상품명</th>
				<td style="width:300px; height:30px; border:1px solid gray;">${vo2.act_name}</td>
			</tr>
			<tr>
				<th style="width:40px; text-align:left">문의내용</th>
				<td style="width:300px; height:300px; border:1px solid gray; padding-top:10px; vertical-align : top;">${vo2.content}</td>
			</tr>
			<c:if test="${vo2.attach_img!=null}">
			<tr>
				<th>
					<img height="200px" src="resources/uploadimg/${vo2.attach_img}" style="border:1px solid gray;"/>
				</th>
			</tr>
			</c:if>
			<c:if test="${user.user_id eq vo2.user_id}">
			<tr>
				<th colspan="2">
					<a href="updateContact.do?id=${param.id}" class="myButton" style="margin-left:220px">문의수정</a>
					<a href="deleteContactOK.do?id=${param.id}&user_id=${user.user_id}" class="myButton">문의삭제</a>
				</th>
			</tr>
			</c:if>
	</table>
	
	<hr>
	<div id="">
	<h3 style="margin-top:40px;">답변</h3>
		<c:if test="${user.type!=3}">
		<table id="qnatable">
			<tr>
				<td>
					<form action="insertAnswerOK.do">
						<input type="hidden" name=id value="${param.id}">
						<input type="hidden" name="seller_id" value="${vo2.seller_id}">						
						<input type="hidden" name="contact_id" value="${vo2.id}">
						<textarea name="content" id="content" rows="20" cols="55" placeholder="답변을 입력하세요"></textarea>
						<input style="margin-top:165px; margin-left:30px" type="submit" value="답변입력" class="myButton">
					</form>
				</td>
			</tr>
		</table>
		
		<table id="qnatable">
			<c:forEach var="com" items="${coms}">
				<tr>
					<td>
						<form action="updateAnswerOK.do">
							<input type="hidden" name="contact_id" value="${com.contact_id}">
							<input type="hidden" name="id" value="${com.id}">
							<textarea name="content" id="content" rows="20" cols="55">${com.content}</textarea>
							<input style="margin-top:165px; margin-left:30px;" type="submit" value="답변수정" class="myButton">
						</form>
					</td>
					<td>
						<a href="deleteAnswerOK.do?id=${com.id}&contact_id=${com.contact_id}" class="myButton">답변삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	
	<c:if test="${user.type==3}">
	<table id="">
		<c:forEach var="com" items="${coms}">
			<tr>
				<th style="width:40px; text-align:left">답변</th>
				<td style="width:300px; height:100px; border:1px solid gray; padding-top:10px; vertical-align : top;">${com.content}</td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>