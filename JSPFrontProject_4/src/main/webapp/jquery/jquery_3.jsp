<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     속성 조작 
     : class / src 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//document.querySelector("img").src="https://img.megabox.co.kr/SharedImg/2026/05/13/zlk6dycnwuPdVuSH40RVickv2CYYCrcU_420.jpg"
	$('img').attr('src','https://img.megabox.co.kr/SharedImg/2026/05/13/zlk6dycnwuPdVuSH40RVickv2CYYCrcU_420.jpg')
    // input에 값 첨부 val
    //document.querySelector("input[type='text']").value="hong"
    //document.querySelector("input[type='password']").value="1234"
    $("input[type='text']").val("hong")
    $("input[type='password']").val("1234")
    alert($("input[type='text']").val())
    alert($("input[type='password']").val())
    /*
        <태그>|</태그>
            text() / html()
        <태그 속성=""> 
                  |
                 attr()
        <input> <textarea> <select> => value값 설정 / 읽기 => val()
        스타일 조작 : css()
        
        => 
        
    */
})
</script>
</head>
<body>
  <img src=""><br>
  ID:<input type=text id="id" size=15><br>
  PW:<input type=password id="pwd" size=15><br>
</body>
</html>