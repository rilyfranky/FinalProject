<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의작성</title>
<jsp:include page="../css.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	console.log("onload...", $('#act_id').val());
	actSelectOne();
});//end onload...

function actSelectOne(){
	$.ajax({
 		url : "jsonActSelectOne.do",
 		data:{id:$('#act_id').val()},
 		method:'GET',
 		dataType:'json', 
 		success : function(vo2) {
 			let act_name =  `\${vo2.act_name}`;
 			console.log(act_name);
 			$("#act_name").html(act_name);
 			$(".act_name").val(act_name);
 		},
 		error:function(xhr,status,error){
 			console.log('xhr.status:', xhr.status);
 		}
 	});//end $.ajax()...
}//end actSelectOne

</script>	
	
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="qform">
	<h3>문의작성</h3>

	<form action="insertContactOK.do" method="post"
		enctype="multipart/form-data">
		<table id="qtable">
			<tr>
				<td style="width:200px"><label for="title">제목</label></td>
				<td><input type="text" id="title" name="title" size="89" placeholder="문의 제목을 입력해주세요"></td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><textarea rows="15" cols="90" name="content" placeholder="문의 내용을 입력해주세요"></textarea></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="file" id="file" value=""></td>
			</tr>
			<tr>
				<td><label for="user_id">작성자</label></td>
				<td><input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
					<input type="hidden" id="seller_id" name="seller_id" value="${param.seller_id}">
					${user.user_id}
				</td>
			</tr>
			<tr>
				<td><label for="act_name">상품명</label></td>
				
				<td><input type="hidden" id="act_id" name="act_id" value="${param.act_id}">
					<input type="hidden" class="act_name" name="act_name" value="">
					<span id="act_name"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input style="margin-left:300px" type="submit" class="myButton" value="문의입력"></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>