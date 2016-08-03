<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    <%@ page import="org.w3c.dom.*"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="java.util.*"%>
<!-- ---------------------------------------------------------- -->
<%
	
%>
<!-- 여기까지는 parse문장 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>Daum 지도 및 xml파싱</title>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<style type="text/css">
	.main-table{ width : 100%; border : #000 solid 1px;}
	.table-title{text-align : center; font-weight : bold;}
	.selectbox-div{text-align : right; margin-bottom:10px;}
	.header{text-align : center;}
	
	select{width:100px;height :23px;margin-left: 10px;}
	td{border : #000 solid 1px;}
</style>
</head>
<body>
	<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/httpRequest.js"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=90a65ba17dc78a1b4afb45c54591cbdd&libraries=services"></script>
	<script>
		var markers = [];

		var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		var places = new daum.maps.services.Places();
		
		var geocoder = new daum.maps.services.Geocoder();
		
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
            
            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng; 
            var resultDiv = document.getElementById('Lat_result'); 
            resultDiv.value = latlng.getLat()+"";
            var resultDiv1 = document.getElementById('Lng_result');
            resultDiv1.value = latlng.getLng()+"";
			var p = document.getElementById("place_result");
			
			p.value = "선택하신 위치";
        });
		
		function search() {
			var text = document.getElementById("place").value;
			places.keywordSearch(text, placesSearchCB);
		}
		
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

		    var keyword = document.getElementById('place').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    places.keywordSearch( keyword, placesSearchCB); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data.places);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === daum.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new daum.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            daum.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
					//add my code. Start
		            daum.maps.event.addListener(marker, 'mousedown', function() {
		                var ss = marker.getPosition();
		                var resultDiv = document.getElementById('Lat_result'); 
		                resultDiv.value = ss.getLat()+"";
		                var resultDiv1 = document.getElementById('Lng_result');
		                resultDiv1.value = ss.getLng()+"";
		            	displayInfowindow1(marker, title);
		            });
		            itemEl.onmousedown =  function () {
		            	var ss = marker.getPosition();
		                var resultDiv = document.getElementById('Lat_result'); 
		                resultDiv.value = ss.getLat()+"";
		                var resultDiv1 = document.getElementById('Lng_result');
		                resultDiv1.value = ss.getLng()+"";
		            	displayInfowindow1(marker, title);
		            };
		           	
		         
		            // End
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].title);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.title + '</h5>';

		    if (places.newAddress) {
		        itemStr += '    <span>' + places.newAddress + '</span>' +
		                    '   <span class="jibun gray">' +  places.address  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
			//var p = document.getElementById("place_result");
			//p.value = title;
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
		function displayInfowindow1(marker, title) {
		    //var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
			var p = document.getElementById("place_result");
			
			p.value = title;
			
		    //infowindow.setContent(content);
		    //infowindow.open(map, marker);
		}
		
		

		
		function remove() {
			// 검색 결과 목록에 추가된 항목들을 제거합니다
			var listEl = document.getElementById('placesList');
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		}
		
		function recom(){
			var lat = document.getElementById("Lat_result").value;
			var lag = document.getElementById("Lng_result").value;
			var params = "lat="+lat+"&lag="+lag;
			alert(params);
			sendRequest("${pageContext.request.contextPath}/subplan/recom.do", params, checkResult,'POST');
		}
		
		function checkResult() {
			if(httpRequest.readyState==4){
				if(httpRequest.status==200){
					var str = httpRequest.responseText;
					
					var o = eval("("+str+")");
					alert(str);
					myDiv = document.getElementById("div1");
					var title;
					var html ="<table><tr><td>장소명</td><td>주소</td><td>상세주소</td><td>지역코드</td><td>콘텐츠id</td><td>콘텐츠타입id</td><td>거리</td><td>mapx</td><td>mapy</td></tr>";
					for(i=0;i<o.length;i++){
						title = o[i].title;
						html += "<tr><td>"+o[i].title+"</td>";
						html += "<td>"+o[i].addr1+"</td>";
						html += "<td>"+o[i].addr2+"</td>";
						html += "<td>"+o[i].areacode+"</td>";
						html += "<td>"+o[i].contentid+"</td>";
						html += "<td>"+o[i].contenttypeid+"</td>";
						html += "<td>"+o[i].dist+"</td>";
						html += "<td>"+o[i].mapx+"</td>";
						html += "<td>"+o[i].mapy+"</td>";
						
						html += "<td><input type='button' value='선택' id='"+title+"' onclick='send(this)'></td></tr>";
					    alert(html);
					}
					html +="</table>"
					myDiv.innerHTML = html;
					
				}
			}
		}
		
		 function send(ss) {
		        //window.opener.document.myform.receiver.value = document.myform.sender.value;
		        window.opener.document.f.place.value = ss.id;
		        window.opener.document.f.llh_x.value = document.myform.Lat_result.value;
		        window.opener.document.f.llh_y.value = document.myform.Lng_result.value
		        window.close();
		    }
		 
		 function send1() {
		        //window.opener.document.myform.receiver.value = document.myform.sender.value;
		        window.opener.document.f.place.value = document.myform.place_result.value;
		        window.opener.document.f.llh_x.value = document.myform.Lat_result.value;
		        window.opener.document.f.llh_y.value = document.myform.Lng_result.value
		        window.close();
		    }
	</script>
	<form name="myform">
	<a>장소검색</a>
	<input type="text" id="place">
	<input type="button" value="검색" onclick="search()">
	<input type="button" value="검색결과제거" onclick="remove()">
	<br>
	<a>장소선택</a>
	<input type="text" id="place_result">
	<br>
	<a>위도</a>
	<input type="text" id="Lat_result">
	<a>경도</a>
	<input type="text" id="Lng_result">
	<input type="button" value="해당위치 추천 목록 보기" onclick="recom()">
	<input type="button" value="해당위치선택" onclick="send1()">
	</form>
	<!-- 여기서부터 파싱목록 -->
	<div id="div1">
	
	</div>
</body>
</html>
