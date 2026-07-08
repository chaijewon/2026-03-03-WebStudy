<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#updateBtn').on('click',function(){
		
		$.ajax({
			method:'post',
			url:'../board/update_ok.do',
			data:$('#frm').serialize(), // 반드시 form태그 => 업로드 => vue/react => FormData
			success:function(result) // serialize() 는 form태그안에 있는 input , select ,textarea태그만 읽어온다 
			{
				result=result.trim()
				if(result==='yes')
				{
					location.href="../board/detail.do?no="+$('#no').val().trim()
				}
				else
				{
					alert("비밀번호가 틀립니다")
					$('#pwd').val("").focus()
				}
			}
		})
	})
})
</script>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>수정하기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <section class="archive-area section_padding_80">
        <div class="container" style="width: 800px">
            <div class="row">
             <form id="frm">
             
             <table class="table" >
               <tr>
                 <th class="text-center bg-success text-white" width="15%">이름</th>
                 <td width="85%">
                  <input type="text" name=name size=20 class="input-sm" required
                    value="${vo.name }"
                  >
                  <input type="hidden" name=no value="${vo.no }" id="no">
                 </td>
               </tr>
               <tr>
                 <th class="text-center bg-success text-white" width="15%">제목</th>
                 <td width="85%">
                  <input type="text" name=subject size=57 class="input-sm" required
                   value="${vo.subject }"
                  >
                 </td>
               </tr>
               <tr>
                 <th class="text-center bg-success text-white" width="15%">내용</th>
                 <td width="85%">
                  <textarea rows="10" cols="62" name="content" required>${vo.content }</textarea>
                 </td>
               </tr>
               <tr>
                 <th class="text-center bg-success text-white" width="15%">비밀번호</th>
                 <td width="85%">
                  <input type="password" name=pwd size=10 class="input-sm" required id="pwd">
                 </td>
               </tr>
               <tr>
                 <td colspan="2" class="text-center">
                   <button type=button class="btn-sm btn-primary" id="updateBtn">수정</button>
                   <button type=button class="btn-sm btn-primary"
                    onclick="javascript:history.back()"
                   >취소</button>
                 </td>
               </tr>
             </table>
             
             </form>
            </div>
        </div>
    </section>
</body>
</html>