<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/table.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script src="https://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
 .join_row{
  margin: 0px auto;
  width: 900px;
} 
</style>
<script type="text/javascript">
 Shadowbox.init({
	players:['iframe']
 })
$(function(){
	$('#idBtn').on('click',function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
			player:'iframe',
			width:500,
			height:350,
			title:'아이디 중복체크'
		})
	})
	// $('#postBtn').click(function(){}) => 고전적 이벤트 => 이벤ㅌ, Listener 
	$('#postBtn').on('click',function(){
		new daum.Postcode({
			oncomplete(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
	
	$('#joinBtn').on('click',function(){
		const id=$('#join_id').val()
		// required => readonly는 적용이 안됨 
		if(id.trim()==="")
		{
			alert("아이디 중복체크를 히세요")
			return
		}
		
		const pwd1=$('#pwd1').val()
		const pwd2=$('#pwd2').val()
		
		if(pwd1!==pwd2)
	    {
			alert("비밀번호가 틀립니다")
			$('#pwd2').val("")
			$('#pwd2').focus()
			return
		}
		
		const post=$('#post').val().trim()
		if(!post)
		{
			alert("우편번호를 검색하세요")
			return
		}
		
		// Model로 전송 
		//$('#frm').submit();
		$('#frm').trigger("submit")
	})
	/*
	    Jquery 3 =====> Jquery 4
	    1. 값이 변경되지 않는 경우 : let => const 
	    2. trim()==="" => !id , !post 
	    3. aaa:function() => ES6 => aaa()
	    4. $('#pwd2').val("")
		   $('#pwd2').focus()
		   => $('#pwd2').val("").focus()
		5. $('#frm').submit() => $('#frm').trigger("submit")
	*/
})
</script>
</head>
<body>
<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>회원 가입</h2>
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
        <div class="container" style="max-width: 800px; margin-top: 40px;">
            
             <div class="panel panel-pastel">
			    <div class="panel-heading text-center">
			      <!-- <span class="glyphicon glyphicon-leaf">회원등록</span> -->
			    </div>
			    <div class="panel-body">
			     <form id="frm" name="frm" method="post" action="../member/join_ok.do">
			      <table class="table table-bordered table-hover">
			        <tr>
			          <th class="text-center" width="20%">ID</th>
			          <td>
			            <div class="form-inline">
			              <input type="text" name="id" id="join_id" class="form-control input-sm" placeholder="아이디" readonly>
			              <button type="button" id="idBtn" class="btn btn-mint btn-sm">중복체크</button>
			            </div>
			          </td>
			        </tr>
			
			        <tr>
			          <th class="text-center">Password</th>
			          <td>
			            <div class="form-inline">
			              <input type="password" name="pwd" id="pwd1" class="form-control input-sm" placeholder="비밀번호" required>
			              <input type="password" name="pwd1" id="pwd2" class="form-control input-sm" placeholder="비밀번호 재입력" required>
			            </div>
			          </td>
			        </tr>
			
			        <tr>
			          <th class="text-center">이름</th>
			          <td><input type="text" name="name" id="name" class="form-control input-sm" placeholder="이름 입력" required></td>
			        </tr>
			
			        <tr>
			          <th class="text-center">성별</th>
			          <td>
			            <label class="radio-inline"><input type="radio" name="sex" value="남자" checked> 남자</label>
			            <label class="radio-inline"><input type="radio" name="sex" value="여자"> 여자</label>
			          </td>
			        </tr>
			
			        <tr>
			          <th class="text-center">생년월일</th>
			          <td><input type="date" name="birthday"  id="birthday" class="form-control input-sm" required></td>
			        </tr>
			
			        <tr>
			          <th class="text-center">이메일</th>
			          <td><input type="text" name="email" class="form-control input-sm" placeholder="example@email.com"></td>
			        </tr>
			
			        <tr>
			          <th class="text-center">우편번호</th>
			          <td>
			            <div class="form-inline">
			              <input type="text" id="post" name="post" class="form-control input-sm" readonly>
			              <button type="button" id="postBtn" class="btn btn-pink btn-sm">우편번호검색</button>
			            </div>
			          </td>
			        </tr>
			
			        <tr>
			          <th class="text-center">주소</th>
			          <td><input type="text" id="addr1" name="addr1" class="form-control input-sm" readonly></td>
			        </tr>
			
			        <tr>
			          <th class="text-center">상세주소</th>
			          <td><input type="text" name="addr2" class="form-control input-sm"></td>
			        </tr>
			
			        <tr>
			          <th class="text-center">전화번호</th>
			          <td>
			            <div class="form-inline">
			              <select name="phone1" class="form-control input-sm">
			                <option>010</option>
			                <option>011</option>
			                <option>016</option>
			              </select>
			              <input type="text" name="phone2" class="form-control input-sm" placeholder="####-####">
			            </div>
			          </td>
			        </tr>
			
			        <tr>
			          <th class="text-center">소개</th>
			          <td><textarea rows="5" name="content" class="form-control input-sm" placeholder="자기소개를 입력하세요" required></textarea></td>
			        </tr>
			
			        <tr>
			          <td colspan="2" class="text-center">
			            <button type="button" class="btn btn-mint btn-sm" id="joinBtn">회원가입</button>
			            <button type="button" class="btn btn-pink btn-sm" onclick="history.back()">취소</button>
			          </td>
			        </tr>
			      </table>
			      </form>
			    </div>
			  </div>
            </div>
        
    </section>

</body>
</html>