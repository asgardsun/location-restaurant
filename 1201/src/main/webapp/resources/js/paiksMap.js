var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new kakao.maps.LatLng(36.20585, 127.15764), // 지도의 중심좌표
	level : 12, // 지도의 확대 레벨
	mapTypeId : kakao.maps.MapTypeId.ROADMAP
// 지도종류
};

// 지도를 생성한다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 마커 출력
$.getJSON('paiksProc.jsp', function(data) {

    $.each(data, function(index, item) {

        var marker = new kakao.maps.Marker({
        	map: map,
			clickable: true,
			position: new kakao.maps.LatLng(item.lat, item.lng) // 마커의 위치
		});
        
        var value = item.place;
		var splitData = value.split(' ', 2);
		
		// data[i].contact undefined 예외처리 필요
		iwContent = '<div class="info-title">' + '<b><span style="font-size:19px;">' + item.name + '</span> </b>' 
		  + '&ensp;<span style="color:#56721c;"><b>' +  item.main_menu + '</b></span>' + '</br>' 
		  + '<div class="line"></div><b>'
		  + item.place + '</b></br>' 
        + '<b><a class="link" href="https://map.naver.com/v5/search/' + splitData[0] + ' ' + splitData[1] + ' ' + item.name + '" target="_black"><span style="font-size:13px;">네이버 지도</span></a>' + '&nbsp;&nbsp;'
        + '<a class="link" href="https://map.kakao.com/link/search/' + splitData[0] + ' ' + splitData[1] + ' ' + item.name + '" target="_black"><span style="font-size:13px;">카카오맵</span></a>' + '</div>';
		
		
		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new kakao.maps.InfoWindow({
			content: iwContent // 인포윈도우에 표시할 내용
		});
		
		// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		// 이벤트 리스너로는 클로저를 만들어 등록합니다 
		// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
		kakao.maps.event.addListener(marker, 'rightclick', makeOutListener(infowindow));
    });
});

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
	return function() {
		infowindow.open(map, marker);
	};
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
	return function() {
		infowindow.close();
	};
}

var seoul = document.getElementById("seoul");
seoul.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(37.564214, 127.001699);
    map.panTo(moveLatLon);            
}    

var gg = document.getElementById("gyeonggi");
gg.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(37.27498331607221, 127.00916864041675);
    map.panTo(moveLatLon);            
}    

var cb = document.getElementById("chungBuk");
cb.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(36.628503, 127.929344);
    map.panTo(moveLatLon);            
}

var cn = document.getElementById("chungNam");
cn.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(36.557229, 126.779757);
    map.panTo(moveLatLon);            
}  

var jb = document.getElementById("jeonBuk");
jb.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(35.716705, 127.144185);
    map.panTo(moveLatLon);            
}    

var jn = document.getElementById("jeonNam");
jn.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(34.819400, 126.893113);
    map.panTo(moveLatLon);            
}    

var gb = document.getElementById("gyeongBuk");
gb.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(36.248647, 128.664734);
    map.panTo(moveLatLon);            
}

var gn = document.getElementById("gyeongNam");
gn.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(35.259787, 128.664734);
    map.panTo(moveLatLon);            
}    


var gwangju = document.getElementById("gwangju");
gwangju.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(35.126033, 126.831302);
    map.panTo(moveLatLon);            
}    

var daejeon = document.getElementById("daejeon");
daejeon.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(36.321655, 127.378953);
    map.panTo(moveLatLon);            
}    

var daegu = document.getElementById("daegu");
daegu.onclick = function seoulTo() {
    var moveLatLon = new kakao.maps.LatLng(35.798838, 128.583052);
    map.panTo(moveLatLon);            
} 

