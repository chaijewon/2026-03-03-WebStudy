<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  margin: 0px auto;
  width: 500px;
}
</style>
</head>
<body>
   <div class="container">
     <h1 class="text-center">개인 정보</h1>
     <div class="row">
      <form method=post action="output3.jsp">
       <table class="table">
         <tbody>
           <tr>
             <th>이름</th>
             <td><input type=text name=name size=20 class="input-sm"></td>
           </tr>
           <tr>
             <th>나이</th>
             <td><input type="number" name=age min=1 max=100 class="input-sm"></td>
           </tr>
           <tr>
             <th>성별</th>
             <td>
               <input type=radio name=sex checked value="남자">남자
               <input type=radio name=sex checked value="여자">여자
             </td>
           </tr>
           <tr>
             <th>주소</th>
             <td><input type=text name=address size=50 class="input-sm"></td>
           </tr>
           <tr>
             <th>전화</th>
             <td><input type=text name=phone size=30 class="input-sm"></td>
           </tr>
           <tr>
             <th>소개</th>
             <td><textarea rows="5" cols="50" name=content></textarea></td>
           </tr>
           <tr>
             <td colspan="2" class="text-center">
               <button class="btn-sm btn-danger">전송</button>
             </td>
           </tr>
         </tbody>
       </table>
       </form>
     </div>
   </div>
</body>
</html>