<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="uupdate">
	<h3>내 정보 수정</h3>
	<form action="u_updateOK.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
		<table id="uupdatetable">
			<tr>
				<td><label for="img">프로필 사진</label></td>
				<td><input type="file" id="file" name="file" value="${users.img}">
				</td>
			</tr>
			<tr>
				<td><label for="user_id">아이디</label></td>
				<td><input type="text" id="user_id" name="user_id" value="${users.user_id}" readonly></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호</label></td>
				<td><input type="password" id="pw1" name="pw" class="pw" value="${users.pw}"></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호 확인</label></td>
				<td><input type="password" id="pw2" value="${users.pw}">
					<span id="alert-success" style="display: none;">✅</span>
    				<span id="alert-danger" style="display: none; color: #d92742;">❎</span>
				</td>
			</tr>
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" id="name" name="name" value="${users.name}"></td>
			</tr>
			<tr>
				<td><label for="eng_name">영문명</label></td>
				<td>
					<input type="text" id="first_name" name="first_name" value="${users.first_name}" size="10">
					<input type="text" id="last_name" name="last_name" value="${users.last_name}" size="10">
				</td>
			</tr>
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td>
					<input type="text" id="tel1" name="tel1" value="${users.tel1}" size="3">
					<input type="text" id="tel2" name="tel2" value="${users.tel2}" size="3">
					<input type="text" id="tel3" name="tel3" value="${users.tel3}" size="3">
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일</label></td>
				<td>
					<input type="text" id="email1" name="email1" value="${users.email1}" size="9"><b>@</b>
					<input type="text" id="email2" name="email2" value="${users.email2}" size="9">
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="저장하기" id="udtbtn" class="myButton">
				</th>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
	$(document).ready(function() {
        // 비밀번호 확인 시 실시간으로 체크
        $("#pw2").on("input", function() {
            var pwd1 = $("#pw1").val();
            var pwd2 = $("#pw2").val();

            if (pwd1 !== '' || pwd2 !== '') {
                if (pwd1 === pwd2) {
                    $("#alert-success").css('display', 'inline-block');
                    $("#alert-danger").css('display', 'none');
                } else {
                    $("#alert-success").css('display', 'none');
                    $("#alert-danger").css('display', 'inline-block');
                }
            }
        });
    });

        function validateForm() {
            // 비밀번호 확인
            var pwd1 = $("#pw1").val();
            var pwd2 = $("#pw2").val();

            if (pwd1 !== pwd2) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }

            // 영문명 검증
            var firstName = $("#first_name").val();
            var lastName = $("#last_name").val();
            var nameRegex = /^[A-Za-z]+$/;

            if (!nameRegex.test(firstName) || !nameRegex.test(lastName)) {
                alert("영문명은 영어만 포함해야 합니다.");
                return false;
            }

            // 전화번호 검증
            var tel1 = $("#tel1").val();
            var tel2 = $("#tel2").val();
            var tel3 = $("#tel3").val();
            var telRegex = /^\d+$/;

            if (!telRegex.test(tel1) || !telRegex.test(tel2) || !telRegex.test(tel3)) {
                alert("전화번호는 숫자만 입력해야 합니다.");
                return false;
            }

            // 이메일 도메인 형식 검증
            var email2 = $("#email2").val();
            var domainRegex = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (!domainRegex.test(email2)) {
                alert("올바른 이메일 도메인 형식으로 입력해야 합니다.");
                return false;
            }

            return true; // 모든 검증 조건을 만족하면 폼 제출 허용
        }
    </script>
</body>
</html>