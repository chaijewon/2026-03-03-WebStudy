package com.sist.vo;
/*
 *   NO      NOT NULL NUMBER         
TYPE             NUMBER         
NAME             VARCHAR2(50)   
SUBJECT NOT NULL VARCHAR2(2000) 
CONTENT NOT NULL CLOB           
REGDATE          DATE           

 */
import java.util.*;

import lombok.Data;
@Data
public class NoticeVO {
   private int no,type,hit;
   private String name,subject,content,dbday;
   private Date regdate;
}
