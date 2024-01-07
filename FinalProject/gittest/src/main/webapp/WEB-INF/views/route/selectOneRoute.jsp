<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루트 정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
.수평테이블{
    width:900px;
    margin: 50px auto;
    border: 1px solid gray;
    border-collapse: collapse;
    overflow: hidden;
    text-align: center;
}
.수평테이블 th{
    border-right: 2px solid lightgray;
}
.수평테이블 td {
    border-right: 1px solid gray;
}
.수평테이블 tfoot tr td {
    border-top: 2px solid lightgray;
}


</style>

</head>
<body>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px">루트정보</h5>
	<img width="300px" src="resources/uploadimg/${vo2.img}" />
	<table id="routeList" class="수평테이블">
		<thead>
			<tr>
				<th style="width:150px">루트이름</th>
				<td>${vo2.route_name}</td>
			</tr>
			<tr>
				<th>요약</th>
				<td>${vo2.summary}</td>
			</tr>
			<tr>
				<th>여행지</th>
				<td>${vo2.dest_name}</td>
			</tr>
			<tr>
				<th>루트상세</th>
				<td style="">
					<c:forEach var="vo" items="${vo2.actVos}" varStatus="status">
					    ${vo.act_name}
					    <c:if test="${!status.last}"> → </c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="padding:1rem">${vo2.content}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="updateRoute.do?id=${param.id}" class="myButton" style="color:white;">루트수정</a>
					<a href="deleteRouteOk.do?id=${param.id}" class="myButton" style="color:white">루트삭제</a></td>
			</tr>
		</tfoot>
	</table>

	<button type="button" onclick="location.href='selectAllRoute.do'" class="myButton" style="color:white; margin-top:20px">루트목록</button>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
</body>
</html>