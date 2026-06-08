<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      제어문 
        = 조건문 
          1. 단일 조건문(***) true/false는 숫자가 변환이 가능하다 
             if(조건문)
             {  -----  부정연산자 / 비교연산자 / 논리연산자  : true/false
                조건이 true일때 실행 => false일 경우에는 건너뛴다
             }
          2. 선택 조건문(***)
             if(조건문)
             {
                조건이 true일때 수행하는 문장 
             }
             else
             {
                조건이 false일때 수행 문장 
             }
             ==> 삼항연산자와 동일 
          3. 다중 조건문 
             if(조건문)
             {
                조건 true면 수행문장 ==> 종료
                    false
             }        | 다음 조건문으로 내려간다
             else if(조건문)
             {
                조건 true면 수행문장 ==> 종료
                    false
             }        | 다음 조건문으로 내려간다
             else if(조건문)
             {
                조건 true면 수행문장 ==> 종료
                    false
             }        | 다음 조건문으로 내려간다
             ...
             ...
             else
             {
                 해당 조건이 없는 경우 
             }
             
             조건문 : 유효성 검사 / 정규식 (자바) 
             
             case 1:
                문장 
             case 2:
                문장 
             case 3:
                문장 
                break;       
          4. 선택문 
             switch(number,문자)
             {
               case 값:
                  처리문장 
                  break; ==> 여기서 종료 
               case 값:
                  처리문장 
                  break; ==> 없는 경우에는 바로 문장수행 => break이 있는 경우
               ..
               ..
               default:
                  처리문장 
                  
             }
        = 반복문 
          1. do~while
          2. while 
          3. 일반 for (***)
             = for in 
             = for of (***)
             = forEach (***)
             = map (***)
        = 반복 제어문
          1. break (***)
          2. continue 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">

window.onload=function(){
	//movieList(1)
	let i=3;
	switch(i)
	{
	case 1:
		document.write("<h1>문장1</h1>")
	case 2:
		document.write("<h1>문장2</h1>")
	case 3:
		document.write("<h1>문장3</h1>")
		
	case 4:
		document.write("<h1>문장4</h1>")
		
	case 5:
		document.write("<h1>문장5</h1>")
		break;
	}
}
// 리턴형 (X) , 매개변수는 변수명만 사용
/*
 *   searchMainDailyBoxOffice.do
	 searchMainRealTicket.do
	 searchMainDailySeatTicket.do
 */
function movieList(no)
{
	let site="https://www.kobis.or.kr/kobis/business/main/";
	if(no===1)
		site+="searchMainDailyBoxOffice.do"
	else if(no===2)
		site+="searchMainRealTicket.do"
	else if(no===3)
		site+="searchMainDailySeatTicket.do"
    axios.get(site).then(response=>{
    	console.log(response.data)
    })
}
</script>
</head>
<body>

</body>
</html>