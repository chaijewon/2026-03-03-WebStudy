const food_detail={
    props:['food_detail'],
	template:
		`
		  <table class="table">
           <tbody>
            <tr>
             <td class="text-center" width=30% rowspan="8">
               <img :src="food_detail.poster" style="width:100%">
             </td>
             <td colspan="2"><h3>{{food_detail.name}}&nbsp;<span style="color:orange">{{food_detail.score}}</span></h3></td>
            </tr>
            <tr>
              <td width=20%>주소</td>
              <td width=50%>{{food_detail.address}}</td>
            </tr>
            <tr>
              <td width=20%>전화</td>
              <td width=50%>{{food_detail.phone}}</td>
            </tr>
            <tr>
              <td width=20%>음식종류</td>
              <td width=50%>{{food_detail.type}}</td>
            </tr>
            <tr>
              <td width=20%>주차</td>
              <td width=50%>{{food_detail.parking}}</td>
            </tr>
            <tr>
              <td width=20%>가격대</td>
              <td width=50%>{{food_detail.price}}</td>
            </tr>
            <tr>
              <td width=20%>영업시간</td>
              <td width=50%>{{food_detail.time}}</td>
            </tr>
            <tr>
              <td colspan="3">{{food_detail.theme}}</td>
            </tr>
            <tr>
              <td colspan="3">{{food_detail.content}}</td>
            </tr>
           </tbody>
          </table>
		`
  }