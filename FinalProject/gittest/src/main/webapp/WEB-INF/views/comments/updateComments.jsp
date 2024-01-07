<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Comments</title>
    <jsp:include page="../css.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>
    <div id="commentsform">
    <h1>후기 수정</h1>
    
    <form action="updateCommentsOK.do" method="post" enctype="multipart/form-data">
        <table id="commentstable">
			<tr>
				<td style="width:80px;"><label for="act_id">상품명</label></td>
				<td>${vo2.act_name}</td>
			</tr>
			<tr>
				<td><label for="rate">평점</label></td>
				<td>${vo2.rate}</td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><textarea id="content" name="content" rows="15" cols="50" required>${vo2.content}</textarea>
					<input type="hidden" id="user_id" name="user_id" value="${user.user_id}" required>
					<input type="hidden" id="res_id" name="res_id" value="${vo2.res_id}" required>
					<input type="hidden" id="id" name="id" value="${vo2.id}" required>
				</td>
			</tr>
			
			<!-- 후기 사진 있을 때 출력 -->
			<tr id="multiplefiles">
				<td>후기 사진</td>
				<td>
					<c:forEach var="vo" items="${vos}">
						<img  width="100px" height="100px" src="resources/uploadimg/${vo.name}">
					</c:forEach>
				</td>
			</tr>
				<tr>
					<td><input type="file" name="file" multiple id="multiplefiles"></td>
				</tr>
			</table>
        <input type="submit" value="수정완료" class="myButton">
    </form>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>