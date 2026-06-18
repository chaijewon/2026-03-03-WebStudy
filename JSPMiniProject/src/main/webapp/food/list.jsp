<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
                        <h2>맛집 목록</h2>
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
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i> </a></li>
                            <li class="breadcrumb-item active" aria-current="page"></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row">

                <c:forEach var="vo" items="${list }">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                          <a href="../food/detail_before.do?no=${vo.no }">
                            <img src="${vo.poster }" alt="">
                          </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">${vo.type }</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">${vo.phone}</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> ${vo.likecount }</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> ${vo.replycount }</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?no=${vo.no }">
                                <h4 class="post-headline">${vo.name }</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <%--
                     저장공간 
                     session : 접속시에 서버에 저장 => 공간 
                               한명당 1개만 생성 
                               -----------------------
                               | port가 다른 경우에는 저장할 수 없다
                                 react / spring-boot
                                 (client) (server)
                                  => 3000  => 8080
                                  |= javascript의 saession 
                                  |= JWT : cookie기반  
                                     ---- 카카오 로그인
                              => 사용자 정보 저장 (로그인) 
                              => 브라우저 종료 / 로그아웃시에 사라진다 
                              => 내장 객체 (HttpSession)
                              => Object단위로 저장  
                              => 주요 메소드 
                                 1) setAttribute(String key,Object value)
                                    저장시에 사용 
                                 2) getAttribute(String key) 
                                    => 출력시 ${sessionScope.key}
                                 3) invalidate() : 세션 해제 => 전체 메모리 삭제 
                                                   로그아웃 / 브라우저 종료 
                                 4) isNew() : 처음 저장하는 여부 확인 
                                              => 장바구니 
                                 5) getId() : 구분 (사용자)
                                      |===> 채팅 
                                 6) setMaxInactiveInterval() : 시간 설정 
                                      |==> 1800초 => 30분 
                     cookie : 브라우저에 저장 
                              new Cookie()
                              => 문자열만 가지고 있다 
                              => 자동로그인 / 최근 방문 / 장바구니 
                              => 주요 메소드 
                                 1) 저장 => 생성자 new Cookie(String key, String value)
                                 2) 저장위치 => setPath("/")
                                 3) cookie => key 읽기 => getName()
                                              value 읽기 => getValue()
                                 4) 삭제 => setMaxAge(0) 
                                                    ---- 1/1000
                     cookie / session => 상태 관리 프로그램 
                                         ------- 데이터 유지 (Vue / React)
                                         
                     => 생성 
                        request를 이용해서 생성 
                        request.getSession() / request.getCookies()
                        -------
                         getParameter() : 요청값을 받는다 (1개) => String
                         getParameterValues() : 여러개를 동시에 받는 경우 => String[]
                         setAttribute() : request안에 새로운 데이터를 저장 
                           => getAttribute() : => JSP : ${key}
                        response : 응답 
                           => HTML =>  setContentType("text/html")
                                                       text/xml
                                                       text/plain : JSON
                           => COOKIE => addCookie()
                           => setHeader()
                           => sendRedirect()
                        application : 서버 관리 
                           => getRealPath() / getResource()
                                              -------------운영체제와 관계없이 사용이 가능 
                                              
                      MVC 
                        브라우저 : .do
                         | request 
                       DispatcherServlet (Controller) 
                         | request
                        Model <=====> DAO
                         | request안에 출력에 필요한 데이터 request에 담는다 
                       DispatcherServlet 
                         | request 
                        JSP(해당) => 화면 출력 
                        
                      ------------------------------------------------- Back 
                       
                       MyBatis 
                        => 환경 설정 파일 (Config.xml) :  한개만 생성 
                           | Connection 관련 
                        => SQL저장 파일 (mapper.xml) : 여러개 생성이 가능 (테이블당)
                           | DAO 
                             = selectList("id명",매개변수) => List
                                                 ------ #{}
                                                 한개만 지정이 가능 
                                                 --------------
                                                 #{} 여러개인 경우 
                                                 => hashmap / VO
                                                    -------   ---
                                                              #{id} => vo.getId()
                                                    #{id}
                                                      --- key
                                                    map.get("id")
                                while(rs.next())
                                {
                                  FoodVO vo=new FoodVO();
                                  vo.setXxx()
                                }
                                
                             =  selectOne() => ROW가 한개 
                             =  insert
                             =  update
                             =  delete
                             
                         XML구사 
                           id => 구분자 (모든 mapper에서 id를 중복하면 오류 발생)
                                       primary / key
                                       => table명 
                           resultType : SQL실행후에 결과값을 받는 변수 (VO) , int ,string
                           paramterType : ?에 값을 채우는 데이터형  #{}
                                                       ------
                           resultMap : JOIN / 컬럼명이 다른 경우에 설정 
                                              -------------------
                           parameterMap : PROCEDURE사용시에 변수 설정 
                             => IN/OUT/INOUT
                             => 전체 댓글 사용 
                           --------------------------------------
                            CREATE PROCEDURE pro_name(pName VARCHAR2(10),...)
                              | 반복이 많은 경우 / 보안 / 트랜잭션
                              
                          접속 
                            Session session=ssf.openSession() : SELECT
                                            => commit : false 
                                            ssf.openSession(true) : DML(insert/delete/update)
                                            => commit : true
                            session.close():반환 => 재사용 
                            
                           Jquery 
                             => $('태그명 , ID명 , class명 , 선택자')
                                --------------------------------- 태그가 가지고 오는 경우 (DOM)
                                값 읽기 
                                  => val() : input / select / textarea 
                                  => text() : <태그>값</태그>
                                  => html() : <태그> <태그> </태그> </태그>
                                  => attr() : 속성 값 읽기 
                                  => append()
                                이벤트
                                  => click  ==> $().on('click',function(){처리})
                                  => change
                                  => keyup 
                                  => mousedown 
                                  => hover
                                효과 
                                  => show 
                                  => hide 
                                  => fadeIn / fadeOut 
                                서버 연결 
                                  $.ajax({
                                     type: get/post
                                     url : 연결할 사이트 주소 
                                     data:{"키":"값"} => JSP로 값 전송 
                                     success:function(결과값){정상 수행 => 결과값 출력}
                                     error:function(error){에러 처리}
                                  })
                                fetch() => 내장된 함수 
                                axios() => 가장 많이 사용 : Vue / React
                                
                                ===> Jquery : JavaScript 
                                ===> JSP  : 자바 
                                ===> DAO : SQL 
                                ------------------------- 웹 화면 제작이 가능 
                 --%>
                </c:forEach>
                

                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                               <c:if test="${startPage>1 }">
                                <li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${startPage-1 }">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                                </li>
                               </c:if>
                               
                               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                               <li class="page-item ${curpage==i?'active':'' }"><a class="page-link" href="../food/list.do?page=${i }">${i }</a></li>
                               </c:forEach>
                               
                               
                               <c:if test="${endPage<totalpage }">
                                <li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                               </c:if>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page ${curpage } of ${totalpage } results</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</body>
</html>