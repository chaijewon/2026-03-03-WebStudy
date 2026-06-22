<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 700px;
}
h3 {
   text-align: center;
}
</style> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<script type="text/javascript">
$(function(){
	$('#year').on('change',function(){
		$('#frm').submit()
	})
	$('#month').on('change',function(){
		$('#frm').submit()
	})
	
	$('.day-link').on('click',function(){
		let year=$('#year').val();
		let month=$('#month').val();
		let day=$(this).text()
		let rday=year+"-"+month+"-"+day
		$('#food_reserve_day').text(rday)
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_time.do',
			success:function(result)
			{
				$('#r_time').html(result)
			}
		})
	})
	
})
</script>
<style type="text/css">
.day-link{
  cursor: pointer;
}
</style>
</head>
<body>
  <%--
     JSTL 사용법 
       <c:if> , <c:forEach> <c:set> <c:choose>
                                    = 다중 조건문  
                            = 변수 설정 
                = 반복문
       = 단일 조건문 
       <c:redirect> 
       = sendRedirect
       
       SpringFramework : JSP (JSTL/EL) : 유지보수 
       Spring-Boot 
           JSP : JSTL / EL
           ThymeLeaf : 자체 제어문 / EL 
                       = {{}} 
                       = Vue : {{}}  => 충돌 해결 
       HTML : 태그=사용자 정의는 불가능 
              속성=사용자 정의가 가능 
              ================== 값을 숨긴 상태에서 값 읽기 (Jquery에서 가능)
       
   --%>
   <table class="table">
    <tr>
	    <td>
	      <h3>${year }년도 ${month }월 ${today }일</h3>
	    </td>
    </tr>
   </table>
   
     <form method="post" action="../reserve/diary.do" id="frm">
     <table class="table">
      <tbody>
        <tr>
          <td>
            <select name="year" class="input-sm" id="year">
              <c:forEach var="i" begin="2026" end="2030">
                <option ${i==year?"selected":"" }>${i }</option>
              </c:forEach>
            </select>년도 &nbsp;
            <select name="month" class="input-sm" id="month">
              <c:forEach var="i" begin="1" end="12">
                <option ${i==month?"selected":"" }>${i }</option>
              </c:forEach>
            </select>월
          </td>
        </tr>
      </tbody>
     </table>
     </form>
   
   
      <table class="table">
       <tbody>
         <tr class="danger">
           <%--
              요일 출력 
            --%>
           <c:set var="k" value="0"/>
           <c:set var="color" value="black"/>
           <c:forEach var="w" items="${strWeek }">
             <c:choose>
               <c:when test="${k==0}">
                 <c:set var="color" value="red"/>
               </c:when>
               <c:when test="${k==6 }">
                 <c:set var="color" value="blue"/>
               </c:when>
               <c:otherwise>
                 <c:set var="color" value="black"/>
               </c:otherwise>
             </c:choose>
             <th style="height: 30px;color:${color}" class="text-center">${w}</th>
             <c:set var="k" value="${k+1 }"/>
           </c:forEach>
         </tr>
         <%-- week변수 설정 --%>
         <c:set var="week" value="${week }"/>
         <%-- 1일부터 날짜 출력  end: 포함 --%>
         <c:forEach var="i" begin="1" end="${lastday }">
           <%-- 맨처음에 요일까지 공백 설정 (1번만 실행) --%>
           <c:if test="${i==1}">
             <tr>
              <c:forEach var="j" begin="1" end="${week}">
               <td class="text-center">&nbsp;</td>
              </c:forEach>
           </c:if>
           <%-- 일자 출력 --%>
           <c:if test="${today>i }">
	           <td class="text-center ${today==i?'success':'' }">
	            <h4 style="color:gray">${i }</h4>
	           </td>
           </c:if>
           <c:if test="${today<=i }">
	           <td class="text-center ${today==i?'success':'' }">
	            <h4 class="day-link" style="color:green">${i }</h4>
	           </td>
           </c:if>
           <%-- 요일 한개씩 증가 : 토요일까지 증가  --%>
           <c:set var="week" value="${week+1 }"/>
           <c:if test="${week>6 }">
             <%-- 토요일이면 일요일부터 시작  --%>
             <c:set var="week" value="0"/>
             </tr>
             <tr>
           </c:if>
         </c:forEach>
         </tr>
       </tbody>
      </table>
   

</body>
</html>