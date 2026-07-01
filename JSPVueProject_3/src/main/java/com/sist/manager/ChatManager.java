package com.sist.manager;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.ChatVO;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.EndpointConfig;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

import java.io.*;
@ServerEndpoint(value="/chat",configurator = WebSocketSessionConfigurator.class)
public class ChatManager {
   // 접속자 저장 => Set (중복이 없는 접속자 등록)
   // 동기화 => 여러 사용자 동시에 접속시에 안전하게 저장 
	
   private static Map<Session,ChatVO> users=
		   Collections.synchronizedMap(new HashMap<Session,ChatVO>());
   // 동기화 방식으로 저장 
   // 접속시 처리 
   // 클라이언트가 WebSocket서버에 연결되었을때 자동 호출 함수 (구분자)
   @OnOpen
   public void onOpen(Session session,EndpointConfig config)
   throws Exception
   {
	   // HttpSession 읽기
	   ChatVO vo=new ChatVO();
	   HttpSession hs=(HttpSession)config.getUserProperties().
			          get(HttpSession.class.getName());
	   vo.setId((String)hs.getAttribute("id"));
	   vo.setName((String)hs.getAttribute("name"));
	   vo.setSession(session);
	   
	   // 접속한 클라이언트 저장 
	   users.put(session, vo);
	   
	   // 입장 메세지 
	   // 접속된 모두 사람 
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   if(ss.getId()!=session.getId())// 본인이 아닌 경우 
		   {
			   // 입장 메세지 전송 
			   ss.getBasicRemote().sendText("msg:[⏰알림]"+vo.getName()+"님 입장하셨습니다");
		   }
	   }
	   System.out.println("클라이언트 접속(ID):"+vo.getId());
	   System.out.println("클라이언트 접속(Session):"+session.getId());
   }
   // 입장메세지 
   @OnMessage
   // String message,Session session
   // => 브라우저에서 전송 메세지 => 본인의 정보 => 브라우저 정보(IP)
   public void onMessage(String message,Session session)
   throws Exception
   {
	   System.out.println("수신된 메세지:"+message+","
			   +users.get(session).getName());
	   
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo=users.get(session);
		   ss.getBasicRemote().sendText("msg:["+vo.getName()+"]"+message);
	   }
   }
   // 접속 해제 
   @OnClose
   public void onClose(Session session) throws Exception
   {
	   Iterator<Session> it=users.keySet().iterator();
	   // 데이터를 모아서 한번에 처리 
	   while(it.hasNext())
	   {
		   Session ss=it.next(); //  전체 접속자 
		   ChatVO vo=users.get(session); // 나가는 사람 
		   // session: 접속자마다 번호 부여 
		   if(ss.getId()!=session.getId())
		   {
			   ss.getBasicRemote().sendText("msg:[⏰알림]"
		                    +vo.getName()+"님 퇴장하셨습니다");
		   }
	   }
	   System.out.println("클라이언트 해제(ID):"+
	                       users.get(session).getName());
	   System.out.println("클라이언트 해제(Session):"+session.getId());
	   users.remove(session); // 접속자 명단에서 삭제 
   }
   // 에러 처리 
   @OnError
   public void onError(Session session, Throwable ex)
   {
	   ex.printStackTrace();
   }
}
