<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 이용 후기</title>
	<jsp:include page="../css.jsp"></jsp:include>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="commentsform">
	<h3>내 이용 후기</h3>

	<table id="selectmenu">
		<tr>
			<th colspan="2">
				<a href="selectMyComments.do?user_id=${user.user_id}">작성 가능한 후기</a>
				<a href="selectMyWrittenComments.do?user_id=${user.user_id}">내가 쓴 후기</a>
			</th>
		</tr>
	</table>
	
	<c:if test="${vos.size() != 0}">
		<c:forEach var="vo" items="${vos}">
			<table id="commentstable">
				<tr>
					<th>예약번호</th>
					<td>${vo.id}</td>
					<td rowspan="3">
						<img width="70px" height="70px"src="resources/uploadimg/thumb_${vo.img_name}"/>
					</td>
				</tr>
				<tr>
					<th>예약일</th>
					<td>
						<fmt:parseDate value="${vo.res_date}" var="res_date" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${res_date}" pattern="yyyy년 MM월 dd일"/>
					</td>
				</tr>
				<tr>
					<th style="width:100px; vertical-align:top;">상품명</th>
					<td style="width:300px;"><a href="selectOneUserAct.do?id=${vo.act_id}">${vo.act_name}</a></td>

				</tr>
				<tr>
					<td colspan="2">
						<a href="insertComments.do?act_id=${vo.act_id}&user_id=${user.user_id}&res_id=${vo.id}" id="cibtn" class="myButton">후기작성</a>
					</td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	
	<c:if test="${vos.size() == 0}">
		<table id="emptyrescom">
			<tr>
				<td>후기를 쓸 수 있는 상품이 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectAllReservation.do?user_id=${user.user_id}" id="ecbtn" class="myButton">예약내역 보기</a></td>
			</tr>
		</table>
	</c:if>	
	
	<c:if test="${vos1.size() != 0}">
		<c:forEach var="vo1" items="${vos1}">
			<table id="commentstable">
				<tr>
					<th>예약번호</th>
					<td>${vo1.res_id}</td>
					<td rowspan="3">
						<img width="70px" height="70px"src="resources/uploadimg/thumb_${vo1.img_name}"/>
					</td>
				</tr>
			
				<tr>
					<th style="width:100px; vertical-align:top;">상품명</th>
					<td style="width:300px;"><a href="selectOneUserAct.do?id=${vo1.act_id}">${vo1.act_name}</a></td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="selectMyOneComments.do?res_id=${vo1.res_id}&user_id=${user.user_id}" id="cibtn" class="myButton">후기상세</a>
					</td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	
	<c:if test="${vos1.size() == 0}">
		<table id="emptycomments">
			<tr>
				<td>작성한 후기가 없습니다</td>
			</tr>
			<tr>
				<td><a href="selectMyComments.do?user_id=${user.user_id}" id="combtn" class="myButton">후기 작성하러 가기</a></td>
			</tr>
		</table>
	</c:if>	
	</div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
