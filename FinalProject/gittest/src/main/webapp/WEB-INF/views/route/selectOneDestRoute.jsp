<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css?ver=1">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>
<script src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script type="text/javascript" src="resources/js/route/selectOneDestRoute.js?ver=2"></script>

<title>여행지 루트</title>
<script>
	const user_id = '${user.user_id}';
	let dest_id = ${param.dest_id};
</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section>
	<h3 id="chosenDest" style="margin-top:50px; margin-bottom:20px; margin-left:445px; font-size:19px; font-weight:bold">미선택 </h3>
	<div class="dropdown" style="text-align: right; margin-right: 10px;">
	  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    정렬
	  </button>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
	    <a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(1);">최근 등록</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(2);">오래된 순</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(3);">조회수 ↑</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(4);">좋아요 ↑</a>
	  </div>
	  <a class="btn btn-outline-danger" href="javascript:sortFunction(5);" role="button">초기화</a>
	</div>
	
	<table id="tableContainer" style="margin-top:30px">
		<thead>
			<tr>
				<th class="sorter-false" style="font-size:20px;"> </th>
				<th class="sorter-false" style="font-size:17px;">루트 소개</th>
				<th class="sorter-false" style="font-size:17px;">기타정보</th>
				<th class="sorter-false" style="display: none;">date</th>
				<th style="display: none;">vcount</th>
				<th class="sorter-false" style="display: none;">likes</th>
			</tr>
		</thead>
		<tbody id="vos">
			
		</tbody>
		<tfoot>
		</tfoot>
	</table>
</section>

<jsp:include page="../footer.jsp"></jsp:include>

<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
<!-- https://fontawesome.com/search 아이콘들 주소 -->
</body>
</html>