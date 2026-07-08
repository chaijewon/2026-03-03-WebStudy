package com.sist.vo;

import lombok.Data;

/*
 *  NO      NOT NULL NUMBER       
	FNO              NUMBER       
	ID               VARCHAR2(20) 
	NAME    NOT NULL VARCHAR2(51) 
	MSG     NOT NULL CLOB         
	REGDATE          DATE 
 */
import java.util.*;
@Data
public class ReviewVO {
   private int no,fno;
   private String id,name,msg,dbday;
   private Date regdate;
}
