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
<title>상품 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>
<script src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script type="text/javascript" src="resources/js/activity/selectAllAct.js?ver=3"></script>
<script>
	const user_id = '${user.user_id}';
</script>
<style>
	section a{
	  color: red;
	}
	section a:visited { color: red; }
	section a:hover { color: red; }
	section a:active { color: red; }
</style>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px">상품목록</h5>
	
	<p style="text-align: right;margin: 10px 10px 0px 0px;"><input class="search" type="search" data-column="2" placeholder="상품 이름"><button type="button" class="reset">검색 초기화</button> <button type="button" onclick="location.href='insertAct.do'" class="myButton">상품등록</button></p>
	<table id="activityList">
	<thead>
		<tr>
			<th>번호</th>
			<th>상품이름</th>
			<th>내용</th>
			<th>평점</th>
			<th>조회수</th>
			<th>태그</th>
			<th>주소</th>
			<th>가격</th>
			<th>등록일</th>
			<th>판매자</th>
			<th>dest_id</th>
		</tr>
	</thead>
	<tbody id="vos">
	</tbody>
	<tfoot>
	</tfoot>
	</table>
	<!-- 페이징 요소-->
	<div class="activityList" style="text-align: center;">
		<form>
			<i class="fa-sharp fa-solid fa-angles-left fa-2xl first"></i>
			<i class="fa-sharp fa-solid fa-angle-left fa-2xl prev"></i>
			<!-- the "pagedisplay" can be any element, including an input -->
			<span class="pagedisplay" data-pager-output-filtered="{startRow:input} &ndash; {endRow} / 검색결과: {filteredRows}개"></span>
			<i class="fa-sharp fa-solid fa-angle-right fa-2xl next"></i>
			<i class="fa-sharp fa-solid fa-angles-right fa-2xl last"></i>
		</form>
	</div>

	
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
</body>
</html>