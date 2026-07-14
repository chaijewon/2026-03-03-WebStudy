<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // mounted() / useEffect()
	// JavaScript => id가 한개만 존재 => class
	$('.type').on('change',function(){
		let id=$(this).attr("data-id")
		let type=$(this).val()
		// vue 
		$.ajax({
			type:'get',
			url:'../adminpage/member_update.do',
			data:{"id":id,"type":type},
			success:function(result)
			{
				if(result.trim()==1)
				{
					location.href="../adminpage/member_list.do"
				}
				else
				{
					alert("등급 상향에 문제가 발생하였습니다")
				}
			}
		})
	})
})
</script>
</head>
<body>
<main class="admin-main">
    <h2>📅 회원 목록</h2>
    <section class="recent-section">
      <table>
        <tr>
          <th>아이디</th>
          <th>이름</th>
          <th>성별</th>
          <th>주소</th>
          <th>전화</th>
          <th>등급</th>
        </tr>
        <c:forEach var="vo" items="${mList }">
          <tr>
              <td>${vo.id }</td>
	          <td>${vo.name }</td>
	          <td>${vo.sex }</td>
	          <td>${vo.addr1 }</td>
	          <td>${vo.phone }</td>
	          <td>
	            <select class="type" data-id="${vo.id }">
	              <option value="1" ${vo.grade==1?"selected":""}>새싹멤버</option>
	              <option value="2" ${vo.grade==2?"selected":""}>일반멤버</option>
	              <option value="3" ${vo.grade==3?"selected":""}>성실멤버</option>
	              <option value="4" ${vo.grade==4?"selected":""}>열심멤버</option>
	              <option value="5" ${vo.grade==5?"selected":""}>핵심멤버</option>
	            </select>
	          </td>
          </tr>
        </c:forEach>
        <tr>
          <td colspan="6" class="text-center">
            <a href="#" class="btn btn-sm btn-primary">이전</a>
             ${curpage } page / ${totalpage } pages
            <a href="#" class="btn btn-sm btn-primary">다음</a>
          </td>
        </tr>
      </table>
    </section>
  </main>
</body>
</html>