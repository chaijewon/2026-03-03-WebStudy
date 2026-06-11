// js => ts
// list_ajax.do?page=1
window.onload=()=>{
	$.ajax({
		type:'post',
		url:'list_ajax.do',
		data:{"page":1},
		success:function(json) //callback => 자동 호출 : 결과값을 매개변수로 가지고 온다
		{
			
			console.log(json)
			json=JSON.parse(json)
			console.log(json)
			foodPrint(json)
		}
	})
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
	   pagePrint+='<li><a href="#">&laquo;</a></li>'	
   }
   
   for(let i=startPage;i<=endPage;i++)
   {
	   pagePrint+='<li><a href="#">'+i+'</a></li>'	
   }
   
   if(endPage<totalpage)
   {
   	  pagePrint+='<li><a href="#">&raquo;</a></li>'	
   }
   pagePrint+='</ul>'
   $('#pagination').html(pagePrint)
}


