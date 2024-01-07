<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<div id="loginform">
	<h3 style="margin-top:30px;">로그인</h3>
	
	<form action="loginOK.do" method="post">
		<table id="logintable">
			<tr>
				<td><label for="user_id">아이디</label></td>
				<td><input type="text" id="user_id" name="user_id" value="" placeholder="아이디" autofocus></td>
			</tr>
			<tr>
				<td><label for="pw">패스워드</label></td>
				<td><input type="password" id="pw" name="pw" value="" placeholder="패스워드"></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="로그인" id="loginbtn" class="myButton"></td>
			</tr>
		</table>
	</form>
	<div id="fpw"><a href="findPassword.do" class="myButton">비밀번호찾기</a></div>
	<p>${message}</p>
	
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>