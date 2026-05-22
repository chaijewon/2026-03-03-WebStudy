<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
    //1. 사용자 보내준 데이터 받기 
    String id=request.getParameter("id"); // 단일값
    String pwd=request.getParameter("pwd");
    
    /*
         String getParameter() => text,password,date,number,select,textarea..
         String[] getParameterValues() => checkbox 
         => 관리자 
         request객체 사용자 요청값을 받거나 추가해 전송 / 세션 / 쿠키 
    */
    // 데이터베이스 연동 
    MemberDAO dao=MemberDAO.newInstance();
    MemberVO vo=dao.memberLogin(id, pwd);
    // Ajax 
    if(vo.getMsg().equals("NOID"))
    {
%>
        <script>
          alert("ID가 존재하지 않습니다");
          history.back();
        </script>
<%
    }
    else if(vo.getMsg().equals("NOPWD"))
    {
%>
        <script>
          alert("비밀번호가 틀립니다!!");
          history.back();
        </script>  
<%
    }
    else
    {
    	// 로그인 상태 
    	// 정보를 세션에 저장 => 브라우저 종료 / 로그아웃전까지 데이터를 유지 
    	// request / session,cookie 
    	//           --------------- 전역변수 => 데이터를 모든 파일 공유
    	// ------- 지역변수
    	session.setAttribute("id", vo.getId());
    	session.setAttribute("name", vo.getName());
    	session.setAttribute("admin", vo.getIsadmin());
    	session.setAttribute("post", vo.getPost());
    	session.setAttribute("address", vo.getAddr1()+" "+vo.getAddr2());
    	session.setAttribute("phone", vo.getPhone());
    	// 이동 main.jsp 
    	response.sendRedirect("../main/main.jsp");
    }
%>
