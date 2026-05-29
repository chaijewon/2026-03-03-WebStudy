<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
    <div class="row" style="width: 300px">
      <h3>삭제하기</h3>
      <%--
         현재 파일에서 처리 : Ajax / Vue / React => 화면 변경없이 그자리에서 처리가 가능 
                         로그인 처리 / 로그아웃 / 검색 / 페이지 변경 
                         추천 / 결제 
             React  Redux  TanStackQuery
             Vue    Vuex   Pinia 
             -------------------------------- 데이터형의 변경 : 고정 
                                               typeScript => 컴파일 => javascript변환
             JSP    MVC    Spring
                           ------ NodeJS 
                           
             let a:number=10;
             
             => let a:string="aaa" => 가독성 
             
       --%>
      <form mathod=post action="delete_ok.jsp">
      <table class="table">
        <tr>
          <td class="text-center">
           비밀번호:<input type="password" name=pwd size=15 class="inout-sm">
           <input type="hidden" name=no value="${param.no }">
           <%--
                ${param.no }
                        --
                delete.jsp?no=${vo.no }
                           --
                request.getParameter("no") => key(구분)
                                      --
            --%>
          </td>
        </tr>
        <tr>
          <td class="text-center">
           <button class="btn-sm btn-warning">삭제</button>
           <button class="btn-sm btn-warning"
             type="button" onclick="javascript:history.back()"
           >취소</button>
          </td>
          <%--
              vue / react => nav(-1)
              javascript:history.go(-1) => forward(1)
              브라우저 제어가 가능 
              => 출력에 필요한 데이터가 필요 
              => Back-End => Javascript로 제어 
           --%>
        </tr>
      </table>
      </form>
    </div>
  </div>
</body>
</html>