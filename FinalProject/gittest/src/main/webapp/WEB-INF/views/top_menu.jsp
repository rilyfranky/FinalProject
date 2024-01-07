<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Top Menu</title>
    <style>
        /* CSS 스타일을 여기에 직접 작성합니다. */
        header {
            padding: 10px;
        }

        /* 나머지 CSS 스타일들 */
        #content ul li a:hover,
        #content ul li a.active {
            color: #000;
            border-bottom: 3px solid #aaaac8;
            text-decoration: none;
        }

        #login ul li a:hover,
        #login ul li a.active {
            color: #333;
            border-bottom: 2px solid #c8c8c8;
            text-decoration: none;
        }
    </style>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var contentLinks = document.querySelectorAll("#content ul li a");
        contentLinks.forEach(function(link) {
            link.addEventListener("click", function(event) {
                // 다른 모든 메뉴 항목의 active 클래스를 제거합니다.
                contentLinks.forEach(function(otherLink) {
                    otherLink.classList.remove("active");
                });
                // 클릭한 메뉴 항목에 active 클래스를 추가합니다.
                link.classList.add("active");
            });

            // 클릭한 메뉴 항목에 active 클래스가 있으면 hover 효과를 유지합니다.
            link.addEventListener("mouseenter", function(event) {
                if (!link.classList.contains("active")) {
                    link.classList.add("hover");
                }
            });

            // 메뉴 항목을 떠날 때 hover 효과를 유지하지 않도록 합니다.
            link.addEventListener("mouseleave", function(event) {
                link.classList.remove("hover");
            });

            // 로그인 상태에 따라 active 클래스를 초기화합니다.
            if ('${user.user_id}' !== '' && link.getAttribute("href") === window.location.pathname) {
                link.classList.add("active");
            }
        });
    });
</script>
</head>
<body>
    <header>
        <div id="logo">
	<a href="balgil.com"><img width="155px" src="resources/uploadimg/balgil.png"></a>
</div>	

<div id="content">
<ul>
	<li style="margin-left:10px;"><a href="selectAllDestination.do?category=City">여행지 루트 선택</a></li>
	<li><a href="selectAllUserAct.do">여행지 상품 선택</a></li>
</ul>	
</div>

<div id="login">
<!-- 우측 상단 출력 -->
<ul>
	<!-- 로그인 전 이렇게 출력 -->
	<li class="login"><a href="login.do">로그인</a></li>
	<li class="u_insert"><a href="u_insert.do">회원가입</a></li>
	
	<!-- 로그인 후 로그인 안보이게 하고 하단 링크들 출력 -->
	<li class="showUserName">${user.name}님</li>
	<li class="info"><a href="myInfo.do?user_id=${user.user_id}">판매자 정보</a></li>
	<li class="wishlist"><a href="selectAllWishList.do?user_id=${user.user_id}">위시리스트</a></li>
	<li class="cart"><a href="selectAllCart.do?user_id=${user.user_id}">장바구니</a></li>
	<li class="myPage"><a href="myPage.do?user_id=${user.user_id}">마이페이지</a></li>
	<li class="logout"><a href="logout.do">로그아웃</a></li>
</ul>
</div>
</header>

<script type="text/javascript">
	if('${user.user_id}'===''){
		$('.login').show();
		$('.u_insert').show();
		$('.showUserName').hide();
		$('.wishlist').hide();
		$('.cart').hide();
		$('.myPage').hide();
		$('.logout').hide();
		$('.info').hide();
	}else{
		$('.login').hide();
		$('.u_insert').hide();
		$('.wishlist').hide();
		$('.cart').hide();
		$('.myPage').hide();
		$('.logout').show();
		$('.info').show();
		if('${user.type}'==='3'){
			$('.login').hide();
			$('.u_insert').hide();
			$('.showUserName').show();
			$('.wishlist').show();
			$('.cart').show();
			$('.myPage').show();
			$('.logout').show();
			$('.info').hide();
		} else if('${user.type}'==='0'){
			$('.login').hide();
			$('.u_insert').hide();
			$('.showUserName').show();
			$('.wishlist').hide();
			$('.cart').hide();
			$('.myPage').hide();
			$('.info').hide();
			$('.logout').show();
			
		}
	}
</script>
</body>
</html>