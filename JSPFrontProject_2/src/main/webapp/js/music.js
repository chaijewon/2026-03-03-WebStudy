let list=[]
window.onload=()=>{
	// 서버와 통신 => Ajax / fetch / axios 
	axios.get('music.do')
	     .then(response=>{
	    	 console.log(response.data)
	    	 list=response.data
	    	 let html=''
	    	 list.forEach((m)=>{
	    		 let s=''
	    		 if(m.state==='상승')
	    		 {
	    			 s='<font color="red">▲</font> '+m.id
	    		 }
	    		 else if(m.state==='하강')
	    		 {
	    			 s='<font color="blue">▼</font> '+m.id
	    		 }
	    		 else
	    		 {
	    			 s='-'
	    		 }
	    		 html+='<tr>'
	    		     +'<td class="text-center">'+m.no+'</td>'
	    		     +'<td class="text-center">'+s+'</td>'
	    		     +'<td class="text-center"><img src="'+m.poster+'" width=30 height=30></td>'
	    		     +'<td>'+m.title+'</td>'
	    		     +'<td>'+m.singer+'</td>'
	    		     +'</tr>'
	    	 })
	    	 let tbody=document.querySelector('#user-table tbody')
	    	 tbody.innerHTML=html
	    	
	     })
	     // 객체 모델 => 태그 제어 
	     let tr=document.querySelector("#user-table thead tr:first-child")
	     tr.style.backgroundColor='orange'
	     
	     // 검색 
	     let key=document.querySelector('#keyword')
	     key.addEventListener('keyup',function(){
	    	 const keyword=this.value.trim()
	    	 //console.log(keyword)
	    	 const rows=document.querySelectorAll('#user-table > tbody > tr')
	    	 /*for(let i=0;i<rows.length;i++)
	    	 {
	    		 rows[i].style.display='none'
	    	 }
	    	 
	    	 const find=document.querySelectorAll('#user-table > tbody > tr > td:nth-child(5n+4):contains("'+key+'")')
	    	 console.log(find.lenght)
	    	 for(let i=0;i<find.length;i++)
	    	 {
	    		 find[i].style.display=''
	    	 }*/
             rows.forEach((row)=>{
            	 const title=row.querySelector('td:nth-child(4)').textContent
            	 // td안에 있는 값을 가지고 온다 
                 //console.log(row)
            	 console.log(title)
                 if(title.includes(keyword))
                 {
            	    row.style.display=''
            	 }
                 else
                 {
                	row.style.display='none'
                 }
             }) 
	     })
	     // Jquery => 바닐라 JS 
}