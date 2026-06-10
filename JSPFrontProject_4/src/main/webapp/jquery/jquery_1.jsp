<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       Jquery 3 => Jquery 4 : 변화가 많지 않다 (제거 , 추가)
           1. 라이브러리가 작아졌다 => 실행의 속도를 최적화 
           2. 자바스크립트 라이브러리 => 프레임워크 형식 (소스 통일화)
                                   ------------
                                   | 교육을 최소화 : Spring / SpringBoot 
                                     => MyBatis / JPA / Vue / React
           = 과거 : Spring = MyBatis = Jquery 3
                   SpringBoot(NodeJS) = JPA = React (Vue)
                   --------------------------------------  
                   => web2.0 : Ajax / axios / fetch 
                   => web3.0 : 블록체인 => AI보다 강세 (스타벅스) : 오디세이 
                   => 개인 컨텐츠 
                   -------------------------------------------------
                   C/S => Colud => 예측 / 분석 => 자동화 (AI) => 감성 컴퓨팅
                                   빅데이터                    ---------
                                                             | 1986년 애플
                   AI => 단점 : 학습비용 => 회사 보안 프로그램 (X)
                    
               = 태그,속성을 제어하는 프로그램 : 문서 객체 모델 (DOM)
                 DOMScript
                 => 속성 조작 / 문자 조작 / 스타일 조작 / 이벤트 가능 
                 => document.querySelector("#btn")
                 => document.querySelectorAll("#btn")
                 => document.getElementById()
                 => document.getElementsByClassName()
                 => document.getElementByTagName()
                 ------------------------------------통일 => $  
                 $('CSS선택자') : 모든 태그 읽기 
                 --------------------------
                 조작 
                 1. 문자 조작 : <b>변경대상</b>
                    textContent / innerHTML 
                        |            |
                      text()        html()
                 2. 스타일 조작 
                    태그.style.속성명 => css()
                    btn.style.color="red"
                    btn.style.backgroundColor="yellow"
                    
                    $("#btn").css("color","red")
                             .css("backgroundColor","yellow")
                    ---------- 비효적이다 
                    4버전 
                         css({
                           "color":"red,
                           "backgroundColor":"yellow"
                         })
                3. 속성 조작
                   <img src="">
                   let img=document.querySelector("img")
                   img.src=""
                   
                   $('img').attr("src","")
                   
                   값읽기 
                   <input type=text value="aaa">
                   let input=document.querySelector("input")
                   input.value 
                   
                   $('input').val()
                   
                   ** getter/setter 
                      text() : getter  text("aaa") : setter
                      attr() : attr("src") => attr("src","")
                      val() : val() , val("")
                      html() : html() , html("")
              ---------------------------------------------
              이벤트 
                <img> 
                  => let img=querySelector("img")
                     img.addEventListener('click',function(){})
                     $('img').on('click',function(){})
                     $('img').click(function(){})
              기타 
                서버와 연결 
                  ajax => $.ajax({})
                  => Vue / React : fetch / axios 
                  => youtube 등록 : api key 
                  => data.go.kr / 관광공사    
              *** Jquery는 버전 충돌시에 작동이 안된다 
              *** main.jsp => 자바스크립트 라이브러리 추가 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>-->
<script type="text/javascript">
// window.onload=function(){}
/*$(document).ready(function(){
	
})*/
// 3,4버전이 동일 
$(function(){
	$('#h1').css("color","yellow")
	// $ => querySelector("#h1")
	//      h1.style.color="yellow"
	$('.h1').css("backgroundColor","cyan")
	$('#h2').css("color","red")
	$('#h3').css("color","blue")
	
	$('h2:eq(0)').css("color","magenta")
	             .css("backgroundColor","black")
	// 4버전에는 권장
	$('h2:eq(1)').css({
		"color":"pink",
		"backgroundColor":"blue"
	})
	// 4버전 => $('h2').eq(1)
	$('h2:eq(2)').css("color","green")
	$('h2:eq(3)').css("color","gray")
	$('h2:eq(4)').css("color","cyan")
	
	// 스타일 조작 
	/*let h3s=document.querySelectorAll("h3")
	for(let h3 of h3s)
	{
		h3.style.backgroundColor='blue'
		h3.style.color="white"
	}*/
	$('h3').css({
		"backgroundColor":"blue",
		"color":"white"
	})
	
	$('img').css({
		"width":"160px",
		"height":"230px"
	})
	
	$('img').hover(function(){
	    $(this).css({
	    	"cursor":"pointer",
	    	"border":"3px solid green"
	    })	
	},function(){
		$(this).css({
	    	"cursor":"none",
	    	"border":"none"
	    })	
	})
	// this => 자신 (이벤트 해당되는 태그)
})
</script>
</head>
<body>
  <h1 id="h1">Hello Jquery</h1>
  <h1 class="h1">Hello Jquery</h1>
  <h1 class="h1">Hello Jquery</h1>
  <h1 id="h2">Hello Jquery</h1>
  <h1 id="h3">Hello Jquery</h1>
  <h2>Hello Jquery</h2>
  <h2>Hello Jquery</h2>
  <h2>Hello Jquery</h2>
  <h2>Hello Jquery</h2>
  <h2>Hello Jquery</h2>
  <h3>Hello Jquery</h3>
  <h3>Hello Jquery</h3>
  <h3>Hello Jquery</h3>
  <h3>Hello Jquery</h3>
  <h3>Hello Jquery</h3>
  <img src="https://img.megabox.co.kr/SharedImg/2026/05/13/zlk6dycnwuPdVuSH40RVickv2CYYCrcU_420.jpg">
  <img src="https://img.megabox.co.kr/SharedImg/2026/05/19/Xya2c40b4Yck7jNWa2l0NWUpIuoZkPAV_420.jpg">
  <img src="https://img.megabox.co.kr/SharedImg/2026/05/21/ysq28y1C9Y3yJdnIIwb3kacb7Sx6omLV_420.jpg">
  <img src="https://img.megabox.co.kr/SharedImg/2026/06/09/KohW1eBmK8OyASrtmtTWAK51aqk448re_420.jpg">
  <img src="https://img.megabox.co.kr/SharedImg/2026/05/28/EWuCHtLbifaow6OzleUI5qz6VczYpjxS_420.jpg">
</body>
</html>