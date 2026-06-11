<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   Jquery : DOM (태그 제어하는 라이브러리) 
                ---------
                1. 태그 선택 
                   $(CSS 선택자)
                     ---------
                     1) id  =====> #id명 
                     2) class ===> .class명
                     3) tag   ===> tag명 
                     4) 속성선택자 ==> 태그[속성=값]
                                    태그[속성*=값] => 포함 
                     5) 자손 / 후손
                              => 태그 태그  
                        => 태그 > 태그 
                        
                     6) 구조선택자 
                        태그명:eq(0)
                        태그명:nth-child(1)
                     => 바닐라 JS 
                        document.querySeletor(CSS선택자) => $
                2. 변경 
                     1) 속성 
                        $(태그).attr("속성명","값)
                        예) $('img').attr("src","파일명")
                        let img=document.querySeletor(선택자)
                        img.src=""
                     2) 값 
                        => input / select / textarea 
                           $(태그).val() => 
                           let h=document.querySeletor(선택자)
                           h.value=값
                        $(태그).text() => 값 읽기
                        $(태그).text(값) => 값 설정 
                        let h=document.querySeletor(선택자)
                        h.textContent=값 => text()
                     3) HTML 추가 
                        $(태그).html() => html 읽기
                        $(태그).html('<h1>Hello</h1>')
                        let h=document.querySeletor(선택자)
                        h.innerHTML=값 => html()
                     4) 여러개 추가 
                        => 위에 출력 : prepend() 
                        => 아래 출력 : append()
                        => appendChild(태그) 
                     5) 스타일 변경 
                        => $(태그).css("속성","값")
                           => margin-top => marginTop
                        let h=document.querySeletor(선택자)
                        h.style.속성= 값
                     => 직관적으로 변경 / 가독성 
                     => jquery3 : 유지보수 => jquery4 : 언제 적용할지 미지수
                        ---------------- 대기업 / 공기업 / 금융권 
                                         -------------------
                                         | Vue / React 
                3. 이벤트 
                   $(태그).click(function(){처리 기능}) => 고전적인 이벤트
                          -----
                          keydown / keyup 
                          mousedown / mouseup 
                          mouseover / mouseout => hover
                          change  
                   $(태그).on('click',function(){처리기능}) => 리스너 등록 
                   ----------------------- 4에서는 권장 
                   => checkbox 
                4. 서버 연결 
                --------------------
                5. 효과 (약간) / 애니메이션 => JQuery UI / PlugIN => CDN 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // $(document).ready(function(){}) => onload
	$('#btn1').on('click',function(){
		let len=$('input[type=checkbox]:checked').length
		alert("선택된 취미:"+len+"개 입니다")
	})
	$('#btn2').on('click',function(){
		$('input[type=checkbox]').prop('checked',true)
	})
	$('#btn3').on('click',function(){
		$('input[type=checkbox]').prop('checked',false)
	})
})
// prop => property : checkbox / radio
</script>
</head>
<body>
  <button id="btn1">확인</button>
  <button id="btn2">전체</button>
  <button id="btn3">해제</button>
  <p>
  <input type="checkbox" checked>낚시
  <input type="checkbox" checked>운동
  <input type="checkbox" checked>쇼핑
  <input type="checkbox" checked>등산
  <input type="checkbox" checked>게임 
  <%-- 관리자 모드 --%>
</body>
</html>