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
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=1">
<jsp:include page="../css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/home.css">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>
<script src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script type="text/javascript" src="resources/js/activity/selectAllUserAct.js?ver=10"></script>

<title>모든 상품 목록</title>
<script>
	const user_id = '${user.user_id}';
</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section>
<!-- 	<h1>상품</h1> -->
	<section id="vos">
	</section>
	
	<br>
		<div class="dropdown" style="text-align: right;margin-right: 10px;">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    정렬
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
		    <a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(1);">최근 등록</a>
	  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(2);">오래된 순</a>
	  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(3);">조회순 ↓↑</a>
	  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(4);">가격순 ↓↑</a>
		  </div>
		    <a class="btn btn-outline-danger" href="javascript:sortFunction(5);" role="button">초기화</a>
		</div>
	<p style="text-align: right; margin: 10px 10px 0px 0px;"><input class="search" type="search" data-column="1" placeholder="상품 이름"><button type="button" class="reset">검색 초기화</button></p>
	<table id="tableContainer" style="margin-top:30px">
	    <thead>
	        <tr>
	            <th class="sorter-false"> </th>
	            <th class="sorter-false" style="font-size:17px;">상품 소개</th>
	            <th class="sorter-false" style="font-size:17px;">기타정보</th>
	            <th style="display: none;">price</th>
	            <th style="display: none;">vcount</th>
	            <th class="sorter-false" style="display: none;">act_date</th>
	        </tr>
	    </thead>
	    <tbody id="vos2">
	        <c:forEach var="vo" items="${vos}" varStatus="status">
	            <tr>
	                <td>
	                    <a href="selectOneUserAct.do?id=${vo.id}">
							<img style="margin: 2px; width:150px; height:150px"  src="resources/uploadimg/thumb_${vo.eng_name}">	
						</a> 
					</td>
	                <td>
	                	<h5><a href="selectOneUserAct.do?id=${vo.id}" style="font-size:18px; font-weight:bold">${vo.act_name}</a></h5>
	                	<p style="font-size:14px">${vo.content}</p>
	                	<span class="stars">${vo.rate}</span>
	                	${vo.price}원 <button class="wish btn btn-outline-danger btn-sm" data-act_id="${vo.id}" data-arg1='${user.user_id}' data-arg2= '${vo.id}' data-arg3='${status.count}'>♡</button>
	                </td>
	                <td style="vertical-align: middle;">
	                	<p style="width: 200px; font-size:13px;">태그: ${vo.tag}</p>
	                	<p style="width: 200px; font-size:13px;">조회수: ${vo.vcount}</p>
	                	<p style="width: 200px; font-size:13px;">주소: ${vo.add}</p>
	                </td>
	                <td style="display: none; font-size:13px;">${vo.price}</td>
	                <td style="display: none; font-size:13px;">${vo.vcount}</td>
	                <td style="display: none; font-size:13px;">${vo.act_date}</td>
	            </tr>
	        </c:forEach>
	    </tbody>
	    <tfoot>
	    </tfoot>
	</table>
	<!-- 페이징 요소-->
	<div class="tableContainer" style="text-align: center;">
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
<!-- 로그인 안할시 띄울 모달창 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">경고!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        로그인 해주세요
      </div>
      <div class="modal-footer">
        <a href="login.do" type="button" class="btn btn-primary">로그인하러가기</a>
      </div>
    </div>
  </div>
</div>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
<script src="https://kit.fontawesome.com/0007d685f8.js" crossorigin="anonymous"></script>
<!-- https://fontawesome.com/search 아이콘들 주소 -->
</body>
</html>
