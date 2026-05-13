<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
   //1. 사용자가 보내준 데이터 받기 
   //detail.jsp?no=1
   String no=request.getParameter("no");
   FoodDAO dao=new FoodDAO();
   FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
   // => vo에 있는 데이터를 출력 
   // 자바:데이터 관리 => 자바가 먼저 실행 => 데이터가 가지고 온다 
   // HTML을 이용해서 출력 
%>
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
  width: 960px;
  /* 가운데 정렬 */
  margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
       <tbody>
         <tr>
          <td width=30% class="text-center" rowspan="8">
           <img src="<%=vo.getPoster() %>" 
             style="width:300px;height: 350px"
             class="img-rounded"  
           >
          </td>
          <td colspan="2">
            <h3><%=vo.getName() %>&nbsp;
              <span style="color:orange;"><%=vo.getScore() %>
              </span>
            </h3>
          </td>
         </tr>
         <tr>
          <td width=10% class="text-center">음식종류</td>
          <td width=60%><%=vo.getType() %></td>
         </tr>
         <tr>
          <td width=10% class="text-center">주소</td>
          <td width=60%><%=vo.getAddress() %></td>
         </tr>
         <tr>
          <td width=10% class="text-center">전화</td>
          <td width=60%><%=vo.getPhone() %></td>
         </tr>
         <tr>
          <td width=10% class="text-center">가격대</td>
          <td width=60%><%=vo.getPrice() %></td>
         </tr>
         <tr>
          <td width=10% class="text-center">영업시간</td>
          <td width=60%><%=vo.getTime() %></td>
         </tr>
         <tr>
          <td width=10% class="text-center">주차</td>
          <td width=60%><%=vo.getParking() %></td>
         </tr>
         <tr>
          <td width=10% class="text-center">테마</td>
          <td width=60%><%=vo.getTheme() %></td>
         </tr>
         <tr>
          <td colspan="3" class="text-right">
           <button class="btn-xs btn-danger">좋아요</button>
           <button class="btn-xs btn-success">찜하기</button>
           <button class="btn-xs btn-warning">예약</button>
           <button class="btn-xs btn-primary"
            onclick="javascript:history.back()"
           >목록</button>
          </td>
         </tr>
         <tr>
          <td colspan="3">
            <pre style="white-space: pre-wrap;background-color: white;border:none"><%=vo.getContent() %></pre>
          </td>
         </tr>
       </tbody>
      </table>
    </div>
  </div>
</body>
</html>