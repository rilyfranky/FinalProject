<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>selectOne</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>
    <div id="commentsform">
    <h3>내 후기 보기</h3>
    <table id="commentstable1">
        <thead>
            <tr>
                <th style="width:100px;">상품명</th>
                <td>${vo2.act_name}</td>
            </tr>
            <tr>
                <th>별점</th>
                <td>${vo2.rate}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td style="width:300px; height:300px; border:1px solid gray; padding-top:10px; vertical-align : top;">${vo2.content}</td>
            </tr>
            <tr>
                <th>작성일자</th>
                <td><fmt:formatDate value="${vo2.com_date}" pattern="yyyy년 MM월 dd일"/></td>
            </tr>
            <tr>
                <th>좋아요</th>
                <td>${vo2.likes}</td>
            </tr>
        </tbody>
    
    <!-- 업로드된 이미지 표시 -->
    <c:if test="${vos.size()!=0}"></c:if>
    <tr>
        <!-- <td>후기 이미지:</td> -->
        <th>후기 사진</th>
        <td colspan="4">
            <c:forEach var="img" items="${vos}">
                <img width="100px" height="100px" src="resources/uploadimg/${img.name}" width="200px" alt="이미지">
            </c:forEach>
        </td>
    </tr>
    </table>
    
    <div>
      <button id="update_comm" data-id="${vo2.id}" data-res_id="${vo2.res_id}" data-user_id="${user.user_id}" class="myButton">후기수정</button>
      <button id="delete_comm" data-id="${vo2.id}" data-res_id="${vo2.res_id}" data-user_id="${user.user_id}" class="myButton">후기삭제</button>
    </div>
    
    <form action="updateComments.do" method="post" class="update_comm_form">
        <input type="hidden" name="id" class="update_id">
        <input type="hidden" name="res_id" class="update_res_id">
        <input type="hidden" name="user_id" class="update_user_id">
    </form>
    
    <form action="deleteCommentsOK.do" method="post" class="delete_comm_form">
        <input type="hidden" name="id" class="delete_id">
        <input type="hidden" name="res_id" class="delete_res_id">
        <input type="hidden" name="user_id" class="delete_user_id">
    </form>
    
    </div>
    <script>
        $(document).ready(function() {
            $(".like_comm").on("click", function(e) {
                e.preventDefault();
                const id = $(this).data("id");
                likeComment(id);
            });

            $("#update_comm").on("click", function(e){
                e.preventDefault();
                const id = $(this).data("id");
                let res_id = $(this).data("res_id");
                let user_id = $(this).data("user_id");
                $(".update_id").val(id);
                $(".update_res_id").val(res_id);
                $(".update_user_id").val(user_id);
                $(".update_comm_form").submit();
            });

            $("#delete_comm").on("click", function(e){
                e.preventDefault();
                const id = $(this).data("id");
                let res_id = $(this).data("res_id");
                let user_id = $(this).data("user_id");
                $(".delete_id").val(id);
                $(".delete_res_id").val(res_id);
                $(".delete_user_id").val(user_id);
                $(".delete_comm_form").submit();
            });
        });

       
    </script>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
