const page_card={
	template:
	`
	      <ul class="pagination">
	        <li v-if="startPage>1"><a class="a-link" @click="move(startPage-1)">&laquo;</a></li>
	        <li v-for="i in range(startPage,endPage)" :class="i===curpage?'active':''"><a class="a-link" @click="move(i)">{{i}}</a></li>
	        <li v-if="endPage<totalpage"><a class="a-link" @click="move(endPage+1)">&raquo;</a></li>
	      </ul>
	`
}