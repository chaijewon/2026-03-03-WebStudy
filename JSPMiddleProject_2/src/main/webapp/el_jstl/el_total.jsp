<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     EL은 JSTL과 라이브러리 관련이 없다 => 독립적인 언어 => J2EE
     EL(Expression Language) : 표현식 => 화면 출력하는 용도 
                               <%= %> => ${}
     *** JSP에서 <% %> , <%! %> , <%= %> ==> 사용하지 않는다 
     *** JSTL , EL => SpringFrameWork / Spring-Boot 
                     -----------------  ------------
                     | JSP              | JSP / HTML 
                                                ----- ThymeLeaf (EL사용)
                                                | 자체 라이브러리 사용
                                          | JSTL => react 
                                                <div th:each(vo:${list})  
                                                <div th:if=""> 
                                                => Vue  
    1) 형식 : ${값} <%= %>
    2) 목적 : JSP파일에서 자바 코드를 최소화 
             => 자바가 포함시에 CSS적용 / 유지보수가 어렵다 
    3) EL 
       = 연산자 
         1. 산술연산자 
           *** + : 순수하게 덧셈 => 문자열 결합 +=
            ${ "10" + 10 } => 20
               ---- Integer.parseInt("10")
            ${ 10 + null } => null은 0으로 취급 => 10
            ${ "10" += 10} => 문자열 결합 => 1010
                    --
           *** / : div로 표현 => 정수/정수=실수 
            ${ 5 / 2} => 2.5
            ${ 5 div 2} => 2.5
           *** % : 나머지 => mod
            ${ 5%2} => 1
            ${ 5 mod 2} => 1
         ----------------------------------------------------
         2. ***비교연산자 : 숫자 => 문자열 , 날짜 
            ==(eq) , !=(ne) , < (lt), >(gt) , <=(le) , >=(ge)
            ===> 결과값 => true/false 
         3. 논리연산자 
            and(&&) , or(||) , not(!) 
         4. ***삼항연산자 : 페이지 나누는 경우 
            조건?값1:값2 => 조건 true => 값1 
                          조건 false => 값2 
         5. empty
            ${ empty 변수} => 변수:"",null => true 
            ------------- 댓글 존재 여부 확인 / 장바구니 
         ---------------------------- <c:if test="">
       = 내장 객체  
         MVC구조에서 주로 사용 
         1. requestScope => request.getAttribute() 
         2. sessionScope => session.getAttribute()
         3. pageContext  => 경로 설정 (<link href=""> <a href="">)
                                     --------------------------
                                     React / Vue 
         -----------------
         JSP 자체에서 사용 
         4. param => getParameter()
         5. paramValues => getParameterValues()
         6. applicationScope => application.getAttribute()
         -----------------
         
         자바 => request.setAttribute("name","홍길동")
                                    -------
                          | JSP에서 받는다 
                        화면 출력 : ${name}  | => 일치
                                  -------
                                    키명칭 
                                  <%= request.getAttribute("name") %>
                        ${일반변수가 아니다}
                          ------------- request/session에 있는 값을 출력
         자바  =======  JSP
          |--- 전송 : request/session을 이용해서 데이터 전송 
                             | 여러개의 JSP에서 공통으로 사용 => static  
                     | 한번 사용 (한개의 JSP) : 인스턴스 변수 
         <%= %> => ${} : 단순화 , 자바코딩을 제거
                   ---- 일반변수는 출력이 불가능  
         ------ 일반변수 / request / session
         
         => 화면 출력을 위해서 넘겨준 값만 출력이 가능 
            ------------------- request / session
                                                
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