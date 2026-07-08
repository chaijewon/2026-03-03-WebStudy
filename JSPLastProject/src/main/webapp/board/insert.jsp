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
                        <h2>글쓰기</h2>
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
             <form method=post action="../board/insert_ok.do">
             <table class="table">
               <tr>
                 <th class="text-center bg-success" width="15%">이름</th>
                 <td width="85%">
                  <input type="text" name=name size=20 class="input-sm" required>
                 </td>
               </tr>
               <tr>
                 <th class="text-center bg-success" width="15%">제목</th>
                 <td width="85%">
                  <input type="text" name=subject size=57 class="input-sm" required>
                 </td>
               </tr>
               <tr>
                 <th class="text-center bg-success" width="15%">내용</th>
                 <td width="85%">
                  <textarea rows="10" cols="62" name="content" required></textarea>
                 </td>
               </tr>
               <tr>
                 <th class="text-center bg-success" width="15%">비밀번호</th>
                 <td width="85%">
                  <input type="password" name=pwd size=10 class="input-sm" required>
                 </td>
               </tr>
               <tr>
                 <td colspan="2" class="text-center">
                   <button type=submit class="btn-sm btn-primary">글쓰기</button>
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