package com.sist.vo;
/*
 *  NO       NOT NULL NUMBER         
	NAME     NOT NULL VARCHAR2(51)   
	SUBJECT  NOT NULL VARCHAR2(2000) 
	CONTENT  NOT NULL CLOB           
	PWD      NOT NULL VARCHAR2(10)   
	REGDATE           DATE           
	HIT               NUMBER         
	FILENAME          VARCHAR2(260)  
	FILESIZE          NUMBER   
	
	1. MVC 셋팅 => Project 
	2. VO => table 설정 
	3. Mapper 
	4. DAO 
	5. Model 
	6. JSP => 출력 
	---------------------------
	1. 벤치마킹 => 화면 UI (페이지 분석) => 화면 캡쳐
	2. 요구사항 => 기능 
	3. 벤치마킹 화면에서 프로젝트에 필요한 데이터 추출 
	4. 데이터베이스 설정 
	5. 데이터 수집 (크롤링) => INSERT 
	6. 메인 화면 제작 => 공통 => GIT 
	7. 회원가입 / 로그인 
	8. 역할 분담 
	9. 종료 => 테스트 (Junit) : 단위 테이스 
	10. 배포 => AWS 
	-------------------------------------------
 */
import java.util.*;

import lombok.Data;
// CRUD 정리 / 파일업로드 , 파일다운로드 => 갤러리 게시판 / 후기 게시판 
@Data
public class DataBoardVO {
   private int no,filesize,hit;
   private String name,subject,content,pwd,filename,dbday;
   private Date regdate;
}



