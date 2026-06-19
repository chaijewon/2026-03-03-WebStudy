<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>등록 하기</h2>
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
                  <form method="post" action="../UploadServlet"
                   enctype="multipart/form-data"
                  >
                  <table class="table">
                   <tbody>
                    <tr>
                      <th width=20% class="text-center">이름</th>
                      <td width=80%>
                        <input type=text name=name size=20 
                          class="input-sm" required>
                      </td>
                    </tr>
                    <tr>
                      <th width=20% class="text-center">제목</th>
                      <td width=80%>
                        <input type=text name=subject size=60 
                          class="input-sm" required>
                      </td>
                    </tr>
                    <tr>
                      <th width=20% class="text-center">내용</th>
                      <td width=80%>
                        <textarea rows="10" cols="60" name="content" required></textarea>
                      </td>
                    </tr>
                    <tr>
                      <th width=20% class="text-center">첨부파일</th>
                      <td width=80%>
                        <input type=file name=files size=20 class="input-sm">
                      </td>
                    </tr>
                    <tr>
                      <th width=20% class="text-center">비밀번호</th>
                      <td width=80%>
                        <input type=password name=pwd size=10 
                          class="input-sm" required>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" class="text-center">
                        <input type="submit" class="btn-sm btn-warning" value="등록">
                        <input type="button" class="btn-sm btn-warning" value="취소"
                         onclick="javascript:history.back()"
                        >
                      </td>
                    </tr>
                   </tbody>
                  </table>
                  </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>