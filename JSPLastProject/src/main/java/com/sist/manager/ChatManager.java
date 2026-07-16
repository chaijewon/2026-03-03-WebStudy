package com.sist.manager;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Endpoint;
import jakarta.websocket.EndpointConfig;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

/*
 *    브라우저에서 접속 
 *        |
 *     WebSocket 연결 (@OnOpen)
 *        |
 *     id,name 가지고 온다 (httpSession)
 *        |
 *      Map에 저장 
 *        |
 *      1) 입장메세지 전송 
 *        |
 *      2) 채팅 시작 
 *        |
 *      @OnMessage 실행 
 *        |
 *      3) 전체 사용자 반복 
 *           |
 *       ---------------
 *       |             |
 *     my:             you:
 *           |
 *      4) 종료 (@OnClose) => Map에서 삭제 
 *           |
 *          퇴장 메세지 전송 
 *           
 */
import java.util.*;

import com.sist.vo.ChatVO;
@ServerEndpoint(value="/chat",configurator = WebSocketSessionConfigurator.class)
public class ChatManager {
   // 접속자 저장 공간 
   private static Map<Session,ChatVO> users=
		   Collections.synchronizedMap(new HashMap<Session,ChatVO>());
   
   // 접속시 처리 
   @OnOpen
   public void connection(Session session,EndpointConfig config)
   throws Exception
   {
	   ChatVO vo=new ChatVO();
	   // HttpSession 읽기 
	   HttpSession hs=(HttpSession)config.getUserProperties()
			   .get(HttpSession.class.getName());
	   vo.setId((String)hs.getAttribute("id"));
	   vo.setName((String)hs.getAttribute("name"));
	   vo.setSession(session);
	   
	   users.put(session, vo); // 사용자 정보 전체 저장
	   // 현재 접속한 사람에게 입장 메세지 전송 
	   /*
	    *   Map => 순차적으로 출력 
	    *   => Map / Set 
	    *   => Iterator => 순차적으로 한개씩 접근이 가능 
	    *   => hasNext() : 존재여부 확인 (true)
	    *   => next() : 다음 데이터로 이동 
	    *   => remove() : 삭제시 사용 
	    *    
	    */
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next(); // "0"
		   if(!ss.getId().equals(session.getId()))
		   {
			   ss.getBasicRemote().sendText(
			      "msg:[🪧 알림]"+vo.getName()+"님이 입장하셨습니다"
			   );
		   }
	   }
	   
	   System.out.println("클라이언트 접속:"
			   +vo.getId()+","+vo.getName()+","+vo.getSession().getId());
   }
   // 퇴장시 처리 
   @OnClose
   public void disConnection(Session session)
   throws Exception
   {
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   ChatVO vo=users.get(session);
		   if(!ss.getId().equals(session.getId()))
		   {
			   ss.getBasicRemote().sendText(
			      "msg:[🪧 알림]"+vo.getName()+"님이 퇴장하셨습니다"
			   );
		   }
	   }
	   
	   System.out.println("클라이언트 접속 종료:"
			   +users.get(session).getName());
	   // 목록에서 제거 
	   users.remove(session);
   }
   // 채팅시 
   @OnMessage
   public void message(String message,Session session)
   throws Exception
   {
	   System.out.println("수신된 메세지:"
			    +message+","+users.get(session).getName()
			   );
	   // 접속한 모든 사람에게 전송 
	   Iterator<Session> it=users.keySet().iterator();
	   while(it.hasNext())
	   {
		   Session ss=it.next();
		   // 접속자 한명씩 읽기 
		   // 메세지를 보낸 사람 가지고 오기 
		   ChatVO vo=users.get(session);
		   // 메세지 보낸 사람이면 
		   if(session.getId().equals(ss.getId()))
		   {
			   ss.getBasicRemote().sendText(
			      "my:["+vo.getName()+"]"+message);
			   
		   }
		   else
		   {
			   ss.getBasicRemote().sendText(
				  "you:["+vo.getName()+"]"+message);
		   }
	   }
   }
   // 오류 처리 
   @OnError
   public void error(Session session,Throwable ex)
   {
	   ex.printStackTrace();
   }
}
