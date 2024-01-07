<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰 보기</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

	function insertUserCoupon(){
		console.log("insertUserCoupon....",$('#user_id').val(), $('#couponcode').val());
		
		$.ajax({
			url : "userCoupon_insertOK.do",
			data:{
				user_id:$('#user_id').val(),
				couponcode:$('#couponcode').val()
			},
			method:'GET',
			dataType:'json',
			success : function(obj) {
				console.log('ajax...success:', obj);
				console.log('ajax...success:', obj.result);
				let msg = '';
				if(obj.result==='OK'){
					location.href='selectAllUserCoupon.do?user_id=${user.user_id}';
					alert("쿠폰이 등록되었습니다!");
				}else{
					location.href='selectAllUserCoupon.do?user_id=${user.user_id}';
					alert("유효하지 않은 쿠폰입니다.");
				}
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
		
	}//end insertUserCoupon()...
	
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="usercoupon">
	<h3 style="margin-top:50px; margin-bottom:30px">내 쿠폰</h3>
    <form action="userCoupon_insertOK.do">
	<table id="usercoupontable1">
		<tr>
<!-- 			<th>쿠폰코드</th> -->
			<td><input type="hidden" name="user_id" id="user_id" value="${user.user_id}">
				<input type="text" name="couponcode" id="couponcode" value="" placeholder="coupooncode" size="30"></td>
	      	<td><button type="button" onclick="insertUserCoupon()" class="myButton">쿠폰등록</button></td>
		</tr>
	</table>	
	</form>
	
	<table id="usercoupontable2">
		<tr>
			<td>쿠폰이름</td>
			<td>쿠폰코드</td>
			<td>사용기한</td>
		</tr>
	<c:forEach var="vos" items="${vos}">
		<tr>
			<td>${vos.name}</td>
			<td>${vos.code}</td>
			<td><fmt:formatDate value="${vos.expire}" pattern="yyyy년 MM월 dd일"/></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
<script>

$('#couponcode').on('keydown', function(e) {
    var keyCode = e.which;

    if (keyCode === 13) { // Enter Key
    	insertUserCoupon();
    }
});

</script>
</body>
</html>