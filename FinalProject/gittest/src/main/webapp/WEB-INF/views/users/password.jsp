<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	console.log("onload....");
});

function findPassword(){
	console.log("findPassword....", $('#user_id').val(), $('#name').val(), $('#tel').val());
	
	$.ajax({
		url : "findPasswordOK.do",
		data:{
			user_id:$('#user_id').val(),
			name:$('#name').val(),
			tel:$('#tel').val()
			},
		method:'POST',
		dataType:'json',
		success : function(obj) {
			console.log('ajax...success:', obj);
			console.log('ajax...success:', obj.message);
			let msg = '';
			if(obj.message==='Not OK'){
			alert("입력한 정보를 확인해주세요");
			}else{
			alert($('#user_id').val()+"님의 비밀번호는 "+obj.message+"입니다");

			}
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
}//end findPassword()...

</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="loginform">
	<h3 style="margin-top:30px;">비밀번호찾기</h3>
	
<!-- 	<form action="findPasswordOK.do" method="post"> -->
		<table id="fpwtable">
			<tr>
				<td><label for="user_id">아이디</label></td>
				<td><input type="text" id="user_id" name="user_id" value="" size="15" autofocus></td>
			</tr>
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" id="name" name="name" value="" size="15"></td>
			</tr>
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td><input type="text" id="tel" name="tel" value="" placeholder="010-0000-0000" size="15"></td>
			</tr>

			<tr>
				<td colspan="2"><button type="button" onclick="findPassword()" id="pwbtn" class="myButton">입력완료</button></td>
			</tr>
		</table>
<!-- 	</form> -->
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>