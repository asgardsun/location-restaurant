/**
 * 
 */
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
$.getJSON('myMapProc.jsp', function(data) {

    $.each(data, function(index, item) {

        var marker = new kakao.maps.Marker({
			clickable: true,
			position: new kakao.maps.LatLng(item.lat, item.lng) // 마커의 위치
		});
        
        marker.setMap(map);
        
        
        var iwContent = '<div class="info-title">' + '<b><span style="font-size:19px;">' + item.name + '</span> </b>' 
		  + '&ensp;<span style="color:#56721c;"><b>' +  item.menu + '</b></span>' + '</br>' 
		  + '<div class="line"></div><b>'
		  + item.place + '</b></br><b>'
		  + item.reason
          + '</b></div>';
        
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent
        });
        

        kakao.maps.event.addListener(marker, 'mouseover', function() {
        // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        	infowindow.open(map, marker);
        	var infoTitle = document.querySelectorAll('.info-title');
    		infoTitle.forEach(function(e) {
    			e.parentElement.previousSibling.style.display = "none";
    			e.parentElement.parentElement.style.border = "0px";
    			e.parentElement.parentElement.style.background = "unset";
    		});
        });

        // 마커에 마우스아웃 이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'mouseout', function() {
        	// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        	infowindow.close();
        });
        
    });
});

//체크박스 하나만 선택하게 하기
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("cbx");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
}


// 수정/삭제 팝업창으로 post 전송
function openUpdewin(frm) {
	  var url    ="updeQuery.jsp";
	  var title  = "testpop";
	  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=500, height=650, top=0,left=20"; 
	  window.open("", title, status); //window.open(url,title,status); window.open 함수에 url을 앞에와 같이
	                                            //인수로  넣어도 동작에는 지장이 없으나 form.action에서 적용하므로 생략
	                                            //가능합니다.
	  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다. 
	  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
	  frm.method = "post";
	  frm.submit();     
}

function opendelwin(frm) {
	  var url    ="deleteQuery.jsp";
	  var title  = "testpop";
	  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=500, height=650, top=0,left=20"; 
	  window.open("", title, status); //window.open(url,title,status); window.open 함수에 url을 앞에와 같이
	                                            //인수로  넣어도 동작에는 지장이 없으나 form.action에서 적용하므로 생략
	                                            //가능합니다.
	  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다. 
	  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
	  frm.method = "post";
	  frm.submit();     
}

// 테이블의 Row 클릭시 값 가져오기
$("#place_table tr").click(function(){ 	

	var str = ""
	var tdArr = new Array();	// 배열 선언
	
	// 현재 클릭된 Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
	console.log("클릭한 Row의 모든 데이터 : "+tr.text());
	
	// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	td.each(function(i){
		tdArr.push(td.eq(i).text());
	});
	
	console.log("배열에 담긴 값 : "+tdArr);
	
	// td.eq(index)를 통해 값을 가져올 수도 있다.
	var name = td.eq(0).text();
	var place = td.eq(1).text();
	var menu = td.eq(2).text();
	var reason = td.eq(3).text();
	
	
	str +=	"<b>선택한 맛집의 정보입니다.</b>" + "<br><br>"
		+   "<b>맛집이름</b> : " + name + "<br>"
		+	"<b>주소</b> : " + place + "<br>"
		+	"<b>메뉴</b> : " + menu + "<br>"
		+	"<b>한 줄 평</b> : "+ reason;		
	
	$("#result").html(str);
});