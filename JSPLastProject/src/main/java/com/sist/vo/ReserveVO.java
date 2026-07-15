package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
 *  RNO     NOT NULL NUMBER       
	FNO              NUMBER       
	ID               VARCHAR2(20) 
	NAME    NOT NULL VARCHAR2(51) 
	RDATE   NOT NULL VARCHAR2(20) 
	RTIME   NOT NULL VARCHAR2(20) 
	INWON   NOT NULL VARCHAR2(20) 
	REGDATE          DATE         
	OK               CHAR(1)  
 */
@Data
public class ReserveVO {
  private int rno,fno;
  private String id,name,rdate,rtime,inwon,ok,dbday;
  private Date regdate;
}
