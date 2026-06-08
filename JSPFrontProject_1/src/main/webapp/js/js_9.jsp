<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    배열 : 여러개의 데이터를 모아서 한개의 이름으로 제어 
          => index번호를 이용해서 데이터를 관리 
          => object : 데이터가 섞일 수 있다 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	/*
	   자바스크립트의 데이터형 
	   number : 정수 / 실수
	   string : 문자열 => "" , ''
	   [] : object => 배열 
	   {} : object => 객체 => JSON
	   boolean : 논리형 
	   undifined : 초기값 / 값 대입이 없는 경우 
	   null 
	   => 확인 typeof 
	   *** boolean : 0,0.0,"",null을 제외한 모든 데이터는 true 
	   => 형변환 
	      Number() / parseInt()
	      String()
	      Boolean()
	*/
	let names=["홍길동","심청이","박문수","이순신","춘향이"]
	//console.log("arr="+typeof arr) //arr의 데이터형 확인
	// 1. index를 이용한 데이터 읽기 = 0번부터 시작 
	document.write("<h1>인덱스 사용</h1>")
	document.write("<ul>")
	document.write("<li>"+names[0]+"</li>")
	document.write("<li>"+names[1]+"</li>")
	document.write("<li>"+names[2]+"</li>")
	document.write("<li>"+names[3]+"</li>")
	document.write("<li>"+names[4]+"</li>")
	document.write("</ul>")
	// 2. for-each을 이용한 데이터 읽기
	document.write("<hr>")
	document.write("<ul>")
	for(let name of names)
	{
		document.write("<li>"+name+"</li>")
	}
	document.write("</ul>")
	
	// 3. 가장 많이 사용 
	document.write("<hr>")
	document.write("<ul>")
	names.forEach(name=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("</ul>")
	document.write("<hr>")
	document.write("<ul>")
	names.map(name=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("</ul>")
	
	document.write("<hr>")
	document.write("<ul>")
	// => 는 function / return 제외 => 람다
	names.map(function(name){
		document.write("<li>"+name+"</li>")
	})
	document.write("</ul>")
	
	/*
	  let detail=Vue.createVue{
		data(){
			return {
				no:1 // 멤버변수 => this.no
			}
		}
		methods:{
			aaa(){
				let _this=this
				names.map(function(name){
					document.write("<li>"+_this.no+"</li>")
				})
				names.map(name=>{
		           document.write("<li>"+this.no+"</li>")
	            })
			}
		}
	  }
	*/
}
</script>
</head>
<body>

</body>
</html>