<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>상품 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/activity/selectOneAct.js"></script>
<style>
	section a{
	  color: white;
	}
	section a:visited { color: white; }
	section a:hover { color: white; }
	section a:active { color: white; }
</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px">상품정보</h5>
	<ul id="imageList" style="display: inline-flex; max-width: 1000px;">
    </ul>
	<table id="adminlisttable" style="text-align: center;">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>평점</th>
				<th>조회수</th>
				<th>태그</th>
				<th>주소</th>
				<th>가격</th>
				<th>등록일자</th>
				<th>판매자</th>
				<th>여행지번호</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.act_name}</td>
				<td>${vo2.rate}</td>
				<td>${vo2.vcount}</td>
				<td>${vo2.tag}</td>
				<td>${vo2.add}</td>
				<td>${vo2.price}</td>
				<td>${vo2.act_date}</td>
				<td>${vo2.seller_id}</td>
				<td>${vo2.dest_id}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="11"><a href="updateAct.do?id=${param.id}" class="myButton">상품수정</a>
					<a href="deleteActOk.do?id=${param.id}" class="myButton">상품삭제</a></td>
			</tr>
		</tfoot>
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
</body>
</html>