/**
 * 
 */

function formCheck() {
	if (!mapform.name.value) {
		alert("맛집이름을 입력해주세요..");
		mapform.name.focus();
		return false;
	}
	if (!mapform.place.value) {
		alert("주소를 입력하고 확인 버튼을 클릭해주세요.");
		mapform.place.focus();
		return false;
	}
	if (!mapform.lat.value || !mapform.lng.value) {
		alert("주소 입력창 옆 확인 버튼을 클릭해주세요.");
		mapform.place.focus();
		return false;
	}
	if (!mapform.menu.value) {
		alert("메뉴를 입력해주세요.");
		mapform.menu.focus();
		return false;
	}
	if (!mapform.reason.value) {
		alert("맛집 선정 이유를 입력해주세요.");
		mapform.reason.focus();
		return false;
	}
	return true;
}


function popCheck() {
	if (!popform.place.value) {
		alert("주소를 입력하고 확인 버튼을 클릭해주세요.");
		popform.place.focus();
		return false;
	}
	if (!popform.lat.value || !popform.lng.value) {
		alert("주소 입력창 옆 확인 버튼을 클릭해주세요.");
		popform.place.focus();
		return false;
	}
	if (!popform.menu.value) {
		alert("메뉴를 입력해주세요.");
		popform.menu.focus();
		return false;
	}
	if (!popform.reason.value) {
		alert("맛집 선정 이유를 입력해주세요.");
		popform.reason.focus();
		return false;
	}
	return true;
}

// 버튼 삭제 클릭시 발생 이벤트
function del_event(){
	  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		  location.href="deleteProc.jsp";
	  }else{   //취소
	      return;
	  }
	}


// var seoul = document.getElementById("seoul");
// seoul.onclick = function seoulTo() {
// var moveLatLon = new kakao.maps.LatLng(37.564214, 127.001699);
// map.panTo(moveLatLon);
// }

// var jusoCheck = document.getElementById("juso");
// seoul.onclick = function check();

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new kakao.maps.LatLng(37.44807116489445, 126.65752555763932), // 지도의
																			// 중심좌표
	level : 3
// 지도의 확대 레벨
};

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var btnCheck = document.getElementById("check");
btnCheck.onclick = function check() {
	var juso = document.getElementById('juso').value;
	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					juso,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// document.getElementById("lat").innerText =
							// result[0].y;
							// document.getElementById("lng").innerText =
							// result[0].x;
							var lat = document.getElementById("lat");
							var lng = document.getElementById("lng");

							lat.value = result[0].y;
							lng.value = result[0].x;

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:180px;text-align:center;padding:6px 0;">위치가 다르다면<br>주소를 다시 입력해주세요.</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}

						else {
							alert("주소를 정확하게 입력해주세요.");
						}
					});

}