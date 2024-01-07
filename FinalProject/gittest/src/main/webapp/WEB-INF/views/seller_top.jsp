<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
/*             color: #0000c8; */
            border-bottom: 3px solid #0000c8;
            text-decoration: none;
        }

        #login ul li a:hover,
        #login ul li a.active {
            color: #333;
            border-bottom: 2px solid #0000c8;
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
<!-- 좌측 상단 출력 -->
<header>
<div id="logo">
	<a href="balgil.com"><img width="155px" src="resources/uploadimg/balgil.png"></a>
</div>	

<div id="content">
	<ul>
		<li><a href="seller.do">판매자 페이지로</a></li>
	</ul>
</div>
<div id="login">
<ul>
	<li class="logout"><a href="myInfo.do?user_id=${user.user_id}">판매자 정보</a></li>
	<li class="logout"><a href="logout.do">로그아웃</a></li>
</ul>
</div>
</header>
</body>
</html>