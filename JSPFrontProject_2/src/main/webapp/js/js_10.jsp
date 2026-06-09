<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 960px;
}
</style>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="music.js"></script>
</head>
<body>
  <div class="container">
    <div class="row">
      <h3 class="text-center">Music Top200</h3>
      <table class="table">
       <tr>
         <td>
           <input type="text" size=20 class="input-sm" id="keyword">
         </td>
       </tr>
      </table>
      <table class="table" id="user-table">
        <thead>
          <tr>
            <th class="text-center">순위</th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center">곡명</th>
            <th class="text-center">가수명</th>
          </tr>
        </thead>
        <tbody>
           
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>