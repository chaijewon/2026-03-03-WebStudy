<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%
    BoardModel model=new BoardModel();
    model.boardUpdateData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#sendBtn').click(function(){
		let name=$('#name').val();
		let subject=$('#subject').val();
		let content=$('#content').val();
		let pwd=$('#pwd').val();
		let no=$('#no').val();
		
		// JSP로 전송
		$.ajax({
			type:'get',
			url:'update_ok.jsp',
			data:{"no":no,"name":name,"subject":subject,"content":content,"pwd":pwd},
			success:function(res)
			{
				alert(res)
				if(res.trim()=="yes")
				{
					location.href="detail.jsp?no="+no;
				}
				else
				{
					alert("비밀번호가 틀립니다!!");
					$('#pwd').val("");
					$('#pwd').focus();
				}
			}
		})
	})
})
</script>
</head>
<body>
   <div class="container">
    <div class="row">
      <h3>수정하기</h3>
      <!-- <form method=post action="update_ok.jsp"> -->
      <table class="table">
       <tr>
        <th width=10% class="text-center">이름</th>
        <td width=90%>
         <input type=text name=name size=20 class="input-sm" required value="${vo.name }" id="name">
         <input type="hidden" name=no value="${vo.no }" id="no">
        </td>
       </tr>
       <tr>
        <th width=10% class="text-center">제목</th>
        <td width=90%><input type=text name=subject size=60 class="input-sm" required value="${vo.subject }" id="subject"></td>
       </tr>
       <tr>
        <th width=10% class="text-center">내용</th>
        <td width=90%>
         <textarea rows="10" cols="61" name="content" required id="content">${vo.content }</textarea>
        </td>
       </tr>
       <tr>
        <th width=10% class="text-center">비밀번호</th>
        <td width=90%><input type=password name=pwd size=10 class="input-sm" required id="pwd"></td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
           <button class="btn-sm btn-primary" type=button id="sendBtn">수정</button>
           <button class="btn-sm btn-primary" type=button
            onclick="javascript:history.back()"
           >취소</button>
         </td>
       </tr>
      </table>
      <!-- </form> -->
    </div>
   </div>
</body>
</html>