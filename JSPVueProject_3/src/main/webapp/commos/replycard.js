/*
    <template> => jsx => xml => vue , jsx , tsx
	 
	</template>
*/
const ReplyComponent={
	/*
	     props:{
			cno:Number,
			rno:Number,
			loginId:String 
		 }
	*/
	props:['cno','rno','loginId'],
	template:
	  `
	  <div class="row">
	     <table class="table" v-if="replyList.length===0">
	                  <tr>
	                    <td class="text-center">
	                      <strong>댓글이 없습니다</strong>
	                    </td>
	                  </tr>
	             </table>
	             <table class="table">
	                  <tr>
	                    <td>
	                      <table class="table" v-for="rvo in replyList" :key="rvo.no">
	                        <tr>
	                          <td class="text-left" width=80%>◑{{rvo.name}} ({{rvo.dbday}})</td>
	                          <td class="text-right" width=20%>
	                            <button class="btn-xs btn-success" v-if="rvo.id===loginId" @click="toggle(rvo)">{{rvo.show?"취소":"수정"}}</button>
	                            <button class="btn-xs btn-info" v-if="rvo.id===loginId"
	                             @click="deleteReply(rvo.no)"
	                            >삭제</button>
	                          </td>
	                        </tr>
	                        <tr>
	                          <td colspan="2" style="white-space: pre-wrap;">
	                           {{rvo.msg}}
	                          </td>
	                        </tr>
	                        
	                        <tr v-show="rvo.show">
	  			             <td colspan="2">
	  			               <textarea rows="4" cols="60" style="float: left" v-model="rvo.umsg"></textarea>
	  			               <input type=button value="댓글수정" 
	  			               style="width: 100px;height: 88px;float: left;margin-left: 3px" 
	  			               class="btn-primary" @click="update(rvo)">
	  			             </td>
	  			           </tr>
	                      </table>
	                    </td>
	                  </tr>
	                </table>
	  	          <table class="table" v-if="loginId">
	  	           <tr>
	  	             <td>
	  	               <textarea rows="4" cols="60" style="float: left" v-model="msg"></textarea>
	  	               <input type=button value="댓글쓰기" 
	  	               style="width: 100px;height: 88px;float: left;margin-left: 3px" 
	  	               class="btn-primary" @click="insert()">
	  	             </td>
	  	           </tr>
	  	         </table>
			</div>
	  ` ,
	  data(){
		return {
			replyList:[],
			msg:''
		}
	  },
	  mounted(){
		this.detailData()
	  },
	  methods:{
		     detailData(){
			    axios.get('../reply/list_vue.do',{
			    			params:{
			    				cno:this.cno,
			    				rno:this.rno
			    			}
			    		}).then(response=>{
			    			console.log(response.data)
			    			this.replyList=response.data
			    			
			    		})
		   },
		   insert(){
		    	  axios.get('../reply/insert_vue.do',{
		    				params:{
		    					cno:this.cno,
		    					rno:this.rno,
		    					msg:this.msg
		    				}
		    			}).then(response=>{
		    				this.replyList=response.data
		    				this.msg=''
		    			})
		    		},
		    		deleteReply(no){
		    			axios.get('../reply/delete_vue.do',{
		    				params:{
		    					no:no,
		    					cno:this.cno,
		    					rno:this.rno
		    				}
		    			}).then(response=>{
		    				this.replyList=response.data
		    			})
		    		},
		    		toggle(rvo){
		    			this.replyList.forEach(r=>{
		    				if(r.no!=rvo.no)
		    				{
		    					r.show=false
		    				}
		    			})
		    			rvo.show=!rvo.show
		    		},
		    		update(rvo){
		    			axios.post('../reply/update_vue.do',{},{
		    				params:{
		    					no:rvo.no,
		    					cno:rvo.cno,
		    					rno:rvo.rno,
		    					msg:rvo.umsg
		    				}
		    			}).then(response=>{
		    				this.replyList=response.data
		    			})
		    		}
	  }
}