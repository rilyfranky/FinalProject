//변수제어용 플래그
let mapFlag = 0;
//순서 저장용 이게 있어야 루트에서 삭제에 제대로 대응할수있음
let orders = new Array();
//id가 map인곳에 지도객체 생성
var map = new naver.maps.Map("map", {
    zoom: 15,
    mapTypeControl: true
});
//마커 저장용 배열
let markerArray = new Array();
//폴리라인 좌표 저장용 배열
let arrayOfCoords = new Array();
//폴리라인 객체
let polyline = new naver.maps.Polyline({
    map: map,
    path: [new naver.maps.LatLng(36.734249797, 127.410516004)], //임의의 값
    startIcon: 3,//시작점은 동그라미
    startIconSize: 10,
    endIcon: 2,//끝점은 화살표
    endIconSize: 10,
});


map.setCursor('pointer');

function addAddressToCoordinate(address,index) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('오류!');
        }

        if (response.v2.meta.totalCount === 0) {
            return alert('주소 검색결과 갯수: ' + response.v2.meta.totalCount);
        }

        var item = response.v2.addresses[0],
        //검색해서 나온 결과의 좌표를 셋팅
        point = new naver.maps.Point(item.x, item.y);
        //console.log("체크한 주소의 좌표값:", point);
			
		mapFlag=1;
		
		//이미 찍힌 마커인지 체크, 

		for(var i = 0 ; i<markerArray.length;i++){
			if(	(markerArray[i].getPosition().x===point.x)&&
				(markerArray[i].getPosition().y===point.y)){
				mapFlag=0;
			//	console.log("통과하지 못함");
			}
		}

		//찍힌 마커가 없을때만 배열에 새 마커 추가
		if(mapFlag==1){
		//	console.log("마커가 없습니다");
	        markerArray.splice(index,0,new naver.maps.Marker({
	        	animation:2,
	            position: new naver.maps.LatLng(point),
	            map: map
	        }));
			arrayOfCoords.splice(index,0,point);
			orders.push(index);
	        
	        
	        /*
	        for(let i in markerArray){
		        console.log("푸쉬후 마커배열",i,markerArray[i].getPosition());       
		        console.log("푸쉬후 arrayOfCoords배열",i,arrayOfCoords[i]);       
	        };
        	*/
        	
        	
	        //좌표들을 더해서 중간값 구하기
	        var centerX=0;
			var centerY=0;
			//현재 마커배열 길이만큼 반복
			for(var i = 0 ; i<markerArray.length;i++){
				centerX+=markerArray[i].getPosition().x;
				centerY+=markerArray[i].getPosition().y;
			}
			//평균 계산
			centerX=centerX/markerArray.length;
			centerY=centerY/markerArray.length;
			//map에 넣을 좌표 계산
	        point = new naver.maps.Point(centerX, centerY);
			
	        //맵을 좌표로 셋팅한다
	        map.setCenter(point);
	        
			//arrayOfCoords에 저장된 좌표들을 가져와서 폴리라인을 그린다
	        if(markerArray.length>1){
	        //	console.log(orders);
	        //	console.log(findRanking(orders));
	        
	        	//orders 상태를 [0,3]->[0,1] 이런식으로 재정렬 해서 indexOutOfBounds 방지
	           	var newOrders=findRanking(orders);
	        	var newArray = new Array();
	        	for(var i = 0 ;i<orders.length;i++){
	        		newArray.push(arrayOfCoords[newOrders[i]]);
	        	}
	        //	console.log("재정렬후의 newArray:",newArray);
				polyline.setPath(newArray);
	        }
		}
        mapFlag=0;
    });
}

function initGeocoder() {
	
	//엔터키만 눌러도 submit이 작동함
    $('#address').on('keydown', function(e) {
        var keyCode = e.which;

        if (keyCode === 13) { // Enter Key
        	removeMarker($('#address').val());
        }
    });

	//submit 이벤트
    $('#submit').on('click', function(e) {
        e.preventDefault();
        removeMarker($('#address').val());
    });
    
    //맞으면 selectOneUserAct에서 호출한거고 아니면 selectOneUserRoute에서 호출한것으로 짐작가능
	if(typeof result=='string'){
		addAddressToCoordinate(result,'1');
	}else{
		addAddressToCoordinate(result.actVos[0].add,'1');
	}
}

function removeMarker(value) {
	if(markerArray[value]===undefined){
		alert('잘못 입력하셨습니다');	
	}else{
	//	console.log("넘어온 value:",value);
		
		//orders 상태를 [0,3]->[0,1] 이런식으로 재정렬 해서 indexOutOfBounds 방지
		var newOrders=findRanking(orders);
		var todelete = newOrders.splice(value,1);
		orders.splice(value,1);
	//	console.log("제거할 배열:",todelete);
		markerArray[todelete].setMap(null);
		
		//여기서 arrayOfCoords로 재셋팅후 splice 해줘야 의도한대로 동작함
		polyline.setPath(arrayOfCoords);
		polyline.getPath().splice(todelete,1);
		
		//후처리
    	//orders 상태를 [0,3]->[0,1] 이런식으로 재정렬 해서 indexOutOfBounds 방지
       	newOrders=findRanking(orders);
    	var newArray = new Array();
    	for(var i = 0 ;i<orders.length;i++){
    		newArray.push(arrayOfCoords[newOrders[i]]);
    	}
    //	console.log("재정렬후의 newArray:",newArray);
		polyline.setPath(newArray);
		
		markerArray.splice(todelete,1);
		
	}
}

naver.maps.onJSContentLoaded = initGeocoder;

function findRanking(arr) {
  // 배열 복사
  var sortedArr = arr.slice();
  
  // 배열 정렬
  sortedArr.sort(function(a, b) {
    return a - b;
  });
  
  // 순위 계산
  var newArr = [];
  for (var i = 0; i < arr.length; i++) {
    var rank = sortedArr.indexOf(arr[i]);
    newArr.push(rank);
  }
  
  return newArr;
}