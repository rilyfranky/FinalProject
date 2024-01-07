<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="../css.jsp"></jsp:include>
<style>
	/* number type input에 화살표를 없애는 역할 */
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<div id="loginform">
	<h3 style="margin-top:30px;">회원가입</h3>
	<form action="u_insertOK.do" method="post">
		<table id="userinserttable">
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" id="name" name="name" value="" autofocus required></td>
			</tr>
			<tr>
				<td><label for="user_id">아이디</label></td>
				<td><input type="text" id="user_id" name="user_id" value="" required>
					<button type="button" onclick="idCheck()">ID중복체크</button>
					<span id="idCheck"></span>
				</td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호</label></td>
				<td><input type="password" id="pw1" name="pw" class="pw" value="" required></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호 확인</label></td>
				<td><input type="password" id="pw2" class="pw" value="" required>
					<span id="alert-success" style="display: none;">✅</span>
    				<span id="alert-danger" style="display: none; color: #d92742;">❎</span>
    			</td>
			</tr>
			
			<tr>
				<td><label for="name">영문명</label></td>
				<td>
					<input type="text" id="first_name" name="first_name" value="" placeholder="영문 이름" size="10.5" required>
					<input type="text" id="last_name" name="last_name" value="" placeholder="영문 성" size="10.5" required>
				</td>
			</tr>
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td>
					<input type="number" id="tel1" name="tel1" value="010" min="0" max="999" required>
					<input type="number" id="tel2" name="tel2" value="" min="0" max="99999" required>
					<input type="number" id="tel3" name="tel3" value="" min="0" max="99999" required>
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일</label></td>
				<td>
					<input type="text" id="email1" name="email1" placeholder="email" value="" size="10" required><b>@</b>
					<input type="text" id="email2" name="email2" placeholder="naver.com" value="" size="10" required>
				</td>
			</tr>
				
			<tr>
				<td></td>
				<td>
					<input type="checkbox" id="type" name="type" value="2">판매자 가입 체크해주세요
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="회원가입하기" id="uinsertbtn" class="myButton"></td>
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
	
	function idCheck(){
		console.log("idCheck....",$('#id').val());
		
		$.ajax({
			url : "json_u_idCheck.do",
			data:{user_id:$('#user_id').val()},
			method:'GET',
			dataType:'json',
			success : function(obj) {
				console.log('ajax...success:', obj);
				console.log('ajax...success:', obj.result);
				let msg = '';
				if(obj.result==='OK'){
					alert("사용가능한 아이디입니다.");
					 msg = '사용가능한 아이디입니다.';
			          $('#idCheck').text(msg);
				 	submitForm();
				}else{
					alert("사용중인 아이디입니다.");
					 msg = '사용중인 아이디입니다.';
			          $('#idCheck').text(msg);
				}
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
		
	}//end idCheck()...
	
	$("#first_name, #last_name").on("input", function() {
		var englishLetters = /^[A-Za-z]+$/;
	    var value = $(this).val();
	    if (!englishLetters.test(value)) {
	      $(this).addClass("error"); // 에러 스타일 적용
	      $(this).next(".error-message").text("영어로만 입력해주세요.");
	    } else {
	      $(this).removeClass("error"); // 에러 스타일 제거
	      $(this).next(".error-message").text("");
	    }
	  });

	  // 전화번호 필드에 숫자만 입력하도록 유효성 검사를 추가합니다.
	  $("#tel1, #tel2, #tel3").on("input", function() {
		  var numbersOnly = /^[0-9]+$/;
		    var value = $(this).val();
		    if (!numbersOnly.test(value)) {
		      $(this).addClass("error"); // 에러 스타일 적용
		      $(this).next(".error-message").text("숫자로만 입력해주세요.");
		    } else {
		      $(this).removeClass("error"); // 에러 스타일 제거
		      $(this).next(".error-message").text("");
		    }
	  });

	  // email2 필드에 특정 도메인 형식과 일치하지 않으면 입력이 막힙니다.
	  $("#email2").on("input", function() {
	    var domainPattern = /^[a-zA-Z0-9.-]*$/;
	    var value = $(this).val();
	    if (!domainPattern.test(value)) {
	      $(this).val(value.replace(/[^a-zA-Z0-9.-]+/g, ""));
	    }
	  });

	  // user_id 필드에 특수 기호 없이 영어와 숫자만 입력하도록 유효성 검사를 추가합니다.
	  $("#user_id").on("input", function() {
	    var alphanumeric = /^[a-zA-Z0-9]+$/;
	    var value = $(this).val();
	    if (!alphanumeric.test(value)) {
	      $(this).val(value.replace(/[^a-zA-Z0-9]+/g, ""));
	    }
	  });

	  // 회원가입 폼이 제출되기 전에 실행되는 이벤트 핸들러를 추가합니다.
	  $('form').submit(function (event) {
	    var pwd1 = $("#pw1").val();
	    var pwd2 = $("#pw2").val();
	    var userID = $("#user_id").val();
	    var firstName = $("#first_name").val();
	    var lastName = $("#last_name").val();
	    var tel1 = $("#tel1").val();
	    var tel2 = $("#tel2").val();
	    var tel3 = $("#tel3").val();
	    var email2 = $("#email2").val();
	    var firstNameValue = $("#first_name").val();
	    var lastNameValue = $("#last_name").val();
	    var tel1Value = $("#tel1").val();
	    var tel2Value = $("#tel2").val();
	    var tel3Value = $("#tel3").val();
	    var firstNameValid = /^[A-Za-z]+$/.test(firstNameValue);
	    var lastNameValid = /^[A-Za-z]+$/.test(lastNameValue);
	    var telValid = /^[0-9]+$/.test(tel1Value) && /^[0-9]+$/.test(tel2Value) && /^[0-9]+$/.test(tel3Value);
	    
	    if (!firstNameValid) {
	        $("#first_name").addClass("error"); // 에러 스타일 적용
	        $("#first_name").next(".error-message").text("영어로만 입력해주세요.");
	        event.preventDefault(); // 폼 제출을 막습니다.
	      } else {
	        $("#first_name").removeClass("error"); // 에러 스타일 제거
	        $("#first_name").next(".error-message").text("");
	      }

	      if (!lastNameValid) {
	        $("#last_name").addClass("error"); // 에러 스타일 적용
	        $("#last_name").next(".error-message").text("영어로만 입력해주세요.");
	        event.preventDefault(); // 폼 제출을 막습니다.
	      } else {
	        $("#last_name").removeClass("error"); // 에러 스타일 제거
	        $("#last_name").next(".error-message").text("");
	      }

	      if (!telValid) {
	        $("#tel1, #tel2, #tel3").addClass("error"); // 에러 스타일 적용
	        $("#tel1, #tel2, #tel3").next(".error-message").text("숫자로만 입력해주세요.");
	        event.preventDefault(); // 폼 제출을 막습니다.
	      } else {
	        $("#tel1, #tel2, #tel3").removeClass("error"); // 에러 스타일 제거
	        $("#tel1, #tel2, #tel3").next(".error-message").text("");
	      }
	    
	    if (pwd1 != pwd2) {
	      event.preventDefault(); // 폼 제출을 막습니다.
	      alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	    } else if (userID.trim() === '') {
	      event.preventDefault(); // 폼 제출을 막습니다.
	      alert("사용자 ID 중복 확인을 해주세요.");
	    } else {
	      // 사용자 ID 중복 확인을 했고, 영문명과 전화번호, email2가 유효한 형식으로 입력되었고, user_id가 영어와 숫자로만 입력되었으면 폼 제출을 합니다.
	      var idCheckMessage = $('#idCheck').text();
	      if (!idCheckMessage.includes("사용가능한")) {
	        event.preventDefault(); // 폼 제출을 막습니다.
	        alert("ID중복체크를 해주세요.");
	      } else if (!/^[A-Za-z]+$/.test(firstName) || !/^[A-Za-z]+$/.test(lastName)) {
	        event.preventDefault(); // 폼 제출을 막습니다.
	        alert("영문명은 영어로만 입력해주세요.");
	      } else if (!/^[0-9]+$/.test(tel1) || !/^[0-9]+$/.test(tel2) || !/^[0-9]+$/.test(tel3)) {
	        event.preventDefault(); // 폼 제출을 막습니다.
	        alert("전화번호는 숫자로만 입력해주세요.");
	      } else if (!/^[a-zA-Z0-9]+$/.test(userID)) {
	        event.preventDefault(); // 폼 제출을 막습니다.
	        alert("사용자 ID는 영어와 숫자로만 입력해주세요.");
	      }
	    }
	  });
	</script>
	</body>
</html>