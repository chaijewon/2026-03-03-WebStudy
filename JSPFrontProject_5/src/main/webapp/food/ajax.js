// js => ts
// list_ajax.do?page=1
window.onload=()=>{
	dataRecv(1)
}
function foodPrint(json)
{
   let html=''
   json.forEach((food)=>{
	     html+='<a href="#">'
	         +'<div class="col-sm-3">'
	         +'<div class="thumbnail">'
	         +'<img src="'+food.poster+'" style="width: 204px;height: 130px;object-fit:cover">'
	         +'<p>'+food.name+'</p>'
          	 +'</div>'
	         +'</div>'
	         +'</a>'
   })
   $('#print').html(html)
   
   let curpage=json[0].curpage
   let totalpage=json[0].totalpage
   let startPage=json[0].startPage
   let endPage=json[0].endPage
   
   let pagePrint='<ul class="pagination">'
   if(startPage>1)
   {
	   pagePrint+='<li><a class="link" onclick="prev('+(startPage-1)+')">&laquo;</a></li>'	
   }
   
   for(let i=startPage;i<=endPage;i++)
   {
	   pagePrint+='<li><a class="link" onclick="change('+i+')">'+i+'</a></li>'	
   }
   
   if(endPage<totalpage)
   {
   	  pagePrint+='<li><a class="link" onclick="next('+(endPage+1)+')">&raquo;</a></li>'	
   }
   pagePrint+='</ul>'
   $('#pagination').html(pagePrint)
}
function change(page)
{
	 dataRecv(page)
}
function prev(page)
{
	  dataRecv(page)
}
function next(page)
{
	  dataRecv(page)
}
function dataRecv(page)
{
	$.ajax({
				type:'post',
				url:'list_ajax.do',
				data:{"page":page},
				success:function(json) //callback => 자동 호출 : 결과값을 매개변수로 가지고 온다
				{
					
					console.log(json)
					json=JSON.parse(json)
					console.log(json)
					foodPrint(json)
				}
			})
}


