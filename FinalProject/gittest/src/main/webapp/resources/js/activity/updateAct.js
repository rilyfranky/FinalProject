//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let id = urlParams.get('id');
console.log(id);

$(function(){
	$.ajax({
		url : "jsonSelectAllImage.do",
		data:{act_id:id},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			console.log('ajax...success:', arr);
			let vos = ``;
			
			if(arr.length==0){
				vos += `	
					<img src="resources/uploadimg/thumb_default.png">
				`;
			}else{
				$.each(arr,function(vo){
	// 				console.log(arr[vo].name);
					vos += `	
						<img src="resources/uploadimg/thumb_${arr[vo].name}">
					`;
					
				});
			}
			$('#imageList').html(vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
	$.ajax({
		url : "jsonUsersSelectOne.do",
		data:{user_id:user_id},
		method:'GET',
		dataType:'json',
		success : function(arr) {
			//유저의 타입이 0일때만 관리자다
			if(arr.type!==0){
				//태그를 수정 불가로 바꿈
				console.log('aass');
				$('#tag').attr('readonly',true); //수정불가
				$('#tag').attr('onFocus',"this.blur();");//포커싱불가
				$('#tag').after(' 관리자만 수정 가능합니다.'); //바로 뒤에 글자 추가
			}
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
});