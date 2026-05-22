<%@page import="com.sist.jsp.JspChange"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   12장 => Cookie / Session , 13장 => 파일업로드 => 예제 
   --------------------------------------------------
   Cookie  => 내 컴퓨터에 저장 => 영구성 
   Session => 서버에 저장 => 브라우저 종료 / 로그아웃시 사라진다 
   => 사용자당 1개만 생성 
   
   1. 필요한 이유 
      1) HTTP는 원래 구조가 기억을 못하는 구조 
         예) 로그인 => 다음 화면으로 이동 => 누구냐?
            장바구니 => 다음 화면으로 이동시에 사라진다 (request는 초기화)
      2) 사용자 기억 장치가 필요
         => cookie / session
         => 상태 유지 
            -------
   2. cookie 
      = 클라이언트 브라우저에 저장 
      = 용량이 작다 (4kb) 
      = 보안이 약하다 (누구나 볼 수 있다)
      = 브라우저 종료시에고 데이터 남아 있다 
      = 저장할 수 있는 데이터 문자열만 저장이 가능 
      
      1) 쿠키 생성 
         Cookie cookie=new Cookie(String key,String value)
                                 ------------
                                 key 중복이 되면 저장이 안된다 
                                 => Map방식 
         => 기간 설정 
         cookie.setMaxAge(초단위) => 60*60*24 ==> 하루 
         => 브라우저로 전송 
         response.addCookie(cookie)
         => 원하는 위치에 저장 
         cookie.setPath("/");
      2) 쿠키 읽기 
         Cookie[] cookies=request.getCookies()
         ==> key활용 
         ==> 맛집 food_맛집번호 / 상품 goods_상품번호
         ==>     id_food_맛집번호 => 문자로 시작 
         for(Cookie c:cookies)
         {
             if(c.getName().startsWith("food_"))
             {
                // 처리 
             }
         } 
         = getName() : 키읽기 
         = getValue() : 실제 저장된 값
      3) 쿠키 삭제 
         cookie.setMaxAge(0)
      4) 쿠키 수정 
         Cookie cookie=new Cookie("a1","aaa")
         Cookie cookie=new Cookie("a1","bbb")
         key를 동일하게 하면 데이터를 덮어쓴다 
      5) 언제 사용하는지 
         1. 자동 로그인 
         2. 최근 방문 (****)
         3. 팝업 => 오늘만 보기
     --------------------------------------------
     
    3. session : 내장 객체 => 미리 생성된 객체 
       => request를 이용해서 생성이 가능 
       HttpSession session=request.getSession()
       
       1) 세션에 저장 
          session.setAttribute("키",값) 
                                   --- Object : ArrayList/VO ...
                              ---- String
       1-1) 세션에 저장된 데이터 읽기 
          session.getAttribute("키")
       2) 세션에서 일부 삭제
          session.removeAttribute("키") => 해당키만 삭제
       3) 세션에서 전체 삭제 : 로그아웃 
          session.invalidate() 
       4) 기간 설정 
          session.setMaxactiveInterval(초단위)
                           ==> 기본값 : 1800초 => 30분저장 
       5) 생성된 시점 
          session.getCreationTime() : 세션에 등록된 시간 
          session.getId() : 각 클라이언트당 1개 배정 => 고유번호 
          ---------------- 채팅  
          session.isNew() : 처음으로 등록된 상태 
          ---------------- 장바구니 
       6) 특징 
          = 서버에 저장 (보안이 좋다)
          = 브라우저 종료시 자동 삭제 
          = 사용자마다 개별 공간 (따로 저장)=> getId()
          = 보통 저장되는 시점 : 로그인 (사용자의 일부 정보 저장)
       7) 사용처 
          = 로그인 상태 유지 
          = 회원 정보 
          = 장바구니 
          = 관리자 인증 
          = 예약 
     
     *** 면접 100%
     cookie vs session
     GET vs POST  
     =====> MyBatis / JPA 
     =====> MVC 
     -----------------------------------
     구분         cookie        session 
     ------------------------------------
     저장위치     컴퓨터(브라우저)    접속한 서버
     ------------------------------------
     보안        낮다               높다 
     ------------------------------------
     용량        작다               크다
               문자열              Object
     ------------------------------------
     유지       오래간다            로그아웃/브라우저 종료 
     ------------------------------------
     속도        빠르다             약간 느리다 
     ------------------------------------
     용도      최근 방문          로그인 상태 / 장바구니 / 예약 
              라이센스 
     ------------------------------------
      실무 
        로그인 ------- session(무조건)
        자동로그인 ---- cookie => spring : remember-me
        장바구니   ---- session / database 
        보안 정보 / security : session 
        => JWT : cookie 기반 => 소셜 로그인 (cookie)
      
        가벼운 데이터 : 쿠키
        안전 필요한 데이터 : 세션
        
     ====> request / response / session 
     ====> cookie 
     ====> <jsp:include> 
     ====> page / taglib(나중) => JSTL / EL (MVC) 
     ====> DataBase
   
--%>
<%
   //session.setAttribute("id","hong");
   //session.setAttribute("name", "홍길동");
   
   String id=(String)session.getAttribute("id");
   // id=null이면 session저장이 안됨 
   // 로그인 => 로그인 처리 => session에 사용자의 일부 정보를 서버에 저장 
   // 프로젝트 전체에서 공통을 사용(전역변수) 
   // 데이터 유지 방법 => session / cookie =>  상태(데이터) 유지 
   /*
      웹 
       1. 메인 페이지 => 조원 공동 
       2. 회원 => 로그인 => 메뉴 조절 
       3. 메뉴별 => 역할 
       
       session의 주요 메소드 
       -------- 브라우저별로 구분
       -------- jquery : 3.0 => IE , jquery : 4.0 => IE제외
       1. 저장 => setAttribute(key,value)
                            key가 중복되면 덮어쓴다 
                 key => 문자열 , value => Object
       2. 읽기 => getAttribute(key)
       3. 전체 삭제 => invalidate() => 로그아웃 
       4. 장바구니 => removeAttribute(key)
       ---------------------------------------
       덮어쓰는 경우 : 회원 수정 
       5. getId() => 사용자별 구분 => webSocket 
       6. isNew() => 처음 저장된 상태 
       ----> 서버에 저장 (보안이 좋다)
   */
   /*
       데이터 전송 받는 경우 
       => 포함하고 있는 JSP에서 데이터 공유 => include 
       => 나눠서 사용 
       => main.jsp : mode => 화면 변경  
       => *.jsp : 해당 데이터를 받아서 화면 출력 
       
       ** request를 공유 
          = include가 된 경우 
          = forward가 된 경우 
          
          <a> , <form> , sendRedirect => request 초기화
   */
   String mode=request.getParameter("mode");
   if(mode==null)
	   mode="1";
   int index=Integer.parseInt(mode);
   String jsp=JspChange.change(index);
%>
<%--
    CSS / JS => main에 존재 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.login {
   width:960px;
}
</style>
<link rel="stylesheet" href="../css/cookie.css">
</head>
<body>
  <jsp:include page="header.jsp"></jsp:include>
  <div class="container">
    <div class="row login">
     <% 
        if(id==null)
        {
     %>
      <form method=post action="../member/login.jsp">
	      <div class="logform text-right">
	        ID:<input type=text name=id class="input-sm" size=15 required>
	        &nbsp;
	        PW:<input type=password name=pwd class="input-sm" size=15 required>
	        &nbsp;
	        <button class="btn-sm btn-primary">로그인</button>
	      </div>
      </form>
      <%
        }
        else
        {
      %>
      <form method="post" action="../member/logout.jsp">
	      <div class="logform text-right">
	        <%= session.getAttribute("name")%>
	        (<%=((String)session.getAttribute("admin")).equals("y")?"관리자":"일반사용자" %>)님 로그인 되었습니다 
	        &nbsp;
	        <button class="btn-sm btn-primary">로그아웃</button>
	      </div>
      </form>
      <%
        }
      %>
    </div>
  </div>
  <jsp:include page="<%=jsp %>"></jsp:include>
</body>
</html>