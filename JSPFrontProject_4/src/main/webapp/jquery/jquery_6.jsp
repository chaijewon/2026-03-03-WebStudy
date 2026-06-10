<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    393page 
        클래스 조작 / 이벤트 / 시각효과 / 애니메이션 / 서버 연결 
                                              -------
        jquery 4버전 변경 => 활용 
        
    이벤트 
      => 고전적인 방식 
         $().click(function(){}) 
         $().keyup(function(){})
         $().keydown(function(){})
         $().change(function(){})
         ------------------------------
         $().mouseup(function(){})
         $().mousedown(function(){})
         ------------------------------
         $().mouseover(function(){})
         $().mouseout(function(){})
         ------------------------------ => $().hover(function(){})
      => 리스너 이용 방식 => jquery 4버전에서 주로 사용
         $().on('click',function(){}) 
         $().on('keyup',function(){})
         $().on('keydown',function(){})
         $().on('change',function(){})
 --%>
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
  width: 500px;
}
h1 {
   text-align: center;
}
#chatArea{
  width:300px;
  height: 300px;
  overflow-y:auto;
  border: 1px solid black;
}

</style>
<!-- 3버전 / 4버전 호환  -->
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
// 이벤트가 발생하면 어떻게 처리 할지 
// 사용자 => 이벤트 : 처리 => DOMScript => 라이브러리 
// 태그를 제어하는 프로그램 (조작)
// 속성 / 스타일 / 데이터를 변경 
$(function(){
	$('#sendMsg').on('keydown',function(key){
		if(key.keyCode===13) // 13 => enter
		{
			// jquery 4 => key.keyCode==='Enter'
			let msg=$(this).val()
			if(msg.trim()==="")
			{
				//trim() : 좌우 공백 제거 
				$(this).focus()
				return
			}
			$('#recvMsg').append(msg+"<br>")
			$(this).val("")
			$(this).focus()
			
			let ch=$('#chatArea').height()
			let m=$('#recvMsg').height()-ch
			$('#chatArea').scrollTop(m)
		}
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <h1>실시간 채팅</h1> <%-- 서버 (wbsocket / stormp:실시간 알림) --%>
      <table class="table">
        <tr>
          <td>
           <div id="chatArea">
             <div id="recvMsg"></div>
           </div>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" size=35 id="sendMsg">
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>