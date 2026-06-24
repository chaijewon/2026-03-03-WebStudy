<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
const obj={
	name:'Hong Gil Dong'
}
function aaa()
{
	 console.log(this.name)
}
const bbb=()=>{
	console.log(this.name)
}
window.onload=function()
{
	 aaa.call(obj) 
	 bbb.call(obj)
}

</script>
</head>
<body>

</body>
</html>