<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
  font-family: 'Noto Sans KR', sans-serif;
  background: linear-gradient(135deg, #f9f6ff, #eef9ff);
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0;
}

.check-container {
 
  background: #fff;
  padding: 40px 30px;
  border-radius: 18px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.08);
  width: 230px;
  text-align: center;
  animation: fadeIn 0.5s ease;
}

@keyframes fadeIn {
  from {opacity: 0; transform: translateY(10px);}
  to {opacity: 1; transform: translateY(0);}
}

h2 {
  margin-bottom: 20px;
  color: #4a3b87;
  font-weight: 700;
  font-size: 22px;
}

/* 입력폼 */
.input-group {
  align-items: center;
  margin-bottom: 10px;
}

.input-group input {
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 10px;
  font-size: 14px;
  transition: all 0.2s ease;
}

.input-group input:focus {
  border-color: #8a7cf3;
  box-shadow: 0 0 6px rgba(138,124,243,0.3);
  outline: none;
}

/* 버튼 */
button {
  background: linear-gradient(135deg, #8a7cf3, #6b64da);
  color: #fff;
  border: none;
  padding: 12px 18px;
  border-radius: 10px;
  cursor: pointer;
  font-size: 14px;
  transition: background 0.3s;
}

button:hover {
  background: linear-gradient(135deg, #7666e6, #5a53c7);
}

/* 메시지 */
.message {
  margin-top: 15px;
  font-size: 14px;
  padding: 10px;
  border-radius: 8px;
  /*display: none;*/
}

.success {
  background: #f1f9f2;
  color: #2e8b57;
  border: 1px solid #a9e7b8;
}

.error {
  background: #fff2f2;
  color: #c0392b;
  border: 1px solid #f5b7b1;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#canBtn').on('click',function(){
		parent.location.href="../main/main.do"
	})
	$('#okBtn').on('click',function(){
		const id=$('#id').val().trim()
		if(!id)
		{
			$('#id').focus()
			return
		}
		const pwd=$('#pwd').val().trim()
		if(!pwd)
		{
			$('#pwd').focus()
			return
		}
		
		$.ajax({
			method:'post',
			url:'../member/login_ok.do',
			data:{id,pwd},
			success:function(result)
			{
				result=result.trim()
				if(result==="NOID")
				{
					$('#message')
					   .text(id+"는(은) 존재하지 않습니다")
					   .removeClass()
					   .addClass("message error")
					   .show()
					   
					$('#id')
					   .val("")
					   .focus()
					   
					$('#pwd').val("")
					
				}
				else if(result==="NOPWD")
				{
					$('#message')
					   .text("비밀번호가 틀립니다")
					   .removeClass()
					   .addClass("message error")
					   .show()
					   
					$('#pwd').val("").focus()
					
				}
				else
				{
					parent.location.href="../main/main.do"
				}
			},
			error:function(err)
			{
				console.log(err)
			}
		})
	})
})
</script>
</head>
<body>
  <div class="check-container">
  <div class="input-group">
    <input type="text" id="id" placeholder="아이디를 입력하세요" style="display: block;">
    <input type="password" id="pwd" placeholder="비밀번호를 입력하세요" style="margin-top: 5px;display: block;">
  </div>
  <div id="message" class="message"></div>
  <button id="okBtn" type="button" style="margin-top: 10px">로그인</button>
  <button id="canBtn" type="button" style="margin-top: 10px">취소</button>
  </div>
</body>
</html>