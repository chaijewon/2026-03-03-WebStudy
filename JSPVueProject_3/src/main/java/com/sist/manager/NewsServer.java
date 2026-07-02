package com.sist.manager;

import jakarta.websocket.server.ServerEndpoint;

/*
 *   프로그램 시작 
 *      | ==> 접속자 저장 => Set : 중복 방지 => static : 한개만 가지고 사용
 *    **스케줄러 생성 => 쓰레드
 *      |
 *    1분 마다 실행 
 *      |
 *    뉴스 검색 
 *      | JSON 
 *    접속자에게 전송 Ajax 출력  
 */
import java.util.*;
import java.util.concurrent.*;
import jakarta.websocket.*;
import jakarta.websocket.server.*;
import java.io.*;
@ServerEndpoint("/news")
public class NewsServer {
   // 1. 접속자 저장 공간 => 모든 접속자 같은 메모리 사용 => static 
	private static Set<Session> clients=ConcurrentHashMap.newKeySet();
	// => 중복이 없어야 된다 / 모든 객체가 하나를 같이 사용 
	// => ConcurrentHashMap.newKeySet() : 여러개 쓰레드가 동시 접속시 종료해도 
	//    안전하게 사용할 수 있는 Set 인터페이스 사용 
	/*
	 *    Session : WebSocket 
	 *    |   세션 ID => 고유 번호 (접속자 구분자) : session.getId()
	 *    |   연결 상태 확인 => close(),open() => session.isOpen()
	 *    |   메세지 전송 기능 : session.getBasicRemote().sendText()
	 *    |   사용자 정보 : 브라우저 , 누구 (IP)
	 *             => session.getUserPrincipal()
	 *                               ------------ Session에 저장된 경우
	 *    |   요청 URL => ws://localhost/JSPProject/news 
	 *    |   접속 시간 
	 *    |   사용자 속성 => UserProperties (HttpSession)
	 *    |   WebSocket 관련 정보
	 */
	// 쓰레드 생성 
	private static ScheduledExecutorService scheduler=
			   Executors.newScheduledThreadPool(1);
	/*
	 *   try
	 *   {
	 *      conn.setAutoCommit(false)
	 *      ...
	 *      conn.commit()
	 *   }catch(Exception e)
	 *   {
	 *       conn.rollback()
	 *   }
	 *   finally
	 *   {
	 *      conn.setAutoCommit(true)
	 *   }
	 *   => @Transactional
	 *   => 스프링 => Task @Schedule(1000)
	 *   Schedule : 예약된 작업을 수행하는 쓰레드 
	 *   ScheduledExecutorService : 예약 실행 => 1분마다 같은 작업을 수행 
	 *   Executors => 쓰레드를 쉽게 만들어주는 클래스 
	 *   newScheduledThreadPool(1) : 예약 작업 수행하는 쓰레드 1개 생성 
	 *        => 쓰레드 1개가 대기 => 1분이 지나면 바로 수행 
	 *   
	 */
	static  // 자동 호출 
	{
		/*
		 *    scheduleAtFixedRate(
		 *      실행할 작업 
		 *      처음 대기 시간 
		 *      반복 시간 
		 *      시간 단위 
		 *    ) => 일정 시간마다 반복 실행 
		 *    
		 *     -> 메소드가 1개인 경우에만 사용이 가능 
		 *     
		 *     interface Runnable
		 *     {
		 *        public void run(); => 쓰레드 작업 
		 *        
		 *     }
		 */
		//                           run()
		scheduler.scheduleAtFixedRate(()->{
			try
			{
				String json=NewsRealManager.newsFindData("맛집");
				// 접속자 전체 전송 
				broadcast(json);
			}catch(Exception ex) 
			{
				ex.printStackTrace();
			}
		},0,60,TimeUnit.SECONDS);// 1분마다 새뉴스를 전송 
	}
	/*
	 *     서버 구동 
	 *       |
	 *     static{} 실행 
	 *       |
	 *     스케줄러 생성 
	 *       |
	 *     0초 후 실행 
	 *       |
	 *     검색 : NewsRealManager.newsFindData("맛집");
	 *       |
	 *     JSON을 읽기 
	 *       |
	 *     모든 접속자 전송 
	 *       |
	 *      60초 대기 
	 *       |
	 *      다시 실행 
	 *       |
	 *      반복 
	 */
	// 1. 접속시 처리 => Set에 저장 
	@OnOpen
	public void onOpen(Session session)
	{
		clients.add(session); 
		System.out.println("클라이언트 접속:"+session.getId());
	}
	// 2. 접속해제 
	@OnClose
	public void onClose(Session session)
	{
		clients.remove(session);
		System.out.println("클라이언트 종료:"+session.getId());
	}
	// 2. 메세지 전송 
	@OnMessage
	public void onMessage(String msg,Session session)
	{
		System.out.println("클라이언트 메세지:"+msg);
	}
	// Http => ws
	//      |=> handshake : HttpSession을 WebScoket 전송 
	//       => Configurator (웹 소캣과 Http를 연결에 필요한 설정을 할 수 있는 클래스)
	public static void broadcast(String message)
	{
		for(Session session:clients) // 접속한 모든 사람 
		{
			if(session.isOpen()) // 접속인 상태 
			{
				try
				{
					session.getBasicRemote().sendText(message);
				}catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
	}
	
}






