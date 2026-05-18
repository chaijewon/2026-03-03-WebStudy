package com.sist.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
// Tomcat => 10버전 이상 => jakarta.servlet
// 이하버전 => javax.servlet 
// JSP => <%@page import=""%>
/*
 *    1. 서블릿 / JSP 
 *       서블릿은 순수하게 자바중심의 웹 프로그램 => 초창기 
 *       = 단점 
 *         1) 수정시마다 컴파일을 해서 톰캣위에 올려준다 
 *            => 수정후 바로 확인할 수 없다 
 *         2) 소스가 길어진다 / CSS나 자바스크립트 처리가 어렵다 
 *       = 장점 
 *         1) 소스가 노출되지 않는다 (보안 뛰어나다)  => .class
 *         2) 자바중심이기 때문에 호환성 / 유지보수가 좋다 
 *            ----------------------------------
 *            | 확장성이 좋다 
 *       JSP : HTML 중심 => 화면 출력 
 *       = 장점 : 서블릿의 단점 보완 
 *               수정후에 바로 수행 => 컴파일 (톰캣에 의해) 
 *               소스가 짧아 진다 => 구분(HTML/JAVA) 구분 
 *               => HTML 중심 => CSS / JavaScript를 바로 사용이 가능 
 *       = 단점 : 소스가 노출된다 / 확장성이 안좋다 
 *       ------------------------------------------------------
 *         보안 / 로직 => 서블릿 
 *         화면       => JSP 
 *         ------------------- MVC 
 *         
 *       2. 서블릿의 생명주기 
 *          init() : 초기화 (생성자 대체) 
 *            |      => DB연결 준비 / 설정파일 읽기 (web.xml)
 *                   => 공통 자원 초기화 
 *                          --- 멤버변수 / 메소드 
 *          service() : 클라이언트 요청시마다 실행 => 화면 출력 
 *            |      => doGet() => 요청시에 GET방식인 경우
 *                      => 화면 출력 
 *                   => doPost() => 요청시 POST방식인 경우
 *                      => 사용자 요청 처리 
 *                   => service() : GET / POST를 동시에 처리 
 *                   => 요청시에는 한개만 수행
 *                   GET  : URL뒤에 데이터 전송 (요청) 
 *                          ?키=값 
 *                          간단한 검색어 / 상세보기
 *                          <a> , location.href=""
 *                          sendRedirect() 
 *                   POST : 내부적으로 데이터 감춰서 전송 
 *                          보안 / 데이터전송이 많은 경우 / 파일 업로드 
 *                          <form> : GET/POST설정이 가능 
 *                          Ajax / Vue / React => 자바스크립트 변경 
 *                          
 *                   1) 요청 데이터 받기 
 *                   2) DB 처리 
 *                   3) 로직 처리 (요청 처리)
 *                   4) 응답 처리 
 *          destory() : 서버 종료 / 새로고침 / 화면이동 => 자동으로 서블릿 제거가 된다 
 *                      => DB연결 해제 / 메모리 해제 / 로그 저장 
 *                    => 한번만 호출된다 
 *                    
 *          클라이언트 요청 (브라우저) 
 *             |
 *           서블릿 객체 생성 
 *             |
 *           init() 호출 => 1번만 수행된다  => _jspInit()
 *             |
 *           요청시마다 => service()      _jspService()
 *             |
 *           응답 처리 
 *             |
 *           서버 종료시 => destory() 호출  _jspDestory()
 *           
 *      => 17page 
 *      1. 동적 컨텐츠 : 파일한개로 데이터를 변경해서 출력 
 *         => 정적 페이지 / 동적 페이지
 *            => HTML만 사용하면 => 데이터를 변경 할 수 없다 
 *            => JSP / JavaScript
 *                     => 바닐라JS / Ajax / Vue / React 
 *                     ------------------------------- 실무 
 *                     3개월 기본 => 4개월 실무 
 *                                ----------
 *                                자바 : 디자인 패턴 / 알고리즘 
 *                                => MVC 패턴 (Spring / MyBatis)
 *                                ---------------------------------- NodeJS 
 *                                => VueJS => vuex => pinia 
 *                                => React => redux => tanStackQuery 
 *                                   -------------------------------
 *                                   nextjs => 기반 (typescript)
 *                                => Spring-Boot => 무중단 CI/CD 
 *                                   ----------- Spring Security / JWT / 쇼설 로그인 
 *                                   ----------- Spring WebSocket : Stormp 
 *                                               => 카프카 
 *                                   ----------- Spring AI (RAG)
 *                                
 *            => 동적 : JSP / ThymeLeaf / PHP / ASP / Django 
 *                     ---------------        ----- --------
 *                     | 자바 중심              #C     파이썬 
 *      2. 웹 동작 (18page) 
 *         request(브라우저에서 요청)  / response (서버에서 요청처리후에 응답) 
 *         ----------------------   -------------------------------
 *             Client (Front)             Server (Back)  
 *         => 브라우저에서 URL로 연결 
 *         http://localhost/JSPBasicProject_1/EmpServlet
 *         http://localhost /JSPBasicProject_1/emp/list.jsp
 *         ---------------- -------------------------------
 *                          ------------------ ROOT : ContextPath
 *           서버 정보            요청 정보 (URI)
 *           -------------------------------- + URL
 *         => 최근 : PathVariable 
 *                  ------------
 *                  http://localhost /JSPBasicProject_1/emp/list.jsp?aaa=10
 *                  http://localhost /JSPBasicProject_1/emp/list.jsp/10
 *                  React / Vue 
 *         19page 
 *                정적페이지 : HTML / CSS => 데이터 갱신이 불가능 
 *                동적페이지 : JSP / JavaScript => 데이터 갱신 가능 
 *         실제 동작 
 *              client(브라우저) ======= Web Server ======= Web Application Server
 *                                    -----------        -----------------------
 *                                    아파치 / IIS              Tomcat (WAS)
 *                요청(주소창:URL)       요청을 받는다                 |
 *                                    | HTML / XML은 자동 처리      |
 *                                    JSP / Servlet --------------
 *                                                            | JSP/Servlet엔진 
 *                                                              => 번역 => HTML을 추출 
 *                         |---------------------------------------- | 소스 미리보기
 *                                                                   | 테스트 웹서버
 *      3. servlet / jsp (22page)
 *         => 자바 중심 HTML 중심 
 *      4. JSP란 
 *      5. JSP의 특징 
 *      6. 서블릿 이해 
 *      -------------------------------- 2장 : JDK / Tomcat / 이클립스 
 *      JSP 처리 : JSP에서 필요한 Java / 지시자 / 내장객체 / Cookie/Session
 *      데이터베이스 처리 / 활용 => 간단한 사이트 
 *      => JSTL/EL 
 *      ---------------------------------------------------------
 *      MVC : JSP 사이트 
 */
@WebServlet("/EmpServlet") // 구분자 => 사용자에 따라 변경이 가능 
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init() 호출");
	}

	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("메모리 해제");
	}
	/// GET + POST => _jspService()
    /////////////////////// doGet / doPost메소드 영역에 소스 추가 => JSP
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// default => 바로 실행 => GET방식이 호출 => HTML 폼
		// 글쓰기 폼 
		// 실행후 변환 
		/*
		 *    1. HTML  => text/html
		 *    2. XML   => text/xml
		 *    3. JSON  => text/plain
		 */
		// 응답하는 타입 설정 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		//  out영역에 HTML을 저장하면 => 해당 브라우저에서 읽어 간다 
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>Hello Servlet!!</h1>");
		out.write("</body>");
		out.write("</html>");
		// 단점 => JSP로 변경 
		
		/*
		 *   1. 역할 : 웹서브스 기능을 처리하는 자바 클래스 : 서블릿 
		 *      현재 : Controller 역할 
		 *            ----------
		 *            자바 + HTML을 묶어 주는 역할 
		 *            =>스프링은 이미 만들어져 있다 => 라이브러리 
		 *            =>DispatcherServlet 
		 *   2. 자바안에 HTML 코드를 첨부해서 사용 
		 *      out.write("<html>");
		 *      => HTML 사용하기 어렵다 (복잡) => CSS/JavaScript사용이 어렵다
		 *      => HTML / CSS / JavaScript 에러 처리가 어렵다 
		 *      => 실행마다 컴파일을 해서 사용 => 바로 결과를 볼 수 없다 
		 *      => 소스를 볼 수 없다 (.class) => 보안이 뛰어나다 
		 *      ---------------------------------------------
		 *   3. 서블릿의 단점 보완 
		 *      JSP => HTML 중심 
		 *      => 자바사용시에는 스크립트릿을 이용
		 *         <% %> <%= %> 
		 *   4. JSP 
		 *      = 서블릿보다는 HTML 작성이 쉽다 
		 *      = 복잡한 내용은 자바와 HTML을 구분해서 사용을 해야 된다 
		 *        => 보완 : JSTL / EL 
		 *        
		 *      <% 
		 *          if(조건문)
		 *          {
		 *      %>
		 *             HTML
		 *      <%
		 *          }
		 *        
		 *          else
		 *          {
		 *       %>
		 *             HTML
		 *       <%
		 *          }
		 *       %>
		 *       
		 *       <c:if test="조건">
		 *         HTML
		 *       </c:if>
		 *       <c:else>
		 *         HTML 
		 *       </c:else>  JSTL  태그형 (태그 라이브러리) 
		 *   JSP 실행 
		 *   a.jsp ==> 브라우저 요청 
		 *     |
		 *   a_jsp.java 
		 *     |
		 *   a_jsp.class 
		 *     |
		 *   실행 => out.write()
		 *   
		 *   a.jsp 
		 *   ------
		 *   <html>
				<head>
					<meta charset="UTF-8">
					<title>Insert title here</title>
				</head>
				<body>
				
				</body>
			</html>
			
			 a_jsp.java => 톰캣 
			 public class a_jsp extends HttpServlet
			 {
			     <%! %> : 멤버변수 , 메소드 => 사용빈도는 거의 없다 
			     public void _jspInit(){생성자 역할}
			     public void _jspDestory(){메모리 해제 : 새로고침 , 화면 이동}
			     public void _jspService(
			        HttpServletRequest request,
			        HttpServletResponse response
			     )
			     {
			         JspWriter out;
			         HttpSession session;
			         Exception exception 
			         ServletConfig config;
			         PageContext pageContext; 
			         ServletContext application 
			         Object page=this; 
			         ////// 내장 객체 
			         ////////////// 여기에 들어가는 HTML코드는 만든다 
			            out.write("<html>");
						out.write("<body>");
						out.write("<h1>Hello Servlet!!</h1>");
						out.write("</body>");
						out.write("</html>");
				    JSP는 _jspService에 들어가는 코드 작성 
				    --- 메소드 영역에 해당
				    <% %> : _jspService() 
				    <%! %> : 
				    <%= %> : out.println() => 변경 
			     }
			 }
		 *    
		 */
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청 처리시에 사용 
		// _ok.jsp 
	}
	///////////////////////

}
