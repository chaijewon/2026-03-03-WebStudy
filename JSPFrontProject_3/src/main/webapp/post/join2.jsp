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
  width: 600px;
}
h1 {
   text-align: center;
}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function postfind()
{
	new daum.Postcode({
		oncomplete:function(data){
			//console.log(data)
			//alert(data)
			document.querySelector("#post").value=data.zonecode
			document.querySelector("#addr").value=data.address
		}
	}).open()
	//alert(typeof daum)
	//alert(typeof daum.Postcode)
}
</script>
</head>
<body>
<div class="container">
    <div class="row">
     <h1>회원 가입</h1>
     <form name="frm">
     <table class="table">
       <tr>
        <th width=20% class="text-center">우편번호</th>
        <td width=80%>
         <input type=text id=post size=10 class="input-sm" readonly>
         <button class="btn-sm btn-danger" 
         onclick="postfind()" type=button>우편번호 검색</button>
        </td>
       </tr>
       <tr>
        <th width=20% class="text-center">주소</th>
        <td width=80%>
         <input type=text id=addr size=43 class="input-sm" readonly>
        </td>
       </tr>
     </table>
     </form>
    </div>
  </div>
</body>
</html>