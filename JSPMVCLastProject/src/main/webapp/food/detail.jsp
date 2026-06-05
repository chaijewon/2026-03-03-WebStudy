<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
  margin: 0px auto;
  width: 960px;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row">
     <table class="table">
      <tbody>
        <tr>
          <td width=30% class="text-center" rowspan="9">
            <img src="${vo.poster }" style="width:280px;height: 300px;object-fit:cover">
          </td>
          <td colspan="2">
            <h3>${vo.name }&nbsp;<span style="color:orange;">${vo.score}</span></h3>
          </td>
        </tr>
        <tr>
          <td width=10% style="color:gray">주소</td>
          <td width=60%>${vo.address }</td>
        </tr>
        <tr>
          <td width=10% style="color:gray">전화</td>
          <td width=60%>${vo.phone }</td>
        </tr>
        <tr>
          <td width=10% style="color:gray">음식종류</td>
          <td width=60%>${vo.type }</td>
        </tr>
        <tr>
          <td width=10% style="color:gray">가격대</td>
          <td width=60%>${vo.price }</td>
        </tr>
        <tr>
          <td width=10% style="color:gray">영업시간</td>
          <td width=60%>${vo.time }</td>
        </tr>
        <tr>
          <td width=10% style="color:gray">주차</td>
          <td width=60%>${vo.parking }</td>
        </tr>
        <tr>
          <td width=10% style="color:gray">테마</td>
          <td width=60%>${vo.theme }</td>
        </tr>
        <tr>
          <td colspan="3">
           ${vo.content }
          </td>
        </tr>
        <tr>
         <td colspan="3" class="text-right">
           <a href="#" class="btn btn-xs btn-warning">좋아요</a>
           <a href="#" class="btn btn-xs btn-info">찜하기</a>
           <a href="#" class="btn btn-xs btn-success">예약하기</a>
           <a href="javascript:history.back()" class="btn btn-xs btn-danger">목록</a>
         </td>
        </tr>
      </tbody>
     </table>
     <div style="height: 30px"></div>
     <table class="table">
      <tr>
        <td class="text-center">
         <div id="map" style="width:960px;height:350px;"></div>
        </td>
      </tr>
     </table>
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72fa81817487692b6dc093004af97650&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${vo.address}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
   </div>
  </div>
</body>
</html>