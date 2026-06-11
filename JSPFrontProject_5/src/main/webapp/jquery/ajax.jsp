<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let httpRequest=null
// $.ajax({})
function getXMLHttpRequest(){
	// 브라우저에 내장 => XMLHttpRequest => 서버 => 처리 결과를 읽어오는 역할 
	// => 바닐라 JS 
	if(window.XMLHttpRequest) // null이 아니면 => 브라우저에 존재
	{
		alert("XMLHttpRequest 생성")
		return new XMLHttpRequest() // 크롬 / FF
	}
	else
	{
		return null; 
	}
}
// 서버에 전송 => 수신  => $.ajax({method:...}):jquery / fetch(Vue) / axios(React)
function sendRequest(url,params,callback,method)
{
	//  sendRequest("list.do","empno=1",result,'GET')
	//1. 객체 생성 : XMLHttpRequest 
	httpRequest=getXMLHttpRequest()
	//2. method 방식 지정 
	let httpMethod=method?method:'GET' //default : GET
	if(httpMethod!='GET' && httpMethod!='POST')
	{
		httpMethod='GET'
	}
	//3. params 처리 => ?id=admin
    let httpParams=(params===null || params==="")?null:params
    //4. url을 변경
    let httpUrl=url
    //4-1 . GET이면 
    if(httpMethod==='GET' && httpParams!=null)
    {
    	httpUrl=httpUrl+"?"+httpParams
    }
    //4-2 . POST이면 
	//5. 서버 연결 
	httpRequest.open(httpMethod,httpUrl,true)
	// open => 이미 제작됨 => 서버연결시 사용 => true (Async 비동기적)
	//6. 데이터 전송 
	// 한글 처리 
	httpRequest.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded")
	//7. 결과값을 읽어오는 함수를 지정 => 자동 호출 => callback
	// success:function(data)
	httpRequest.onreadystatechange=callback
	//8. 데이터 전송 
	httpRequest.send(httpMethod==='POST'?httpParams:null)
	//9. 값을 읽은 경우 : responseText / responseXML(JSON)
}
function send()
{
	sendRequest('sub.jsp',null,ok,'POST')
}
// callback => 자동으로 호출 
function ok()
{
	/*
	   readyState
	   0 => 서버 연결 준비
	   1 => 서버연결 => open()
	   2 => 서버 연결 완료
	   3 => 데이터 전송 준비 => send()
	   4 => 데이터 전송 완료
	   
	   200 => 서버에서 정상 수행 
	   404 / 405 / 500 ...
	   success:
	   error:
	*/
	if(httpRequest.readyState===4)
	{
		if(httpRequest.status===200)
		{
			//alert(httpRequest.responseText)
			let div=document.querySelector("#print")
			div.innerHTML=httpRequest.responseText
		}
	}
}
</script>
</head>
<body>
  <button onclick="send()">전송</button>
  <div id="print"></div>
</body>
</html>