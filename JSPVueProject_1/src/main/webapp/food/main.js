let food=Vue.createApp({
	  data(){
		  return {
			  curpage:1,
			  totalpage:0,
			  endPage:0,
			  startPage:0,
			  food_list:[], // ArrayList = []
			  isShow:false,
			  food_detail:{} // {} = VO
		  }
	  },
	  mounted(){
		 this.dataRecv()  
	  },
	  methods:{
		  dataRecv(){
			  axios.get('../food/list_vue.do',{
				  params:{
					  page:this.curpage
				  }// ? => 데이터 전송 
			  }).then(response=>{
				  // 결과값 => response에 채워서 가지고 온다 
				  console.log(response.data)
				  this.endPage=response.data.endPage
				  this.startPage=response.data.startPage
				  this.curpage=response.data.curpage
				  this.totalpage=response.data.totalpage
				  this.food_list=response.data.food_list
			  })
		  },
		  // 숫자 증가 = 배열에 저장 
		  range(start,end){
			  let arr=[]
			  let len=end-start
			  for(let i=0;i<=len;i++)
			  {
				  arr[i]=start
				  start++
			  }
			  return arr
		  },
		  move(page){
			  this.curpage=page
			  this.dataRecv()
		  },
		  detail(no){
			  this.isShow=true
			  // detail_vue.do?no=2
			  axios.get('../food/detail_vue.do',{
				  params:{
					  no:no
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.food_detail=response.data
			  })
		  }
	  },
	  components:{
		  pagecard:page_card,
		  fooddetail:food_detail
	  }
  }).mount(".container-fluid")