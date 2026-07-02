<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.news-box{
    max-width:850px;
    margin:auto;
    background:white;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,.2);
}

.news-header{
    background:#0d6efd;
    color:white;
    padding:20px;
    text-align:center;
}

.news-header h2{
    margin:0;
    font-weight:bold;
}

.news-header p{
    margin-top:8px;
    color:#dbe8ff;
}

#newsList{
    list-style:none;
    margin:0;
    padding:20px;
}

#newsList li{
    background:#fff;
    border-left:6px solid #0d6efd;
    border-radius:12px;
    margin-bottom:15px;
    transition:.3s;
    animation:fadeIn .5s;
}

#newsList li:hover{
    transform:translateY(-3px);
    box-shadow:0 8px 20px rgba(0,0,0,.15);
}

#newsList a{
    display:block;
    padding:18px;
    color:#333;
    text-decoration:none;
    font-size:17px;
    font-weight:600;
}

#newsList a:hover{
    color:#0d6efd;
}

.news-no{
    display:inline-block;
    width:35px;
    height:35px;
    line-height:35px;
    text-align:center;
    background:#0d6efd;
    color:white;
    border-radius:50%;
    margin-right:15px;
}

.update{
    text-align:right;
    padding:15px;
    background:#f8f9fa;
    color:gray;
    font-size:14px;
}

@keyframes fadeIn{

    from{
        opacity:0;
        transform:translateY(20px);
    }

    to{
        opacity:1;
        transform:translateY(0);
    }

}

}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	const ws=new WebSocket("ws://localhost/JSPVueProject_3/news")
	const newList=$('#newsList')
	ws.onopen=()=>console.log("서버 연결 완료")
	ws.onclose=()=>console.log("서버 연결 종료")
	ws.onerror=(e)=>console.err("에러:",e)
	ws.onmessage=(event)=>{
		try
		{
			const data=JSON.parse(event.data)
			console.log(data)
			let html=""
			data.map(news=>{
				html+='<li><a href="'+news.link+'" target="_blank">'+news.title+'</a></li>'
			})
			$('#newsList').html(html)
			
			const now=new Date()
			$('#updateTime').text("마지막 업데이트 :"+now.toLocaleTimeString())
			
		}catch(err)
		{
			// event.data => session.getBasicRemote().sendText(message)
			console.err("JSON파싱 실패:",err,event.data)
		}
	}
})
</script>
</head>
<body>
  <div class="news-box">
   <div class="news-header">
    <h2>실시간 뉴스</h2>
   </div>
    <ul id="newsList">
      
    </ul>
    <div class="update" id="updateTime">
      마지막 업데이트 :
    </div>
  </div>
</body>
</html>