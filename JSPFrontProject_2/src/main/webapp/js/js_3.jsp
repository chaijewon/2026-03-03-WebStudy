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
  width: 350px;
}
</style>
<script type="text/javascript">
// 속성 변경 (조작) => img.src
let index=1
let prev=()=>{
	index--
	if(index<1)
		index=7
    let img=document.querySelector("img")
    let path="../images/m"+index+".jpg"
    img.src=path
}
// 태그의 속성 변경 => 제어 => m1 m2 m3 m4 .... 이미지이 틀린 경우 []
let next=()=>{
	index++
	if(index>7)
		index=1
    let img=document.querySelector("img")
    let path="../images/m"+index+".jpg"
    img.src=path
}
// 자바스크립트는 대소문자 구분한다 
let auto=()=>{
	// 지정된 시간마다 호출이 되면 함수 : 실시간 뉴스 / 날씨 => Thread.sleep(1000)
	setInterval(()=>{
		next()
	},1000) // 1/1000 
}
</script>
</head>
<body>
  <div class="container">
   <div class="row">
     <table class="table">
      <tr>
       <td class="text-center">
        <img src="../images/m1.jpg" style="width: 320px;height: 420px;object-fit:cover">
       </td>
      </tr>
      <tr>
        <td class="text-center">
          <button type=button class="btn-sm btn-warning" onclick="prev()">이전</button>
          <button type=button class="btn-sm btn-info" onclick="next()">다음</button>
          <button type=button class="btn-sm btn-success" onclick="auto()">자동</button>
        </td>
      </tr>
     </table>
   </div>
  </div>
</body>
</html>