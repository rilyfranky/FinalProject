<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer>
	<div id="line1">
		<ul>
			<li><a href="selectAllFaq.do"><p style="font-size:17px; margin-bottom:0px">고객센터</p></a></li>
		</ul>
		
		<div id="page">
			<ul>
				<li class="adminPage"><a href="admin.do"><p>관리자 페이지로</p></a></li>
				<li class="sellerPage"><a href="seller.do"><p>판매자 페이지로</p></a></li>
			</ul>
		</div>
	</div>
	
	<div id="line2">
		<p>회사소개 │ 이용약관 │ 개인정보 처리방침 │ 사업자정보 확인</p>
	</div>

	<div id="line3">
		<p>대표이사: 김노이 │ 이메일: balgil7@balgil.com</p>
	</div>

	<div id="line4">
		<p>(주)원트트래블컴퍼니 ALL RIGHT RESERVED</p>
	</div>

</footer>
<script type="text/javascript">
	$('.adminPage').hide();
	$('.sellerPage').hide();
	if('${user.type}'==='0'){ //관리자
		$('.adminPage').show();
	}else if ('${user.type}'==='1' || '${user.type}'==='2'){ //승인 셀러
		$('.sellerPage').show();
	}
</script>