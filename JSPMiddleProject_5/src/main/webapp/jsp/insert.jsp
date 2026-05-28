<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      화면 => 자바를 태그형으로 제작 : JSTL 
      ---- 제어문 / 변환 (날짜,숫자) / 화면 이동 
           core    format         core 
           
           1. 제어문 
              반복문 
                for(int i=1;i<=10;i++)
                => <c:forEach var="i" begin="1" end="10" step="1">
                for(BoardVO vo:list)
                => <c:forEach var="vo" items="${list}">
              조건문
                if(i==10)
                => <c:if test="${i==10}">
              다중 조건문 
                <c:choose>
                  <c:when test="${i==10}">출력값</c:when>
                  <c:when test="${i==5}">출력값</c:when>
                  <c:when test="${i==1}">출력값</c:when>
                  <c:otherwise></c:otherwise>
                </c:choose>
              변수 선언 
                int i=10
                <c:set var="i" value="10"/>
              화면 이동 
                response.sendRedirect("list.jsp")
                <c:redirect url="list.jsp"/>
          EL : <%=%> 대체 
               연산자 => + , +=
                      덧셈  문자열 
                    => == , < , > , <= , >= , !=
                       -------------------------- 숫자 비교 , 날짜 비교 , 문자 비교
                    => 삼항연산자 => 페이지 나누기 (이전,다음) 
                    => empty => 장바구니 / 로그인 
                => 데이터 출력 
                   request.setAttibute("키",값)
                     ${requestScope.키}
                       ------------ 생략 
                       => request.getAttribute(키)
                   session.setAttibute("키",값)
                     ${sessionScope.키}
                       => session.getAttribute(키)
       jquery => $().text() , $().html() 
       vue => {{}} ======= {{}} => 변경 delimitter : [[]]
       react => {} 
       django => {{}} ====
       thymeleaf => [[]]
                  
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
   <div class="container">
    <div class="row">
      <h3>글쓰기</h3>
      <%-- 입력된 모든 값을 전송  
           URL뒤에 데이터 노출 => GET
               단순한 검색어 / 페이지 번호 / 상세보기 번호 
               <a> , location.href , sendRedirect()
               ?뒤에 값을 첨부 
           감춰서 전송 => POST
               데이터가 많은 경우 / 보안이 필요로 한 전송 (id,password)
               <form> , ajax , vue => axios , fetch 
      --%>
      <form method=post action="insert_ok.jsp">
      <table class="table">
       <tr>
        <th width=10% class="text-center">이름</th>
        <td width=90%><input type=text name=name size=20 class="input-sm" required></td>
       </tr>
       <tr>
        <th width=10% class="text-center">제목</th>
        <td width=90%><input type=text name=subject size=60 class="input-sm" required></td>
       </tr>
       <tr>
        <th width=10% class="text-center">내용</th>
        <td width=90%>
         <textarea rows="10" cols="61" name="content" required></textarea>
        </td>
       </tr>
       <tr>
        <th width=10% class="text-center">비밀번호</th>
        <td width=90%><input type=password name=pwd size=10 class="input-sm" required></td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
           <button class="btn-sm btn-primary">글쓰기</button>
           <button class="btn-sm btn-primary" type=button
            onclick="javascript:history.back()"
           >취소</button>
         </td>
       </tr>
      </table>
      </form>
    </div>
   </div>
</body>
</html>