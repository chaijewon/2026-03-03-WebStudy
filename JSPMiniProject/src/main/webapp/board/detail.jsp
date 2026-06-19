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
let i=0
$(function(){
	$('#delBtn').on('click',function(){
		if(i===0)
		{
			$('#delTr').show()
			$(this).text("취소")
			i=1
		}
		else
		{
			$('#delTr').hide()
			$(this).text("삭제")
			i=0
		}
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
                        <h2>상세 보기</h2>
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
    <section class="single_blog_area section_padding_80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width=20% class="text-center">번호</th>
                        <td width=30% class="text-center">${vo.no }</td>
                        <th width=20% class="text-center">작성일</th>
                        <td width=30% class="text-center">${vo.dbday }</td>
                      </tr>
                      <tr>
                        <th width=20% class="text-center">이름</th>
                        <td width=30% class="text-center">${vo.name }</td>
                        <th width=20% class="text-center">조회수</th>
                        <td width=30% class="text-center">${vo.hit }</td>
                      </tr>
                      <tr>
                        <th width=20% class="text-center">제목</th>
                        <td colspan="3">${vo.subject }</td>
                      </tr>
                      <c:if test="${vo.filesize>0 }">
	                      <tr>
	                        <th width=20% class="text-center">첨부파일</th>
	                        <td colspan="3"><a href="../board/download.do?fn=${vo.filename }">${vo.filename }</a>(${vo.filesize }Bytes)</td>
	                      </tr>
                      </c:if>
                      <tr>
                        <td colspan="4" class="text-left" valign="top" height="200">
                         <pre style="white-space: pre-wrap;border:none;background-color: white">${vo.content }</pre>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="4" class="text-right">
                         <a href="#" class="btn btn-xs btn-info">수정</a>
                         <span class="btn btn-xs btn-info" id="delBtn">삭제</span>
                         <a href="../board/list.do" class="btn btn-xs btn-info">목록</a>
                        </td>
                      </tr>
                      <tr style="display:none" id="delTr">
                        <td colspan="4" class="text-right">
                        비밀번호:<input type="password" name=pwd 
                               size=15 class="input-sm">
                         <button type="submit" class="btn-sm btn-warning">삭제</button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
            </div>
        </div>
    </section>
</body>
</html>