<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99e91fbe1b2c343821dfa986b88cb1b6&libraries=services,clusterer,drawing"></script>
</head>
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
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
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
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form name="placeSearch" action="SearchPlace">
                    키워드 : <input type="text" placeholder="검색어를 입력하세요" name="keyword" value="${address}"id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        ${SelectList}
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99e91fbe1b2c343821dfa986b88cb1b6"></script>
<script>
      var container = document.getElementById('map');
      var options = {
         center: new daum.maps.LatLng(33.450701, 126.570667),
         level: 3
      };

      var map = new daum.maps.Map(container, options);
      var geocoder = new daum.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      
            
   
      <c:forEach items="${shoplist}" var="item">
      geocoder.addressSearch('${item.getNl_address()}', function(result, status) {
           // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);

              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new daum.maps.Marker({
                  map: map,
                  position: coords
              });

              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new daum.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">${item.getNl_name()}</div>'
              });
              infowindow.open(map, marker);

              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
          } 
      });   
      </c:forEach>
      <c:forEach items="${coinshoplist}" var="item">
            geocoder.addressSearch('${item.getCl_address()}', function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                 if (status === daum.maps.services.Status.OK) {

                    var Markcoords = new daum.maps.LatLng(result[0].y, result[0].x);

                       // 결과값으로 받은 위치를 마커로 표시합니다
                       var marker = new daum.maps.Marker({
                           map: map,
                           position: Markcoords
                       });

                       // 인포윈도우로 장소에 대한 설명을 표시합니다
                       var infowindow = new daum.maps.InfoWindow({
                           content: '<div style="width:150px;text-align:center;padding:6px 0;">${item.getCl_name()}</div>'
                       });
                       infowindow.open(map, marker);

                       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
               }
            });
            </c:forEach>
            geocoder.addressSearch('${address}', function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                 if (status === daum.maps.services.Status.OK) {

                    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new daum.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new daum.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">검색위치</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } 
            });   
            
   </script>
</body>

</html>