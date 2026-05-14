<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     1. VO / DTO => 오라클에서 보낸값을 모아서 전송 목적 
        --------- 오라클의 컬럼과 일치 
     2. DAO => VO에 값을 채운다 
     3. JSP => 화면 UI (HTML/CSS)
     4. DAO에서 얻어온 데이터를 화면에 출력 
     ================================> 웹 개발 
     JSP 
       1. 재사용이 어렵다 : 한번 사용후에 버린다 
       2. 보안이 취약하다 
          ------------ 자바: .class
                       JSP는 통째로 전송 
       3. UI로만 사용 => 화면 출력 (View) => Front
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
  margin-top: 50px;
}
.row {
  margin: 0px auto; /* 가운데 정렬 */
  width: 960px;
}
p {
    overflow: hidden;/* 벗어난 글자를 감춘다 */
    white-space: nowrap; /* 한줄로 만든다 */
    text-overflow: ellipsis; /* ... */
}
</style>
</head>
<!-- 
   HTML 태그 
   화면 UI => <div> <span> <ul> ...
   데이터 입력 => 전송 
      데이터를 모아서 한번에 전송 : <form>
                              | 보안 => method=post
                              | 일반 검색 => method=get 
                              | 데이터를 전송하는 태그는 반드시 name속성을 가지고 있어야 된다
   HTML안에서 전송할때 사용 
   => JavaScript : Ajax , Vue , React  
 -->
<body>
   <div class="container">
     <div class="row text-center">
      <form action="find.jsp" method="post">
      <%-- 
          전송 데이터 한번에 묶어서 보낸다 : input / textarea /select
          속성
           => method : 공개/비공개 
                       GET / POST => 생력하면 GET방식이다 
           => action : 어떤 파일로 전송할지 
           ?page=1&type=한식
           
           => id , class : CSS / JavaScript에서 태그제어 
           => name : JSP/Servlet으로 값을 전송 
           
           selected / checked / readonly / required / placeholder
                                         text,textarea       
                                
           <select>   radio/checkbox
           
           => GET : SELECT
           => POST : INSERT
           ----------------------
           => PUT : UPDATE 
           => DELETE : DELETE
           ---------------------- Rest API
      --%>
       <select name="column" class="input-sm">
         <option value="address">주소</option>
         <option value="type" selected>음식종류</option>
         <option value="name">업체명</option>
       </select>
       <input type="text" name="fd" size=20 class="input-sm" required>
       <button class="btn-sm btn-info">검색</button>
      </form>
     </div>
   </div>
</body>
</html>