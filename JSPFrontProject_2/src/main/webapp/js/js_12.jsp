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
</style>
<script type="text/javascript">
let fileIndex=0
// window.onload=function(){} 
document.addEventListener("DOMContentLoaded",function(){
	let addBtn=document.querySelector("#addBtn");
	let removeBtn=document.querySelector("#removeBtn");
	
	addBtn.addEventListener('click',function(){
		const tbody=document.querySelector("#user-table tbody")
		const tr=document.createElement("tr") // <tr></tr>
		// 태그를 만드는 경우 
		tr.id="m"+fileIndex // <tr id=""> 속성 조작 => img.src
		tr.innerHTML='<td width=15%>파일 '+(fileIndex+1)+'</td>'
		            +'<td width=85%><input type=file></td>'
		tbody.appendChild(tr)
		// 원하는 위치에 저장 
		fileIndex++
		
	})
	removeBtn.addEventListener('click',function(){
		if(fileIndex>0)
		{
		    const row=document.getElementById("m"+(fileIndex-1))
		    if(row)
		    {
		       row.remove()	
		    }
		    fileIndex--
	    }
	})
})
</script>
</head>
<body>
  <div class="container">
   <div class="row">
     <table class="table">
      <tbody>
        <tr>
         <th width=15%>우편번호</th>
         <td width=85%>
           <input type=text id="post" size=7 class="input-sm" readonly>
           <button class="btn-sm btn-primary">우편번호 검색</button>
         </td>
        </tr>
        <tr>
         <th width=15%>주소</th>
         <td width=85%>
           <input type=text id="address" size=50 class="input-sm" readonly>
         </td>
        </tr>
        <tr>
          <td class="text-right" colspan="2">
           <button class="btn-xs btn-warning" id="addBtn">추가</button>
           <button class="btn-xs btn-info" id="removeBtn">삭제</button>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <table class="table" id="user-table">
              <tbody>
              
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
     </table>
   </div>
  </div>
</body>
</html>