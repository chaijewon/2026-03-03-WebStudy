<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.notice-form-wrap{
    width:900px;
    margin:40px auto;
    padding:30px;
    background:#fff;
    border-radius:12px;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
}

.form-title{
    margin-bottom:25px;
    font-size:28px;
    font-weight:bold;
    color:#333;
    border-bottom:2px solid #2563eb;
    padding-bottom:10px;
}

/* 한 줄 배치 */
.form-row{
    display:flex;
    align-items:center;
    margin-bottom:18px;
}

/* textarea만 위쪽 정렬 */
.form-row.top{
    align-items:flex-start;
}

.label{
    width:120px;
    font-weight:600;
    color:#444;
    font-size:15px;
}

/* input, select */
.input{
    flex:1;
    height:42px;
    border:1px solid #dcdfe6;
    border-radius:8px;
    padding:0 12px;
    font-size:15px;
    transition:.2s;
    background:#fff;
}

.input:focus{
    outline:none;
    border-color:#2563eb;
    box-shadow:0 0 8px rgba(37,99,235,.2);
}

/* textarea */
.textarea{
    flex:1;
    border:1px solid #dcdfe6;
    border-radius:8px;
    padding:12px;
    font-size:15px;
    resize:vertical;
    min-height:220px;
}

.textarea:focus{
    outline:none;
    border-color:#2563eb;
    box-shadow:0 0 8px rgba(37,99,235,.2);
}

/* 파일 */
input[type=file]{
    flex:1;
}

/* 버튼 */
.form-actions{
    margin-top:30px;
    display:flex;
    justify-content:flex-end;
    gap:10px;
}

.btn{
    min-width:90px;
    height:42px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-size:15px;
    font-weight:600;
    background:#e5e7eb;
}

.btn:hover{
    background:#d1d5db;
}

.btn.primary{
    background:#2563eb;
    color:#fff;
}

.btn.primary:hover{
    background:#1d4ed8;
}
</style>
</head>
<body>
<main class="admin-main">
  <div class="notice-form-wrap">
    <h2 class="form-title">📅 공지사항 수정</h2>

    <form method="post" action="../notice/update_ok.do"
          class="notice-form">

      <!-- 공지 종류 -->
      <div class="form-row">
        <label class="label">공지 종류</label>
        <select name="type" class="input">
          <option value="1" ${vo.type==1?"selected":"" }>서비스/점검</option>
          <option value="2" ${vo.type==2?"selected":"" }>이벤트</option>
          <option value="3" ${vo.type==3?"selected":"" }>정책변경</option>
          <option value="4" ${vo.type==4?"selected":"" }>영업/운영</option>
          <option value="5" ${vo.type==5?"selected":"" }>행사/일정</option>
        </select>
      </div>

      <!-- 제목 -->
      <div class="form-row">
        <label class="label">제목</label>
        <input type="text" name="subject" class="input" value="${vo.subject  }">
        <input type="hidden" name=no value="${vo.no }">
      </div>

      <!-- 내용 -->
      <div class="form-row top">
        <label class="label">내용</label>
        <textarea name="content" class="textarea" rows="8">${vo.content }</textarea>
      </div>

      

      <div class="form-actions">
        <button type="submit" class="btn primary">수정</button>
        <button type="button" class="btn"
                onclick="history.back()">취소</button>
      </div>

    </form>
  </div>
</main>
</body>
</html>