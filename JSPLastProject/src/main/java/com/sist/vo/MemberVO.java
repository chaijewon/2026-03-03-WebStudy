package com.sist.vo;

import lombok.Data;

/*
 *      ID       NOT NULL VARCHAR2(20)  
		PWD      NOT NULL VARCHAR2(10)  
		NAME     NOT NULL VARCHAR2(51)  
		SEX               VARCHAR2(6)   
		BIRTHDAY NOT NULL VARCHAR2(30)  
		EMAIL             VARCHAR2(100) 
		POST     NOT NULL VARCHAR2(6)   
		ADDR1    NOT NULL VARCHAR2(200) 
		ADDR2             VARCHAR2(100) 
		PHONE             VARCHAR2(15)  
		CONTENT  NOT NULL CLOB          
		ADMIN             CHAR(1)       
		REGDATE           DATE      
 */
import java.util.*;
@Data
public class MemberVO {
  private String id,pwd,name,sex,birthday,email,post,
                 addr1,addr2,phone,content,admin,dbday,msg;
  private Date regdate;
}
