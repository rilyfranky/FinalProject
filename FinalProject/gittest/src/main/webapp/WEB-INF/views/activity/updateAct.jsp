<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/activity/updateAct.js?ver=4"></script>
<title>상품 업데이트</title>
<script>
	const user_id = '${user.user_id}';
</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px">상품수정</h5>
	<span id="imageList">
	</span>
	<form action="updateActOk.do" method="POST" enctype="multipart/form-data">
		<table id="activityList">
			<tr>
				<td style="width: 90px"><label for="dest_id">여행지명</label></td>
				<td><select id="dest_id" name="dest_id">
					<c:forEach var="vo" items="${vos}" varStatus="status">
						<option value="${status.count}">${vo.name}</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><label for="act_name">상품 이름</label></td>
				<td><input type="text" id="act_name" name="act_name"
					value="${vo2.act_name}" size="50"></td>
			</tr>
			<tr>
				<td><label for="content">상품 소개</label></td>
				<td><textarea rows="10" cols="52" name="content">${vo2.content}</textarea></td>
			</tr>
			<tr>
				<td><label for="price">가격</label></td>
				<td><input type="number" id="price" name="price"
					value="${vo2.price}" style="width: 90px"></td>
			</tr>
			<tr>
				<td><label for="tag">태그</label></td>
				<td><input type="text" id="tag" name="tag" value="${vo2.tag}" style="width: 90px">
				</td>
			</tr>
			<tr>
				<td><label for="add">주소</label></td>
				<td><input type="text" id="add" name="add" value="${vo2.add}" size="50"></td>
			</tr>
			<tr>
				<td><label for="user_id">판매자</label></td>
				
				<td>${vo2.seller_id}
					<input type="hidden" id="seller_id" name="seller_id" value="${vo2.seller_id}"> 
					<input type="hidden" id="id" name="id" value="${vo2.id}">
				</td>
			</tr>
			<tr id="multiplefiles">
				<td colspan="2"><input type="file" name="file" multiple id="multiplefiles"></td>
			</tr>
			<tr>
				<td colspan="2"><input style="margin-top:20px; margin-left:220px" type="submit" class="myButton" value="수정완료"></td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
	$(function(){
   	   $("input[type='file']").change(function(event){
   	      var $fileUpload = $("input[type='file']");
   	      if (parseInt($fileUpload.get(0).files.length) > 5){ //5개이상이면
   	         $fileUpload.val('');// 파일선택을 초기화
   	         alert("이미지는 최대 5장까지만 삽입 가능합니다.");
   	      }
   	   });
	});
	//컨트롤러에서 온 메시지를 받아서 처리
	var msg = '${alertMsg}';
	if(msg===''){
		
	}else if(msg!==''){
		alert(msg);
		<% request.setAttribute("alertMsg", ""); %>
	}
</script>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
</body>
</html>