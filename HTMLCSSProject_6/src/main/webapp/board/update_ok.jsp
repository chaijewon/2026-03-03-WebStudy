<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    // 화면 출력 (X) ==> 사용자 요청값을 받아서 처리 
    // 데이터 4개 
    String name=request.getParameter("name");
    String subject=request.getParameter("subject");
    String content=request.getParameter("content");
    String pwd=request.getParameter("pwd");
    String no=request.getParameter("no"); // hidden
    
    BoardVO vo=new BoardVO();
    vo.setName(name);
    vo.setSubject(subject);
    vo.setContent(content);
    vo.setPwd(pwd);
    vo.setNo(Integer.parseInt(no));
    
    // 오라클 전송 
    BoardDAO dao=new BoardDAO();
    boolean bCheck=dao.boardUpdate(vo);
    
    if(bCheck==true)
    {
    	response.sendRedirect("detail.jsp?no="+vo.getNo());
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






