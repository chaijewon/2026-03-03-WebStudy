// 클래스 
/*
   <template>
     
   </template> 
*/
const page_card={
	template:
	`
	      <ul class="pagination">
	        <li v-if="$parent.startPage>1"><a class="a-link" @click="$parent.move($parent.startPage-1)">&laquo;</a></li>
	        <li v-for="i in $parent.range($parent.startPage,$parent.endPage)" :class="i===$parent.curpage?'active':''"><a class="a-link" @click="$parent.move(i)">{{i}}</a></li>
	        <li v-if="$parent.endPage<$parent.totalpage"><a class="a-link" @click="$parent.move($parent.endPage+1)">&raquo;</a></li>
	      </ul>
	`
}