<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
  margin: 0px auto;
  width: 960px;
}
p {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.link:hover{
  cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	dataRecv(1);
	
	$('#findBtn').on('click',function(){
		dataRecv(1)
	})
	$('#fd').on('keydown',function(e){
		if(e.key==='Enter') // e.keyCode===13 
		{
			dataRecv(1)
		}
	})
})
function dataRecv(page)
{
	$.ajax({
		type:'POST',
		url:'../food/find_ajax.do',
		data:{"page":page,"fd":$('#fd').val(),"col":$('#col').val()},
		success:function(response)
		{
			//console.log(response)
			let json=JSON.parse(response)
			//console.log(json)
			let html=''
			json.forEach((food)=>{
				html+='<div class="col-sm-3">'
				     +'<a href="../food/detail_before.do?no='+food.no+'">'
				     +'<div class="thumbnail">'
				     +'<img src="'+food.poster+'" style="width:240px;height:130px;object-fit:cover">'
				     +'</div>'
				     +'<p>'+food.name+'</p>'
				     +'</a>'
				     +'</div>'
			})  
			$('#print').html(html)
			
			// 페이지 설정 vue => thymeleaf : SpringFrame + Vue / MyBatis (Annotation)
			let curpage=json[0].curpage
			let totalpage=json[0].totalpage
			let startPage=json[0].startPage
			let endPage=json[0].endPage
			
			let pageHtml='<ul class="pagination">'
			if(startPage>1)
			{
				pageHtml+='<li><a class="link" onclick="move('+(startPage-1)+')">&laquo;</a></li>'
			}
			for(let i=startPage;i<=endPage;i++)
			{
				pageHtml+='<li '+(i===curpage?"class=active":"")+'><a class="link" onclick="move('+i+')">'+i+'</a></li>'
			}
			if(endPage<totalpage)
			{
				pageHtml+='<li><a class="link" onclick="move('+(endPage+1)+')">&raquo;</a></li>'
			}
			pageHtml+='</ul>'
			
			$('#paging').html(pageHtml)
		}
	})
}
function move(page)
{
	 dataRecv(page)
}
/*
function prev(page)
{
	dataRecv(page)
}
function next(page)
{
	dataRecv(page)
}
function change(page)
{
	dataRecv(page)
}
*/
</script>
</head>
<body>
  <div class="container">
    <div class="row">
     <select id="col" class="input-sm">
       <option value="name">맛집명</option>
       <option value="type">음식종류</option>
       <option value="address" selected>주소</option>
     </select>
     <input type=text id="fd" class="input-sm" size=20 value="마포"> 
     <button type=button id="findBtn" class="btn-sm btn-primary">검색</button>
    </div>
    <div class="row" style="margin-top: 30px" id="print">
     
    </div>
    <div class="row text-center" style="margin-top: 30px" id="paging">
      
    </div>
  </div>
</body>
</html>