<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../chat/chat.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<%--
    sockjs => websocket  => stomp: 알림 / 1:1 / 그룹 채팅  
 --%>
<%--
   실시간 뉴스 / 실시간 날씨 
   -------------------- 시간 조절 => Timer : Spring 스케쥴러 
 --%>
<script type="text/javascript">
/*
 *   1. 실행과정 
        window.onload=function(){} 브라우저에서 HTML을 메모리에서 읽어서 출력된 상태 
         => $(function(){}) => Jquery 
            $(document).ready(function(){})
         => mounted() => Vue 
         => componentDidMount() => React 
            useEffect()
         |
        connection() => 서버와 연결 
         |
        -----------------
         websocket 서버연결 
           onopen 
           onmessage
           onclose 
           ------------- 등록 : 호출할 함수 지정 => 자동호출 => CallBack
           => 이벤트 등록 
      1) 서버연결 
      websocket=new WebSocket("ws://localhost/JSPVueProject_3/chat")
                                  ---------------------------
                                  | 프로젝트와 일치 
                                  | /chat => ServerEndPoint와 일치 
      2) 서버에서 호출 
         => @OnOpen
             => 밑에 있는 호출  
             => alert("채팅서버에 연결되었습니다") 정상 수행 
      3) 메세지 전송
         사용자 입력 
            |
         <input type=text id="messageInput">
            |
           send() => websocket.send(msg)
           ------
             입력값 읽기 
             공백검사 
             서버 전송 
             입력값 초기화 
     4) 서버에서 메세지 수신 
     ss.getBasicRemote().
         sendText("msg:[⏰알림]"+vo.getName()+"님 입장하셨습니다");
                  ----- 구분자 
                  my: 
                  you:
        websocket.onmessage=onMessage
        function onMessage(event){
        	let data=event.data // 전송된 데이터 
        	
        	if(data.substring(0,4)==="msg:"){
        		appendMessage(data.substring(4)) => 사용자 정의 
        		// 문자열 결합 
        	}
        	
        	입장 / 퇴장 / 상대방 / 본인 
        }
                  
        => appendMessage(data.substring(4)) 
            <div id="chatBox">
              [] aaa <br>
              [] bbb
              [] ccc
            </div>
           $('#chatBox').append(msg+"<br>")
	       $('#chatBox').scrollTop($('#chatBox').scrollHeight())
 */
let websocket
window.onload=function(){
	connection()
}
function connection(){
	websocket=new WebSocket("ws://localhost/JSPVueProject_3/chat")
	websocket.onopen=onOpen
	websocket.onclose=onClose
	websocket.onmessage=onMessage
}
function onOpen(event){
	alert("채팅서버에 연결되었습니다")
}
function onClose(event){
	alert("채팅서버와 연결 해제되었습니다")
}
function onMessage(event){
	let data=event.data // 전송된 데이터 
	if(data.substring(0,4)==="msg:"){
		appendMessage(data.substring(4))
	}
}
function appendMessage(msg){
	$('#chatBox').append(msg+"<br>")
	// 스ㅋ크롤의 위치 지정 => 가장 아래 
	$('#chatBox').scrollTop($('#chatBox').scrollHeight())
}

function send(){
	// 입력값 읽기 
	let msg=$('#messageInput').val()
	// 공백 검사 
	if(msg.trim()==="")
	{
		$('#messageInput').focus()
		return
	}
	// 서버로 전송 
	websocket.send(msg)
	// 입력값 초기화 
	$('#messageInput').val("")
	$('#messageInput').focus()
}

$(function(){
	// 버튼 
	$('#sendBtn').on('click',function(){
		send()
	})
	// 엔터
	$('#messageInput').on('keydown',function(key){
		if(key.keyCode===13){
			send()
		}
	})
})
/*
 *     채팅창 출력 => chat.do 
	      |
	   connection()
	      |
	   WebSocket 연결 
	      |
	   사용자 입력 
	       = 버튼 클릭 
	       = 엔터 
	      |
	    send() 
	      |
	      메세지 입력 확인 
	      |
	    websocket.send(msg) => 서버로 전송 
	      |
	      서버에서는 접속자 전체 메세지 전송 
	      |
	     onMessage() 
	      |
	    appendMessage()
	      |
	    채팅창에 출력 
 */
</script>
</head>
<body>
  <div class="chat-container">
    <div class="chat-header">실시간 채팅</div>
    <div id="chatBox" class="chat-box"></div>
    <div class="chat-input">
      <input type=text id="messageInput" placeholder="메세지 입력...">
      <button id="sendBtn">전송</button>
    </div>
  </div>
</body>
</html>