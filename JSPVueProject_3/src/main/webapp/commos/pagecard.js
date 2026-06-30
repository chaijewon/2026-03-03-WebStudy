// <pagecard curPage="curpage">
// 재사용이 필요한 경우 / 조립식 
const pagecard={  
	props:{
		curPage:0, 
		endPage:0,
		startPage:0,
		totalPage:0
	},
	// 이벤트 발생 
	emits:['page-change'], // 함수 호출 => 데이터 제어 (list.jsp:Parent)
	methods:{
		range(start,end){
			let arr=[]
			let len=end-start
			for(let i=0;i<=len;i++)
			{
				arr[i]=start
				start++
			}
			return arr
		}
	},
	template:
	  `
	     <ul class="pagination">
		   <li v-if="startPage>1"><a class="a-link" @click="$emit('page-change',startPage-1)">&laquo;</a></li>
		   <li v-for="i in range(startPage,endPage)" :class="i===curPage?'active':''"><a class="a-link" @click="$emit('page-change',i)">{{i}}</a></li>
		   <li v-if="endPage<totalPage"><a class="a-link" @click="$emit('page-change',endPage+1)">&raquo;</a></li>
		 </ul>
	  `
}