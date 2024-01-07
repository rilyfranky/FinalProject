<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>후기 작성</title>
    <jsp:include page="../css.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	console.log("onload...");
    	actSelectOne();

    });//end onload...
    
	function actSelectOne(){
		$.ajax({
	 		url : "jsonActSelectOne.do",
	 		data:{id:$('#act_id').val()},
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
    
    </script>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>
    <div id="commentsform">
    <h3>후기 작성</h3>
    <form action="insertCommentsOK.do" method="post" enctype="multipart/form-data">
        <table id="commentstable">
            <tr>
                <td style="width:80px;"><label for="user_id">작성자</label></td>
                <td><input type="hidden" id="user_id" name="user_id" value="${user.user_id}" readonly required>
                <input type="hidden" id="res_id" name="res_id" value="${param.res_id}" required>${user.user_id}</td>
            </tr>
            <tr>
                <td><label for="act_id">상품번호</label></td>
                <td><input type="hidden" id="act_id" name="act_id" value="${param.act_id}" required><span id="act_name"></span></td>
            </tr>
			<tr>
                <td><label for="content">내용</label></td>
                <td><textarea id="content" name="content" rows="15" cols="50" required></textarea></td>
            </tr>
            <tr>
                <td><label for="rate">평점</label></td>
                <td><select id="rate" name="rate" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                </select></td>
            </tr>
				<tr>
					<td>후기 사진</td>
					<td><input type="file" name="file" multiple></td>
				</tr>
				<!-- 이미지 업로드 -->
				<tr id="uploadedImages">
					<td><c:if test="${not empty uploadedImages}">
							<c:forEach var="vo" items="${uploadedImages}">
								<img width="100px" height="100px" src="resources/uploadimg/${vo.name}">
							</c:forEach>
						</c:if>
					</td>
				</tr>
			</table>
        <input type="submit" value="입력완료" class="myButton">
    </form>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
    <script>
        $(function(){
            $("input[type='file']").change(function(event){
                var $fileUpload = $("input[type='file']");
                var files = event.target.files;
                var $uploadedImages = $("#uploadedImages");

                $uploadedImages.empty();

                if (files.length > 5){
                    $fileUpload.val('');
                    alert("이미지는 최대 5장까지만 삽입 가능합니다.");
                } else {
                    for (var i = 0; i < files.length; i++) {
                        var reader = new FileReader();
                        reader.onload = function(e){
                            $uploadedImages.append('<img width="100px" src="' + e.target.result + '">');
                        };
                        reader.readAsDataURL(files[i]);
                    }
                }
            });
        });
    </script>
</body>
</html>