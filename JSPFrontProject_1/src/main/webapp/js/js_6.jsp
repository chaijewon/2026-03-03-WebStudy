<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     => 조건 : 단일 / 선택 
     반복문 
       do~while : 반드시 한번 이상 수행 => 조건을 나중에 검색 
       초기값 =======  1
       do
       {
          반복문장 == 2
          증가식  == 3
       }while(조건문) ==4
       
       while : 반복횟수가 없는 경우 (한번..)
       
       초기값 ======= 1
       while(조건문) =2 
       {
          반복문장 ==3 
          증가식  ===4   1 2 3 4 2 3 4... 2번이 false면 종료
       }
       ------------------------ 가끔 사용  
       for : 반복횟수가 지정된 경우
            1     2    4
       for(초기값;조건식;증가식)
       {       | 
           반복 수행문장 3 
       }
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let i=1
	do
	{
	   	document.write("<h3>"+i+"</h3>");
	   	i++;
	}while(i<=10)
	document.write("<hr>")
	i=1
	while(i<=10)
	{
		document.write("<h3>"+i+"</h3>");
	   	i++;
	}
	document.write("<hr>")
	for(i=1;i<=10;i++)
	{
		document.write("<h3>"+i+"</h3>");
	}
}
</script>
</head>
<body>

</body>
</html>