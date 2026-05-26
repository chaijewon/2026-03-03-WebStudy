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
  margin: 0px auto; /* 가운데 정렬 */
  width: 800px;
}
h3 {
  text-align: center;
}
.board-wrap{
  background: #fff;
  padding: 30px;
  border-radius: 18px;
  box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.table {
  background: white;
  border-radius: 12px;
  overflow: hidden;
}

</style>
</head>
<body>
   <div class="container">
     <div class="board-wrap">
       <h3>글쓰기</h3>
       <div class="row">
        <form method=post action="insert_ok.jsp">
         <table class="table">
          <tbody>
            <tr>
             <th width="15%" class="text-center">이름</th>
             <td width="85%">
              <input type=text name=name size=20 class="input-sm"
               required
              >
             </td>
            </tr>
            <tr>
             <th width="15%" class="text-center">제목</th>
             <td width="85%">
              <input type=text name=subject size=50 class="input-sm"
               required
              >
             </td>
            </tr>
            <tr>
             <th width="15%" class="text-center">내용</th>
             <td width="85%">
              <textarea rows="10" cols="52" required name=content></textarea>
             </td>
            </tr>
            <tr>
             <th width="15%" class="text-center">비밀번호</th>
             <td width="85%">
              <input type=password name=pwd size=10 class="input-sm"
               required
              >
             </td>
            </tr>
            <tr>
              <td colspan="2" class="text-center">
               <input type=submit class="btn-sm btn-primary" value="글쓰기">
               <input type=button class="btn-sm btn-primary" value="취소"
                 onclick="javascript:history.back()"
               >
              </td>
            </tr>
          </tbody>
         </table>
         </form>
       </div>
     </div>
   </div>
</body>
</html>