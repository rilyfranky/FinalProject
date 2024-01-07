<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css?ver=2">
<link rel="stylesheet" href="resources/css/home.css?after">
<link rel="stylesheet" href="resources/css/cardAndStar.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>
<script
	src="https://mottie.github.io/tablesorter/addons/pager/jquery.tablesorter.pager.js"></script>
<script
	src="https://mottie.github.io/tablesorter/js/jquery.tablesorter.widgets.js"></script>
<script type="text/javascript">
$(function(){
	actSelectOne();
	commImgSelectAll();
	$('span.stars').stars();
});//end onload...

function actSelectOne(){
	$.ajax({ 
 		url : "jsonActSelectOne.do",
 		data:{id:${param.act_id}},
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


function commImgSelectAll(){
$.ajax({
	url:"jsonSelectCommImage.do",
	data:{act_id:${param.act_id}},
	method:'GET',
	dataType:'json',
	success:function(response){
		console.log(response);
		let tag_vos='';
		tag_vos+=`
				<h3 style="font-size:16px; font-weight:bold;">전체 후기 사진</h3>
				<div class="scrolling-wrapper row flex-row mt-4 pb-4 pt-2" 
					 style="max-height: 170px; overflow-y: scroll;"
				>
		`;
		for(let i in response){
			let vo = response[i];
			tag_vos+=`
				<a>
					<div style="align-items: center;">
						<img class="" width="150px" height="150px" style="margin-right:7px; margin-bottom:7px" src="resources/uploadimg/\${vo.name}">
					</div>
				</a>
			`;
		}
		
		tag_vos+=`
		</div>
		`;
		$("#allCommImg").html(tag_vos);
		
	},
 	error:function(xhr,status,error){
		console.log('xhr.status:',xhr.status);
 	}
});//end ajax
}


//별점 관련 함수 추후 	$('span.stars').stars(); 를 써줘야함
$.fn.stars = function() {
    return $(this).each(function() {
        // Get the value
        var val = parseFloat($(this).html());
        // Make sure that the value is in 0 - 5 range, multiply to get width
        var size = Math.max(0, (Math.min(5, val))) * 16;
        // Create stars holder
        var $span = $('<span />').width(size);
        // Replace the numerical value with stars
        $(this).html($span);
    });
}


</script>
<title>상품 후기</title>
<jsp:include page="../css.jsp"></jsp:include>

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="display: flex;
    			flex-direction: column;
			    align-items: center;">
	<h5 style="font-weight:bold; margin-top:30px; margin-bottom:30px"> <span id="act_name"></span><span> 상품 후기</span></h5>
	
	<section id="allCommImg" style="width:650px; margin-top:30px; margin-bottom:30px;">
	</section>
	
	<c:forEach var="vo" items="${vos}">
		<table id="commentsList" style="margin-top:20px;">
			<tbody>
					<tr style="border-top: 2px solid gray;">
						<td style="text-align:left"><p style="margin:5px 0px 5px 5px;">${vo.user_id}</p></td>
						<td style="font-size:13px; color:gray; text-align:right"><p style="margin:5px 0px 5px 5px;"><fmt:formatDate value="${vo.com_date}" pattern="작성일 yyyy년 MM월 dd일"/></p></td>
					</tr>
					<tr style="border-top: 1px solid gray;">
						<td colspan="2">
							<span style="margin:5px 0px 5px 5px;" class="stars">${vo.rate}</span>
						</td>
					</tr>
					<tr>
						<td style="width:500px; height:100px; vertical-align : top;"><p style="margin:5px 0px 5px 5px;">${vo.content}</p></td>
					</tr>
					<tr>
						<td><a href="updateLikes.do?id=${vo.id}&act_id=${vo.act_id}" style="margin:5px 0px 25px 5px;"> 좋아요👍🏻 ${vo.likes}</a></td>
					</tr>
			</tbody>
		</table>
	</c:forEach>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
</body>
</html>