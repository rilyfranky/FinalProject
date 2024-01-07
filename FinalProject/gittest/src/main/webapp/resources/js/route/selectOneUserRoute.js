//현재 url 파라미터에서 값을 가져와서 변수에 할당한다
const urlParams = new URL(location.href).searchParams;
let id = urlParams.get('id');

//jsonSelectOneRoute 결과를 담을 변수
let result;

//체크박스 이벤트 핸들러에 쓰일 카운트용 변수
let count=0;

//onload...
$(function(){

	$.ajax({
		url : "jsonSelectOneRoute.do",
		data:{id:id},
		method:'GET',
		dataType:'json',
		async : false,
		success : function(response) {
			console.log('ajax...success:', response);
			result=response;
			let vo = ``;
			
			vo += `${response.route_name} 추천 루트`;
			
			$('.display-5').text(vo);
			
			vo=``;
		 	//루트 표시용
			response.actVos.forEach(function(e){
			   if (e.act_name != null) 
				 vo += `${e.act_name} → `;
			});
			
			// 마지막 화살표 날리기
 			vo = vo.substring(0, vo.length - 3);
	 		$('.lead').text(vo);
	 			
			vo=`♥: ${response.likes} <button class="myButton " onclick="likeUpRoute(${response.id})">추천하기!</button>`;
			$('#추천수').html(vo);
			
			//초기화
			vo=``;
			
			//체크박스 생성용
			response.actVos.forEach(function(e, index){
				if(index==0){
					//<label for="act${index}">${e.act_name}</label>
					vo += `
						<div class="card mb-3" >
						
							<a href='selectOneUserAct.do?id=${e.id}'>
								<img src="resources/uploadimg/${e.eng_name}" class="card-img-top" alt="이미지">
							</a>
							
							<div class="card-body">
		   	 					<h6 class="card-title"><a href='selectOneUserAct.do?id=${e.id}' style="text-decoration:none">${e.act_name}</a></h6>
		   	 				</div>
							
							<div class="card-footer" style="text-align: center;">
								<!-- 부트스트랩 체크박스 -->
								<span class="custom-control custom-checkbox" style="display: inline-block;">
								  <input type="checkbox" class="custom-control-input" id="act${index}" name="${index}" checked>
								  <label class="custom-control-label" for="act${index}"></label>
								</span>
								
								<button id="wish${index}" class="${e.id} btn btn-outline-danger btn-sm" onclick="addWish('${user_id}',${e.id},${index})">♡</button>
	    					</div>
						</div>
					`;
				}else{
					vo += `
						<div class="card mb-3">
						
							<a href='selectOneUserAct.do?id=${e.id}'>
								<img src="resources/uploadimg/${e.eng_name}" class="card-img-top" alt="이미지">
							</a>
							
							<div class="card-body">
		   	 					<h6 class="card-title"><a href='selectOneUserAct.do?id=${e.id}' style="text-decoration:none">${e.act_name}</a></h6>
		   	 				</div>
							
							<div class="card-footer" style="text-align: center;">
								<!-- 부트스트랩 체크박스 -->
								<span class="custom-control custom-checkbox" style="display: inline-block;">
								  <input type="checkbox" class="custom-control-input" id="act${index}" name="${index}">
								  <label class="custom-control-label" for="act${index}"></label>
								</span>
								
								<button id="wish${index}" class="${e.id} btn btn-outline-danger btn-sm" onclick="addWish('${user_id}',${e.id},${index})">♡</button>
	    					</div>
						</div>
					`;
				}
			});
			
			$('#act_container').html(vo); //체크박스 띄우기
			
			//초기화
			vo=`
				<p>
				  <button style="font-size:18px; margin-left:-2px" class="myButton" type="button" data-toggle="collapse" data-target="#collapseTarget" aria-expanded="false" aria-controls="collapseTarget">
				    루트소개(클릭!)
				  </button>
				</p>
				<div class="collapse" id="collapseTarget">
				  <div class="card card-body" style=" white-space: pre-line;">
				  	${response.content}
				  </div>
				</div>
			`;
			$('#route_content').html(vo); //루트 소개 띄우기
			
			//checkbox event
			$('input[type=checkbox]').change(function() {
				var act_name;
			    var act_id;
			    var act_add;
				//체크한 체크박스에 따라 act_name1~5 act_id1~5가 act_name act_id에 삽입됨
				switch(this.name){
					case "0":
						act_name=response.actVos[0].act_name;
						act_id=response.actVos[0].id;
						act_add=response.actVos[0].add;
						break;
					case "1":
						act_name=response.actVos[1].act_name;
						act_id=response.actVos[1].id;
						act_add=response.actVos[1].add;
						break;
					case "2":
						act_name=response.actVos[2].act_name;
						act_id=response.actVos[2].id;
						act_add=response.actVos[2].add;
						break;
					case "3":
						act_name=response.actVos[3].act_name;
						act_id=response.actVos[3].id;
						act_add=response.actVos[3].add;
						break;
					case "4":
						act_name=response.actVos[4].act_name;
						act_id=response.actVos[4].id;
						act_add=response.actVos[4].add;
						break;
					default:
						alert("Something wrong..");
				}
		
			        //체크박스 이벤트 핸들러
			        if ($(this).is(':checked')) {
			            addAddressToCoordinate(act_add,this.name);
			            count++;
			        }
			        else {
			            //해당 id=act_id? 의 div를 지운다
			            //$('#' + act_id).remove();
			            count--;
			            for(var i =0 ;i<orders.length;i++){
						    if(orders[i]==(this.name)){
						    	//console.log("오더 인덱스:",i);
						    	//console.log("클릭한 박스:",this.name);
						        removeMarker(i);
						    }
						}
			        }
			    });
				    
			$('#act0').trigger('change');
		}, //end success
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end ajax()...


	//초기 위시리스트 하트 빈하트 여부 확인
	$.ajax({
		url : "jsonselectAllWishList.do",
		data:{
			user_id:user_id
		},
		method:'GET',
		dataType:'json',
		async : false,
		success : function(response) {
			//사용자의 위시리스트 만큼 반복
			for(let i in response){
				let vo = response[i];
				//페이지내의 요소에서 확인
				for(let j=0;j<5;j++){
					if($('#wish'+j).hasClass(vo.act_id)){
					    $('#wish'+j).text('♥');
					}
				}
			}
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
});
//end onload

function addWish(user_id,act_id,index){
	let param_user_id=user_id;
	let param_act_id=act_id;
	console.log("insertWishListOk로 넘겨줄 파라미터",param_user_id,param_act_id);
	
	if(isLoggedIn()){
		$.ajax({
			url : "insertWishListOK.do",
			data:{
				act_id:param_act_id,
				user_id:param_user_id
			},
			method:'POST',
			dataType:'json',
			success : function(response) {
				console.log(response);
				if(response.result==='OK'){
					alert("위시리스트에 추가했습니다");
					$('#wish'+index).text('♥');
				}else{
					alert("위시리스트에 제거했습니다");
					$('#wish'+index).text('♡');
				}
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
	}else{
		$('#staticBackdrop').modal('show');
	}
}

function likeUpRoute(value){
	console.log(value);
	if(isLoggedIn()){
		$.ajax({
		    url: "likeUpRoute.do",
		    data: {id: value},
			method:'GET',
		    dataType:'json',
		    success: function(response) {
		        console.log("ajax success",response,response.result);
		        if(response.result=="NotOK"){
		        	alert("추천은 10초에 한번만 가능합니다");
		        }else if(response.result=="OK"){
		        	alert("루트를 추천했습니다");
		        }
		    },
		 	error:function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
		 	}
		});//end ajax
	}else{
		$('#staticBackdrop').modal('show');
	}
}

//도로경로 표시용 함수
function showRoadRoute(){
	//console.log(arrayOfCoords);
	
	$.ajax({
		url: "directions5.do",
		data: JSON.stringify(polyline.getPath()._array),
		method:'POST',
		contentType: "application/json; charset=utf-8",
		dataType:'json',
		success:function(data) {
			console.log(data);
			RoadRoute=data;
			polyline.setPath(RoadRoute.route.trafast[0].path);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});//end ajax
	
}
function hideRoadRoute(){
	console.log(arrayOfCoords);
	//orders 상태를 [0,3]->[0,1] 이런식으로 재정렬 해서 indexOutOfBounds 방지
   	var newOrders=findRanking(orders);
	var newArray = new Array();
	for(var i = 0 ;i<orders.length;i++){
		newArray.push(arrayOfCoords[newOrders[i]]);
	}
	console.log("재정렬후의 newArray:",newArray);
	polyline.setPath(newArray);
	
	//polyline.setPath(arrayOfCoords);
}

// 참조한 사이트:
//	https://stackoverflow.com/questions/11404711/how-can-i-trigger-a-bootstrap-modal-programmatically
//	https://getbootstrap.com/docs/4.6/components/modal/
// 로그인되어있으면 true를 리턴
function isLoggedIn() {
	return user_id===''?false:true;
}