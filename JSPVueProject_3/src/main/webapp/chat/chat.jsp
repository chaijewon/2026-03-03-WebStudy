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
<script type="text/javascript">
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
	$('#chatBox').scrollTop($('#chatBox').scrollHeight())
}

function send(){
	let msg=$('#messageInput').val()
	if(msg.trim()==="")
	{
		$('#messageInput').focus()
		return
	}
	
	websocket.send(msg)
	$('#messageInput').val("")
	$('#messageInput').focus()
}

$(function(){
	$('#sendBtn').on('click',function(){
		send()
	})
	$('#messageInput').on('keydown',function(key){
		if(key.keyCode===13){
			send()
		}
	})
})
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