<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     // 맛집 번호 받기 
     String no=request.getParameter("no"); // ?뒤에 있는 값을 받는다 
     // 1. 쿠키 생성 
     Cookie cookie=new Cookie("food_"+no,no);
     // 2. 기간 정하기 
     cookie.setMaxAge(60*60*24); // 하루만 저장 
     // => session (default : 1800초 (30분))
     // 삭제 => cookie.setMaxAge(0);
     // 3. 저장하는 위치 지정 
     cookie.setPath("/");
     // 4. 사용자의 브라우저로 전송 
     response.addCookie(cookie);
     
     // 5. 화면 이동 
     response.sendRedirect("../main/main.jsp?mode=2&no="+no);
     
     // sendRedirect() : 서버에서 화면 이동 
     // GET => request 초기화 
     /*
        1. 브라우저에 저장 
        2. 문자열만 저장이 가능 
        3. 저장 공간이 작다 (4KB)
        4. 보안 => 낮다 (누구나 볼 수 있다)
        5. 사용처 
           최근 방문 / 자동 로그인 
        6. 주요 메소드 
           new Cookie(키,값)
                     --- 중복없이 
           setPath() 저장 위치 
           setMaxAge(초단위)
           => getName() / getValue()
              => Key      값
              
        response는 전송 
           쿠키전송 / HTML 전송 => 한파일에서 두개를 동시에 처리하지 못한다 
           detail_before.jsp : 쿠키 전송 
           detail.jsp : HTML 전송 
           
        Cookie 읽기
        ----------
        1. 쿠키 전체 읽기 
           Cookie[] cookies=request.getCookies()
        2. key / value 
           키읽기 cookies[0].getName()
           값읽기 cookies[0].getValue()
           삭제 cookies[0].setMaxAge(0)
     */
%>