<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      1. Cookie / Session 
      2. FileUpload 
      3. ConnectionPool 
      -------------------- Spring-Boot
      JSP (HTML변경이 가능=> 데이터변경 (한파일에서 여러개를 수행 = 동적 페이지)
          화면 출력 : HTML  데이터 변경 : 자바 
          ------------------------------
              HTML + Java => 복잡하다 (분리할 수 없다 : 여러명이 동시 작업이 불가능)
                                                  ---------------
                                                   협업 => 분리 (HTML / Java)
                                                                 |     |
                                                                Front  Back
                                                   --------> MVC  
          MVC : 금융권 / 공기업 / 대기업 
                | Spring      ------ React/Vue
                | React  
                포털 => Spring(X) => 자체 Controller 
                ----------------------------------
                | Server를 각각 수행 => MSA 
                | 배포 =>  Docker-Compose / 쿠바네티스 
                          -------------- AWS | => 우분투 
          Back 
            1. 자바 
            2. JSP => MVC
              -----
            3. SpringFramework 
            4. Spring-Boot 
            5. JDBC => DBCP 
            6. MyBatis 
            7. JPA
          Front 
            1. JavaScript 
            2. Jquery / 바닐라JS 
            3. VueJS = Vuex = Pinia
            4. React = Redux = TanStack-Query = NextJS
            5. NodeJS / TypeScript 
          CI/CD 
            1. Git Action : Git 명령어 
            2. Docker 
            3. Docker-compose 
            4. DockerHub 
            5. 쿠바네티스 / 우분투 
            6. Jinkins : 사령관
            7. Ngiex / Ngrook
       
      1. JSP 지시자 
         => 전체 설정을 담당하는 태그 
         => page : JSP 페이지 속성 설정 
            ***contentType : 브라우저로 응답 
                          text/html => default 
                          => text/html;charset=ISO_8859_1 : ASC
                          text/xml
                          text/plain => JSON (자바 = 자바스트립트 연동)
                                        --------------------------
                                        RestFul
                          한글 => charset=UTF-8
                          
            ***import : 라이브러리 / 사용자 클래스 읽기 
            errorPage : 오류가 발생하면 이동 페이지 
            buffer : HTML을 출력하는 메모리 공간 크기 => 8kb  
            
            MVC        
         => taglib : 자바의 기본 (제어문) , String , 날짜변환 , 숫자변환 
                     => 태그형으로 만들어져 있다 => <% %> 사용하지 않게 만든다
                     ***<c:forEach> <c:if> <c:choose> 
                     ***<c:redirect> : sendRedirect()
                     ***<c:set> : 변수 설정 
                     <fmt:formatDate> <fmt:formatNumber>
                                      | => DecimalFormat
                     | => SimpleDateFormat
                     <fn:substring....>
                     => 이미 제작되어 있다 (JSTL) => 사용자 정의
         -----------------------------------------------------------
         JSP 내장 객체 
          => 미리 생성된 객체 (자동으로 제공하는 객체) 
             **request : 클라이언트 요청 정보 => 사용자 전송한 데이터를 담은 클래스
             **response : 응답하는 클래스 (HTML ,Cookie)
             -----------------------------------------
             **session : 사용자당 1개만 생성 => 서버에 저장
                       => Object단위로 저장이 가능
                       => 보안 
                       => 로그인 / 장바구니 
             -----------------------------------------
             application : 전체 내용을 관리 
             -------------
             out : 출력 버퍼 관리 
             pageContext : <jsp:include> <jsp:forward>
          => ***Cookie
             => 클라이언트 브라우저에 저장 
                보안 약함 / 만료시간 설정 / 문자열만 저장이 가능 
                최근 방문 / 로그인 유지 / 자동 로그인 
                                     ---------- 비밀번호 암호화 
         -------------------------------------------------------
         1. 액션 태그 151page 
            ***<jsp:include> : 마지막 (실무)
               <jsp:param>
            --------------------------------------Model 1
            <jsp:forward>
            ***<jsp:useBean>
            ***<jsp:setProperty> <jsp:getProperty> 
         2. 자바빈즈  
            ------- VO / DTO 
            => 데이터를 모아서 전송 : JSP => Bean
            => 캡슐화 : 데이터 보호 
            => ---- 데이터은닉화 / 변수에 기능 부여 : 읽기 / 쓰기 
                                메소드 : getter/setter
                    변수 : private 
                    데이터를 담는 규칙 
                    제작 
                     private String name;
                     --------------------
                     => 읽기 
                        public String getName() 
                        getXxx()
                        public void setName(String name)
                        {
                           this.name=name
                        }
                     private boolean admin;
                     => 읽기 
                        public boolean isAdmin()
                                      ----
                     => setter 동일 
                     => lombok 
         
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>