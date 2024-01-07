<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>결제단계</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	console.log("onload...");
	usersSelectOne();
	actSelectOne();
	userCouponSelectAll();

});//end onload...


	function usersSelectOne(){
	console.log('usersSelectOne()...');
		$.ajax({
	 		url : "jsonUsersSelectOne.do",
	 		data:{user_id:$('#user_id').val()},
	 		method:'GET',
	 		dataType:'json', 
	 		success : function(vo2) {
				//console.log(vo2);
				
	  			let tag_vo2 =  `
	  				<tr>
	 					<th colspan="2">예약자 정보</th>
	 				</tr>
	 				<tr>
	 					<td>여권상 영문명</td>
	 					<td>\${vo2.eng_name}</td>
	 				</tr>
	 				<tr>
	 					<td>전화번호</td>
 						<td>\${vo2.tel}</td>
	 				</tr>
	 				<tr>
 						<td>이메일</td>
	 					<td>\${vo2.email}</td>
	 				</tr>
	  				<tr>
	  					<td colspan="2"><font color='royalblue' size='2p'><span>예약자 정보는 <a href="myInfo.do?user_id=${user.user_id}">내 정보 관리</a>에서 변경하세요<span></font></td>
	  				</tr>
	 				`;
				
	  			let point = '';
	  			
	  			if(vo2.point===0) {
	  				$("#point_use").hide();
	  			}
	  			point += `<div>보유 포인트: <span id="user_point">\${vo2.point}</span>원<div>`;

	 			$("#vo2").html(tag_vo2);
	 			$("#having_point").html(point);

	 			$(".point").on("propertychange change keyup paste input", function(){
	 				console.log("point...keyup",`\${vo2.point}`,$(this).val());
	 				const maxPoint = parseInt(`\${vo2.point}`);
	 				const maxPrice = parseInt(${param.price*param.quantity}-$(".coupon").val());
// 	 				console.log("maxPrice",maxPrice);
					let inputValue = parseInt($(this).val());	
					if(inputValue < 0){
						$(this).val(0);
					} else if(inputValue > maxPrice){
						$(this).val(maxPrice);
					} else if(inputValue > maxPoint){
							$(this).val(maxPoint);
					} else if(inputValue = ""){
						$(this).val(0);
					}
					setFinalPriceInfo();
					
				});
					  			
	 			$(".using_point_input_btn").on("click", function(){
	 				console.log("using_point_input_btn...",`\${vo2.point}`);

	 				const maxPoint = parseInt(`\${vo2.point}`);	
	 				const maxPrice = parseInt(${param.price*param.quantity}-$(".coupon").val());
 					console.log("maxPoint...",maxPoint, maxPrice);
	 				
	 				let state = $(this).data("state");	
	 				
	 				if(state == 'N'){
	 					console.log("n동작");
	 					/* 모두사용 */
	 					//값 변경
	 					if(maxPoint>maxPrice){
		 					$(".point").val(maxPrice);
	 					} else{
		 					$(".point").val(maxPoint);
	 					}
	 					
	 					//글 변경
	 					$(".using_point_input_btn_Y").css("display", "inline-block");
	 					$(".using_point_input_btn_N").css("display", "none");
	 				} else if(state == 'Y'){
	 					console.log("y동작");
	 					/* 취소 */
	 					//값 변경
	 					$(".point").val(0);
	 					//글 변경
	 					$(".using_point_input_btn_Y").css("display", "none");
	 					$(".using_point_input_btn_N").css("display", "inline-block");		
	 				}	
	 				
	 				setFinalPriceInfo();
	 				
	 			});	  			
	  				
	 		},
	 		error:function(xhr,status,error){
	 			console.log('xhr.status:', xhr.status);
	 		}
	 	});//end $.ajax()...
	}//end userSelectOne
	
	function actSelectOne(){
		$.ajax({
	 		url : "jsonActSelectOne.do",
	 		data:{id:$('#act_id').val()},
	 		method:'GET',
	 		dataType:'json', 
	 		success : function(vo2) {
	 			let act_name =  `\${vo2.act_name}`;
	 			$("#act_name").html(act_name);
	 		},
	 		error:function(xhr,status,error){
	 			console.log('xhr.status:', xhr.status);
	 		}
	 	});//end $.ajax()...
	}//end actSelectOne
	
	function userCouponSelectAll(){
		$.ajax({
	 		url : "jsonUserCouponSelectAll.do",
	 		data:{user_id:$('#user_id').val()},
// 	 		data:{user_id:'seller01'},
	 		method:'GET',
	 		dataType:'json', 
	 		success : function(vos) {
	 			console.log('userCouponSelectAll', vos)
	 			
	 			let coupon = '';
				
	 			let discount = '';

	 			if(vos==0){
// 					discount += `보유한 쿠폰이 없습니다`;
		 			coupon += `<select id="coupon-select">`;
		 			coupon += `<option value="0">쿠폰 사용 안함</option>`;
		 			coupon += `</select>`;

		 			discount += `
		 				<div><input type="hidden" name="coupon" class="coupon" value="0"></div>
		 				<div><input type="hidden" name="code" class="code" value="0"></div>
		 				`;
				} else{
		 			coupon += `<select id="coupon-select">`;
		 			coupon += `<option selected disabled>쿠폰을 선택해주세요</option>`;
		 			coupon += `<option value="0">쿠폰 사용 안함</option>`;
	 				$.each(vos, function(index, vo){
 						coupon += `<option value="\${vo.code}">\${vo.name} </option>`;
					});
		 			coupon += "</select>";
		 			
		 			discount += `<div>쿠폰 할인 금액: <span id="discountPrice">0</span>원</div>
		 				<div><input type="hidden" name="coupon" class="coupon" value="0"></div>
		 				<div><input type="hidden" name="code" class="code" value="0"></div>
		 				`;
				}
					
	 			$("#coupon_use").html(coupon);
	 			$("#discount").html(discount);
	 			
	 		},
	 		error:function(xhr,status,error){
	 			console.log('xhr.status:', xhr.status);
	 		}
	 	});//end $.ajax()...
	 	
	 	let originalPrice = $("#price_total").val();
	 	
		$("#coupon_use").change(function(){
			
			if($("#coupon-select option:selected").val()=='0'){
				let couponPrice = 0;
				let couponCode = 0;
				$("#discountPrice").html("<span style=\"color:blue;\">"+couponPrice+"</span>");
				$(".coupon").val(couponPrice);
				$(".code").val(couponCode);
			}else {
			 	let discountRate = $("#coupon-select option:selected").text().slice(0,2).trim();
				let couponPrice = Math.floor(originalPrice*(discountRate/100));
				let finalPrice = originalPrice-couponPrice;
				let couponCode = $("select").val();
				console.log(couponCode);
				$("#discountPrice").html("<span style=\"color:blue;\">"+couponPrice+"</span>");
				$(".coupon").val(couponPrice);
				$(".code").val(couponCode);
			}
			setFinalPriceInfo();
			
		})	 
	}//end userCouponSelectList
	
	function setFinalPriceInfo(){
		let totalPrice = parseInt($("#price_total").val());
		let pointPrice = parseInt($(".point").val());
		let discountPrice = parseInt($(".coupon").val());
		let finalPrice = totalPrice-pointPrice-discountPrice;
		console.log(totalPrice, pointPrice, discountPrice);
		
		if(finalPrice<0) {
			$(".point").val(0);
			$("#price_final").val(totalPrice);
			
			alert ("쿠폰과 포인트를 다시 설정해주십시오");
		}else{
			$("#price_final").val(finalPrice);
			
		}
		
	}//end setFinalPriceInfo
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
<div id="insertres">
	<table id="userinfo">
		<tbody id="vo2"></tbody> <!-- 이 부분에 유저 정보 얻어오기 -->
	</table>
	
<form action="insertPaymentOne.do" method="POST">
	<table id="resinfo">
		<tbody>
			<!-- 상품 페이지에서 넘어올 부분 -->
			<tr>	
				<td><input type="hidden" name="act_id" id = "act_id" value="${param.act_id}">상품명: <span id="act_name"></span></td>
			</tr>
			<tr>	
				<td><input type="hidden" name="user_id" id = "user_id" value="${user.user_id}">
				<input type="hidden" name="res_date" id = "res_date" value="${param.res_date}">
					예약일: <fmt:parseDate value="${param.res_date}" var="res_date" pattern="yyyy-MM-dd"/>
							<fmt:formatDate value="${res_date}" pattern="yyyy년 MM월 dd일"/>
				</td>
			</tr>
			<tr>	
				<td><input type="hidden" name="quantity" id = "quantity" value="${param.quantity}">수량: ${param.quantity}</td>
			</tr>
			<tr>
				<td><input type="hidden" name="price" id = "price" value="${param.price}">금액: <fmt:formatNumber value="${param.price}" pattern=" #,###원" /> </td>
			</tr>
			<tr>	
				<td><input type="hidden" name="price_total" id = "price_total" value="${param.price*param.quantity}">총 금액: <fmt:formatNumber value="${param.price*param.quantity}" pattern=" #,###원" /></td>
			</tr>
			
			<!-- 쿠폰 select -->
			<tr>
				<td id = "coupon_use">
				</td>
			</tr>
			<!-- 쿠폰 할인 금액 -->
			<tr>
				<td id = "discount">
				</td>
				
			</tr>
			<!-- 포인트 보유 금액 -->
			<tr id = "pointbox">
				<td id = "having_point">
				</td>
			</tr>
			<!-- 포인트 사용 금액 -->
			<tr id = "point_use">
				<td>
					<input style="ont-size:16px; text-align:right; width:70px;" type="text" type="number" name="point" class="point" value="0">원 
					<a class="using_point_input_btn using_point_input_btn_N" data-state="N">모두사용</a>
					<a class="using_point_input_btn using_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
					
				</td>
			</tr>
			<!-- 최종 결제 금액 -->
			<tr> 
				<td>최종 결제 금액: <input style="border:0px; font-size:16px; text-align:right; width:70px;" type="text" name="price_final" id="price_final" value="${param.price*param.quantity}" readonly>원
				</td>
			</tr>
			<tr>	
				<td><input type="submit" value="예약하기" id="reservebtn" class="myButton"></td>
			</tr>
			
		</tbody>
	</table>
</form>
</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>