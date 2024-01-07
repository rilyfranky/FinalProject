window.onload = function(){
	//2. jquery AJAX
	$.ajax({
		url:"jsonSelectAllRoute.do",
		data:{dest_id:dest_id},
		dataType:'json',
		success:function(response){
			console.log('ajax...success:',response);
			let tag_vos='';
			for(let i in response){
				let vo = response[i];
				tag_vos+=`
				<tr>
 					<td>				
 						<a href="selectOneUserRoute.do?id=${vo.id}">
							<img style="margin: 2px; width:150px; height:150px"  src="resources/uploadimg/${vo.img}">	
						</a> 
 					</td>
 					<td>
 						<h5><a href="selectOneUserRoute.do?id=${vo.id}" style="font-size:18px; font-weight:bold">${vo.route_name}</a></h5>
 						<p style="font-size:15px;">${vo.summary}</p>
 						<p>추천 루트<br>
 				`;
 				
 				//루트들 삽입하는 부분
 				vo.actVos.forEach(function(e){
				   if (e.act_name != null) 
					 tag_vos += `${e.act_name} → `;
				});
 				
 				// 마지막 화살표 날리기
 				tag_vos = tag_vos.substring(0, tag_vos.length - 3);
 				
 				
 				tag_vos+=`
 					</p>
 					</td>
 					<td style="vertical-align: middle;">
 						<p style="width: 200px; font-size:13px;">여행지:${vo.dest_name}</p>
 						<p style="width: 200px; font-size:13px;">조회수:${vo.vcount}</p>
 						<p style="width: 200px; font-size:13px;">좋아요:${vo.likes}</p>
 					</td>
 					<td style="display: none;">${vo.date}</td>
 					<td style="display: none;">${vo.vcount}</td>
 					<td style="display: none;">${vo.likes}</td>
 				</tr>
				`;
			}
			
			$("#vos").html(tag_vos);
			$("#tableContainer").tablesorter({
		 	})
		 	let temp = `${response[0].dest_name} 추천 루트`;
		 	$("#chosenDest").text(temp);
		},
	 	error:function(xhr,status,error){
			console.log('xhr.status:',xhr.status);
	 	}
		
	});//end ajax
	
	
};//end onload


function sortFunction(value){
	switch (value) {
		//최근 등록
		case 1:
 			$("#tableContainer").trigger("sorton", [ [[3,1]] ]);
			break;
			
		//오래된 순
		case 2:	
 			$("#tableContainer").trigger("sorton", [ [[3,0]] ]);
			break;

		//조회순
		case 3:
			$("#tableContainer").trigger("sorton", [ [[4,1]] ]);
			break;
		
		//좋아요순
		case 4:
 			$("#tableContainer").trigger("sorton", [ [[5,1]] ]);
 			break;
 			
 		//정렬 초기화
 		case 5:
 			$("#tableContainer").trigger("sortReset");
 		break;
		default:
    	console.log(`error sorting.`);
	}
}