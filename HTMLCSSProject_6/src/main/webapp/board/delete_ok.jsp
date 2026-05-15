<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%--
    JSP 
      1. 화면 UI (View)
      2. 처리 기능 => 사용자 요청값을 받아서 데이터베이스 연동 => 화면 이동 
                   --------------------------------
                    INSERT / UPDATE / DELETE
                    
                    _ok.jsp
   Servlet 
      1. doGet() => 화면 UI
      2. doPost() => 사용자 요청 => 처리 
      |=> 화면 UI는 사용하지 않는다 => 보안이 필요 / HTML/자바 연결 
 --%>
<%
     String no=request.getParameter("no");// no => name=no
     String pwd=request.getParameter("pwd"); // pwd => name=pwd
     // 데이터베이스 연동 
     BoardDAO dao=new BoardDAO();
     /*
         경우의 수 
         1. 비밀번호가 맞는 경우 ==> delete => list.jsp 이동 
         2. 비밀번호가 틀린 경우 ==> 다시 입력 => history.back()
         비밀번호는 본인 글인지 확인 => 회원가입 => 보안의 유지 
                                 -------
                                 비번 => 암호화 (ED255_1)
     */
     boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
     /*
         1. login => main.jsp 
         2. 탈퇴 => main.jsp 
         
     */
     if(bCheck==true)
     {
    	 response.sendRedirect("list.jsp");  // 서버에서 강제로 화면 변경
    	 // 삭제된 경우 
    	 /*
    	     jsp호출 
    	     => class A
    	        new A(); // 메모리가 사라진다 
    	        new A(); // 새로운 메모리가 생성 
    	 */
     }
     else
     {
%>
          <script>
          alert("비밀번호가 틀립니다!!");
          history.back();
          </script>
<% 
     }
%>
