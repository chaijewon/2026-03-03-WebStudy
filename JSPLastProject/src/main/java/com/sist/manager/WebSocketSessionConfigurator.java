package com.sist.manager;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.HandshakeResponse;
import jakarta.websocket.server.HandshakeRequest;
import jakarta.websocket.server.ServerEndpointConfig;
import jakarta.websocket.server.ServerEndpointConfig.Configurator;

// WebSocket에서 HttpSession을 사용할 수 있게 설정
/*
 *    1. 사용자 로그인 => id,name 저장 => HttpSession
 *            |
 *         WebSocket에 접속 (ws://..../chat)
 *            |
 *    2.   modifyHandshake() 실행 => HttpSession을 저장 
 *            |
 *         request.getHttpSession() => 가지고 오기 
 *            |
 *         ServerEndpointConfig의 UserProperties에 저장 
 *    3.  OnOpen() 연결시 실행
 *            | HttpSession을 가지고 온다
 *    4. OnMessage() =>  채팅 시작 
 *    
 *    HttpSession ==== WebSocket에 연결하는 역할 
 */
public class WebSocketSessionConfigurator extends Configurator{

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		// HTTP요청 => HttpSession읽기 
		HttpSession session=(HttpSession)request.getHttpSession();
		if(session!=null) // session이 존재하는 경우 
		{
			// WebSocket에서 사용이 가능 저장 => UserProperties
			// key / value => Map 형식으로 '
			sec.getUserProperties().put(HttpSession.class.getName(), session);
		}
		// => OnOpen
	}
   
}
