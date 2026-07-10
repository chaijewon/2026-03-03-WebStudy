<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/comment.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
$(function(){
	let bCheck=false;
	$('.btns').on('click',function(){
		let no=$(this).attr('data-no')
		$('.forms').hide()
		$('.btns').val('수정')
		if(bCheck===false)
		{
			bCheck=true
			$('#form'+no).show()
			$(this).val("취소")
		}
		else
		{
			bCheck=false
			$('#form'+no).hide()
			$(this).val("수정")
		}
	})
})
</script>
</head>
<body>
  <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row">
                 <div class="col-12 col-lg-8">
                   <div class="row no-gutters">
                      <div class="col-12 col-sm-12">
                          <div class="related-post-area section_padding_50">
                               
                                <div class="related-post-slider owl-carousel">
                                    <c:forTokens items="${vo.images }" delims="," var="img">
                                    <!-- Single Related Post-->
                                    <div class="single-post">
                                        <!-- Post Thumb -->
                                        <div class="post-thumb">
                                            <img src="http://www.menupan.com${img}" alt="">
                                        </div>
                                        
                                    </div>
                                   </c:forTokens>
                                </div>
                               
                          </div>
                        </div>
                        <table class="table">
                          <tr>
                            <td width=40% class="text-center" rowspan="10" valign="middle">
                              <img src="${vo.poster}" style="width: 100%;height:350px;object-fit:cover"
                               class="img-rounded"
                              >
                             
                            </td>
                          </tr>
                          <tr>
                            <td colspan="2">
                              <h3>${vo.name }&nbsp;<span style="color: orange;">${vo.score }</span></h3>
                            </td>
                          </tr>
                          <tr>
                            <th width=10% style="color:gray">주소</th>
                            <td width=50%>${vo.address }</td>
                          </tr>
                          <tr>
                            <th width=10% style="color:gray">전화</th>
                            <td width=50%>${vo.phone }</td>
                          </tr>
                          <tr>
                            <th width=10% style="color:gray">음식종류</th>
                            <td width=50%>${vo.type }</td>
                          </tr>
                          <c:if test="${vo.price!=null }">
	                          <tr>
	                            <th width=10% style="color:gray">가격대</th>
	                            <td width=50%>${vo.price }</td>
	                          </tr>
                          </c:if>
                          <tr>
                            <th width=10% style="color:gray">영업시간</th>
                            <td width=50%>${vo.time }</td>
                          </tr>
                          <tr>
                            <th width=10% style="color:gray">주차</th>
                            <td width=50%>${vo.parking }</td>
                          </tr>
                          <tr>
                            <th width=10% style="color:gray">예약</th>
                            <td width=50%>${vo.reserve }</td>
                          </tr>
                          <tr>
                            <th width=10% style="color:gray">테마</th>
                            <td width=50%>${vo.theme }</td>
                          </tr>
                          <tr>
                            <td colspan="3">${vo.content }</td>
                          </tr>
                          <tr>
                            <td colspan="3" class="text-right">
                              <c:if test="${sessionScope.id!=null }">
                               <button class="btn-xs btn-danger">좋아요 <span>10</span></button>
                               <button class="btn-xs btn-info">찜하기</button>
                               <c:if test="${vo.reserve!='불가' }">
                                <button class="btn-xs btn-success">예약하기</button>
                               </c:if>
                              </c:if>
                              <button class="btn-xs btn-primary">추천</button>
                              <button class="btn-xs btn-warning" onclick="location.href='../food/food_main.do'">목록</button>
                            </td>
                          </tr>
                        </table>
                        <table class="table">
                          <tr>
                            <td>
                              <div id="map" style="width:100%;height:350px;"></div>
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
                            </td>
                          </tr>
                        </table>
                     </div>
                   </div>  
            </div>
        </div>
        <h2>맛집 리뷰</h2>
        <c:if test="${rCount==0 }">
          <div class="text-center">
           <h3>댓글이 없습니다</h3>
          </div>
        </c:if>
        <c:if test="${rCount>0 }">
          <ul class="review-list">
            <c:forEach var="rvo" items="${reList }">
             <li class="review-card">
               <div class="review-header">
                 <div class="review-avatar">
                   ${fn:substring(rvo.name,0,1) }
                 </div>
                 <div class="review-nick">${rvo.name }</div>
                 <div class="review-date">${rvo.dbday }</div>
               </div>
               <div class="review-text">${rvo.msg }</div>
               <c:if test="${sessionScope.id==rvo.id }">
                <div class="review-meta">
                 <div><input type=button class="btn-xs btn-primary btns" value="수정" data-no="${rvo.no }"></div>
                 <div><input type=button class="btn-xs btn-danger" value="삭제"
                   onclick="location.href='../review/delete.do?no=${rvo.no}&fno=${rvo.fno }'"
                 ></div>
                </div>
               </c:if>
               <form class="review-form forms" method="post" action="../review/update.do"
                id="form${rvo.no }" style="display:none"
               >
	            <input type="hidden" name=fno value="${vo.no}">
	            <input type="hidden" name=no value="${rvo.no}">
	            <input type=text name=msg placeholder="리뷰 입력" required value="${rvo.msg }">
	            <button type="submit">수정</button>
	            
	          </form>
             </li>
            </c:forEach>
          </ul>
        </c:if>
        <%--
           1. 번호  ====>  자동 증가 
           2. 맛집번호 
           3. id , name ===> session
           4. msg
           5. date ==> SYSDATE
           1111 유형  ==> #{1} 
           
           .do?no=1
           /insert/1
         --%>
        <c:if test="${sessionScope.id!=null }">
          <form class="review-form" method="post" action="../review/insert.do">
            <input type="hidden" name=fno value="${vo.no}">
            <input type=text name=msg placeholder="댓글 입력" required>
            <button type="submit">등록</button>
            
          </form>
        </c:if>
  </section>
</body>
</html>