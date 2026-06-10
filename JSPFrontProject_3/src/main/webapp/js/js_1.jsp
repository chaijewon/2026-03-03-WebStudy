<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      자바스크립트 => 기본 문법 
        | 태그 선택 (브라우저안에서 태그를 제어 / 추가 / 삭제 / 데이터 수정)
                  ---------------------------------------------
                  | 동적 (페이지 변경없이 그 자리에서 변경)
          JSP ===== 서버 
                    |
                   JSP 새로운 JSP (new)
          자바스크립트 
          JSP ========> 채팅 =======> 전에 있는 내용이 사라진다
                             | 데이터를 저장 (몽고디비 / Redis)
       1) CSS 선택자 
          <button id="btn"> => #btn 
          ------------------------------- 단일  document.querySelector("#btn")
          <button class="btn"> => .btn
          <button>             => btn 
          ------------------------------- 다중  document.querySelectorAll(".btn")
          자손 / 후손 
          <div>
            <p></p>  ==> div > p
            <span>
              <p></p> ==> div span p
            </span>
          </div>
          
          기타
           <input type="text"> ==> input[type="text"] 속성 선택자 
          구조 선택자 
          ---------
            nth-child(1) ....  nth-child(2n) nth-child(2n+1)
       2) 자바스크립트에서 지원하는 객체 모델
          1. id 속성 
             document.getElementById("아이디명")
          2. class 속성 
             document.getElementsClassName("클래스명")
          3. name 속성 
             document.getElementsByName("name속성명")
             <button name="btn">
          4. tag명 
             document.getElementByTagName("태그명")
          5. css 선택자 이용 
             document.querySelector(css선택자)
             document.querySelectorAll(css선택자)
                                       --------
                                       id => #
                                       class => .
                                       태그>태그 
                                       태그 태그 
                                       태그[속성=값]
         -------------------- 태그 선택 
         문자 조작 
           textContent : 순수하게 문자열만 출력 => HTML파싱이 안된다
           innerHTML : HTML을 파싱이 가능하다 
         스타일 조작 
           태그.style.속성=값 
           태그.style.color="red"
           태그.style.display='' ==> 화면 출력 ===> show
           태그.style.display='none' ==> 화면 감추기 ===> hide
         속성 조작 
           img.src=""
           a.href=""
           
         ---------------------------------
         언제 제어하는지 => 이벤트 
         --------------------
         고전적 이벤트 / 일반 이벤트 / Listener(O)
         
         btn.onclick(function(){})
         <button onclick="처리함수 호출"> : Vue / React
         btn.addEventListener('click',function(){}) : Jquery
          
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 350px;
}
h1 {
   text-align: center;
}
</style>
<script type="text/javascript">
function gesan()
{
	let kor=document.getElementById("kor")
	if(kor.value==="")
	{
		kor.focus()
		return
	}
	let eng=document.getElementById("eng")
	if(eng.value==="")
	{
		eng.focus()
		return
	}
	let math=document.getElementById("math")
	if(math.value==="")
	{
		math.focus()
		return
	}
	
	// 계산 
	let total=document.getElementById("total")
	let hap=Number(kor.value)+parseInt(eng.value)+parseInt(math.value)
	// 웹 => 데이터는 String => 숫자형 변환 Number(),parseInt()
	total.value=hap
	
	let av=hap/3
	let avg=document.getElementById("avg")
	avg.value=Math.round(av)
	
	let score='A'
	if(av>=90)
		score='A'
    else if(av>=80)
    	score='B'
    else if(av>=70)
    	score='C'
    else if(av>=60)
    	score='D'
    else
    	score='F'
    document.getElementById('score').value=score
}
window.onload=()=>{
	// 태그 읽기 
	let h2=document.querySelectorAll("h2") // []
	for(let i of h2)
	{
		i.style.backgroundColor='green'
		i.textContent="Hello JavaScript"
	}
	
	let acc=document.querySelector("#account")
	acc.addEventListener('change',function(){
		let val=acc.value
		let price=document.querySelector("#price")
		let total=Number(val)*Number(price.textContent)
		document.querySelector('#sum').innerHTML='<font color=red>'+total+'원 </font>'
	})
}
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <h1>성적 계산</h1>
      <table class="table">
       <tr>
         <th width="35%" class="text-center">국어</th>
         <td width=65%>
           <input type=text class="input-sm" id="kor" size=15>
         </td>
       </tr>
       <tr>
         <th width="35%" class="text-center">영어</th>
         <td width=65%>
           <input type=text class="input-sm" id="eng" size=15>
         </td>
       </tr>
       <tr>
         <th width="35%" class="text-center">수학</th>
         <td width=65%>
           <input type=text class="input-sm" id="math" size=15>
         </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
          <input type=button id="btn" onclick="gesan()"
           class="btn-sm btn-primary" value="계산"
          >
         </td>
       </tr>
      </table>
      <h1>처리 결과</h1>
      <table class="table">
        <tr>
         <th width=35% class="text-center">총점</th>
         <td width=65%>
           <input type=text class="input-sm" id="total"
            size=15 readonly>
         </td>
        </tr>
        <tr>
         <th width=35% class="text-center">평균</th>
         <td width=65%>
           <input type=text class="input-sm" id="avg"
            size=15 readonly>
         </td>
        </tr>
        <tr>
         <th width=35% class="text-center">학점</th>
         <td width=65%>
           <input type=text class="input-sm" id="score"
            size=15 readonly>
         </td>
        </tr>
      </table>
    </div>
    <div class="row" style="margin-top: 20px">
      <h2>Hello DOM-1</h2>
      <h2>Hello DOM-2</h2>
      <h2>Hello DOM-3</h2>
      <h2>Hello DOM-4</h2>
      <h2>Hello DOM-5</h2>
    </div>
    <div class="row" style="margin-top: 20px">
     <table class="table">
       <tr>
        <td>
         수량:<select id="account">
             <%-- account.value
                  input / textarea / select 
              --%>
             <option value="1">1개</option>
             <option value="2">2개</option>
             <option value="3">3개</option>
             <option value="4">4개</option>
             <option value="5">5개</option>
         </select>
        </td>
       </tr>
       <tr>
        <td>가격:<span id="price">3000</span></td>
        <%-- textContent --%>
       </tr>
       <tr>
         <td>총금액:<span id="sum"></span></td>
       </tr>
     </table>
    </div>
  </div>  
</body>
</html>


