<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    append() : 추가 (태그)
    --------
    
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
  width: 600px;
}
h1 {
   text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let fileIndex=0
$(function() {
	$('#add').on('click',function(){
		$('#user-table tbody').append(
		   '<tr id="m'+(fileIndex)+'">'
		  +'<td width=15%>File '+(fileIndex+1)+'</td>'
		  +'<td width=85%><input type=file size=20></td>'
		  +'</tr>'
		)
		fileIndex++
	})
	$('#remove').on('click',function(){
		if(fileIndex>0)
		{
			$('#m'+(fileIndex-1)).remove()
			fileIndex--
		}
	})
})
</script>
</head>
<body>
   <div class="table">
    <div class="row">
     <h1>등록</h1>
     <table class="table">
       <tr>
        <td class="text-right">
          <button class="btn-xs btn-warning" id="add">Add</button>
          <button class="btn-xs btn-warning" id="remove">Remove</button>
        </td>
       </tr>
       <tr>
         <td>
           <table class="table" id="user-table">
             <tbody>
              
             </tbody>
           </table>
         </td>
       </tr>
     </table>
    </div>
   </div>
</body>
</html>




